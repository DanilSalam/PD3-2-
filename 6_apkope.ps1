$logPath = Join-Path $env:USERPROFILE "Documents\Servisi.log"

$services = @("Spooler", "wuauserv")

foreach ($name in $services) {
$service = Get-Service $name
$time = Get-Date -Format "yyyy-MM-dd HH:mm:ss"

"$time Serviss $($service.Name) ir $($service.Status)." |
Out-File -FilePath $logPath -Append
}
