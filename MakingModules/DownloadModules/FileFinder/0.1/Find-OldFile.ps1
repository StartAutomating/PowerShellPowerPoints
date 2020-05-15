function Find-OldFile
{
    <#
    .Synopsis
        Finds old files
    .Description
        Finds old files.  By default, finds files that have not been written to in over a year.
    .Example
        Find-OldFile -RootPath $pwd -OlderThan ([DateTime]::Now.AddDays(-1)) # Finds files older than yesterday
    #>
    param(
    # The root path
    [Parameter(Mandatory)]
    [ValidateScript({
        . $validateRootPath
    })]
    [string]
    $RootPath,

    # The size at which a file is considered "Big".  
    # By default, these are files who are at least 1mb
    [DateTime]
    $OlderThan = ([DateTime]::now.AddYears(-1)),

    # If set, will always enumerate files.
    [Switch]$Force
    )

    if (-not $Script:fileCache) {
        $Script:fileCache = @{}
    }
    if ($Force) {
        $Script:fileCache.$RootPath = $null
    }
    if (-not $Script:fileCache.$RootPath) {
        $Script:fileCache.$RootPath = Get-ChildItem -Path $RootPath -Recurse -Force 
    }
    
    foreach ($file in $Script:fileCache.$RootPath) {
        if ($file.LastWriteTime -lt $OlderThan) {
            $file
        }
    }
        
}
