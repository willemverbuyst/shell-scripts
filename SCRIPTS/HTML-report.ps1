$header = @"

    <style>

        table, 
        th, 
        td {
            border-collapse: collapse; 
            border: 1px solid teal; 
            padding: 5px;
        } 
        
        h1 {
            color: teal
        }

    </style>

"@

$person = [PSCustomObject]@{
    firstName = 'Sjaak'
    lastName = 'Marty'
    age = 34
}
$titleDoc = "<title>$($person.firstName)</title>"

$titleSection = "<h1>Report of Person</h1>"
$mainSection = $person | ConvertTo-Html -As List -Fragment

$report = ConvertTo-Html -Body "$titleSection $mainSection"  -Head "$header $titleDoc"
 
$report | Out-File ./index.html -Force

Invoke-Expression ./index.html
