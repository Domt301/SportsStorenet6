# Install the Power Apps CLI
Invoke-WebRequest -Uri "https://aka.ms/PowerAppsCLI" -OutFile ".\pac.exe"
.\pac.exe

# Authenticate with source environment
pac auth create --url $env:SOURCE_ENV_URL --username $env:SOURCE_USERNAME --password $env:SOURCE_PASSWORD

# Publish all customizations
pac org publishall

# Export solution
pac solution export --path .\solution.zip --name $env:SOLUTION_NAME

# # Authenticate with target environment
# pac auth create --url $env:TARGET_ENV_URL --username $env:TARGET_USERNAME --password $env:TARGET_PASSWORD

# # Import solution
# pac solution import --path .\solution.zip
