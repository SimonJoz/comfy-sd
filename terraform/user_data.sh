#!/bin/bash

set -e

exec > /var/log/init.log 2>&1
echo "Bootstrapping..."

# ======================================================================================
# System Dependencies
# ======================================================================================

apt update -y
apt upgrade -y

apt install -y git python3.10-venv libgl1-mesa-glx libglib2.0-0 libsm6 libxrender1 libxext6

# ======================================================================================
# Install ComfyUI
# ======================================================================================

sudo -u ubuntu bash <<'EOF'

pip install --upgrade pip
mkdir -p ~/src
cd ~/src
python3 -m venv .venv
source .venv/bin/activate
python3 -m pip install comfy-cli
python3 -m pip install --upgrade pip
COMFY_UI_HOME="$HOME/src/comfy"

comfy --workspace="$COMFY_UI_HOME" --skip-prompt install --nvidia
comfy set-default "$COMFY_UI_HOME"
comfy tracking disable
comfy env

EOF





