$Data = @()  
$Groups = import-csv c:/temp/groups.csv  
  
foreach ($group in $groups){  
    $value = Get-DistributionGroup $group.Name | select DisplayName,@{Expression=" ";Label="ManagedBy";}  
    $temp = (Get-DistributionGroup $group.Name).ManagedBy      
    foreach ($element in $temp){  
        $value.ManagedBy = $element.tostring()  
        $temp2 = $value |select DisplayName,ManagedBy  
        $data+=$temp2  
        }  
}$data | export-csv c:/temp/Owner.csv -NoTypeInformation  