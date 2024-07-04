#!/usr/bin/env bash
source ~/.nvm/nvm.sh
NODE_VERSION=$1
IS_DEFAULT=$2
CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
# Check if NODE_VERSION is set and not empty
if [ "x$NODE_VERSION" != "x" ]; then
    echo "Installing Node.js version $NODE_VERSION..."
    nvm install $NODE_VERSION
    nvm use $NODE_VERSION
    if [ "$IS_DEFAULT" == "1" ]; then
      nvm alias default "$NODE_VERSION"
    fi
else
    echo "NODE_VERSION not specified. Installing the latest LTS version."
    nvm install --lts
fi