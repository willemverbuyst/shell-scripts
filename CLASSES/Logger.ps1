class Logger {
    $TimeStamp = $(Get-Date -Format "yyyy-MM-dd")
    $Prefix = $(Get-Date -Format "yyyyMMdd")
    $LogFile = $this.Prefix + "-report.txt"

    [void]LogInfo([string]$message) {
        Write-Host $this.TimeStamp "| INFO `t|" $message
    }
    [void]LogError([string]$message) {
        Write-Host $this.TimeStamp "| ERROR `t|" $message
    }
    [void]LogWarning([string]$message) {
        Write-Host $this.TimeStamp "| WARNING `t|" $message
    }
}




$Log = [Logger]::new()

Write-Host $Log.LogFile

$Log.LogError("errrrrrrrrrrror")
$Log.LogInfo("inforrrrrrrrmation")
$Log.LogWarning("Warrrrrrrning")