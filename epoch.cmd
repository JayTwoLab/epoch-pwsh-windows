@echo off
if "%~1"=="" (
    echo "Input epoch time. (such as 1718712000)"
    exit /b
)
echo %1
:: pwsh: powershell 6 or higer version 
:: powershell: old powershell 5
:: pwsh -ExecutionPolicy Bypass -File "C:\UTIL\epoch_time.ps1" %1
pwsh -ExecutionPolicy Bypass -File "%~dp0epoch_time.ps1" "%~1"
