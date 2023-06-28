# Check if eksctl is already installed
$eksctlVersion = eksctl version --short
if ($LASTEXITCODE -eq 0) {
    Write-Host "eksctl is already installed."
    exit 0
}

# Download eksctl binary
$eksctlVersion = "0.70.0"  # Specify the desired eksctl version
$eksctlUrl = "https://github.com/weaveworks/eksctl/releases/download/$eksctlVersion/eksctl_Windows_amd64.zip"
$eksctlZipFile = "$env:TEMP\eksctl.zip"
$eksctlExtractPath = "$env:TEMP\eksctl"

Write-Host "Downloading eksctl..."
Invoke-WebRequest -Uri $eksctlUrl -OutFile $eksctlZipFile

# Extract eksctl
Write-Host "Extracting eksctl..."
Expand-Archive -Path $eksctlZipFile -DestinationPath $eksctlExtractPath -Force

# Move eksctl binary to a directory in the system's PATH
Write-Host "Installing eksctl..."
$eksctlBinaryPath = "$eksctlExtractPath\eksctl.exe"
Move-Item -Path $eksctlBinaryPath -Destination "$env:ProgramFiles\eksctl\eksctl.exe"

# Verify eksctl installation
$eksctlVersion = eksctl version --short
if ($LASTEXITCODE -eq 0) {
    Write-Host "eksctl installation completed successfully."
} else {
    Write-Host "Failed to install eksctl."
    exit 1
}

# Clean up temporary files
Write-Host "Cleaning up temporary files..."
Remove-Item -Path $eksctlZipFile -Force
Remove-Item -Path $eksctlExtractPath -Force -Recurse

