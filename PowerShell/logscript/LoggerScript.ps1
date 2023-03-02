function GetMeetings {
    $Local:Meetings = @{}
    $Local:NumberOfMeetings = 6
    $Local:Greetings = "Hi Madam!","Hello Sir!",  `
        "How are you?", "What's up?!", "Yo!"
   
    for ($i = 1; $i -le $NumberOfMeetings; $i++) {
        $Meetings.Add($i, $Greetings)
    } 
    return $Meetings
}

function CreateLog($LoggerScript, $FileWithLogs ,$TimeStamp, $DateStamp) {
    New-Item $FileWithLogs -Type file -Force
    Add-Content $FileWithLogs `
        "$TimeStamp | INFO `t| Log made with $LoggerScript, d.d. $DateStamp"    
}

function WriteLog ($Log, $Meetings, $TimeStamp) {
    foreach ($key in $Meetings.Keys) {
        for ($i= 0; $i -lt $Meetings.Item($key).Count; $i++) {
            $Local:Greeting = $Meetings.Item($key)[$i]
            if ($Greeting -like "H*") {
                Add-Content $Log "$TimeStamp | FORMAL `t| $key $Greeting " 
            }
            else {
                Add-Content $Log "$TimeStamp | INFORMAL | $key $Greeting"
            }   
        } 
    }
    Add-Content $Log "$TimeStamp | INFO `t| Goodbye, have a nice day."
}

# Clear the log files that are older than 1 week
function CleanUpFolder($Folder) {
    $Local:CheckDateStamp = $(Get-Date).AddDays(-6).ToString("yyyyMMdd")   
    $Local:Files = Get-ChildItem $Folder
    foreach ($f in $Files) {
        if ($f.Name.Substring(0,8) -lt $CheckDateStamp) {
            Remove-Item $f
        }
    }
}

function RunProcess {
    $Local:CurrentFolder = (Split-Path $MyInvocation.PSCommandPath) + "\"
    $Local:LoggerScript = Split-Path $MyInvocation.PSCommandPath -Leaf
    $Local:DateStamp = $(Get-Date -f yyyy-MM-dd)
    $Local:TimeStamp = $(Get-Date -f HH:mm:ss:fff)
    $Local:FileWithLogs = $CurrentFolder + $DateStamp.Replace("-", "") `
        + "-" + $LoggerScript.Replace(".ps1", ".log")
    
    $Local:Meetings = GetMeetings
    CreateLog $LoggerScript $FileWithLogs $TimeStamp $DateStamp
    WriteLog $FileWithLogs $Meetings $TimeStamp
    CleanUpFolder $CurrentFolder
}

RunProcess

