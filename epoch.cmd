@echo off
if "%~1"=="" (
    echo "Input epoch time. (such as 1718712000)"
    exit /b
)
echo %1
@REM pwsh: old powershell 5
@REM powershell : powershell 6 or higer version
pwsh -ExecutionPolicy Bypass -File "C:\UTIL\epoch_time.ps1" %1
