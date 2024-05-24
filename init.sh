#!/bin/sh
python3 -m venv docs-venv
# shellcheck source=docs-venv/bin/activate
# shellcheck disable=SC1091
source docs-venv/bin/activate
pip3 install -r requirements.txt
pip3 install git+https://${GH_TOKEN}@github.com/squidfunk/mkdocs-material-insiders.git
npm install
