# Check if Helm is already installed
$helmVersion = helm version --short
if ($LASTEXITCODE -eq 0) {
    Write-Host "Helm is already installed."
    exit 0
}

# Download Helm binary
$helmVersion = "v3.7.0"  # Specify the desired Helm version
$helmUrl = "https://get.helm.sh/helm-$helmVersion-windows-amd64.zip"
$helmZipFile = "$env:TEMP\helm.zip"
$helmExtractPath = "$env:TEMP\helm"

Write-Host "Downloading Helm..."
Invoke-WebRequest -Uri $helmUrl -OutFile $helmZipFile

# Extract Helm
Write-Host "Extracting Helm..."
Expand-Archive -Path $helmZipFile -DestinationPath $helmExtractPath -Force

# Move Helm binary to a directory in the system's PATH
Write-Host "Installing Helm..."
$helmBinaryPath = "$helmExtractPath\windows-amd64\helm.exe"
Move-Item -Path $helmBinaryPath -Destination "$env:ProgramFiles\Helm\helm.exe"

# Verify Helm installation
$helmVersion = helm version --short
if ($LASTEXITCODE -eq 0) {
    Write-Host "Helm installation completed successfully."
} else {
    Write-Host "Failed to install Helm."
    exit 1
}

# Clean up temporary files
Write-Host "Cleaning up temporary files..."
Remove-Item -Path $helmZipFile -Force
Remove-Item -Path $helmExtractPath -Force -Recurse

