function Write-Log {
    <#
    .Description
    This is a function that logs messages to a log file.
    #>
    param(
        [parameter(
            Mandatory=$True,
            HelpMessage="Please enter the path to the log folder"
        )]
        [string] $NewFolderPath,
        $Message
    )

    $prefix = Get-Date -Format "yyyyMMdd"
    if ( -not (Test-Path $NewFolderPath/LOG)) { 
        $LogFolderPath = New-Item -Path $NewFolderPath -Name "LOG" -ItemType Directory
    }

    $LogFile = New-Item `
        -Path $LogFolderPath `
        -Name "$prefix-log.txt" `
        -ItemType File `
        -Force
    
    Add-Content $LogFile $Message
}