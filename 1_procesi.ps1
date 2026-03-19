$CompObject =  Get-WmiObject -Class WIN32_OperatingSystem
 $Memory = ((($CompObject.TotalVisibleMemorySize - $CompObject.FreePhysicalMemory)*100)/ $CompObject.TotalVisibleMemorySize)
 
 Write-Host "Memory usage in Percentage:" $Memory
        
 $processMemoryUsage = Get-WmiObject WIN32_PROCESS | Sort-Object -Property ws -Descending | Select-Object -first 5 processname, @{Name="Mem Usage(MB)";Expression={[math]::round($_.ws / 1mb)}}
 $processMemoryUsage
Export-Csv -Path "$env:USERPROFILE\Document\1_procesi.ps1"
