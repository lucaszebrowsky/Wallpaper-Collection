#!/bin/bash

# Check if cjxl is installed
if ! command -v cjxl &>/dev/null; then
  echo "Error: cjxl not found. Make sure it is installed and in your PATH."
  exit 1
fi

# Check if a directory is provided as an argument
if [ -z "$1" ]; then
  echo "Usage: $0 <directory>"
  exit 1
fi

# Check if the provided directory exists
if [ ! -d "$1" ]; then
  echo "Error: Directory '$1' not found."
  exit 1
fi

# Convert images to JXL format
for file in "$1"/*.{jpg,jpeg,png,gif}; do
  if [ -f "$file" ]; then
    output_file="${file%.*}.jxl"
    echo "Converting $file to $output_file"
    cjxl "$file" "$output_file"
  fi
done

echo "Conversion completed."

