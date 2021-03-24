Remove-Item ./TEST_ENV -Recurse

function New-SubFolders($d, $subDir, $number) {
    foreach ($i in 1..$number) {
        New-Item -Path $d -Name ($subDir + "_Sub" + $i) -ItemType Directory > $null
    }
}

function New-FolderTree {
    $baseDir = "./TEST_ENV"
    $numberOfLevels = 1
    $numberOfSubFolders = 1

    New-Item $baseDir -ItemType Directory -Force > $null

    foreach ($l in 1..$numberOfLevels) {
        $subDir = "L$l"
        $dirs = Get-ChildItem . -Recurse -Directory
        $xdirs = Get-DeepestsFolders $dirs
      
        if ($xdirs.count -gt 1) {          
           for ($i = 0; $i -lt $xdirs.count; $i++) {
               New-SubFolders $xdirs[$i] $subDir $numberOfSubFolders
          }
        }
        Else {
            New-SubFolders $baseDir $subDir $numberOfSubFolders
        }
    }
}

function Get-DeepestsFolders ($dirs) {
    $directories = New-Object System.Collections.ArrayList
    foreach ($d in $dirs) {
        $t = Split-Path $d.FullName -Parent
        if ($directories -notcontains $t) {
            $directories.add($d.FullName) > $null
        }
        Else {
            $directories.Remove($t)
            $directories.add($d.FullName) > $null
        }
    }

    return $directories
}


New-FolderTree