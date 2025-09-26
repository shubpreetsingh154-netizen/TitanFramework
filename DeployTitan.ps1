$mt5Path = "$env:USERPROFILE\AppData\Roaming\MetaQuotes\Terminal\Common\Files"

# Create folders if they don't exist
New-Item -ItemType Directory -Force -Path "$mt5Path\Experts\TitanFramework"
New-Item -ItemType Directory -Force -Path "$mt5Path\Experts\TitanFramework\Modules"
New-Item -ItemType Directory -Force -Path "$mt5Path\Experts\TitanFramework\Strategies"
New-Item -ItemType Directory -Force -Path "$mt5Path\Files"

# Copy EA core
Copy-Item -Path ".\Titan.mq5" -Destination "$mt5Path\Experts\TitanFramework" -Force

# Copy Modules
Copy-Item -Path ".\Modules\*" -Destination "$mt5Path\Experts\TitanFramework\Modules" -Recurse -Force

# Copy Strategies
Copy-Item -Path ".\Strategies\*" -Destination "$mt5Path\Experts\TitanFramework\Strategies" -Recurse -Force

# Copy Config
Copy-Item -Path ".\Config\Titan.cfg" -Destination "$mt5Path\Files" -Force

Write-Host "✅ Titan Framework deployed successfully!"
