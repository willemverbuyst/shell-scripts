class Logger {
    $TimeStamp = (Get-Date -Format "yyyy-MM-dd")
    $Prefix = (Get-Date -Format "yyyyMMdd")
    $LogFolder
    $LogFile
    

    [void]LogInfo([string]$message) {
        Write-Host $this.TimeStamp "| INFO `t|" $message
    }
    [void]LogError([string]$message) {
        Write-Host $this.TimeStamp "| ERROR `t|" $message
    }
    [void]LogWarning([string]$message) {
        Write-Host $this.TimeStamp "| WARNING `t|" $message
    }

    [void]SetLogFolderAndFile([string]$NewFolderPath) {

        if (-not (Test-Path $NewFolderPath/LOG)) { 
            $this.LogFolder = New-Item `
                -Path $NewFolderPath `
                -Name "LOG" `
                -ItemType Directory > $Null
        }

        $this.LogFile = New-Item `
            -Path $NewFolderPath/LOG `
            -Name ($this.prefix + "-log.txt") `
            -ItemType File `
            -Force `
    }
}




