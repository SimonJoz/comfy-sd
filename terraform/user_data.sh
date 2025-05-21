#!/bin/bash

set -e

exec > /var/log/init.log 2>&1
echo "Bootstrapping..."

# ======================================================================================
# System Dependencies
# ======================================================================================

apt update -y
apt upgrade -y
apt install -y git python3.12 python3.12-venv python3.12-pip python3.12-dev \
libgl1-mesa-glx libglib2.0-0 libsm6 libxrender1 libxext6

# ======================================================================================
# Install ComfyUI
# ======================================================================================

pip install --upgrade pip
python -m venv comfy_env
source comfy_env/bin/activate

pip install comfy-cli

COMFY_UI_HOME="$HOME/comfy"

comfy --workspace="$COMFY_UI_HOME" --skip-prompt install --nvidia
comfy update all
comfy tracking disable
comfy env

# ======================================================================================
# Download checkpoints
# ======================================================================================

CHECKPOINTS_DIR="./models/checkpoints"

# HuggingFace Checkpoints
declere -A hugging_face_models

hugging_face_models["sd_xl_base_1.0.safetensors"]="https://huggingface.co/stabilityai/stable-diffusion-xl-base-1.0/resolve/main/sd_xl_base_1.0.safetensors"
hugging_face_models["sd_xl_refiner_1.0.safetensors"]="https://huggingface.co/stabilityai/stable-diffusion-xl-refiner-1.0/resolve/main/sd_xl_refiner_1.0.safetensors"
hugging_face_models["flux1-schnell-fp8.safetensors"]="https://huggingface.co/Comfy-Org/flux1-schnell/resolve/main/flux1-schnell-fp8.safetensors"
hugging_face_models["flux1-dev-fp8.safetensors"]="https://huggingface.co/Comfy-Org/flux1-dev/resolve/main/flux1-dev-fp8.safetensors"

for key in "${!hugging_face_models[@]}"; do
  comfy model download --relative-path "$CHECKPOINTS_DIR" --filename "$key" --url "${hugging_face_models[$key]}"
done

# FLUX
comfy model download --relative-path ./models/unet/ --filename flux1-dev.safetensors \
--url "https://huggingface.co/black-forest-labs/FLUX.1-dev/resolve/main/flux1-dev.safetensors"

comfy model download --relative-path ./models/clip/ --filename clip_l.safetensors \
--url "https://huggingface.co/comfyanonymous/flux_text_encoders/resolve/main/clip_l.safetensors"

comfy model download --relative-path ./models/clip/ --filename t5xxl_fp16.safetensors \
--url "https://huggingface.co/comfyanonymous/flux_text_encoders/resolve/main/t5xxl_fp16.safetensors"

comfy model download --relative-path ./models/vae/ --filename ae.safetensors \
--url "https://huggingface.co/black-forest-labs/FLUX.1-schnell/resolve/main/ae.safetensors"


# Civitai
declere -A civitai_models

civitai_models["juggernautXL_jugg_XI_by_RunDiffusion.safetensors"]="https://civitai.com/api/download/models/782002?type=Model&format=SafeTensor&size=full&fp=fp16"
civitai_models["dreamshaperXL_v21TurboDPMSDE.safetensors"]="https://civitai.com/api/download/models/351306?type=Model&format=SafeTensor&size=full&fp=fp16"
civitai_models["epicrealism_naturalSinRC1VAE.safetensors"]="https://civitai.com/api/download/models/143906?type=Model&format=SafeTensor&size=pruned&fp=fp16"
civitai_models["epicrealismXL_vxviLastfameRealism.safetensors"]="https://civitai.com/api/download/models/1522905?type=Model&format=SafeTensor&size=pruned&fp=fp16"
civitai_models["realisticVisionV60B1_v51HyperVAE.safetensors"]="https://civitai.com/api/download/models/501240?type=Model&format=SafeTensor&size=full&fp=fp16"


for key in "${!civitai_models[@]}"; do
  comfy model download --relative-path "$CHECKPOINTS_DIR" --filename "$key" --url "${civitai_models[$key]}"
done

# ======================================================================================
# Download LoRAs
# ======================================================================================

# FLUX
comfy model download --relative-path ./models/loras/ --filename flux_realism_lora.safetensors \
--url "https://huggingface.co/comfyanonymous/flux_RealismLora_converted_comfyui/resolve/main/flux_realism_lora.safetensors"


# ICE Edit
comfy model download --relative-path ./models/loras/ --filename ICEdit-MoE-LoRA.safetensors \
--url "https://huggingface.co/sanaka87/ICEdit-MoE-LoRA/resolve/main/ICEdit-MoE-LoRA.safetensors"



# ======================================================================================
# Download ControlNets
# ======================================================================================

# SDXL
comfy model download --relative-path ./models/controlnet/ --filename controlnet-union-sdxl-1.0.safetensors \
--url "https://huggingface.co/xinsir/controlnet-union-sdxl-1.0/resolve/main/diffusion_pytorch_model_promax.safetensors"

# SD 1.5
comfy model download --relative-path ./models/controlnet/ --filename outfitToOutfit_v20.safetensors \
--url "https://civitai.com/api/download/models/469517?type=Model&format=SafeTensor"

comfy model download --relative-path ./models/controlnet/ --filename diffusion_pytorch_model.safetensors \
--url "https://huggingface.co/InstantX/InstantID/resolve/main/ControlNetModel/diffusion_pytorch_model.safetensors"

comfy model download --relative-path ./models/controlnet/ --filename control_v11p_sd15_openpose.safetensors \
--url "https://huggingface.co/lllyasviel/control_v11p_sd15_openpose/resolve/main/diffusion_pytorch_model.fp16.safetensors"



# ======================================================================================
# Download Upscalers
# ======================================================================================

# SDXL
comfy model download --relative-path ./models/upscale_models/ --filename 4x-Ultrasharp.pth \
--url "https://civitai.com/api/download/models/125843?type=Model&format=PickleTensor"



# ======================================================================================
# Download VAE
# ======================================================================================

# SDXL
comfy model download --relative-path ./models/vae/ --filename sdxl_vae.safetensors \
--url "https://huggingface.co/stabilityai/sdxl-vae/resolve/main/sdxl_vae.safetensors"

# SD 1.5
comfy model download --relative-path ./models/vae/ --filename vae-ft-mse-840000-ema-pruned.safetensors \
--url "https://huggingface.co/stabilityai/sd-vae-ft-mse-original/resolve/main/vae-ft-mse-840000-ema-pruned.safetensors"



# ======================================================================================
# Instant ID
# ======================================================================================

# SDXL
comfy model download --relative-path ./models/instantid/ --filename ip-adapter-faceid-plusv2_sdxl.bin \
--url "https://huggingface.co/h94/IP-Adapter-FaceID/resolve/main/ip-adapter-faceid-plusv2_sdxl.bin"

# SD 1.5
comfy model download --relative-path ./models/instantid/ --filename ip-adapter.bin \
--url "https://huggingface.co/InstantX/InstantID/resolve/main/ip-adapter.bin"

comfy model download --relative-path ./models/instantid/ --filename ip-adapter-faceid-plusv2_sd15.bin \
--url "https://huggingface.co/h94/IP-Adapter-FaceID/resolve/main/ip-adapter-faceid-plusv2_sd15.bin"

comfy model download --relative-path ./models/insightface/ --filename antelopev2.zip \
--url "https://github.com/deepinsight/insightface/releases/download/v0.7/antelopev2.zip"

unzip "$COMFY_UI_HOME/models/insightface/antelopev2.zip" -d "$COMFY_UI_HOME/models/insightface/models/"



# ======================================================================================
# Download AnimateDiff
# ======================================================================================

# SD 1.5
comfy model download --relative-path ./models/animatediff_models --filename v3_sd15_mm.ckpt \
--url "https://huggingface.co/guoyww/animatediff/blob/main/v3_sd15_mm.ckpt"



# ======================================================================================
# Install Custom Nodes
# ======================================================================================

custom_nodes=(
#"was-node-suite-comfyui"                # WAS Node Suite
#"comfyui_ultimatesdupscale"             # ComfyUI_UltimateSDUpscale
#"comfyui-inspire-pack"                  # ComfyUI Inspire Pack
#"comfyui_controlnet_aux"                # comfyui_controlnet_aux
#"comfyui-animatediff-evolved"           # ComfyUI-AnimateDiff-Evolved
#"cg-use-everywhere"                     # cg-use-everywhere
#"comfyui-videohelpersuite"              # ComfyUI-VideoHelperSuite
#"comfyui-frame-interpolation"           # ComfyUI-Frame-Interpolation
#"comfyui_instantid"                     # ComfyUI_InstantID
#"comfyui-hunyuanvideowrapper"           # ComfyUI-HunyuanVideoWrapper
#"comfyui-custom-scripts"                # ComfyUI-Custom-Scripts
#"comfyui-florence2"                     # ComfyUI-Florence2
#"comfyui-advanced-controlnet"           # ComfyUI-Advanced-ControlNet
#"comfyui-mxtoolkit"                     # ComfyUI-mxToolkit
#"comfyui-image-saver"                   # ComfyUI Image Saver
#"ComfyUI-GGUF"                          # ComfyUI-GGUF
#"comfyui-kjnodes"                       # ComfyUI-KJNodes
#"rgthree-comfy"                         # rgthree-comfy
#"comfyui-impact-pack"                   # ComfyUI Impact Pack
#"gguf"                                  # gguf
#"comfyui_essentials"                    # ComfyUI_essentials
#"x-flux-comfyui"                        # x-flux-comfyui
#"ComfyUI-GGUF_Forked"                   # ComfyUI-GGUF_Forked
#"comfyui-florence2xy"                   # comfyui-florence2xy
#"comfyui-reactor-node"                  # comfyui-reactor-node
#"comfyui-logicutils"                    # ComfyUI-LogicUtils
#"comfyui-get-meta"                      # comfyui-get-meta
#"comfyui-reactor"                       # ComfyUI-ReActor
#"teacachehunyuanvideo"                  # ComfyUI-TeaCacheHunyuanVideo
#"ComfyUI-Apt_Preset"                    # ComfyUI-Apt_Preset
#"ComfyUI-InstantIDUtils"                # ComfyUI-InstantIDUtils
#"agilly1989_motorway"                   # ComfyUI_agilly1989_motorway
#"ComfyUI-InstantID"                     # ComfyUI-InstantID
#"ComfyUI-DeepFuze"                      # DeepFuze
#"comfyui_essentials_mb"                 # ComfyUI_essentials_mb
#"comfyui-web-viewer"                    # ComfyUI Web Viewer
#"comfyui-clh-tool"                      # ComfyUi-clh-Tool
#"ComfyUI-FramePackWrapper_Plus"         # ComfyUI-FramePackWrapper_Plus
#"ComfyUI_Comfyroll_CustomNodes"         # Comfyroll Studio
#"comfystereo"                           # ComfyStereo
#"comfy-image-saver"                     # Save Image with Generation Metadata
#"comfyui-tensorops"                     # comfyui-tensorop
#"ComfyUI-JNodes"                        # ComfyUI-JNodes
#"ComfyLiterals"                         # ComfyLiterals
#"teacache"                              # ComfyUI-TeaCache
#"comfyui-detail-daemon"                 # ComfyUI-Detail-Daemon
#"comfyui-multigpu"                      # ComfyUI-MultiGPU
)

for cn in "${custom_nodes[@]}";
do
  comfy node install "$cn"
done


# ======================================================================================
# Start ComfyUI
# ======================================================================================
nohup comfy launch --background -- --port 8188 &
