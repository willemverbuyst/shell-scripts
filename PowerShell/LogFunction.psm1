<#
.SYNOPSIS
    This is a function that logs messages to a log file with a datestamp.

.DESCRIPTION
    The function creates a file with the current date in the name.
    The messages with be logged in the file.

.PARAMETER NewFolderPath
    This is the path to the folder with logs.

.PARAMETER Message
    This is content that needs to be logged.

.NOTES
    FunctionName    : Write-Log
    Created by      : W.V.
    Date Coded      : 01/03/2021 04:35:40
    Modified by     : DWV
    Date Modified   : 02/03/2021 10:19:10
    
#>
function Write-Log {
    param(
        [parameter(
            Mandatory=$True,
            HelpMessage="Please enter the path to the log folder"
        )]
        [ValidateNotNullOrEmpty()]
        [string] 
        $NewFolderPath,

        [parameter(Mandatory=$False)]
        [string[]] 
        $Message = "Nothing to log"
    )

    $Prefix = Get-Date -Format "yyyyMMdd"
    if ( -not (Test-Path $NewFolderPath/LOG)) { 
        $LogFolderPath = New-Item `
            -Path $NewFolderPath `
            -Name "LOG" `
            -ItemType Directory
    }

    $LogFile = New-Item `
        -Path $LogFolderPath `
        -Name "$prefix-log.txt" `
        -ItemType File `
        -Force
    
    Add-Content $LogFile $Message
}