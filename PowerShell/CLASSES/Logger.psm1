class Logger {
    [string]$TimeStamp = (Get-Date -Format "yyyy-MM-dd")
    [string]$Prefix = (Get-Date -Format "yyyyMMdd")
    [string]$MainPath
    [string]$LogFolder
    [string]$LogFile

    Logger ([string]$MainPath) {
        $this.Mainpath = $MainPath

        if (-not (Test-Path $MainPath/LOG)) { 
            $this.LogFolder = New-Item `
                -Path $this.MainPath `
                -Name "LOG" `
                -ItemType Directory > $Null
        }

        $this.LogFile = New-Item `
            -Path $MainPath/LOG `
            -Name ($this.prefix + "-log.txt") `
            -ItemType File `
            -Force `
    }
    
    [void]LogInfo([string]$message) {
        Add-Content $this.LogFile ($this.TimeStamp + "| INFO `t`t|" + $message)
    }
    [void]LogError([string]$message) {
        Add-Content $this.LogFile ($this.TimeStamp + "| ERROR `t`t|" + $message)
    }
    [void]LogWarning([string]$message) {
        Add-Content $this.LogFile ($this.TimeStamp + "| WARNING `t|" + $message)
    }

}




