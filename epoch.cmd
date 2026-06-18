@echo off
if "%~1"=="" (
    echo "Input epoch time. (such as 1718712000)"
    exit /b
)
echo %1
:: pwsh: old powershell 5
:: powershell : powershell 6 or higer version
:: pwsh -ExecutionPolicy Bypass -File "C:\UTIL\epoch_time.ps1" %1
pwsh -ExecutionPolicy Bypass -File "%~dp0epoch_time.ps1" "%~1"

