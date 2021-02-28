if (Test-Path ./PROJECT) { 
    Remove-Item -Recurse PROJECT
}

function generateFoldersAndFiles {
    $newFolderPath = New-Item -Path . -Name "PROJECT" -ItemType Directory
    generateFoldersForYears $newFolderPath 
}

function generateFoldersForYears ($newFolderPath) {
    $years = @(2017, 2018)
    ForEach ($year in $years) {
        $yearFolderPath = New-Item -Path $newFolderPath -Name $year -ItemType Directory
        generateFoldersForMonths $yearFolderPath
    }
}

function generateFoldersForMonths ($yearFolderPath) {
    $months = @("JAN", 'FEB', 'APR', 'MAY', 'JUN', 'JUL', 'AUG', 'SEP', 'OCT', 'NOV', 'DEC')
    ForEach ($month in $months) {
        $montFolderPath = New-Item -Path $yearFolderPath -Name $month -ItemType Directory
        generateFoldersForWeeks($montFolderPath) 
    }  
}

function generateFoldersForWeeks ($monthFolderPath) {
    Foreach ($i in 1..52) {
        $weekFolderPath = New-Item -Path $monthFolderPath -Name "WEEK$i" -ItemType Directory
        generateTextFiles($weekFolderPath)
    }
}

function generateTextFiles ($weekFolderPath) {
    Foreach ($i in 1..3) {
       New-Item -Path $weekFolderPath -Name "FILE-$i.txt" -ItemType File
    }
}

generateFoldersAndFiles