#!/bin/bash

# ┌───────────────────────────────────────────┐
# │                   FLUX                    │
# └───────────────────────────────────────────┘


MODELS="$HOME/src/comfy/models"
LORAS="$MODELS/loras/flux"
VEA="$MODELS/vae/flux"
CLIP="$MODELS/clip"
CONTROL_NET="$MODELS/controlnet/flux"
CHECKPOINTS="$MODELS/checkpoints/flux"


# ──────────────────────────────────────────────────────────────────────────────────────────────────────
# Checkpoints
# ──────────────────────────────────────────────────────────────────────────────────────────────────────

# Flux1 schnell fp8 17.2 GB
wget -c "https://huggingface.co/Comfy-Org/flux1-schnell/resolve/main/flux1-schnell-fp8.safetensors" -O "$CHECKPOINTS/flux1-schnell-fp8.safetensors"

# Flux1 Redux (Image Variation) - 129 MB
wget -c "https://huggingface.co/black-forest-labs/FLUX.1-Redux-dev/resolve/main/flux1-redux-dev.safetensors" -O "$MODELS/style_models/flux1-redux-dev.safetensors"

# Flux1 Fill (Inpaint / Outpaint) - 23.8 GB
wget -c "https://huggingface.co/black-forest-labs/FLUX.1-Fill-dev/resolve/main/flux1-fill-dev.safetensors" -O "$CHECKPOINTS/flux1-fill-dev.safetensors"

# Flux1 DEV
# ──────────────────────────────────────────────

# fp16 - 23.8 GB
wget -c "https://huggingface.co/black-forest-labs/FLUX.1-dev/resolve/main/flux1-dev.safetensors" -O "$MODELS/unet/flux1-dev.safetensors"

# fp8 - 17.2 GB
wget -c "https://huggingface.co/Comfy-Org/flux1-dev/resolve/main/flux1-dev-fp8.safetensors" -O "$CHECKPOINTS/flux1-dev-fp8.safetensors"

# 8-bit (Q8_0) GGUF - 12.7 GB
wget -c "https://huggingface.co/lllyasviel/FLUX.1-dev-gguf/resolve/main/flux1-dev-Q8_0.gguf" -O "$CHECKPOINTS/flux1-dev-Q8_0.gguf"

# 6-bit (Q6_KM) GGUF - 9.86 GB
wget -c "https://huggingface.co/lllyasviel/FLUX.1-dev-gguf/resolve/main/flux1-dev-Q6_K.gguf" -O "$CHECKPOINTS/flux1-dev-Q6_KM.gguf"

# NF4 (bnb-nf4 quant v2) - 12 GB
wget -c "https://huggingface.co/lllyasviel/flux1-dev-bnb-nf4/resolve/main/flux1-dev-bnb-nf4-v2.safetensors" -O "$CHECKPOINTS/flux1-dev-bnb-nf4-v2.safetensors"


# ──────────────────────────────────────────────────────────────────────────────────────────────────────
# LoRAs
# ──────────────────────────────────────────────────────────────────────────────────────────────────────

# Flux DEV Photo-Realism - 22.4 MB
wget -c "https://huggingface.co/comfyanonymous/flux_RealismLora_converted_comfyui/resolve/main/flux_realism_lora.safetensors" -O "$LORAS/flux_realism_lora.safetensors"

# Flux DEV ICEdit - 429 MB
wget -c "https://huggingface.co/sanaka87/ICEdit-MoE-LoRA/resolve/main/ICEdit-MoE-LoRA.safetensors" -O "$LORAS/flux_icedit_moe_lora.safetensors"

# ──────────────────────────────────────────────────────────────────────────────────────────────────────
# ControlNets
# ──────────────────────────────────────────────────────────────────────────────────────────────────────

# Flux DEV - 6.6 GB
wget -c "https://huggingface.co/Shakker-Labs/FLUX.1-dev-ControlNet-Union-Pro/resolve/main/diffusion_pytorch_model.safetensors" -O "$CONTROL_NET/flux-controlnet-union-pro.safetensors"


# ──────────────────────────────────────────────────────────────────────────────────────────────────────
# VEA
# ──────────────────────────────────────────────────────────────────────────────────────────────────────

# 335 MB
wget -c "https://huggingface.co/black-forest-labs/FLUX.1-dev/resolve/main/ae.safetensors" -O "$VEA/ae.safetensors"


# ──────────────────────────────────────────────────────────────────────────────────────────────────────
# CLIP
# ──────────────────────────────────────────────────────────────────────────────────────────────────────

# 246 MB
wget -c "https://huggingface.co/comfyanonymous/flux_text_encoders/resolve/main/clip_l.safetensors" -O "$CLIP/clip_l.safetensors"

# 9.79 GB
wget -c "https://huggingface.co/comfyanonymous/flux_text_encoders/resolve/main/t5xxl_fp16.safetensors" -O "$CLIP/t5xxl_fp16.safetensors"
