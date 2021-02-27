$months = @("JAN", 'FEB', 'APR', 'MAY', 'JUN', 'JUL', 'AUG', 'SEP', 'OCT', 'NOV', 'DEC')
$years = @(2017, 2018, 2019, 2020, 2021)

ForEach ($year in $years) {
    New-Item -Path . -Name "$year" -ItemType "Directory"
    ForEach ($month in $months) {
        New-Item -Path ./$year -Name "$month" -ItemType "Directory"
        1..10 | ForEach-Object {New-Item -Path ./$year/$month -Name "File$_.txt" -ItemType "File"}
    }
    
}