<#
    .SYNOPSIS
        AppVeyor install script.
#>
[OutputType()]
param ()

# Set variables
If (Test-Path 'env:APPVEYOR_BUILD_FOLDER') {
    # AppVeyor Testing
    $projectRoot = Resolve-Path -Path $env:APPVEYOR_BUILD_FOLDER
    $module = $env:Module
}
Else {
    # Local Testing 
    $projectRoot = Resolve-Path -Path (((Get-Item (Split-Path -Parent -Path $MyInvocation.MyCommand.Definition)).Parent).FullName)
    $module = Split-Path -Path $projectRoot -Leaf
}
$moduleParent = Join-Path -Path $projectRoot -ChildPath $module
$manifestPath = Join-Path -Path $moduleParent -ChildPath "$module.psd1"
$modulePath = Join-Path -Path $moduleParent -ChildPath "$module.psm1"

# Echo variables
Write-Host ""
Write-Host "ProjectRoot:     $projectRoot."
Write-Host "Module name:     $module."
Write-Host "Module parent:   $moduleParent."
Write-Host "Module manifest: $manifestPath."
Write-Host "Module path:     $modulePath."

# Line break for readability in AppVeyor console
Write-Host ""
Write-Host "PowerShell Version:" $PSVersionTable.PSVersion.ToString()

# Install packages
Install-PackageProvider -Name NuGet -MinimumVersion 2.8.5.208
If (Get-PSRepository -Name PSGallery | Where-Object { $_.InstallationPolicy -ne "Trusted" }) {
    Set-PSRepository -Name PSGallery -InstallationPolicy Trusted
}
If ([Version]((Find-Module -Name Pester).Version) -gt (Get-Module -Name Pester).Version) {
    Install-Module -Name Pester -SkipPublisherCheck -Force #-RequiredVersion 4.10.1
    Import-Module -Name Pester
}
If ([Version]((Find-Module -Name PSScriptAnalyzer).Version) -gt (Get-Module -Name PSScriptAnalyzer).Version) {
    Install-Module -Name PSScriptAnalyzer -SkipPublisherCheck -Force
    Import-Module -Name PSScriptAnalyzer
}
If ([Version]((Find-Module -Name posh-git).Version) -gt (Get-Module -Name posh-git).Version) {
    Install-Module -Name posh-git -SkipPublisherCheck -Force
    Import-Module -Name posh-git
}

# Import module
Write-Host ""
Write-Host "Importing module." -ForegroundColor Cyan
Import-Module $manifestPath -Force
