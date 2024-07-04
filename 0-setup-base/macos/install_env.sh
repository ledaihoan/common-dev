#!/usr/bin/env bash
CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
PARENT_DIR="$(dirname "$(dirname "${BASH_SOURCE[0]}")")"
INSTALL_LIST_FILE="$PARENT_DIR/install_list.txt"
echo $INSTALL_LIST_FILE
# Install homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" < /dev/null | echo -ne '\n'
(echo; echo 'eval "$(/usr/local/bin/brew shellenv)"') >> ~/.zprofile
eval "$(/usr/local/bin/brew shellenv)"
# Install common packages
brew install wget htop

# Check if the file exists
if [ -f "$INSTALL_LIST_FILE" ]; then
    # Read the contents of the file into an array
    declare -a INSTALL_LIST=()

    # Read lines from the file into the array
    while IFS= read -r line; do
        INSTALL_LIST+=("$line")
    done < "$INSTALL_LIST_FILE"

    # Loop through each item in the array
    for ITEM in "${INSTALL_LIST[@]}"; do
        # Perform whatever operation you need with the item
        "$CURRENT_DIR/$ITEM"/install.sh
    done
    echo "Done MacOS Install env!!"
else
    echo "install_list.txt not found."
fi