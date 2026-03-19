$apps = winget list --source msstore

$count = ($apps | Measure-Object).Count

Write-Output "Sistema ir instaleta $count aplikacijas no Microsoft Store."
