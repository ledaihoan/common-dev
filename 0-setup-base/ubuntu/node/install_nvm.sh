#!/usr/bin/env bash
if command -v nvm &> /dev/null; then
    echo "NVM is already installed."
else
    echo "NVM is not installed. Starting install"
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
fi