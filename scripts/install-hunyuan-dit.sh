#!/bin/bash

# ┌───────────────────────────────────────────┐
# │               Hunyuan-DIT                 │
# └───────────────────────────────────────────┘


MODELS="$COMFY_HOME/models"
CHECKPOINTS="$MODELS/checkpoints/hunyuan"

# ──────────────────────────────────────────────────────────────────────────────────────────────────────
# Checkpoints
# ──────────────────────────────────────────────────────────────────────────────────────────────────────

# 8.24 GB
wget -c "https://huggingface.co/comfyanonymous/hunyuan_dit_comfyui/resolve/main/hunyuan_dit_1.2.safetensors" -O "$CHECKPOINTS/hunyuan_dit_1.2.safetensors"

