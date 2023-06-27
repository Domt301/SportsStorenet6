# Install Node.js
Invoke-WebRequest -Uri "https://nodejs.org/dist/v14.15.1/node-v14.15.1-x64.msi" -OutFile "nodejs.msi"
Start-Process -FilePath "msiexec.exe" -ArgumentList "/i nodejs.msi /passive" -Wait
RefreshEnv

# Install the Power Apps CLI
npm install -g @microsoft/powerapps-cli

# Authenticate with source environment
pac auth create --kind CDS --url $env:SOURCE_ENV_URL --username $env:SOURCE_USERNAME --password $env:SOURCE_PASSWORD

# Publish all customizations
pac org publishall

# Export solution
pac solution export --path .\solution.zip --name $env:SOLUTION_NAME

# # Authenticate with target environment
# pac auth create --kind CDS --url $env:TARGET_ENV_URL --username $env:TARGET_USERNAME --password $env:TARGET_PASSWORD

# # Import solution
# pac solution import --path .\solution.zip
