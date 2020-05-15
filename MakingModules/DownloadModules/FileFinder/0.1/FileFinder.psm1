<#
. $PSScriptRoot\Find-BigFile.ps1
. $PSScriptRoot\Find-OldFile.ps1
. $PSScriptRoot\Find-StaleFile.ps1
. $PSScriptRoot\Find-FreshFile.ps1
#>

foreach ($file in Get-ChildItem -Path $psScriptRoot -Filter *-*.ps1) {
    . $file.Fullname
}


$ValidateRootPath = {
    $fileItem = Get-Item -Path $_
    if (-not $fileItem.PSISContainer) {
        throw "Must be a directory"
    }
    return $true 
}

Set-Alias -Name OldFile -Value Find-OldFile
Set-Alias -Name OldFiles -Value Find-OldFile

$MyComputerName =$env:COMPUTERNAME

Export-ModuleMember -Alias OldFile, OldFiles -Function * -Variable MyComputerName

$MyInvocation.MyCommand.ScriptBlock.Module.OnRemove = { 
    # Clean up here!
}