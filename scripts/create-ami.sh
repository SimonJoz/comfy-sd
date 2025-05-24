#!/bin/bash

# ──────────────────────────────────────────────────────────────────────────────────────────────────────
# Configuration
# ──────────────────────────────────────────────────────────────────────────────────────────────────────
REGION="us-east-1"
INSTANCE_ID="i-xxxxxxxxxxxxx"
AMI_NAME="custom-ami-name-$(date +%Y%m%d-%H%M%S)"

# ──────────────────────────────────────────────────────────────────────────────────────────────────────
# Create AMI from EC2 instance
# ──────────────────────────────────────────────────────────────────────────────────────────────────────

echo "Creating AMI from instance $INSTANCE_ID..."
AMI_ID=$(
  aws ec2 create-image \
  --instance-id "$INSTANCE_ID" \
  --name "$AMI_NAME" \
  --no-reboot \
  --region "$REGION" \
  --query 'ImageId' \
  --output text
)

echo "Waiting for AMI ($AMI_ID) to become available..."

aws ec2 wait image-available --image-ids "$AMI_ID" --region "$REGION"

echo "AMI created: $AMI_ID"
