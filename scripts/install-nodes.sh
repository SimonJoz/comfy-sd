#!/bin/bash

custom_nodes=(
  "was-node-suite-comfyui"                # WAS Node Suite
  "comfyui_ultimatesdupscale"             # ComfyUI_UltimateSDUpscale
  "comfyui-inspire-pack"                  # ComfyUI Inspire Pack
  "comfyui_controlnet_aux"                # comfyui_controlnet_aux
  "comfyui-animatediff-evolved"           # ComfyUI-AnimateDiff-Evolved
  "cg-use-everywhere"                     # cg-use-everywhere
  "comfyui-videohelpersuite"              # ComfyUI-VideoHelperSuite
  "comfyui-frame-interpolation"           # ComfyUI-Frame-Interpolation
  "comfyui_instantid"                     # ComfyUI_InstantID
  "comfyui-hunyuanvideowrapper"           # ComfyUI-HunyuanVideoWrapper
  "comfyui-custom-scripts"                # ComfyUI-Custom-Scripts
  "comfyui-florence2"                     # ComfyUI-Florence2
  "comfyui-advanced-controlnet"           # ComfyUI-Advanced-ControlNet
  "comfyui-mxtoolkit"                     # ComfyUI-mxToolkit
  "comfyui-image-saver"                   # ComfyUI Image Saver
  "ComfyUI-GGUF"                          # ComfyUI-GGUF
  "comfyui-kjnodes"                       # ComfyUI-KJNodes
  "rgthree-comfy"                         # rgthree-comfy
  "comfyui-impact-pack"                   # ComfyUI Impact Pack
  "gguf"                                  # gguf
  "comfyui_essentials"                    # ComfyUI_essentials
  "x-flux-comfyui"                        # x-flux-comfyui
  "ComfyUI-GGUF_Forked"                   # ComfyUI-GGUF_Forked
  "comfyui-florence2xy"                   # comfyui-florence2xy
  "comfyui-reactor-node"                  # comfyui-reactor-node
  "comfyui-logicutils"                    # ComfyUI-LogicUtils
  "comfyui-get-meta"                      # comfyui-get-meta
  "comfyui-reactor"                       # ComfyUI-ReActor
  "teacachehunyuanvideo"                  # ComfyUI-TeaCacheHunyuanVideo
  "ComfyUI-Apt_Preset"                    # ComfyUI-Apt_Preset
  "ComfyUI-InstantIDUtils"                # ComfyUI-InstantIDUtils
  "agilly1989_motorway"                   # ComfyUI_agilly1989_motorway
  "ComfyUI-InstantID"                     # ComfyUI-InstantID
  "ComfyUI-DeepFuze"                      # DeepFuze
  "comfyui_essentials_mb"                 # ComfyUI_essentials_mb
  "comfyui-web-viewer"                    # ComfyUI Web Viewer
  "comfyui-clh-tool"                      # ComfyUi-clh-Tool
  "ComfyUI-FramePackWrapper_Plus"         # ComfyUI-FramePackWrapper_Plus
  "ComfyUI_Comfyroll_CustomNodes"         # Comfyroll Studio
  "comfystereo"                           # ComfyStereo
  "comfy-image-saver"                     # Save Image with Generation Metadata
  "comfyui-tensorops"                     # comfyui-tensorop
  "ComfyUI-JNodes"                        # ComfyUI-JNodes
  "ComfyLiterals"                         # ComfyLiterals
  "teacache"                              # ComfyUI-TeaCache
  "comfyui-detail-daemon"                 # ComfyUI-Detail-Daemon
  "comfyui-multigpu"                      # ComfyUI-MultiGPU
  "kaytool"                               # KayTool
)

for cn in "${custom_nodes[@]}";
do
  comfy node install "$cn"
done

