#!/usr/bin/env bash
./init_sudo.sh
if [ -f /etc/os-release ]; then
    # Get the ID field from /etc/os-release
    OS=$(awk -F= '/^ID=/{print $2}' /etc/os-release | tr -d '"')
else
    echo "File /etc/os-release not found"
    if [[ "$(uname)" == "Darwin" ]]; then
      OS=macos
    else
      OS=unknown_os
    fi
fi
echo "Detected OS: $OS..."
CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Check if the directory exists
if [ -d "$CURRENT_DIR/$OS" ]; then
    echo "Start installing $OS env..."
else
    echo "Currently, $OS is not officially supported yet...Exiting!"
    exit 1
fi
"$CURRENT_DIR"/$OS/install_env.sh
echo "Installation completed...Please log out and login again with current user or restart your machine to ensure the environment update works correctly!"