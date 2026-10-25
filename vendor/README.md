# Vendor Dependencies & Python Wheels

This directory contains vendored third-party Python wheel distributions, offline NLP binaries, and text-to-speech model components integrated into the **PDF-to-Voice Autonomous Pipeline**.

These assets have been vendored directly into this repository to ensure absolute system stability, eliminate runtime external network dependency risks, prevent package breakage from upstream PyPI changes, and guarantee 100% air-gapped reproducibility inside CI/CD execution environments like GitHub Actions.

---

## Included Components & License Compliance

### 1. Kokoro AI & Misaki G2P Engine
- **Components:** `kokoro` (`v0.9.4`) & `misaki` (`v0.9.4`) Python wheel distributions.
- **Source:** [Hexgrad / Kokoro-82M](https://github.com/hexgrad/kokoro) & [Misaki G2P](https://github.com/hexgrad/misaki)
- **License:** [Apache License 2.0](https://www.apache.org/licenses/LICENSE-2.0)
- **Description:** Provides the core neural text-to-speech architecture, grapheme-to-phoneme conversion, and multi-voice synthesis pipeline.

### 2. PyTorch & Torchaudio (CPU Runtimes)
- **Components:** `torch` (`2.14.1+cpu`) & `torchaudio` (`2.11.0+cpu`) CPU-optimized wheel packages.
- **Source:** [PyTorch Core & Ecosystem](https://pytorch.org/)
- **License:** [BSD 3-Clause License](https://github.com/pytorch/pytorch/blob/main/LICENSE)
- **Description:** Supplies lightweight CPU tensor execution backends and audio processing operations for local speech generation without requiring heavy NVIDIA CUDA GPU runtimes.

### 3. spaCy NLP Pipeline & Dependencies
- **Components:** `spacy` (`v3.7.4`), `en_core_web_sm`, `thinc`, `blis`, and structural tokenization utilities.
- **Source:** [Explosion AI / spaCy](https://spacy.io/)
- **License:** [MIT License](https://opensource.org/licenses/MIT)
- **Description:** Handles linguistic sentence segmentation, text tokenization, and linguistic feature parsing for speech boundary detection.

### 4. Integration Utilities & Storage Drivers
- **Components:** `dropbox` SDK, `requests`, `pypdf`, `soundfile`, and core helper modules.
- **Source:** PyPI Ecosystem & Official Maintainers
- **License:** MIT / Apache 2.0 / BSD
- **Description:** Manages automated Dropbox cloud synchronization, secure OAuth credential exchanges, PDF layout extraction, and final audio stream encoding.

---

## Legal & Distribution Summary

All bundled vendor components are distributed under their respective permissive open-source licenses (**Apache License 2.0**, **MIT**, and **BSD 3-Clause**). 

Unless required by applicable law or agreed to in writing, software distributed under the `vendor/` directory is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
