#!/bin/bash

# Define the path to the .gitignore file
gitignorePath=".gitignore"

# Read the .gitignore file, excluding comments and empty lines
patterns=$(grep -E -v '^\s*(#|$)' "$gitignorePath")

# Initialize an array to store skipped patterns
skippedPatterns=()

# Loop through each pattern and apply 'git rm --cached'
while IFS= read -r pattern; do
    # Check if there are files matching the pattern in the git index
    files=$(git ls-files "$pattern")
    if [ -n "$files" ]; then
        # Handle patterns ending with '/' as directory removal
        if [[ "$pattern" == */ ]]; then
            git rm -r --cached "${pattern%/}" > /dev/null
        else
            git rm --cached "$pattern" > /dev/null
        fi
    else
        skippedPatterns+=("$pattern")  # Add the skipped pattern to the array
    fi
done <<< "$patterns"

# Check if there are any skipped patterns and print them
if [ ${#skippedPatterns[@]} -gt 0 ]; then
    echo "No files found for the following patterns, so they were skipped:"
    for pattern in "${skippedPatterns[@]}"; do
        echo "- $pattern"
    done
else
    echo "No patterns were skipped."
fi
