Using module '../CLASSES/Logger.psm1'


function Write-Messages {

$MainPath = ((Split-Path $MyInvocation.PSCommandPath -Parent))
$Log = [Logger]::new($MainPath)

$Log.LogError("Errrrrrrrrrrror")
$Log.LogInfo("Inforrrrrrrrmation")
$Log.LogWarning("Warrrrrrrning")
$Log.LogInfo("Classes are fun!")

}

Write-Messages