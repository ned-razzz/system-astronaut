param(
    [string]$InstallRoot = $(if ($env:CODEX_HOME) { Join-Path $env:CODEX_HOME 'skills' } else { Join-Path $HOME '.codex\skills' })
)

$ErrorActionPreference = 'Stop'
$source = Join-Path (Split-Path -Parent $PSScriptRoot) '.agents\skills\astronaut-sw'
$destination = Join-Path $InstallRoot 'astronaut-sw'

if (-not (Test-Path -LiteralPath $source -PathType Container)) {
    throw "Skill source not found: $source"
}

New-Item -ItemType Directory -Path $destination -Force | Out-Null
Copy-Item -Path (Join-Path $source '*') -Destination $destination -Recurse -Force
Write-Host "Installed astronaut-sw to $destination"
