@echo off
echo ywsa-dev cmd command launcher
echo You can view the help information using the "help" command.
:LOOP
set /p "ydshell=ydshell> "
for /f "tokens=1,2 delims= " %%a in ("%ydshell%") do (
set "first=%%a"
set "second=%%b"
)
if "%first%"=="help" (
echo veris  You can see computer os version.
echo now  You can see time or date.
echo               /date only see date.
echo               /time only see time.
echo clear  You can organize the screen.
echo exit  You can exit Ydshell.
echo cmdstart  start cmd.
echo               /changepowershell not start cmd. start powershell.
echo rem  It's same:cmd rem
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
echo shutdown ydshell...
timeout /t 1 /nobreak >nul
exit
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
) else (
echo "%first%" is an unknown command.
)
goto LOOP