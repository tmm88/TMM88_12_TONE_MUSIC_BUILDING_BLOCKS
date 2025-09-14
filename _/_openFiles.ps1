# Set the path to the folder where the files are located
$folderPath = ".\"

# Check if the folder exists
if (-Not (Test-Path -Path $folderPath)) {
    Write-Host "The specified folder does not exist: $folderPath"
    exit
}

# Get all the files in the folder (including subfolders, if needed)
$files = Get-ChildItem -Path $folderPath -File

# Check if there are any files in the folder
if ($files.Count -eq 0) {
    Write-Host "No files found in the folder: $folderPath"
    exit
}

# If there are fewer than 5 files, adjust the count accordingly
$fileCount = [Math]::Min($files.Count, 5)

# Select random files
$randomFiles = $files | Get-Random -Count $fileCount

# Open each random file using the default associated application
foreach ($file in $randomFiles) {
    Write-Host "Opening file: $($file.FullName)"
    Start-Process $file.FullName
}
