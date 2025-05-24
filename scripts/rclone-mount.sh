#!/bin/bash

# ──────────────────────────────────────────────────────────────────────────
# Configuration
# ──────────────────────────────────────────────────────────────────────────
USER="ubuntu"
REGION="us-east-1"
MOUNT_POINT="$HOME/s3bucket"
BUCKET_NAME="s3-bucket-name"

# Local VFS cache size - ~/.cache/rclone/vfs/
CACHE_SIZE="50G"

# In-memory dir listing cache (RAM) - Default 5m. avoid repeatedly querying S3 for ls-style ops
LISTING_CACHE_TTL="2h"

# ──────────────────────────────────────────────────────────────────────────
# Install Rclone
# ──────────────────────────────────────────────────────────────────────────
echo "[1/4] Installing Rclone..."
sudo apt-get update
sudo apt-get install -y rclone fuse

# ──────────────────────────────────────────────────────────────────────────
# Create mount point
# ──────────────────────────────────────────────────────────────────────────
echo "[3/4] Creating mount point..."
sudo -u "$USER" mkdir -p "$MOUNT_POINT"

# ──────────────────────────────────────────────────────────────────────────
# Configure Rclone for S3
# ──────────────────────────────────────────────────────────────────────────
sudo -u "$USER" mkdir -p /home/$USER/.config/rclone

cat <<EOF | sudo -u $USER tee /home/$USER/.config/rclone/rclone.conf > /dev/null
[s3]
type = s3
provider = AWS
env_auth = true
region = $REGION
EOF

# Optional: Allow other users to access mount
#echo "user_allow_other" | tee -a /etc/fuse.conf

# ──────────────────────────────────────────────────────────────────────────
# Mount S3 with VFS caching 
# ──────────────────────────────────────────────────────────────────────────
sudo -u "$USER" rclone mount s3:$BUCKET_NAME "$MOUNT_POINT" \
  --vfs-cache-mode=full \
  --vfs-cache-max-size=$CACHE_SIZE \
  --dir-cache-time=$LISTING_CACHE_TTL \
  --daemon

# Optional: --allow-other

# ──────────────────────────────────────────────────────────────────────────
# Verify
# ──────────────────────────────────────────────────────────────────────────
if mountpoint -q "$MOUNT_POINT"; then
    echo "S3 bucket mounted successfully at $MOUNT_POINT"
else
    echo "Failed to mount S3 bucket"
fi
