#!/usr/bin/env bash
source ~/.nvm/nvm.sh
CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Define the path to the global_modules.txt file
GLOBAL_MODULES_FILE="$CURRENT_DIR/global_modules.txt"

# Check if the file exists
if [ -f "$GLOBAL_MODULES_FILE" ]; then
    # Read the contents of the file into an array
    declare -a MODULES=()

    # Read lines from the file into the array
    while IFS= read -r line; do
        MODULES+=("$line")
    done < "$GLOBAL_MODULES_FILE"
    mapfile -t MODULES < <(grep -v '^$' "$GLOBAL_MODULES_FILE")

    # Join the lines with spaces to form LIST_OF_MODULES
    LIST_OF_MODULES=$(IFS=' '; echo "${MODULES[*]}")

    # Install the modules globally using npm
    npm install -g $LIST_OF_MODULES

    echo "Installed the following modules globally: $LIST_OF_MODULES"
else
    echo "global_modules.txt not found in $CURRENT_DIR."
fi