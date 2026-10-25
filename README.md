# Autonomous Air-Gapped PDF-to-Speech (TTS) Pipeline

## Overview
This repository contains a fully autonomous, offline-capable cloud workflow designed to monitor a designated Dropbox folder, securely download PDF documents, merge them, convert the extracted text into high-quality natural speech audio using **Kokoro AI** via local CPU execution, and upload the resulting audio file back to Dropbox.

By utilizing a local `./vendor` directory containing pre-downloaded Python wheel distributions, this pipeline runs completely independently of external PyPI stability, preventing upstream package deletions or build failures.

---

## Configuration (`config.json`)
All pipeline parameters—including voice selection, language codes, sample rates, target Dropbox directories, and output audio filenames—are managed centrally through the `config.json` file[cite: 2]:

```json
{
  "kokoro_voice": "af_heart",
  "kokoro_lang_code": "a",
  "sample_rate": 24000,
  "dropbox_folder": "/Exchange/pdf_to_voice",
  "output_filename": "audio.mp3"
}

```

---

## How It Works

1. **Add PDF Files to Dropbox**:
* Place your PDF files into the designated Dropbox folder (default: `/Exchange/pdf_to_voice`).


2. **Trigger the GitHub Workflow**:
* Navigate to the **Actions** tab in this repository on GitHub.
* Select the **"Run PDF to Natural Speech Dropbox Pipeline"** workflow and click **"Run workflow"**.


3. **Autonomous Execution & Resulting Output**:
* The workflow installs all required dependencies completely offline from the local `./vendor` directory.
* It downloads all PDF files from Dropbox, merges them into a single chronological sequence (`merged.pdf`), and extracts the raw text.
* Using **Kokoro AI**, the text is synthesized into natural speech streams via local PyTorch CPU optimization and stitched together into a unified audio file (configured via `output_filename`, e.g., `audio.mp3`).
* The final audio file is automatically uploaded back to your Dropbox folder, ready for listening.



---

## Repository Architecture

```text
pdf_to_voice/
├── downloaded_pdfs/         # Ephemeral runtime directory for processing
├── vendor/                  # Local offline Python wheels & third-party assets
│   └── README.md            # Vendor compliance and open-source licenses
├── config.json              # Central pipeline configuration
├── download_from_dropbox.py # Dropbox download & cleanup client
├── process_downloaded_pdfs.sh # Main offline build & Kokoro TTS engine script
├── upload_to_dropbox.py     # Dropbox audio upload handler
├── PDFMerge.sh              # PDF merging utility script
├── main.sh                  # Master pipeline execution orchestrator
├── LICENSE                  # GNU AGPL-3.0 License
└── README.md                # Project documentation

```

---

## Licensing & Acknowledgments

* **Orchestration & Automation Code**:
This project's source code and automation scripts are licensed under the terms of the **GNU Affero General Public License v3.0 (AGPL-3.0)**. See the `LICENSE` file for full details.
* **Vendor Dependencies (`vendor/`)**:
Third-party software modules, CPU runtimes, and model components bundled within the `vendor/` directory (including Kokoro AI, spaCy, and PyTorch CPU builds) are distributed under their respective permissive open-source licenses (**Apache License 2.0**, **MIT**, and **BSD 3-Clause**). For complete details, see the [vendor/README.md](https://www.google.com/search?q=vendor/README.md) file.