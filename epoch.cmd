@echo off
if "%~1"=="" (
    echo Input epoch time. ^(such as 1718712000^)
    exit /b
)

:: pwsh: PowerShell 7+ (or 6+)
:: powershell: Windows PowerShell 5.1
pwsh -NoProfile -ExecutionPolicy Bypass -Command "$t=[long]%~1; $d=[DateTimeOffset]::FromUnixTimeSeconds($t); Write-Host '--------------------------------'; Write-Host ('Epoch Time : ' + $t); Write-Host ('UTC Time   : ' + $d.UtcDateTime.ToString('yyyy-MM-dd HH:mm:ss')); Write-Host ('Local Time : ' + $d.LocalDateTime.ToString('yyyy-MM-dd HH:mm:ss')); Write-Host '--------------------------------'"

