#!/bin/bash

# ┌───────────────────────────────────────────┐
# │                 SDXL 1.0                  │
# └───────────────────────────────────────────┘

MODELS="$HOME/src/comfy/models"
CONTROL_NET="$MODELS/controlnet/sdxl"
CHECKPOINTS="$MODELS/checkpoints/sdxl"

# ──────────────────────────────────────────────────────────────────────────────────────────────────────
# Checkpoints
# ──────────────────────────────────────────────────────────────────────────────────────────────────────

# SDXL base
wget -c "https://huggingface.co/stabilityai/stable-diffusion-xl-base-1.0/resolve/main/sd_xl_base_1.0.safetensors" -O "$CHECKPOINTS/sd_xl_base_1.0.safetensors"

# SDXL refiner
wget -c "https://huggingface.co/stabilityai/stable-diffusion-xl-refiner-1.0/resolve/main/sd_xl_refiner_1.0.safetensors" -O "$CHECKPOINTS/sd_xl_refiner_1.0.safetensors"

# Realistic models - CivitAI
wget -c "https://civitai.com/api/download/models/782002?type=Model&format=SafeTensor&size=full&fp=fp16" -O "$CHECKPOINTS/juggernautXL_jugg_XI_by_RunDiffusion.safetensors"
wget -c "https://civitai.com/api/download/models/351306?type=Model&format=SafeTensor&size=full&fp=fp16" -O "$CHECKPOINTS/dreamshaperXL_v21TurboDPMSDE.safetensors"
wget -c "https://civitai.com/api/download/models/1522905?type=Model&format=SafeTensor&size=pruned&fp=fp16" -O "$CHECKPOINTS/epicrealismXL_vxviLastfameRealism.safetensors"


# ──────────────────────────────────────────────────────────────────────────────────────────────────────
# ControlNets
# ──────────────────────────────────────────────────────────────────────────────────────────────────────

wget -c "https://huggingface.co/xinsir/controlnet-union-sdxl-1.0/resolve/main/diffusion_pytorch_model_promax.safetensors" -O "$CONTROL_NET/controlnet-union-sdxl-1.0.safetensors"

# ──────────────────────────────────────────────────────────────────────────────────────────────────────
# Upscalers
# ──────────────────────────────────────────────────────────────────────────────────────────────────────

wget -c "https://civitai.com/api/download/models/125843?type=Model&format=PickleTensor" -O "$MODELS/upscale_models/4x-Ultrasharp.pth"

# ──────────────────────────────────────────────────────────────────────────────────────────────────────
# VAE
# ──────────────────────────────────────────────────────────────────────────────────────────────────────

wget -c "https://huggingface.co/stabilityai/sdxl-vae/resolve/main/sdxl_vae.safetensors" -O "$MODELS/vae/sdxl_vae.safetensors"

# ──────────────────────────────────────────────────────────────────────────────────────────────────────
# Instant ID
# ──────────────────────────────────────────────────────────────────────────────────────────────────────

wget -c "https://huggingface.co/h94/IP-Adapter-FaceID/resolve/main/ip-adapter-faceid-plusv2_sdxl.bin" -O "$MODELS/instantid/ip-adapter-faceid-plusv2_sdxl.bin"
wget -c "https://github.com/deepinsight/insightface/releases/download/v0.7/antelopev2.zip" -O "$MODELS/insightface/antelopev2.zip"

unzip "$MODELS/models/insightface/antelopev2.zip" -d "$MODELS/insightface/models/"

