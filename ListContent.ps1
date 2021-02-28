$newFileName = "OVERVIEW.txt"

if (Test-Path ./$newFileName) { 
    Remove-Item $newFileName
}


$list = New-Item -Path . -Name $newFileName -ItemType File 


Get-ChildItem -Path . -File -Exclude *.ps1 -Recurse | Format-Table -Property Name, LastWriteTime| Format-Wide > $list
