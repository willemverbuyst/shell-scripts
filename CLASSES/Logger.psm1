class Logger {
    $TimeStamp = (Get-Date -Format "yyyy-MM-dd")
    $Prefix = (Get-Date -Format "yyyyMMdd")
    $LogFolder
    $LogFile
    

    [void]LogInfo([string]$message) {
        Add-Content $this.LogFile ($this.TimeStamp + "| INFO `t`t|" + $message)
    }
    [void]LogError([string]$message) {
        Add-Content $this.LogFile ($this.TimeStamp + "| ERROR `t`t|" + $message)
    }
    [void]LogWarning([string]$message) {
        Add-Content $this.LogFile ($this.TimeStamp + "| WARNING `t|" + $message)
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




