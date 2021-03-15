Using module '../CLASSES/Logger.psm1'


function Write-Messages {
$Log = [Logger]::new()


$Log.SetLogFolderAndFile((Split-Path $MyInvocation.PSCommandPath -Parent))

$Log.LogError("Errrrrrrrrrrror")
$Log.LogInfo("Inforrrrrrrrmation")
$Log.LogWarning("Warrrrrrrning")

Write-Host $Log.LogFile
}

Write-Messages