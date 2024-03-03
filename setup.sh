#!/usr/bin/env bash

python3 -m venv docs-venv
# shellcheck source=docs-venv/bin/activate
# shellcheck disable=SC1091
source docs-venv/bin/activate
pip3 install -r requirements.txt
