$status = Get-MpComputerStatus

$score = 100

if (-not $status.RealTimeProtectionEnabled) {
    $score -= 50
}

if ($status.AntivirusSignatureAge -gt 3) {
    $score -= 20
}

if ($status.QuickScanAge -gt 7) {
    $score -= 20
}

Write-Output "Sistemas drosibas reitings: $score / 100"
