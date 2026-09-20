#!/bin/bash
# ==============================================================================
# Script: setup-ec2.sh
# Description: Automated setup script for AWS EC2 (Ubuntu 22.04 LTS) host
# Author: Sumbul Zahra
# ==============================================================================

set -e

echo "[1/4] Updating system packages..."
sudo apt update && sudo apt upgrade -y

echo "[2/4] Installing Docker Engine..."
sudo apt install -y docker.io curl git
sudo systemctl enable --now docker

echo "[3/4] Adding current user to Docker group..."
sudo usermod -aG docker $USER

echo "[4/4] Installing CNCF Pack CLI..."
PACK_VERSION="v0.33.0"
curl -sSL "https://github.com/buildpacks/pack/releases/download/${PACK_VERSION}/pack-${PACK_VERSION}-linux.tgz" | tar -xzf - -C /tmp
sudo mv /tmp/pack /usr/local/bin/pack

echo "======================================================================"
echo "Installation complete!"
echo "Pack CLI Version: $(pack --version)"
echo "Docker Version: $(docker --version)"
echo "NOTE: Please log out and back in to apply docker group permissions."
echo "======================================================================"
