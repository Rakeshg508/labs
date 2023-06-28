$openjdkDownloadUrl = "https://download.java.net/java/GA/jdk11/9/GPL/openjdk-11.0.2_windows-x64_bin.zip"
$openjdkArchive = "openjdk-11.0.2_windows-x64_bin.zip"
$javaHome = "$env:ProgramFiles\Java\jdk-11\jdk-11.0.2"

Write-Host "Downloading OpenJDK 11..."
Invoke-WebRequest -Uri $openjdkDownloadUrl -OutFile $openjdkArchive

Write-Host "Extracting OpenJDK 11..."
Expand-Archive -Path $openjdkArchive -DestinationPath $javaHome -Force
Write-Host "Setting JAVA_HOME environment variable..."
[Environment]::SetEnvironmentVariable("JAVA_HOME", $javaHome, "Machine")
[Environment]::SetEnvironmentVariable("Path", "$($env:Path);$javaHome\bin", "Machine")

Write-Host "Cleaning up..."
Remove-Item $openjdkArchive

Write-Host "OpenJDK 11 installation completed."