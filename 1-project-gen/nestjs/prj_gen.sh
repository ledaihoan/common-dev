#!/usr/bin/env bash
# Function to check if a path is absolute
is_absolute_path() {
    case $1 in
        /*) return 0 ;;
        *) return 1 ;;
    esac
}

# Function to check if the project name is valid
is_valid_project_name() {
    if [[ "$1" =~ ^[a-z0-9_-]+$ ]]; then
        return 0
    else
        echo "Invalid project name. It should only contain lowercase letters, numbers, dashes, or underscores."
        return 1
    fi
}

# Check if the correct number of arguments are provided
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <project_name> <parent_directory>"
    exit 1
fi

project_name=$1
parent_directory=$2
origin_project_name=nestjs-tpl

# Check if the parent directory is an absolute path
if ! is_absolute_path "$parent_directory"; then
    echo "Error: The parent directory must be an absolute path."
    exit 1
fi

# Call the function with the provided project name
if ! is_valid_project_name "$1"; then
    exit 1
fi
# copy project
echo "Initializing project files at $parent_directory/$project_name..."
rsync -a --info=progress2 --info=name0 ./nestjs-tpl/ $parent_directory/$project_name
echo "Renaming project name from $origin_project_name to $project_name"
find "$parent_directory/$project_name" -type f -exec sed -i "s/$origin_project_name/$project_name/g" {} +
# check for yarn
if ! command -v yarn &> /dev/null
then
    echo "Yarn could not be found. Installing Yarn..."
    npm install -g yarn
fi
# Install dependencies
echo "Installing dependencies..."
cd $parent_directory/$project_name
yarn
