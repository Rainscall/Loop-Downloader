@echo off
setlocal enabledelayedexpansion
cls
echo This script only supports Windows 10 or Windows Server 2016 and above
echo Start test
echo Press Ctrl+C to exit
set /a finished_times=0
set /p URL=Enter your test URL:
:Loop
echo Downloading....
curl -s %URL% > testfile.test
del testfile.test
set /a finished_times=finished_times+1
echo Test !finished_times! completed
goto Loop
pause
