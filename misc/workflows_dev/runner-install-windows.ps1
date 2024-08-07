# Create a folder under the drive root
mkdir actions-runner; cd actions-runner

# Download the latest runner package
Invoke-WebRequest -Uri https://github.com/actions/runner/releases/download/v2.311.0/actions-runner-win-x64-2.311.0.zip -OutFile actions-runner-win-x64-2.311.0.zip

# Optional: Validate the hash
if((Get-FileHash -Path actions-runner-win-x64-2.311.0.zip -Algorithm SHA256).Hash.ToUpper() -ne 'e629628ce25c1a7032d845f12dfe3dced630ca13a878b037dde77f5683b039dd'.ToUpper()) { throw 'Computed checksum did not match' }

# Extract the installer
Add-Type -AssemblyName System.IO.Compression.FileSystem ; [System.IO.Compression.ZipFile]::ExtractToDirectory("$PWD/actions-runner-win-x64-2.311.0.zip", "$PWD")

# Create the runner and start the configuration experience
./config.cmd --url https://github.com/enterprises/timothy-warner --token <token>

# Run it!
./run.cmd