#Arrays - If it is quick
$Array = @()

#Adding to the list
$NumberOfItems = 10000
Measure-Command {
    For($Counter = 0; $Counter -lt $NumberOfItems; $Counter++)
    {
        $r = Get-Random -Maximum 50000 -Minimum 0
        $Array += $r
    }
}

Measure-Command {$array.IndexOf($array[5000])}

#ArrayLists - If you need to expand the list
$ArrayList = New-Object -typename System.Collections.ArrayList
$NumberOfItems = 10000
Measure-Command {
    For($Counter = 0; $Counter -lt $NumberOfItems; $Counter++)
    {
        $r = Get-Random -Maximum 50000 -Minimum 0
        [void] $ArrayList.add($r)
    }
}
Measure-Command {$ArrayList.IndexOf($ArrayList[5000])}


#Generic Lists - your better option
$GenericList = New-Object -typename System.Collections.Generic.List[int]
$NumberOfItems = 10000
Measure-Command {
    For($Counter = 0; $Counter -lt $NumberOfItems; $Counter++)
    {
        $r = Get-Random -Maximum 50000 -Minimum 0
        [void] $GenericList.add($r)
    }
}
Measure-Command {$GenericList.IndexOf($GenericList[5000])}


#HashTables - For faster lookups if unique
$HashTables = @{}
$NumberOfItems = 10000
Measure-Command {
    For($Counter = 0; $Counter -lt $NumberOfItems; $Counter++)
    {
        $r = Get-Random -Maximum 50000 -Minimum 0
        [void] $HashTables.add($r,$R)
    }
}
Measure-Command {$HashTables.IndexOf($HashTables[5000])}



#HashSets - For Deduplications and speed

