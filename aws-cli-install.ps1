$AWSCLIInstallerUrl = "https://awscli.amazonaws.com/AWSCLIV2.msi"
$AWSCLIInstaller = "AWSCLIInstaller.msi"

# Download AWS CLI installer
Write-Host "Download AWS CLI installer"
Invoke-WebRequest -Uri $AWSCLIInstallerUrl -OutFile $AWSCLIInstaller

# Install AWS CLI silently
Write-Host "Install AWS CLI silently"
Start-Process -FilePath msiexec.exe -ArgumentList "/i $AWSCLIInstaller /quiet" -Wait

# Clean up AWS CLI installer
Write-Host "Clean up AWS CLI installer"
Remove-Item -Path $AWSCLIInstaller

Write-Host "AWS CLI installation completed."
