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
pdf_files=$(find "$default_pdf_dir" -maxdepth 1 -name "*.pdf")

if [ -z "$pdf_files" ]; then
    echo "No PDF files found in $default_pdf_dir. Please ensure files are downloaded before running this script."
    exit 1
fi

echo "Found the following PDF files in $default_pdf_dir:"
for pdf_file in $pdf_files; do
    echo "$(basename "$pdf_file")"
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

# Install system dependencies required by Kokoro phonemizer (espeak-ng)
echo "Installing system dependencies (espeak-ng)..."
sudo apt-get update && sudo apt-get install -y espeak-ng

# Install Python dependencies for Kokoro AI speech synthesis
echo "Installing Kokoro AI and audio packages..."
pip install --upgrade pip --quiet
pip install -q kokoro>=0.9.2 soundfile pypdf torchaudio

# Run PDFMerge.sh if it exists to merge multiple PDFs into one
if [ -x ./PDFMerge.sh ]; then
    echo "Running PDFMerge.sh on $default_pdf_dir..."
    ./PDFMerge.sh "$default_pdf_dir"
else
    echo "PDFMerge.sh is not found or not executable."
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

# Run Python script to extract text and generate audio chunks
python3 -u - <<EOF
import os
from pypdf import PdfReader
from kokoro import KPipeline
import soundfile as sf

pdf_path = "$pdf_path"
output_folder = "$AUDIO_OUTPUT_DIR"
voice = "af_heart"  # Calm, soft, pleasant natural voice style

os.makedirs(output_folder, exist_ok=True)

print(" -> Extracting text from PDF...")
reader = PdfReader(pdf_path)
full_text = ""

for page_num, page in enumerate(reader.pages):
    text = page.extract_text()
    if text:
        full_text += text + "\n"

print(f" -> Text extraction complete. Total length: {len(full_text)} characters.")

print(" -> Initializing Kokoro AI Pipeline (American English)...")
pipeline = KPipeline(lang_code='a')

print(" -> Generating natural audio tracks...")
generator = pipeline(full_text, voice=voice)

for i, (gs, ps, audio) in enumerate(generator):
    output_filename = os.path.join(output_folder, f"audio_chunk_{i:03d}.wav")
    sf.write(output_filename, audio, 24000)
    print(f"   Saved: {output_filename}")

print(f" -> All audio chunks successfully generated in '{output_folder}'.")
EOF

# Delete the merged PDF after speech generation
rm -f "$pdf_path"
echo "The merged.pdf file was deleted."