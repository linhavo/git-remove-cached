# Define the path to the .gitignore file
$gitignorePath = ".gitignore"

# Read the .gitignore file, excluding comments and empty lines
$patterns = Get-Content $gitignorePath | Where-Object { $_ -notmatch "^\s*#" -and $_.Trim() -ne "" }

# Initialize an array to store skipped patterns
$skippedPatterns = @()

# Loop through each pattern and apply 'git rm --cached'
foreach ($pattern in $patterns) {
    # Check if there are files matching the pattern in the git index
    $files = git ls-files $pattern
    if ($files) {
        # Handle patterns ending with '/' as directory removal
        if ($pattern -match "/$") {
            git rm -r --cached $pattern.TrimEnd('/') | Out-Null
        } else {
            git rm --cached $pattern | Out-Null
        }
    } else {
        $skippedPatterns += $pattern  # Add the skipped pattern to the array
    }
}

# Check if there are any skipped patterns and print them
if ($skippedPatterns.Count -gt 0) {
    Write-Output "No files found for the following patterns, so they were skipped:"
    $skippedPatterns | ForEach-Object { Write-Output "- $_" }
} else {
    Write-Output "No patterns were skipped."
}
