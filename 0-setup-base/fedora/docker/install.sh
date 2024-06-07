#!/usr/bin/env bash
# Add Docker's official repo:
sudo dnf -y install dnf-plugins-core
sudo dnf config-manager --add-repo https://download.docker.com/linux/fedora/docker-ce.repo

# Install docker
sudo dnf install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
sudo systemctl start docker && sudo systemctl enable docker
$CURRENT_DIR/post_install.sh
$CURRENT_DIR/test_docker.sh