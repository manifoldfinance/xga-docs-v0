#!/bin/bash

OUTPUT_FILE="combined.md"

if [ -e "$OUTPUT_FILE" ]; then
    echo "Error: The output file $OUTPUT_FILE already exists. Please remove it before running this script."
    exit 1
fi

echo "Starting the concatenation process..."

TEMP_FILE_LIST=$(mktemp)
find . -type f -name '*.md' | sort > "$TEMP_FILE_LIST"

if [ ! -s "$TEMP_FILE_LIST" ]; then
    echo "No .md files found. Exiting."
    rm "$TEMP_FILE_LIST"
    exit 0
fi

while IFS= read -r file; do
    if [ ! -f "$file" ]; then
        echo "Warning: File $file not found during concatenation process."
        continue
    fi
    cat "$file" >> "$OUTPUT_FILE"
done < "$TEMP_FILE_LIST"

rm "$TEMP_FILE_LIST"

echo "Concatenation complete. Output file: $OUTPUT_FILE"
