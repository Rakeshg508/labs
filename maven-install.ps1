$mavenDownloadUrl = "https://archive.apache.org/dist/maven/maven-3/3.8.4/binaries/apache-maven-3.8.4-bin.zip"
$mavenArchive = "apache-maven.zip"
$mavenHome = "$env:ProgramFiles\Apache\maven-3.8.4"

Write-Host "Downloading Apache Maven..."
Invoke-WebRequest -Uri $mavenDownloadUrl -OutFile $mavenArchive

Write-Host "Extracting Apache Maven..."
Expand-Archive -Path $mavenArchive -DestinationPath $mavenHome -Force
Write-Host "Setting MAVEN_HOME and adding Maven to PATH..."
[Environment]::SetEnvironmentVariable("MAVEN_HOME", $mavenHome, "Machine")
[Environment]::SetEnvironmentVariable("Path", "$($env:Path);$mavenHome\bin", "Machine")

Write-Host "Cleaning up Maven archive..."
Remove-Item $mavenArchive

Write-Host "Apache Maven installation completed."