param(
    [string]$InstallRoot = (Join-Path $HOME '.agents\skills')
)

$ErrorActionPreference = 'Stop'
$repoRoot = Split-Path -Parent $PSScriptRoot
$skillRoot = Join-Path $repoRoot 'skills'

foreach ($name in 'astronaut-ur', 'astronaut-sr', 'astronaut-sa') {
    $source = Join-Path $skillRoot $name
    $destination = Join-Path $InstallRoot $name

    if (-not (Test-Path -LiteralPath $source -PathType Container)) {
        throw "Skill source not found: $source"
    }

    New-Item -ItemType Directory -Path $destination -Force | Out-Null
    Copy-Item -Path (Join-Path $source '*') -Destination $destination -Recurse -Force
    Write-Host "Installed $name to $destination"
}
