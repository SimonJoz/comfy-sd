#!/bin/bash

set -e

# ======================================================================================
# Install ComfyUI
# ======================================================================================
python -m venv .venv
source ./.venv/bin/activate

python -m pip install comfy-cli
python -m pip install --upgrade pip

comfy --workspace="./comfyui" --skip-prompt install --m-series
comfy update all
comfy tracking disable
comfy env
# ======================================================================================
# Start ComfyUI
# ======================================================================================
nohup comfy launch --background -- --port 8080
