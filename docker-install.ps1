$DockerDesktopUrl = "https://desktop.docker.com/win/main/amd64/Docker%20Desktop%20Installer.exe"
$DockerInstallerPath = "$env:TEMP\DockerDesktopInstaller.exe"

# Download Docker Desktop installer
Write-Host "Download Docker Desktop installer"
Invoke-WebRequest -Uri $DockerDesktopUrl -OutFile $DockerInstallerPath

# Install Docker Desktop
Write-Host "Install Docker Desktop"
Start-Process -FilePath $DockerInstallerPath -ArgumentList "--quiet" -Wait

# Clean up Docker Desktop installer
Write-Host "Clean up Docker Desktop installer"
Remove-Item -Path $DockerInstallerPath

Write-Host "Docker installation completed. Please restart your computer to start using Docker."
