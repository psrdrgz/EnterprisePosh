# Gathering Data From 
$FilePath = "E:\RunSpaceData.txt"

$RunSpaceData = @{
    Computername = $ENV:COMPUTERNAME
    PID = $PID
    RunSpace = $Host.Runspace.ID
}
Out-File -FilePath $FilePath -InputObject (Convertto-json $RunSpaceData)

#Wait
# Wait-Debugger for local
$Seconds = 300
For ($Counter = 0; $Counter -lt $Seconds; $Counter++){
    Start-Sleep -Seconds 1
}

###################################################################################################
# Entering The Runspace
$FilePath = "E:\RunSpaceData.txt"
$Content = Get-Content -Path $FilePath -Raw
$RunSpaceData = ConvertFrom-Json -InputObject $content

If ($RunSpaceData.ComputerName -NE $ENV:COMPUTERNAME){
    $PSSession = Enter-PSSession -ComputerName $RunSpaceData.ComputerName
    Invoke-Command -ScriptBlock {Enter-PSHostProcess -ID $args} -ArgumentList $RunSpaceData.PID -Session $PSSession
    "Debug-Runspace -id $($RunSpaceData.RunSpace)"
}Else{
    Enter-PSHostProcess -ID $RunSpaceData.PID
    get-Runspace
    Get-RunspaceDebug
    Debug-Runspace -ID $RunSpaceData.RunSpace
}

# ? or h for help



#Concerned
$Host.Runspace.Debugger.SetDebugMode([System.Management.Automation.DebugModes]::None)

 
# Notes
#1) You have to be an admin or the same user to enter the HostProcess 
#2) holds the remote runspace up until you detach
#3) Errors Easily
