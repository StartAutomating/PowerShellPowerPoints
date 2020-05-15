. $PSScriptRoot\Find-BigFile.ps1
. $PSScriptRoot\Find-OldFile.ps1
. $PSScriptRoot\Find-StaleFile.ps1
. $PSScriptRoot\Find-FreshFile.ps1

foreach ($file in Get-ChildItem -Path $psScriptRoot -Filter *-*.ps1) {
    . $file.Fullname
}