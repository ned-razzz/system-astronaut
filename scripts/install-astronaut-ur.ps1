param(
    [string]$InstallRoot = (Join-Path $HOME '.agents\skills')
)

$ErrorActionPreference = 'Stop'
$source = Join-Path (Split-Path -Parent $PSScriptRoot) 'skills\astronaut-ur'
$destination = Join-Path $InstallRoot 'astronaut-ur'

if (-not (Test-Path -LiteralPath $source -PathType Container)) {
    throw "Skill source not found: $source"
}

New-Item -ItemType Directory -Path $destination -Force | Out-Null
Copy-Item -Path (Join-Path $source '*') -Destination $destination -Recurse -Force
Write-Host "Installed astronaut-ur to $destination"
