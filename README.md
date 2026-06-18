# epoch-pwsh-windows

- 윈도우에서 `epoch` 시간을 명령어로 쉽게 보는 스크립트
   - `epoch`는 1970년 1월 1일(`UTC`)부터 해당 시간까지의 초(`second`) 단위 시간이다. 
   - `1` : 1970년 1월 1일 0시 0분 1초

## 설정 방법

- (1) `epoch.cmd`를 `PATH` 경로에 넣는다.
- (2) `epoch_time.ps1`를 복사하고, `epoch.cmd`의 다음 코드에서 `epoch_time.ps1`의 위치를 수정한다. 
```bat
@echo off
if "%~1"=="" (
    echo "Input epoch time. (such as 1718712000)"
    exit /b
)
echo %1
@REM pwsh: old powershell 5
@REM powershell : powershell 6 or higer version
pwsh -ExecutionPolicy Bypass -File "C:\UTIL\epoch_time.ps1" %1
```

## 사용 방법

- 다음과 같이 `Windows Terminal` 또는 `PowerShell` 에서 입력한다.
```bat
PS C:\UTIL> epoch 1718712000
1718712000
--------------------------------
Epoch Time : 1718712000
UTC Time   : 2024-06-18 12:00:00
Local Time : 2024-06-18 21:00:00
--------------------------------
```
