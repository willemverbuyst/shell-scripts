Using module '../CLASSES/Logger.psm1'


function Write-Messages {
$Log = [Logger]::new()


$Log.SetLogFolderAndFile((Split-Path $MyInvocation.PSCommandPath -Parent))

$Log.LogError("errrrrrrrrrrror")
$Log.LogInfo("inforrrrrrrrmation")
$Log.LogWarning("Warrrrrrrning")

Write-Host $Log.LogFile
}

Write-Messages