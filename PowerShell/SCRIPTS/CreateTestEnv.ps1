# For dev
Remove-Item ../ENV/TEST_ENV -Recurse

function Invoke-Creation {
    $baseDir = "../ENV/TEST_ENV"
    $numberOflevels = 3
    $numberOfSubFolders = 4

    New-FolderTree $baseDir $numberOflevels $numberOfSubFolders
}


function New-FolderTree ($baseDir, $numberOfLevels, $numberOfSubFolders) {
    New-Item $baseDir -ItemType Directory -Force > $null

    foreach ($numberOfLevel in 1..$numberOflevels) {
        $subFolderNamePrefix = "L$numberOfLevel"
        $allFolders = Get-ChildItem ../ENV -Recurse -Directory
        $lastFolders = Get-LastDirectories $allFolders

        for ($i = 0; $i -lt $lastFolders.count; $i++) {
            New-SubFolders $lastFolders[$i] $subFolderNamePrefix $numberOfSubFolders
        }
    }
}

function Get-LastDirectories ($dirs) {
    $lastDirectories = New-Object System.Collections.ArrayList
    foreach ($d in $dirs) {
        if ($null -eq ($d.EnumerateDirectories()).count) {
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