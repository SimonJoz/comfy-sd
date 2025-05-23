#!/bin/bash

# ┌───────────────────────────────────────────┐
# │                  SD 1.5                   │
# └───────────────────────────────────────────┘

MODELS="$HOME/src/comfy/models"
# LORAS="$MODELS/loras/sd15"
CONTROL_NET="$MODELS/controlnet/sd15"
CHECKPOINTS="$MODELS/checkpoints/sd15"

# ──────────────────────────────────────────────────────────────────────────────────────────────────────
# Checkpoints
# ──────────────────────────────────────────────────────────────────────────────────────────────────────

# Realistic models - CivitAI
wget -c "https://civitai.com/api/download/models/143906?type=Model&format=SafeTensor&size=pruned&fp=fp16" -O "$CHECKPOINTS/epicrealism_naturalSinRC1VAE.safetensors"
wget -c "https://civitai.com/api/download/models/501240?type=Model&format=SafeTensor&size=full&fp=fp16" -O "$CHECKPOINTS/realisticVisionV60B1_v51HyperVAE.safetensors"


# ──────────────────────────────────────────────────────────────────────────────────────────────────────
# LoRAs
# ──────────────────────────────────────────────────────────────────────────────────────────────────────

# PLACEHOLDER

# ──────────────────────────────────────────────────────────────────────────────────────────────────────
# ControlNets
# ──────────────────────────────────────────────────────────────────────────────────────────────────────

wget -c "https://civitai.com/api/download/models/469517?type=Model&format=SafeTensor" -O "$CONTROL_NET/outfitToOutfit_v20.safetensors"
wget -c "https://huggingface.co/InstantX/InstantID/resolve/main/ControlNetModel/diffusion_pytorch_model.safetensors" -O "$CONTROL_NET/diffusion_pytorch_model.safetensors"
wget -c "https://huggingface.co/lllyasviel/control_v11p_sd15_openpose/resolve/main/diffusion_pytorch_model.fp16.safetensors" -O "$CONTROL_NET/control_v11p_sd15_openpose.safetensors"

# ──────────────────────────────────────────────────────────────────────────────────────────────────────
# VAE
# ──────────────────────────────────────────────────────────────────────────────────────────────────────

wget -c "https://huggingface.co/stabilityai/sd-vae-ft-mse-original/resolve/main/vae-ft-mse-840000-ema-pruned.safetensors" -O "$MODELS/vae/vae-ft-mse-840000-ema-pruned.safetensors"

# ──────────────────────────────────────────────────────────────────────────────────────────────────────
# Instant ID
# ──────────────────────────────────────────────────────────────────────────────────────────────────────

wget -c "https://huggingface.co/InstantX/InstantID/resolve/main/ip-adapter.bin" -O "$MODELS/instantid/ip-adapter.bin"
wget -c "https://huggingface.co/h94/IP-Adapter-FaceID/resolve/main/ip-adapter-faceid-plusv2_sd15.bin" -O "$MODELS/instantid/ip-adapter-faceid-plusv2_sd15.bin"
wget -c "https://github.com/deepinsight/insightface/releases/download/v0.7/antelopev2.zip" -O "$MODELS/insightface/antelopev2.zip"

unzip "$MODELS/models/insightface/antelopev2.zip" -d "$COMFY_UI_HOME/models/insightface/models/"

# ──────────────────────────────────────────────────────────────────────────────────────────────────────
# Motion Modules - AnimateDiff
# ──────────────────────────────────────────────────────────────────────────────────────────────────────

wget -c "https://huggingface.co/guoyww/animatediff/blob/main/v3_sd15_mm.ckpt" -O "$MODELS/animatediff_models/v3_sd15_mm.ckpt"
