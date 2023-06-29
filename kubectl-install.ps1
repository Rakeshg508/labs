# Download kubectl binary
Invoke-WebRequest -Uri "https://dl.k8s.io/release/$(curl.exe -L -s https://dl.k8s.io/release/stable.txt)/bin/windows/amd64/kubectl.exe" -OutFile "kubectl.exe"

# Move kubectl binary to a directory in PATH
Move-Item -Path ".\kubectl.exe" -Destination "$env:USERPROFILE\bin\kubectl.exe"

# Add kubectl directory to PATH environment variable
[System.Environment]::SetEnvironmentVariable("PATH", "$env:PATH;$env:USERPROFILE\bin", "Machine")

# Verify kubectl installation
kubectl version --client
