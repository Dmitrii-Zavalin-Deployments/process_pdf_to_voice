# Cloud-Native PDF-to-Speech (TTS) Automation Pipeline

## Overview
This repository contains an automated cloud workflow designed to monitor a designated Dropbox folder, securely download PDF documents, merge them, convert the extracted text into high-quality natural speech audio using **Kokoro AI**, and upload the resulting audio file back to Dropbox.

---

## Configuration (`config.json`)
All pipeline parameters—including voice selection, language codes, sample rates, target Dropbox directories, and output audio filenames—are managed centrally through the `config.json` file:

```json
{
  "kokoro_voice": "af_heart",
  "kokoro_lang_code": "a",
  "sample_rate": 24000,
  "dropbox_folder": "/Exchange/pdf_to_voice",
  "output_filename": "audio.wav"
}

```

---

## How It Works

1. **Add PDF Files to Dropbox**:
* Place your PDF files into the designated Dropbox folder (default: `/Exchange/pdf_to_voice`).


2. **Trigger the GitHub Workflow**:
* Navigate to the **Actions** tab in this repository on GitHub.
* Select the **"Run PDF to Natural Speech Dropbox Pipeline"** workflow and click **"Run workflow"**.


3. **Resulting Output**:
* The workflow downloads all PDF files from Dropbox, merges them into a single chronological sequence (`merged.pdf`), and extracts the text.
* Using **Kokoro AI**, the text is synthesized into natural speech streams and stitched together into a unified audio file (configured via `output_filename`, e.g., `audio.wav`).
* The final audio file is automatically uploaded back to your `/Exchange/pdf_to_voice` Dropbox folder, ready for listening.



---

## Licensing & Acknowledgments

* **Repository Automation Code**:
This project's orchestration and automation scripts are licensed under the terms of the **GNU Affero General Public License v3.0 (AGPL-3.0)**. See the `LICENSE` file for details.
* **Voice Synthesis Engine (Kokoro AI)**:
This pipeline utilizes **Kokoro** (Kokoro-82M), an open-weight text-to-speech model.
* **Model License**: Apache License 2.0.
* **Copyright**: Copyright © hexgrad and contributors.
* The Apache 2.0 license terms permit commercial and personal use, modification, and distribution, subject to preserving copyright and license notices.