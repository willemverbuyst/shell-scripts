s$obj = [PSCustomObject]@{
    firstName = 'Sjaak'
    lastName = 'Marty'
    age = 34
}

$style = "<style>table, th, td {border-collapse: collapse; border: 1px solid red; padding: 5px;}</style>"

$obj | ConvertTo-Html -Head $style | Out-File ./index.html -Force

Invoke-Expression ./index.html