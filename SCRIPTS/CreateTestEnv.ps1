# For dev
Remove-Item ./TEST_ENV -Recurse

function Invoke-Creation {
    $baseDir = "./TEST_ENV"
    $numberOflevels = 2
    $numberOfSubFolders = 2

    New-FolderTree $baseDir $numberOflevels $numberOfSubFolders
}


function New-FolderTree ($baseDir, $numberOfLevels, $numberOfSubFolders) {
    New-Item $baseDir -ItemType Directory -Force > $null

    foreach ($numberOfLevel in 1..$numberOflevels) {
        $subFolderNamePrefix = "L$numberOfLevel"
        $allFolders = Get-ChildItem . -Recurse -Directory
        $lastFolders = Get-LastDirectories $allFolders

        for ($i = 0; $i -lt $lastFolders.count; $i++) {
            New-SubFolders $lastFolders[$i] $subFolderNamePrefix $numberOfSubFolders
        }
    }
}

function Get-LastDirectories ($dirs) {
    $lastDirectories = New-Object System.Collections.ArrayList
    foreach ($d in $dirs) {
        $t = Split-Path $d.FullName -Parent
        if ($lastDirectories -notcontains $t) {
            $lastDirectories.add($d.FullName) > $null
        }
        Else {
            $lastDirectories.Remove($t)
            $lastDirectories.add($d.FullName) > $null
        }
    }
    # Extra comma to return an array even with one element
    return ,$lastDirectories
}


function New-SubFolders($lastFolder, $subFolderNamePrefix, $numberOfSubFolders) {
    foreach ($i in 1..$numberOfSubFolders) {
        New-Item `
            -Path $lastFolder `
            -Name ($subFolderNamePrefix + "_Sub" + $i) `
            -ItemType Directory > $null
    }
}


Invoke-Creation