#!/bin/bash
set -e

# Directory containing downloaded PDFs
default_pdf_dir="./downloaded_pdfs"

# Check if the directory exists; if not, create it
if [ ! -d "$default_pdf_dir" ]; then
    echo "The directory for PDFs does not exist. Creating $default_pdf_dir..."
    mkdir -p "$default_pdf_dir"
else
    echo "The directory for PDFs already exists: $default_pdf_dir"
fi

# Verify if there are PDF files in the directory
pdf_files=("$default_pdf_dir"/*.pdf)

if [ ${#pdf_files[@]} -eq 0 ] || [ ! -f "${pdf_files[0]}" ]; then
    echo "No PDF files found in $default_pdf_dir. Please ensure files are downloaded before running this script."
    exit 1
fi

echo "Found the following PDF files in $default_pdf_dir:"
for pdf_file in "${pdf_files[@]}"; do
    if [ -f "$pdf_file" ]; then
        echo "$(basename "$pdf_file")"
    fi
done

# Install Python3 if not installed
if ! command -v python3 &> /dev/null; then
    echo "Python3 is not installed. Installing Python3..."
    sudo apt-get update
    sudo apt-get install -y python3
else
    echo "Python3 is already installed."
fi

# Install pip if not installed
if ! command -v pip &> /dev/null; then
    echo "pip is not installed. Installing pip..."
    sudo apt-get update
    sudo apt-get install -y python3-pip
else
    echo "pip is already installed."
fi

# Install system dependencies required by Kokoro (espeak-ng) and audio conversion (ffmpeg)
echo "Installing system dependencies (espeak-ng, ffmpeg)..."
sudo apt-get update && sudo apt-get install -y espeak-ng ffmpeg

# Install Python dependencies for Kokoro AI speech synthesis
echo "Installing Kokoro AI and audio packages..."
pip install --upgrade pip --quiet
pip install -q kokoro>=0.9.2 soundfile pypdf torchaudio

# Run PDFMerge.sh if it exists to merge multiple PDFs into one
if [ -x ./PDFMerge.sh ]; then
    echo "Running PDFMerge.sh on $default_pdf_dir..."
    ./PDFMerge.sh "$default_pdf_dir"
else
    echo "ERROR: PDFMerge.sh is not found or not executable."
    exit 1
fi

# Set the merged PDF path
pdf_path="$default_pdf_dir/merged.pdf"
if [ ! -f "$pdf_path" ]; then
    echo "ERROR: Merged PDF not found at $pdf_path"
    exit 1
fi

AUDIO_OUTPUT_DIR="$default_pdf_dir/audio_output"
mkdir -p "$AUDIO_OUTPUT_DIR"

echo "Converting merged PDF into natural speech audio via Kokoro..."

# Run Python script to read config.json, extract text, combine chunks, and save
python3 -u - <<EOF
import os
import json
import numpy as np
from pypdf import PdfReader
from kokoro import KPipeline
import soundfile as sf

pdf_path = "$pdf_path"
output_folder = "$AUDIO_OUTPUT_DIR"
config_path = "config.json"

# Default settings
voice = "af_heart"
lang_code = "a"
sample_rate = 24000
output_filename = "audio.mp3"

# Load configuration from config.json if present
if os.path.exists(config_path):
    try:
        with open(config_path, "r", encoding="utf-8") as f:
            config = json.load(f)
            voice = config.get("kokoro_voice", voice)
            lang_code = config.get("kokoro_lang_code", lang_code)
            sample_rate = config.get("sample_rate", sample_rate)
            output_filename = config.get("output_filename", output_filename)
            print(f" -> Loaded configuration from {config_path} (Voice: {voice}, Lang: {lang_code}, Output: {output_filename})")
    except Exception as e:
        print(f" -> Warning: Could not parse {config_path} ({e}), using default settings.")
else:
    print(f" -> {config_path} not found, using default settings.")

os.makedirs(output_folder, exist_ok=True)

print(" -> Extracting text from PDF...")
reader = PdfReader(pdf_path)
full_text = ""

for page_num, page in enumerate(reader.pages):
    text = page.extract_text()
    if text:
        full_text += text + "\n"

print(f" -> Text extraction complete. Total length: {len(full_text)} characters.")

print(f" -> Initializing Kokoro AI Pipeline (Lang code: {lang_code})...")
pipeline = KPipeline(lang_code=lang_code)

print(f" -> Generating natural audio tracks using voice '{voice}'...")
generator = pipeline(full_text, voice=voice)

all_audio_chunks = []
for i, (gs, ps, audio) in enumerate(generator):
    all_audio_chunks.append(audio)

if all_audio_chunks:
    combined_audio = np.concatenate(all_audio_chunks)
    
    # If target is MP3, we temporarily write a WAV file and use ffmpeg to encode it to MP3 cleanly
    base_name, ext = os.path.splitext(output_filename)
    temp_wav_path = os.path.join(output_folder, f"{base_name}_temp.wav")
    final_output_path = os.path.join(output_folder, output_filename)

    sf.write(temp_wav_path, combined_audio, sample_rate)

    if ext.lower() == ".mp3":
        print(f" -> Converting temporary WAV to universal MP3 format via ffmpeg...")
        os.system(f"ffmpeg -y -i '{temp_wav_path}' -codec:a libmp3lame -qscale:a 2 '{final_output_path}' >/dev/null 2>&1")
        if os.path.exists(temp_wav_path):
            os.remove(temp_wav_path)
    else:
        os.rename(temp_wav_path, final_output_path)

    print(f"   Saved final audio file: {final_output_path}")
else:
    print(" -> Warning: No audio was generated from the text.")

print(f" -> Audio generation complete in '{output_folder}'.")
EOF

# Delete the merged PDF after speech generation
rm -f "$pdf_path"
echo "The merged.pdf file was deleted."