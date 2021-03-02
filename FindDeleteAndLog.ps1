$ProjectName = "PROJECT-2"

if (Test-Path ./$ProjectName) { 
    Remove-Item -Recurse $ProjectName
}

function generateFoldersAndFiles {
    $NewFolderPath = New-Item -Path . -Name $ProjectName -ItemType Directory
    generateFoldersForYears $NewFolderPath 
}

function generateFoldersForYears ($NewFolderPath) {
    ForEach ($i in 1..4) {
        $NewSubFolderPath = New-Item -Path $NewFolderPath -Name "Folder$i" -ItemType Directory
        New-Item -Path $NewSubFolderPath.FullName -Name "File1.txt" -ItemType File
    }
}

generateFoldersAndFiles