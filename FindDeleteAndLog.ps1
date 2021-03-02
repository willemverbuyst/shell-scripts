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

function New-SubFoldersAndFiles {
    ForEach ($i in 1..4) {

        $NewSubFolderPath = New-Item `
            -Path $NewFolderPath `
            -Name "Folder$i" `
            -ItemType Directory

        New-Item `
            -Path $NewSubFolderPath.FullName `
            -Name "File1.txt" `
            -ItemType File
    }
}

function Get-FilesToLog {
    $Files = Get-ChildItem `
    -Path ./$ProjectName `
    -Filter "File1.txt" `
    -Recurse

    # For development
    Write-Host ($Files | Out-String) -ForegroundColor red

    Return $Files
}

function Write-Message ($NewFolderPath, $LogMessage) {
    if (-not (Test-Path $NewFolderPath/LOGS)) { 
        New-Item `
            -Path $NewFolderPath `
            -Name 'LOGS' `
            -ItemType Directory
    }

    New-Item `
        -Path $NewFolderPath `
        -Name "Log.txt" `
        -ItemType File

    Add-Content `
        -Path $NewFolderPath/Log.txt `
        -Value $LogMessage
}


$NewFolderPath = New-MainFolder
New-SubFoldersAndFiles $NewFolderPath 
$Files = Get-FilesToLog
Write-Message $NewFolderPath $Files



