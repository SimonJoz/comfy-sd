#!/bin/bash

# ┌───────────────────────────────────────────┐
# │                  SD 1.5                   │
# └───────────────────────────────────────────┘

MODELS="$HOME/src/comfy/models"
CONTROL_NET="$MODELS/controlnet/sd15"
CHECKPOINTS="$MODELS/checkpoints/sd15"


# ──────────────────────────────────────────────────────────────────────────────────────────────────────
# Total size ~14.1 GB
# ──────────────────────────────────────────────────────────────────────────────────────────────────────
echo "1.99 + 3.97 + 690/1024 + 2.5 + 723/1024 + 335/1024 + 1.69 + 157/1024 + 344/1024 + 1.67" | bc -l


# ──────────────────────────────────────────────────────────────────────────────────────────────────────
# Checkpoints
# ──────────────────────────────────────────────────────────────────────────────────────────────────────

# Realistic models - CivitAI

# 1.99 GB
wget -c "https://civitai.com/api/download/models/143906?type=Model&format=SafeTensor&size=pruned&fp=fp16" -O "$CHECKPOINTS/epicrealism_naturalSinRC1VAE.safetensors"

# 3.97 GB
wget -c "https://civitai.com/api/download/models/501240?type=Model&format=SafeTensor&size=full&fp=fp16" -O "$CHECKPOINTS/realisticVisionV60B1_v51HyperVAE.safetensors"


# ──────────────────────────────────────────────────────────────────────────────────────────────────────
# ControlNets
# ──────────────────────────────────────────────────────────────────────────────────────────────────────

# 690 MB
wget -c "https://civitai.com/api/download/models/469517?type=Model&format=SafeTensor" -O "$CONTROL_NET/outfitToOutfit_v20.safetensors"

# 2.5 GB
wget -c "https://huggingface.co/InstantX/InstantID/resolve/main/ControlNetModel/diffusion_pytorch_model.safetensors" -O "$CONTROL_NET/diffusion_pytorch_model.safetensors"

# 723 MB
wget -c "https://huggingface.co/lllyasviel/control_v11p_sd15_openpose/resolve/main/diffusion_pytorch_model.fp16.safetensors" -O "$CONTROL_NET/control_v11p_sd15_openpose.safetensors"

# ──────────────────────────────────────────────────────────────────────────────────────────────────────
# VAE
# ──────────────────────────────────────────────────────────────────────────────────────────────────────

# 335 MB
wget -c "https://huggingface.co/stabilityai/sd-vae-ft-mse-original/resolve/main/vae-ft-mse-840000-ema-pruned.safetensors" -O "$MODELS/vae/vae-ft-mse-840000-ema-pruned.safetensors"

# ──────────────────────────────────────────────────────────────────────────────────────────────────────
# Instant ID
# ──────────────────────────────────────────────────────────────────────────────────────────────────────

# 1.69 GB
wget -c "https://huggingface.co/InstantX/InstantID/resolve/main/ip-adapter.bin" -O "$MODELS/instantid/ip-adapter.bin"

# 157 MB
wget -c "https://huggingface.co/h94/IP-Adapter-FaceID/resolve/main/ip-adapter-faceid-plusv2_sd15.bin" -O "$MODELS/instantid/ip-adapter-faceid-plusv2_sd15.bin"

# 344 MB
wget -c "https://github.com/deepinsight/insightface/releases/download/v0.7/antelopev2.zip" -O "$MODELS/insightface/antelopev2.zip"

unzip "$MODELS/models/insightface/antelopev2.zip" -d "$COMFY_UI_HOME/models/insightface/models/"

# ──────────────────────────────────────────────────────────────────────────────────────────────────────
# Motion Modules - AnimateDiff
# ──────────────────────────────────────────────────────────────────────────────────────────────────────

# 1.67 GB
wget -c "https://huggingface.co/guoyww/animatediff/blob/main/v3_sd15_mm.ckpt" -O "$MODELS/animatediff_models/v3_sd15_mm.ckpt"
