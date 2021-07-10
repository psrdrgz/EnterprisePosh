$Loops = 10
$BreakPoint = 3
 
wait-Debugger
:LoopName For ($Counter = 0; $Counter -LT $loops; $Counter++){
    If ($Counter = $BreakPoint){
        Break LoopName
    }
    "Sleeping $Counter"
    Start-Sleep -Seconds 1
}