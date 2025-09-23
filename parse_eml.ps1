<# 
PowerShell helper: parse_eml.ps1
Put this script in the same folder as sample_email.eml and run in PowerShell.
It will create `headers.txt` and `body.txt` in the same folder.
#>

$emlPath = Join-Path -Path $PSScriptRoot -ChildPath 'sample_email.eml'
if (-not (Test-Path $emlPath)) {
    Write-Error "sample_email.eml not found in script folder: $emlPath"
    exit 1
}

$content = Get-Content -Raw -Path $emlPath
$parts = $content -split "\r?\n\r?\n", 2
$headers = $parts[0]
$body = if ($parts.Length -gt 1) { $parts[1] } else { "" }

$headers | Set-Content -Path (Join-Path $PSScriptRoot 'headers.txt') -Encoding UTF8
$body | Set-Content -Path (Join-Path $PSScriptRoot 'body.txt') -Encoding UTF8

Write-Host "Saved headers.txt and body.txt in $PSScriptRoot"
