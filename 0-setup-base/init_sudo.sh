#!/usr/bin/env bash
# Prompt for sudo password
echo "Asking for sudo permission for process..."
if [ $UID -eq 0 ]; then
    echo "Error: Don't run as root. Please create administrator user before proceed"
    exit 1
fi
echo "Please enter your sudo password:"
sudo -v

# Check if sudo was successful
if [ $? -eq 0 ]; then
    echo "sudo authentication successful"
else
    echo "sudo authentication failed, exiting..."
    exit 1
fi
# Exit immediately if any command fails
set -e

# Define an error handler function
error_handler() {
    echo "An error occurred. Exiting..." >&2
    exit 1
}

# Trap errors and call the error handler function
trap 'error_handler' ERR