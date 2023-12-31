$TerraformVersion = "1.5.1"
$TerraformZipUrl = "https://releases.hashicorp.com/terraform/$TerraformVersion/terraform_$TerraformVersion"+"_windows_amd64.zip"
$TerraformZipFile = "terraform.zip"
$TerraformExtractPath = "terraform-path"


# Create Terraform directory
Write-Host "Create Terraform directory"
New-Item -ItemType Directory -Path $TerraformExtractPath -Force | Out-Null

# Download Terraform zip
Write-Host "Download Terraform zip"
Invoke-WebRequest -Uri $TerraformZipUrl -OutFile $TerraformZipFile

# Extract Terraform zip
Write-Host "Extract Terraform zip"
Expand-Archive -Path $TerraformZipFile -DestinationPath $TerraformExtractPath

$currentDirectory = (Get-Location).Path
Write-Host "Current Directory: $currentDirectory"

$TerraformPath = $currentDirectory +"\" + $TerraformExtractPath 

Write-Host "Terraform path Directory: $terraformPath" 

# Add Terraform to system PATH
#$env:Path += ";$TerraformExtractPath"
[Environment]::SetEnvironmentVariable("Path", "$($env:Path);$TerraformPath", "Machine")

# Clean up Terraform zip file
Write-Host "Clean up Terraform zip file"
Remove-Item -Path $TerraformZipFile

Write-Host "Terraform installation completed. Please make sure to reopen your PowerShell session for the changes to take effect."
