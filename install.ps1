[CmdletBinding()]
param(
    [string]$DestinationRoot
)

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

$sourceManifest = Join-Path $PSScriptRoot 'pet.json'
$sourceSpritesheet = Join-Path $PSScriptRoot 'spritesheet.webp'

foreach ($requiredFile in @($sourceManifest, $sourceSpritesheet)) {
    if (-not (Test-Path -LiteralPath $requiredFile -PathType Leaf)) {
        throw "Required package file is missing: $requiredFile"
    }
}

$manifest = Get-Content -Raw -LiteralPath $sourceManifest | ConvertFrom-Json
if ($manifest.id -ne 'little-isaac' -or $manifest.spriteVersionNumber -ne 2) {
    throw 'The pet manifest is not the expected little-isaac v2 package.'
}

if ([string]::IsNullOrWhiteSpace($DestinationRoot)) {
    $userProfile = [Environment]::GetFolderPath('UserProfile')
    $DestinationRoot = Join-Path $userProfile '.codex\pets'
}

$target = Join-Path $DestinationRoot 'little-isaac'
$backup = $null

New-Item -ItemType Directory -Path $DestinationRoot -Force | Out-Null

if (Test-Path -LiteralPath $target -PathType Container) {
    $stamp = Get-Date -Format 'yyyyMMdd-HHmmss-fff'
    $backup = Join-Path $DestinationRoot "little-isaac.backup-$stamp"
    Copy-Item -LiteralPath $target -Destination $backup -Recurse
}

New-Item -ItemType Directory -Path $target -Force | Out-Null
Copy-Item -LiteralPath $sourceManifest -Destination (Join-Path $target 'pet.json') -Force
Copy-Item -LiteralPath $sourceSpritesheet -Destination (Join-Path $target 'spritesheet.webp') -Force

$sourceHash = (Get-FileHash -Algorithm SHA256 -LiteralPath $sourceSpritesheet).Hash
$installedHash = (Get-FileHash -Algorithm SHA256 -LiteralPath (Join-Path $target 'spritesheet.webp')).Hash
if ($sourceHash -ne $installedHash) {
    throw 'The installed spritesheet hash does not match the repository copy.'
}

Write-Host "Installed 小以撒 to $target"
Write-Host "spritesheet.webp SHA-256: $installedHash"
if ($null -ne $backup) {
    Write-Host "Previous package backup: $backup"
}
Write-Host 'Restart Codex to load the pet.'
