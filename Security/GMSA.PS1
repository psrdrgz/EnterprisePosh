
$adgroup = New-ADGroup -DisplayName Testgmsa -name testgmsa -GroupScope Global -PassThru
$GMSA = New-ADServiceAccount -name gmsa-test -DNSHostName gmsa-test.corp.jps.com -PrincipalsAllowedToRetrieveManagedPassword $adgroup.NAME -PassThru

Install-ADServiceAccount gmsa-test
Test-ADServiceAccount gmsa-test


KLIST purge -lh 0 -li 0x3e7 purge

$action = New-ScheduledTaskAction $env:ComSpec
$Principle = New-ScheduledTaskPrincipal -UserId  jps\gmsa-test$ -LogonType Password
$trigger = New-ScheduledTaskTrigger -at 23:00 -Daily
Register-ScheduledTask test-gmsa -Action $action -Trigger $trigger -Principal $Principle




# using GMSA accounts in your scripts
#https://github.com/Ryan2065/gMSACredentialModule

