$logs = Get-WinEvent -LogName Application | Where-Object {
    $_.LevelDisplayName -eq "Warning" -and $_.TimeCreated -gt (Get-Date).AddDays(-3)
}

$logs | Out-File "$env:USERPROFILE\Documents\Warnings.txt"

$logs | Group-Object ProviderName | Sort-Object Count -Descending |
Select-Object -First 3 | Out-File "$env:USERPROFILE\Documents\2_zurnals.ps1"
