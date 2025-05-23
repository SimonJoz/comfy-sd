#!/bin/bash

# ┌───────────────────────────────────────────┐
# │              HunyuanVideo                 │
# └───────────────────────────────────────────┘


MODELS="$COMFY_HOME/models"
VEA="$MODELS/vea/hunyuan"
LORAS="$MODELS/loras/hunyuan"
TEXT_ENCODERS="$MODELS/text_encoders/hunyuan"
CHECKPOINTS="$MODELS/diffusion_models/hunyuan"
CLIP_VISION="$MODELS/loras/clip_vision/hunyuan"


# ──────────────────────────────────────────────────────────────────────────────────────────────────────
# Total size ~143.7 GB
# ──────────────────────────────────────────────────────────────────────────────────────────────────────
echo "13.2 + 25.6 + 25.6 + 25.6 + 25.6 + 653/1024 + 1.15 + 9.09 + 16.1 + 493/1024 + 649/1024" | bc -l


# ──────────────────────────────────────────────────────────────────────────────────────────────────────
# Checkpoints
# ──────────────────────────────────────────────────────────────────────────────────────────────────────

# Tencent Official - FP8 — Scaled, memory-friendly. Size: 13.2 GB
wget -c "https://huggingface.co/tencent/HunyuanVideo/resolve/main/hunyuan-video-t2v-720p/transformers/mp_rank_00_model_states_fp8.pt" -O "$CHECKPOINTS/hunyuanvideo-t2v-720p-mp_rank_00_fp8.pt"

# All vRAM ≈60GB, Size: 25.6 GB

# Tencent Official- FP16/FP32 — Highest fidelity
wget -c "https://huggingface.co/tencent/HunyuanVideo/resolve/main/hunyuan-video-t2v-720p/transformers/mp_rank_00_model_states.pt" -O "$CHECKPOINTS/hunyuanvideo-t2v-720p-mp_rank_00__model_states_fp16.pt"

# Repackaged for ComfyUI - FP16 — Text to Vid
wget -c "https://huggingface.co/Comfy-Org/HunyuanVideo_repackaged/resolve/main/split_files/diffusion_models/hunyuan_video_t2v_720p_bf16.safetensors" -0 "$CHECKPOINTS/hunyuan_video_t2v_720p_bf16.safetensors"

# Repackaged for ComfyUI - FP16 — Image to Vid - V1 Concat
wget -c "https://huggingface.co/Comfy-Org/HunyuanVideo_repackaged/resolve/main/split_files/diffusion_models/hunyuan_video_image_to_video_720p_bf16.safetensors" -0 "$CHECKPOINTS/hunyuan_video_image_to_video_720p_bf16.safetensors"

# Repackaged for ComfyUI - FP16 — Image to Vid - V2 Replace - Higher fidelity
wget -c "https://huggingface.co/Comfy-Org/HunyuanVideo_repackaged/resolve/main/split_files/diffusion_models/hunyuan_video_v2_replace_image_to_video_720p_bf16.safetensors" -0 "$CHECKPOINTS/hunyuan_video_v2_replace_image_to_video_720p_bf16.safetensors"


# ──────────────────────────────────────────────────────────────────────────────────────────────────────
# LoRAs
# ──────────────────────────────────────────────────────────────────────────────────────────────────────

# Image-to-Video - Size: 653 MB
wget -c "https://huggingface.co/Kijai/HunyuanVideo_comfy/resolve/main/hyvid_I2V_lora_embrace.safetensors" -O "$LORAS/hyv_I2V_lora_embrace.safetensors"

# Keyframe-Control LoRA - Size: 1.15 GB
wget -c "https://huggingface.co/dashtoon/hunyuan-video-keyframe-control-lora/resolve/main/i2v.sft" -O "$LORAS/hyv_I2V_keyframe_control_lora.safetensors"


# ──────────────────────────────────────────────────────────────────────────────────────────────────────
# Text Encoders
# ──────────────────────────────────────────────────────────────────────────────────────────────────────

# llava llama3 fp8 - Size: 9.09 GB
wget -c "https://huggingface.co/Comfy-Org/HunyuanVideo_repackaged/resolve/main/split_files/text_encoders/llava_llama3_fp8_scaled.safetensors" -0 "$TEXT_ENCODERS/llava_llama3_fp8_scaled.safetensors"

# llava llama3 fp16 - Size: 16.1 GB
wget -c "https://huggingface.co/Comfy-Org/HunyuanVideo_repackaged/resolve/main/split_files/text_encoders/llava_llama3_fp16.safetensors" -0 "$TEXT_ENCODERS/llava_llama3_fp16.safetensors"


# ──────────────────────────────────────────────────────────────────────────────────────────────────────
# VEA
# ──────────────────────────────────────────────────────────────────────────────────────────────────────

# 493 MB
wget -c "https://huggingface.co/Comfy-Org/HunyuanVideo_repackaged/resolve/main/split_files/vae/hunyuan_video_vae_bf16.safetensors" -O "$VEA/hunyuan_video_vae_bf16.safetensors"


# ──────────────────────────────────────────────────────────────────────────────────────────────────────
# CLIP VISION
# ──────────────────────────────────────────────────────────────────────────────────────────────────────

# 649 MB
wget -c "https://huggingface.co/Comfy-Org/HunyuanVideo_repackaged/resolve/main/split_files/clip_vision/llava_llama3_vision.safetensors" -O "$CLIP_VISION/llava_llama3_vision.safetensors"

