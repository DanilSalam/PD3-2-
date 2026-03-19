$source = "$env:USERPROFILE\Downloads"
$destination = "$env:USERPROFILE\Documents\PDF_Backup.zip"

$files = Get-ChildItem $source -Filter *.pdf | Where-Object {
$_.LastWriteTime -gt (Get-Date).AddHours(-48)
}

Compress-Archive -Path $files.FullName -DestinationPath $destination -Force
