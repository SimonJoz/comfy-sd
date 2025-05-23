#!/bin/bash

# ┌───────────────────────────────────────────┐
# │                  Wan 2.1                  │
# └───────────────────────────────────────────┘


MODELS="$COMFY_HOME/models"
VEA="$MODELS/vea/wan"
TEXT_ENCODERS="$MODELS/text_encoders/wan"
CHECKPOINTS="$MODELS/diffusion_models/wan"
CLIP_VISION="$MODELS/loras/clip_vision/wan"


# ──────────────────────────────────────────────────────────────────────────────────────────────────────
# Checkpoints
# ──────────────────────────────────────────────────────────────────────────────────────────────────────

# Frame-Level Fine-to-Video
# ─────────────────────────────────────────────────────────────────

# 14B fp16 32.8 GB
wget -c "https://huggingface.co/Comfy-Org/Wan_2.1_ComfyUI_repackaged/resolve/main/split_files/diffusion_models/wan2.1_flf2v_720p_14B_fp16.safetensors" -O "$CHECKPOINTS/wan2.1_flf2v_720p_14B_fp16.safetensors"

# 14B fp8 16.4 GB
wget -c "https://huggingface.co/Comfy-Org/Wan_2.1_ComfyUI_repackaged/resolve/main/split_files/diffusion_models/wan2.1_flf2v_720p_14B_fp8_e4m3fn.safetensors" -O "$CHECKPOINTS/wan2.1_flf2v_720p_14B_fp8_e4m3fn.safetensors"

# FUN Control & In-paint
# ─────────────────────────────────────────────────────────────────

# 3.13 GB each
#wget -c "https://huggingface.co/Comfy-Org/Wan_2.1_ComfyUI_repackaged/resolve/main/split_files/diffusion_models/wan2.1_fun_control_1.3B_bf16.safetensors" -O "$CHECKPOINTS/wan2.1_fun_control_1.3B_bf16.safetensors"
#wget -c "https://huggingface.co/Comfy-Org/Wan_2.1_ComfyUI_repackaged/resolve/main/split_files/diffusion_models/wan2.1_fun_inp_1.3B_bf16.safetensors" -O "$CHECKPOINTS/wan2.1_fun_inp_1.3B_bf16.safetensors"

# Image to Video
# ─────────────────────────────────────────────────────────────────

# 14B fp16 480p 32.8 GB
wget -c "https://huggingface.co/Comfy-Org/Wan_2.1_ComfyUI_repackaged/resolve/main/split_files/diffusion_models/wan2.1_i2v_480p_14B_fp16.safetensors" -O "$CHECKPOINTS/wan2.1_i2v_480p_14B_fp16.safetensors"

# 14B fp8 480p 16.4 GB
wget -c "https://huggingface.co/Comfy-Org/Wan_2.1_ComfyUI_repackaged/resolve/main/split_files/diffusion_models/wan2.1_i2v_480p_14B_fp8_scaled.safetensors" -O "$CHECKPOINTS/wan2.1_i2v_480p_14B_fp8_scaled.safetensors"

# 14B fp16 720p 32.8 GB
wget -c "https://huggingface.co/Comfy-Org/Wan_2.1_ComfyUI_repackaged/resolve/main/split_files/diffusion_models/wan2.1_i2v_720p_14B_fp16.safetensors" -O "$CHECKPOINTS/wan2.1_i2v_720p_14B_fp16.safetensors"

# 14B fp8 720p 16.4 GB
wget -c "https://huggingface.co/Comfy-Org/Wan_2.1_ComfyUI_repackaged/resolve/main/split_files/diffusion_models/wan2.1_i2v_720p_14B_fp8_scaled.safetensors" -O "$CHECKPOINTS/wan2.1_i2v_720p_14B_fp8_scaled.safetensors"

# Text to Video
# ─────────────────────────────────────────────────────────────────

# 14B fp16 28.6 GB
wget -c "https://huggingface.co/Comfy-Org/Wan_2.1_ComfyUI_repackaged/resolve/main/split_files/diffusion_models/wan2.1_t2v_14B_fp16.safetensors" -O "$CHECKPOINTS/wan2.1_t2v_14B_fp16.safetensors"

# 14B ft8 14.3 GB
wget -c "https://huggingface.co/Comfy-Org/Wan_2.1_ComfyUI_repackaged/resolve/main/split_files/diffusion_models/wan2.1_t2v_14B_fp8_scaled.safetensors" -O "$CHECKPOINTS/wan2.1_t2v_14B_fp8_scaled.safetensors"

# 1.3B fp16 2.84 GB
wget -c "https://huggingface.co/Comfy-Org/Wan_2.1_ComfyUI_repackaged/resolve/main/split_files/diffusion_models/wan2.1_t2v_1.3B_fp16.safetensors" -O "$CHECKPOINTS/wan2.1_t2v_1.3B_fp16.safetensors"

# Video-Aware Control Enhancement
# ─────────────────────────────────────────────────────────────────

# 14B fp16 34.7 GB
wget -c "https://huggingface.co/Comfy-Org/Wan_2.1_ComfyUI_repackaged/resolve/main/split_files/diffusion_models/wan2.1_vace_14B_fp16.safetensors" -O "$CHECKPOINTS/wan2.1_vace_14B_fp16.safetensors"

# 1.3B fp16 4.31 GB
wget -c "https://huggingface.co/Comfy-Org/Wan_2.1_ComfyUI_repackaged/resolve/main/split_files/diffusion_models/wan2.1_vace_1.3B_fp16.safetensors" -O "$CHECKPOINTS/wan2.1_vace_1.3B_fp16.safetensors"


# ──────────────────────────────────────────────────────────────────────────────────────────────────────
# Text Encoders
# ──────────────────────────────────────────────────────────────────────────────────────────────────────

# fp16 - Size: 11.4 GB
wget -c "https://huggingface.co/Comfy-Org/Wan_2.1_ComfyUI_repackaged/resolve/main/split_files/text_encoders/umt5_xxl_fp16.safetensors" -0 "$TEXT_ENCODERS/umt5_xxl_fp16.safetensors"

# fp8 - Size: 9.09 GB
wget -c "https://huggingface.co/Comfy-Org/Wan_2.1_ComfyUI_repackaged/resolve/main/split_files/text_encoders/umt5_xxl_fp8_e4m3fn_scaled.safetensors" -0 "$TEXT_ENCODERS/umt5_xxl_fp8_e4m3fn_scaled.safetensors"

# ──────────────────────────────────────────────────────────────────────────────────────────────────────
# VEA
# ──────────────────────────────────────────────────────────────────────────────────────────────────────

# 254 MB
wget -c "https://huggingface.co/Comfy-Org/Wan_2.1_ComfyUI_repackaged/resolve/main/split_files/vae/wan_2.1_vae.safetensors" -O "$VEA/wan_2.1_vae.safetensors"


# ──────────────────────────────────────────────────────────────────────────────────────────────────────
# CLIP VISION
# ──────────────────────────────────────────────────────────────────────────────────────────────────────

# 1.26 GB
wget -c "https://huggingface.co/Comfy-Org/Wan_2.1_ComfyUI_repackaged/resolve/main/split_files/clip_vision/clip_vision_h.safetensors" -O "$CLIP_VISION/clip_vision_h.safetensors"
