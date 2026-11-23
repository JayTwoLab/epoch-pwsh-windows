@echo off
chcp 65001 >nul

if "%~1"=="" (
    echo Input epoch time. ^(such as 1718712000^)
    exit /b
)

echo %1

set "PS_TEMP=%TEMP%\epoch_time_%RANDOM%.ps1"
for /f "tokens=1 delims=:" %%A in ('findstr /n "^:__PS1_SCRIPT__$" "%~f0"') do set "SKIP_LINES=%%A"
more +%SKIP_LINES% "%~f0" > "%PS_TEMP%"

:: pwsh: PowerShell 7+ (or 6+)
:: powershell: Windows PowerShell 5.1
pwsh -NoProfile -ExecutionPolicy Bypass -File "%PS_TEMP%" "%~1"

del /q "%PS_TEMP%" >nul 2>&1
exit /b

:__PS1_SCRIPT__
param (
    [Parameter(Mandatory=$true, Position=0)]
    [long]$EpochTime
)

try {
    # Convert Epoch Time (Unix Timestamp in seconds) to DateTimeOffset object
    $dto = [DateTimeOffset]::FromUnixTimeSeconds($EpochTime)

    # Format UTC Time (yyyy-MM-dd HH:mm:ss)
    $utcTime = $dto.UtcDateTime.ToString("yyyy-MM-dd HH:mm:ss")

    # Format Local Time (yyyy-MM-dd HH:mm:ss)
    $localTime = $dto.LocalDateTime.ToString("yyyy-MM-dd HH:mm:ss")

    # Display results
    Write-Host "--------------------------------"
    Write-Host "Epoch Time : $EpochTime"
    Write-Host "UTC Time   : $utcTime"
    Write-Host "Local Time : $localTime"
    Write-Host "--------------------------------"
} catch {
    Write-Error "An error occurred while converting Epoch Time. Please check if it is a valid 10-digit integer."
}
