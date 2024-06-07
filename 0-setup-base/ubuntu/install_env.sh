#!/usr/bin/env bash
CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
PARENT_DIR="$(dirname "$(dirname "${BASH_SOURCE[0]}")")"
INSTALL_LIST_FILE="$PARENT_DIR/install_list.txt"
sudo apt-get update && sudo apt-get upgrade -y
sudo apt-get install curl git htop vim -y

# Check if the file exists
if [ -f "$INSTALL_LIST_FILE" ]; then
    # Read the contents of the file into an array
    mapfile -t INSTALL_LIST < <(grep -v '^$' "$INSTALL_LIST_FILE")

    # Loop through each item in the array
    for ITEM in "${INSTALL_LIST[@]}"; do
        # Perform whatever operation you need with the item
        "$CURRENT_DIR/$ITEM"/install.sh
    done
    echo "Done Ubuntu Install env!!"
else
    echo "install_list.txt not found."
fi