Import-Module ./LogFunction.psm1

$ProjectName = "PROJECT-2"

 # Clean up to have a fresh start
 if (Test-Path ./$ProjectName) { 
     Remove-Item -Recurse $ProjectName
 }

function New-MainFolder {
    $NewFolderPath = New-Item `
        -Path . `
        -Name $ProjectName `
        -ItemType Directory

    return $NewFolderPath
}

function New-SubFoldersAndFiles ($NewFolderPath){
    ForEach ($i in 1..4) {

        $NewSubFolderPath = New-Item `
            -Path $NewFolderPath `
            -Name "Folder$i" `
            -ItemType Directory

        New-Item `
            -Path $NewSubFolderPath.FullName `
            -Name "File.txt" `
            -ItemType File `
            > $Null
    }
}

function Get-FilesToLog ($NewFolderPath){
    $Files = Get-ChildItem `
    -Path $NewFolderPath `
    -Filter "File1.txt" `
    -Recurse

   $TextFiles = @() 
   Foreach ($File in $Files) {
        $TextFiles += $File.FullName
    }

   Return $TextFiles
}

$NewFolderPath = New-MainFolder
New-SubFoldersAndFiles $NewFolderPath 
$ContentToLog = Get-FilesToLog $NewFolderPath 
Write-Log $NewFolderPath $ContentToLog


