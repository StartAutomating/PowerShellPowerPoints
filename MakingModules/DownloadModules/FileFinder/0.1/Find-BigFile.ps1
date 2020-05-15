function Find-BigFile
{
    <#
    .Synopsis
        Finds big files
    .Description
        Finds big files.  By default, finds files that are at least 1mb.
    #>
    param(
    # The root path
    [Parameter(Mandatory)]
    [ValidateScript({
        return . $validateRootPath
    })]
    [string]
    $RootPath,

    # The size at which a file is considered "Big".  
    # By default, these are files who are at least 1mb
    [long]
    $BiggerThan = 1mb
    )

    Get-ChildItem -Path $RootPath -Recurse -Force |
        Where-Object {
            $_.Length -ge $BiggerThan
        }
}
