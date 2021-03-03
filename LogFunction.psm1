#function Write-Message ($FolderPath, $Messsage) {
#    $prefix = Get-Date -Format "yyyyMMdd"
#    if ( -not (Test-Path $FolderPath/LOG)) { 
#        $NewFolderPath = New-Item `
#            -Path $FolderPath `
#            -Name "LOG" `
#            -ItemType Directory
#    }
#
#    $logFile = New-Item `
#        -Path $NewFolderPath `
#        -Name "$prefix-log.txt" `
#        -ItemType File `
#        -Force
#    
#    Add-Content $LogFile $Messsage
#
#    return $logFile
#}
#