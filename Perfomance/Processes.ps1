#Checking Each Object Individually

#Collection All your data up front



#Collecting only the data you need
Measure-Command {$allMetadata = Get-ChildItem -Path 'c:\windows\system32' -File}
Measure-Command {$FileName = Get-ChildItem -Path 'c:\windows\system32' -File -name}
Measure-command {$DotNet = [System.IO.Directory]::EnumerateFiles('c:\windows\system32','*')}


#Structured Data
#HashTables
#Reduced Sets

