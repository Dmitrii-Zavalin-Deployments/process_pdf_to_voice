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

### 2. PyTorch, Torchaudio & Core Runtimes
- **Components:** `torch` (`2.14.1`), `torchaudio` (`2.11.0`), `sympy`, `networkx`, `jinja2`, `fsspec`, `filelock`, `mpmath`, `triton`, and associated acceleration toolchains (`nvidia_*` toolkits, `cuda_*`).
- **Source:** [PyTorch Core & Ecosystem](https://pytorch.org/)
- **License:** [BSD 3-Clause License](https://github.com/pytorch/pytorch/blob/main/LICENSE)
- **Description:** Supplies tensor computation backends and audio processing operations for local speech generation.

### 3. spaCy NLP Pipeline & Linguistic Models
- **Components:** `spacy` (`v3.7.5`), `en_core_web_sm` (`v3.7.0`), `thinc`, `blis`, `weasel`, `confection`, `srsly`, `catalogue`, `cymem`, `murmurhash`, `preshed`, `wasabi`, `typer`, `click`, `cloudpathlib`, `langcodes`, `smart_open`, `curated_tokenizers`, `curated_transformers`, and `spacy_curated_transformers`.
- **Source:** [Explosion AI / spaCy](https://spacy.io/)
- **License:** [MIT License](https://opensource.org/licenses/MIT)
- **Description:** Handles linguistic sentence segmentation, text tokenization, and linguistic feature parsing for speech boundary detection completely offline.

### 4. Integration Utilities, Serialization & Storage Drivers
- **Components:** `dropbox` SDK (`v12.1.0`), `stone`, `requests`, `urllib3`, `certifi`, `idna`, `charset_normalizer`, `pypdf`, `soundfile`, `pydantic`, `pydantic_core`, `yaml` (`pyyaml`), `babel`, `jsonschema`, `transformers`, `tokenizers`, `safetensors`, `loguru`, `tqdm`, `click`, `shellingham`, `typing_extensions`, `typing_inspection`, `annotated_types`, `annotated_doc`, `addict`, `anyio`, `attrs`, `cffi`, `pycparser`, `cloudpickle`, `csvw`, `dlinfo`, `docopt`, `espeakng_loader`, `exceptiongroup`, `h11`, `hf_xet`, `httpcore2`, `httpx2`, `huggingface_hub`, `isodate`, `joblib`, `jsonschema_specifications`, `language_tags`, `markupsafe`, `num2words`, `packaging`, `phonemizer_fork`, `ply`, `pyparsing`, `python_dateutil`, `rdflib`, `referencing`, `regex`, `rfc3986`, `rpds_py`, `segments`, `setuptools`, `six`, `termcolor`, `tomli`, `truststore`, `tzdata`, and `uritemplate`.
- **Source:** PyPI Ecosystem & Official Maintainers
- **License:** MIT / Apache 2.0 / BSD / PSF
- **Description:** Manages automated Dropbox cloud synchronization, secure credential handling, PDF layout extraction, configuration validation, tokenization, and audio stream encoding.

---

## Complete Vendor File Inventory & Links

Below is the complete inventory of all harvested wheels located in `vendor/` along with links to their respective source repositories and licenses:

| Wheel Filename | Upstream Source Repository | License |
| :--- | :--- | :--- |
| `addict-2.4.0-py3-none-any.whl` | [Addict on GitHub](https://github.com/mewwts/addict) | [MIT License](https://github.com/mewwts/addict/blob/master/LICENSE) |
| `annotated_types-0.8.0-py3-none-any.whl` | [Annotated Types on GitHub](https://github.com/annotated-types/annotated-types) | [MIT License](https://github.com/annotated-types/annotated-types/blob/main/LICENSE) |
| `anyio-4.15.1-py3-none-any.whl` | [AnyIO on GitHub](https://github.com/agronholm/anyio) | [MIT License](https://github.com/agronholm/anyio/blob/main/LICENSE) |
| `attrs-26.1.0-py3-none-any.whl` | [Attrs on GitHub](https://github.com/python-attrs/attrs) | [MIT License](https://github.com/python-attrs/attrs/blob/main/LICENSE) |
| `babel-2.18.0-py3-none-any.whl` | [Babel on GitHub](https://github.com/python-babel/babel) | [BSD 3-Clause](https://github.com/python-babel/babel/blob/master/LICENSE) |
| `blis-0.7.11-...whl` | [Blis on GitHub](https://github.com/explosion/cython-blis) | [MIT License](https://github.com/explosion/cython-blis/blob/master/LICENSE) |
| `catalogue-2.0.10-...whl` | [Catalogue on GitHub](https://github.com/explosion/catalogue) | [MIT License](https://github.com/explosion/catalogue/blob/master/LICENSE) |
| `certifi-2026.10.23-...whl` | [Certifi on GitHub](https://github.com/certifi/python-certifi) | [MPL 2.0](https://github.com/certifi/python-certifi/blob/master/LICENSE) |
| `cffi-2.1.1-...whl` | [CFFI on Foss.heptapod](https://foss.heptapod.ai/cffi/cffi) | [MIT License](https://foss.heptapod.ai/cffi/cffi/-/blob/branch/default/LICENSE) |
| `charset_normalizer-3.5.2-...whl` | [Charset Normalizer on GitHub](https://github.com/jettify/charset-normalizer) | [MIT License](https://github.com/jettify/charset-normalizer/blob/master/LICENSE) |
| `click-8.5.0-...whl` | [Click on GitHub](https://github.com/pallets/click) | [BSD 3-Clause](https://github.com/pallets/click/blob/main/LICENSE.rst) |
| `cloudpathlib-0.16.0-...whl` | [Cloudpathlib on GitHub](https://github.com/drivendataorg/cloudpathlib) | [MIT License](https://github.com/drivendataorg/cloudpathlib/blob/main/LICENSE) |
| `cloudpickle-3.1.2-...whl` | [Cloudpickle on GitHub](https://github.com/cloudpipe/cloudpickle) | [BSD 3-Clause](https://github.com/cloudpipe/cloudpickle/blob/master/LICENSE) |
| `confection-0.1.5-...whl` | [Confection on GitHub](https://github.com/explosion/confection) | [MIT License](https://github.com/explosion/confection/blob/master/LICENSE) |
| `csvw-4.1.1-...whl` | [CSVW on GitHub](https://github.com/cldf/csvw) | [Apache 2.0](https://github.com/cldf/csvw/blob/master/LICENSE) |
| `cuda_bindings-13.4.4-...whl` | [NVIDIA CUDA on PyPI](https://pypi.org/project/nvidia-cuda-runtime-cu13/) | [NVIDIA Proprietary / EULA](https://docs.nvidia.com/cuda/eula/index.html) |
| `cuda_pathfinder-1.8.3-...whl` | [NVIDIA CUDA on PyPI](https://pypi.org) | [NVIDIA Proprietary / EULA](https://developer.nvidia.com) |
| `cuda_toolkit-13.0.3.0-...whl` | [NVIDIA CUDA on PyPI](https://pypi.org) | [NVIDIA Proprietary / EULA](https://developer.nvidia.com) |
| `curated_tokenizers-0.0.10-...whl` | [Curated Tokenizers on GitHub](https://github.com/explosion/curated-tokenizers) | [MIT License](https://github.com/explosion/curated-tokenizers/blob/main/LICENSE) |
| `curated_transformers-0.1.1-...whl` | [Curated Transformers on GitHub](https://github.com/explosion/curated-transformers) | [MIT License](https://github.com/explosion/curated-transformers/blob/main/LICENSE) |
| `cymem-2.0.16-...whl` | [Cymem on GitHub](https://github.com/explosion/cymem) | [MIT License](https://github.com/explosion/cymem/blob/master/LICENSE) |
| `dlinfo-2.0.0-...whl` | [Dlinfo on GitHub](https://github.com/sampsyo/dlinfo) | [MIT License](https://github.com/sampsyo/dlinfo/blob/master/LICENSE) |
| `docopt-0.6.2.tar.gz` | [Docopt on GitHub](https://github.com/docopt/docopt) | [MIT License](https://github.com/docopt/docopt/blob/master/LICENSE-MIT) |
| `dropbox-12.1.0-...whl` | [Dropbox Python SDK on GitHub](https://github.com/dropbox/dropbox-sdk-python) | [MIT License](https://github.com/dropbox/dropbox-sdk-python/blob/master/LICENSE) |
| `en_core_web_sm-3.7.0-...whl` | [spaCy Models on GitHub](https://github.com/explosion/spacy-models) | [MIT License](https://github.com/explosion/spacy-models/blob/main/LICENSE) |
| `espeakng_loader-0.2.4-...whl` | [Espeakng Loader on GitHub](https://github.com/espeak-ng/espeak-ng) | [Apache 2.0](https://github.com/espeak-ng/espeak-ng/blob/master/License.txt) |
| `exceptiongroup-1.3.1-...whl` | [Exceptiongroup on GitHub](https://github.com/agronholm/exceptiongroup) | [MIT License](https://github.com/agronholm/exceptiongroup/blob/main/LICENSE) |
| `filelock-4.1.0-...whl` | [Filelock on GitHub](https://github.com/tox-dev/py-filelock) | [Unlicense](https://github.com/tox-dev/py-filelock/blob/main/LICENSE) |
| `fsspec-2026.9.0-...whl` | [Fsspec on GitHub](https://github.com/fsspec/filesystem_spec) | [BSD 3-Clause](https://github.com/fsspec/filesystem_spec/blob/master/LICENSE) |
| `h11-0.16.0-...whl` | [H11 on GitHub](https://github.com/python-hyper/h11) | [MIT License](https://github.com/python-hyper/h11/blob/master/LICENSE.txt) |
| `hf_xet-1.7.0-...whl` | [Hugging Face Xet on PyPI](https://pypi.org/project/hf-xet/) | [Apache 2.0](https://github.com/huggingface/hf-xet) |
| `httpcore2-2.14.0-...whl` | [Httpcore on GitHub](https://github.com/encode/httpcore) | [BSD 3-Clause](https://github.com/encode/httpcore/blob/master/LICENSE.md) |
| `httpx2-2.14.0-...whl` | [Httpx on GitHub](https://github.com/encode/httpx) | [BSD 3-Clause](https://github.com/encode/httpx/blob/master/LICENSE.md) |
| `huggingface_hub-2.3.0-...whl` | [Hugging Face Hub on GitHub](https://github.com/huggingface/huggingface_hub) | [Apache 2.0](https://github.com/huggingface/huggingface_hub/blob/main/LICENSE) |
| `idna-3.20-...whl` | [IDNA on GitHub](https://github.com/kjd/idna) | [BSD 3-Clause](https://github.com/kjd/idna/blob/master/LICENSE.md) |
| `isodate-0.7.2-...whl` | [Isodate on GitHub](https://github.com/gweis/isodate) | [BSD 3-Clause](https://github.com/gweis/isodate/blob/master/LICENCE) |
| `jinja2-3.1.6-...whl` | [Jinja on GitHub](https://github.com/pallets/jinja) | [BSD 3-Clause](https://github.com/pallets/jinja/blob/main/LICENSE.rst) |
| `joblib-1.6.0-...whl` | [Joblib on GitHub](https://github.com/joblib/joblib) | [BSD 3-Clause](https://github.com/joblib/joblib/blob/main/LICENSE.txt) |
| `jsonschema-4.26.0-...whl` | [JSON Schema on GitHub](https://github.com/python-jsonschema/jsonschema) | [MIT License](https://github.com/python-jsonschema/jsonschema/blob/main/COPYING) |
| `jsonschema_specifications-...whl` | [JSON Schema Specs on GitHub](https://github.com/python-jsonschema/jsonschema-specifications) | [MIT License](https://github.com/python-jsonschema/jsonschema-specifications/blob/main/COPYING) |
| `kokoro-0.9.4-...whl` | [Kokoro-82M on GitHub](https://github.com/hexgrad/kokoro) | [Apache 2.0](https://github.com/hexgrad/kokoro/blob/main/LICENSE) |
| `langcodes-3.5.1-...whl` | [Langcodes on GitHub](https://github.com/rspeer/python-langcodes) | [MIT License](https://github.com/rspeer/python-langcodes/blob/master/LICENSE.txt) |
| `language_tags-1.3.2-...whl` | [Language Tags on GitHub](https://github.com/ilingua/language-tags) | [MIT License](https://github.com/ilingua/language-tags/blob/master/LICENSE) |
| `loguru-0.7.3-...whl` | [Loguru on GitHub](https://github.com/Delgan/loguru) | [MIT License](https://github.com/Delgan/loguru/blob/master/LICENSE) |
| `markupsafe-3.0.4-...whl` | [MarkupSafe on GitHub](https://github.com/pallets/markupsafe) | [BSD 3-Clause](https://github.com/pallets/markupsafe/blob/main/LICENSE.txt) |
| `misaki-0.9.4-...whl` | [Misaki G2P on GitHub](https://github.com/hexgrad/misaki) | [Apache 2.0](https://github.com/hexgrad/misaki/blob/main/LICENSE) |
| `mpmath-1.3.0-...whl` | [Mpmath on GitHub](https://github.com/fredrik-johansson/mpmath) | [BSD 3-Clause](https://github.com/fredrik-johansson/mpmath/blob/master/LICENSE) |
| `murmurhash-1.0.16-...whl` | [Murmurhash on GitHub](https://github.com/explosion/murmurhash) | [MIT License](https://github.com/explosion/murmurhash/blob/master/LICENSE) |
| `networkx-3.4.2-...whl` | [NetworkX on GitHub](https://github.com/networkx/networkx) | [BSD 3-Clause](https://github.com/networkx/networkx/blob/main/LICENSE.txt) |
| `num2words-0.5.14-...whl` | [Num2words on GitHub](https://github.com/savoirfairelinux/num2words) | [MIT License](https://github.com/savoirfairelinux/num2words/blob/master/LICENSE) |
| `numpy-1.26.4-...whl` | [NumPy on GitHub](https://github.com/numpy/numpy) | [BSD 3-Clause](https://github.com/numpy/numpy/blob/main/LICENSE.txt) |
| `nvidia_*` packages (cublas, cupti, nvrtc, etc.) | [NVIDIA PyTorch Ecosystem](https://pypi.org) | [NVIDIA Proprietary / EULA](https://developer.nvidia.com) |
| `packaging-26.3-...whl` | [Packaging on GitHub](https://github.com/pypa/packaging) | [Apache 2.0 / BSD](https://github.com/pypa/packaging/blob/main/LICENSE) |
| `phonemizer_fork-3.3.2-...whl` | [Phonemizer on GitHub](https://github.com/bootphon/phonemizer) | [GPLv3 / MIT Fork](https://github.com/bootphon/phonemizer) |
| `ply-3.11-...whl` | [PLY on GitHub](https://github.com/dabeaz/ply) | [BSD 3-Clause](https://github.com/dabeaz/ply/blob/master/README.md) |
| `preshed-3.0.15-...whl` | [Preshed on GitHub](https://github.com/explosion/preshed) | [MIT License](https://github.com/explosion/preshed/blob/master/LICENSE) |
| `pycparser-3.11-...whl` | [Pycparser on GitHub](https://github.com/eliben/pycparser) | [BSD 3-Clause](https://github.com/eliben/pycparser/blob/release-v3.x/LICENSE) |
| `pydantic-2.14.1-...whl` | [Pydantic on GitHub](https://github.com/pydantic/pydantic) | [MIT License](https://github.com/pydantic/pydantic/blob/main/LICENSE) |
| `pydantic_core-2.50.1-...whl` | [Pydantic Core on GitHub](https://github.com/pydantic/pydantic-core) | [MIT License](https://github.com/pydantic/pydantic-core/blob/main/LICENSE) |
| `pyparsing-3.3.3-...whl` | [Pyparsing on GitHub](https://github.com/pyparsing/pyparsing) | [MIT License](https://github.com/pyparsing/pyparsing/blob/master/LICENSE) |
| `pypdf-6.21.2-...whl` | [PyPDF on GitHub](https://github.com/py-pdf/pypdf) | [BSD 3-Clause](https://github.com/py-pdf/pypdf/blob/main/LICENSE) |
| `python_dateutil-3.0.0-...whl` | [Dateutil on GitHub](https://github.com/dateutil/dateutil) | [Apache 2.0 / BSD](https://github.com/dateutil/dateutil/blob/master/LICENSE) |
| `pyyaml-6.0.3-...whl` | [PyYAML on GitHub](https://github.com/yaml/pyyaml) | [MIT License](https://github.com/yaml/pyyaml/blob/master/LICENSE) |
| `rdflib-7.6.0-...whl` | [RDFLib on GitHub](https://github.com/RDFLib/rdflib) | [BSD 3-Clause](https://github.com/RDFLib/rdflib/blob/main/LICENSE) |
| `referencing-0.37.0-...whl` | [Referencing on GitHub](https://github.com/python-jsonschema/referencing) | [MIT License](https://github.com/python-jsonschema/referencing/blob/main/COPYING) |
| `regex-2026.9.29-...whl` | [Regex on GitHub](https://github.com/python-re/regex) | [Apache 2.0](https://github.com/python-re/regex/blob/main/LICENSE.txt) |
| `requests-2.34.2-...whl` | [Requests on GitHub](https://github.com/psf/requests) | [Apache 2.0](https://github.com/psf/requests/blob/main/LICENSE) |
| `rfc3986-1.5.0-...whl` | [RFC3986 on GitHub](https://github.com/python-hyper/rfc3986) | [Apache 2.0](https://github.com/python-hyper/rfc3986/blob/master/LICENSE) |
| `rpds_py-0.30.0-...whl` | [RPDS on GitHub](https://github.com/python-jsonschema/rpds) | [MIT License](https://github.com/python-jsonschema/rpds/blob/main/LICENSE) |
| `safetensors-0.8.0-...whl` | [Safetensors on GitHub](https://github.com/huggingface/safetensors) | [Apache 2.0](https://github.com/huggingface/safetensors/blob/main/LICENSE) |
| `segments-2.4.0-...whl` | [Segments on GitHub](https://github.com/cldf/segments) | [Apache 2.0](https://github.com/cldf/segments/blob/master/LICENSE) |
| `setuptools-84.2.1-...whl` | [Setuptools on GitHub](https://github.com/pypa/setuptools) | [MIT License](https://github.com/pypa/setuptools/blob/main/LICENSE) |
| `six-1.17.0-...whl` | [Six on GitHub](https://github.com/benjaminp/six) | [MIT License](https://github.com/benjaminp/six/blob/master/LICENSE) |
| `smart_open-6.4.0-...whl` | [Smart Open on GitHub](https://github.com/RaRe-Technologies/smart_open) | [MIT License](https://github.com/RaRe-Technologies/smart_open/blob/master/LICENSE) |
| `soundfile-0.14.0-...whl` | [PySoundFile on GitHub](https://github.com/bastibe/python-soundfile) | [BSD 3-Clause](https://github.com/bastibe/python-soundfile/blob/master/LICENSE) |
| `spacy-3.7.5-...whl` | [spaCy on GitHub](https://github.com/explosion/spaCy) | [MIT License](https://github.com/explosion/spaCy/blob/master/LICENSE) |
| `spacy_curated_transformers-...whl` | [spaCy Transformers on GitHub](https://github.com/explosion/spacy-transformers) | [MIT License](https://github.com/explosion/spacy-transformers/blob/master/LICENSE) |
| `spacy_legacy-3.0.12-...whl` | [spaCy Legacy on GitHub](https://github.com/explosion/spacy-legacy) | [MIT License](https://github.com/explosion/spacy-legacy/blob/master/LICENSE) |
| `spacy_loggers-1.0.5-...whl` | [spaCy Loggers on GitHub](https://github.com/explosion/spacy-loggers) | [MIT License](https://github.com/explosion/spacy-loggers/blob/master/LICENSE) |
| `srsly-2.5.5-...whl` | [Srsly on GitHub](https://github.com/explosion/srsly) | [MIT License](https://github.com/explosion/srsly/blob/master/LICENSE) |
| `stone-3.3.9-...whl` | [Stone on GitHub](https://github.com/dropbox/stone) | [MIT License](https://github.com/dropbox/stone/blob/master/LICENSE) |
| `sympy-1.14.0-...whl` | [SymPy on GitHub](https://github.com/sympy/sympy) | [BSD 3-Clause](https://github.com/sympy/sympy/blob/master/LICENSE) |
| `termcolor-3.3.0-...whl` | [Termcolor on GitHub](https://github.com/termcolor/termcolor) | [MIT License](https://github.com/termcolor/termcolor/blob/main/COPYING.txt) |
| `thinc-8.2.5-...whl` | [Thinc on GitHub](https://github.com/explosion/thinc) | [MIT License](https://github.com/explosion/thinc/blob/master/LICENSE) |
| `tokenizers-0.23.3-...whl` | [Tokenizers on GitHub](https://github.com/huggingface/tokenizers) | [Apache 2.0](https://github.com/huggingface/tokenizers/blob/main/LICENSE) |
| `tomli-2.5.0-...whl` | [Tomli on GitHub](https://github.com/hukkin/tomli) | [MIT License](https://github.com/hukkin/tomli/blob/master/LICENSE) |
| `torch-2.14.1-...whl` | [PyTorch on GitHub](https://github.com/pytorch/pytorch) | [BSD 3-Clause](https://github.com/pytorch/pytorch/blob/main/LICENSE) |
| `torchaudio-2.11.0-...whl` | [PyTorch Audio on GitHub](https://github.com/pytorch/audio) | [BSD 3-Clause](https://github.com/pytorch/audio/blob/main/LICENSE) |
| `tqdm-4.70.1-...whl` | [TQDM on GitHub](https://github.com/tqdm/tqdm) | [MIT License / MPL 2.0](https://github.com/tqdm/tqdm/blob/master/LICENCE) |
| `transformers-5.20.2-...whl` | [Transformers on GitHub](https://github.com/huggingface/transformers) | [Apache 2.0](https://github.com/huggingface/transformers/blob/main/LICENSE) |
| `triton-3.8.0-...whl` | [Triton on GitHub](https://github.com/triton-lang/triton) | [MIT License](https://github.com/triton-lang/triton/blob/main/LICENSE) |
| `truststore-0.10.5-...whl` | [Truststore on GitHub](https://github.com/sethmlarson/truststore) | [MIT License](https://github.com/sethmlarson/truststore/blob/main/LICENSE) |
| `typer-0.9.4-...whl` | [Typer on GitHub](https://github.com/tiangolo/typer) | [MIT License](https://github.com/tiangolo/typer/blob/master/LICENSE) |
| `typing_extensions-4.16.0-...whl` | [Typing Extensions on GitHub](https://github.com/python/typing) | [PSF / MIT License](https://github.com/python/typing/blob/main/LICENSE) |
| `typing_inspection-0.4.4-...whl` | [Typing Inspection on GitHub](https://github.com/ilevkivskyi/typing_inspect) | [MIT License](https://github.com/ilevkivskyi/typing_inspect/blob/master/LICENSE) |
| `tzdata-2026.5-...whl` | [Tzdata on GitHub](https://github.com/python/tzdata) | [Apache 2.0](https://github.com/python/tzdata/blob/master/LICENSE) |
| `uritemplate-4.2.0-...whl` | [URITemplate on GitHub](https://github.com/uri-templates/uritemplate-py) | [Apache 2.0 / BSD](https://github.com/uri-templates/uritemplate-py/blob/master/LICENSE) |
| `urllib3-2.8.0-...whl` | [Urllib3 on GitHub](https://github.com/urllib3/urllib3) | [MIT License](https://github.com/urllib3/urllib3/blob/main/LICENSE.txt) |
| `wasabi-1.1.3-...whl` | [Wasabi on GitHub](https://github.com/explosion/wasabi) | [MIT License](https://github.com/explosion/wasabi/blob/master/LICENSE) |
| `weasel-0.3.4-...whl` | [Weasel on GitHub](https://github.com/explosion/weasel) | [MIT License](https://github.com/explosion/weasel/blob/master/LICENSE) |

---

## Legal & Distribution Summary

All bundled vendor components are distributed under their respective permissive open-source licenses (**Apache License 2.0**, **MIT**, **BSD 3-Clause**, and **PSF**). 

Unless required by applicable law or agreed to in writing, software distributed under the `vendor/` directory is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.

### 5. Hugging Face Model Weights & Voice Checkpoints
- **Components:** `config.json`, `kokoro-v1_0.pth` (Neural Model Weights), and `voices/af_heart.pt` (Voice Style Checkpoint).
- **Source:** [Hexgrad / Kokoro-82M on Hugging Face Hub](https://huggingface.co/hexgrad/Kokoro-82M)
- **License:** [Apache License 2.0](https://www.apache.org/licenses/LICENSE-2.0)
- **Description:** Pre-cached neural text-to-speech architecture weights and voice embedding profiles stored locally in `vendor/huggingface_cache/` (tracked via Git LFS) to enable 100% offline, air-gapped synthesis execution without external runtime hub lookups.