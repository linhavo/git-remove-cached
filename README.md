# Git Cached Removal Script

## Overview
This PowerShell script is designed to automate the process of removing files from the Git cache that are listed in the `.gitignore` file. It helps in cases where files were previously tracked by Git but are now ignored and need to be removed from the index without deleting them from the local file system.

## Usage
### Windows
To run the script, use the following command in PowerShell:
```powershell
./remove-cached.ps1
```
#### Add to PATH

To make the script `remove-cached.ps1` easily accessible from any directory via the command line, you can add it to your system's PATH. Follow these steps:

1. **Optional:** Move the script to a desired location, for example: `Documents\WindowsPowerShell\Scripts`.
2. **Copy the path to the script.**
3. **Search for and open "Edit the system environment variables"** through the Windows search bar.
4. **Access "Environment Variables":**
   - In the System Properties window that appears, click on the `Environment Variables` button.
5. **Modify the Path:**
   - In the Environment Variables window, under the "User variables" section, find and select the `Path` variable.
   - Click `Edit`, then `New`, and paste the copied path to the script.
6. **Complete the setup:** Click `OK` to close all dialogs. 

You have now added the script to your PATH. You can call it directly from any command line window by typing `remove-cached.ps1`.

## Notes
* The script handles patterns ending with / as directories.
* It is safe to run as it only affects the Git index and not your actual files.

## Output
Upon completion, the script provides a summary of patterns that were skipped because no matching files were found. This helps you verify which entries in your .gitignore are effective or need adjustments.

## Contributing
Contributions to this script are welcome! Please feel free to fork the repository, make your changes, and submit a pull request.
