function FindFileAndLog {
    $fileToTrack = "SPECIAL.TXT"
    $logFile = PrepareLog
    FindFile $fileToTrack $logFile
}
function PrepareLog {
    $prefix = Get-Date -Format "yyyyMMdd"
    if ( -not (Test-Path ./LOG)) { 
        New-Item -Path . -Name "LOG" -ItemType Directory
    }
    $logFile = New-Item -Path ./LOG -Name "$prefix-report.txt" -ItemType File -Force
    return $logFile
}

function FindFile($fileToTrack, $logFile) {
    ForEach ($file in Get-ChildItem ./PROJECT -Filter $fileToTrack -Recurse) {
    Add-Content -Path $logFile $file.FullName
    }
}

FindFileAndLog
