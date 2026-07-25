@echo off
set ver=ydshell version:[ywsa-dev:ydshell:1.5]
echo ywsa-dev cmd command launcher
echo You can view the help information using the "help" command.
echo %ver%
echo.
set noexit=0
:LOOP
set /p "ydshell=ydshell> "
for /f "tokens=1,2 delims= " %%a in ("%ydshell%") do (
set "first=%%a"
set "second=%%b"
)
if "%first%"=="help" (
echo veris  You can see computer os version.
echo ver  You can see ydshell version.
echo now  You can see time or date.
echo               /date only see date.
echo               /time only see time.
echo clear  You can organize the screen.
echo exit  You can exit Ydshell.
echo cmdstart  start cmd.
echo               /changepowershell not start cmd. start powershell.
echo rem  It's same:cmd rem
echo tsli  You can know what program running.
echo destory  You can definitely delete the file.
) else if "%first%"=="veris" (
ver
) else if "%first%"=="now" (
if "%second%"=="" (
echo date: %date%
echo time: %time%
) else if "%second%"=="/date" (
echo %date%
) else if "%second%"=="/time" (
echo %time%
) else (
echo The command is invalid.
)
) else if "%first%"=="clear" (
cls
) else if "%first%"=="exit" (
if %noexit% == 0 (
echo shutdown ydshell...
timeout /t 1 /nobreak >nul
exit
) else (
set /a noexit=%noexit-1
)
) else if "%first%"=="cmdstart" (
if "%second%"=="" (
cmd
) else if "%second%" == "/changepowershell" (
powershell
) else (
echo The command is invalid.
)
) else if "%first%" == "rem" (
rem rem
) else if "%first%" == "tsli" (
tasklist /fi "status eq running"
) else if "%first%" == "destory" (
takeown /f "%second%"
icacls "%second%" /grant Administrators:F
del "%second%"
) else if "%first%" == "ver" (
echo %ver%
) else if "%first%" == "ydshell" (
if "%second%" == "" (
echo .
echo ywsa-dev cmd command launcher
echo You can view the help information using the "help" command.
echo ydshell version:[ywsa-dev:ydshell:1.0]
echo.
set /a noexit=%noexit%+1
)
) else (
echo "%first%" is an unknown command.
)
goto LOOP
