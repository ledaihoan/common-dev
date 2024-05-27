#!/usr/bin/env bash
CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
NODE_VERSION=20.13.1
IS_DEFAULT=1
echo "1. Installing NVM..."
"$CURRENT_DIR"/install_nvm.sh
echo "2. Installing NodeJS..."
"$CURRENT_DIR"/install_node_version.sh $NODE_VERSION $IS_DEFAULT
"$CURRENT_DIR"/install_global_modules.sh
echo "Done Install NodeJS..."