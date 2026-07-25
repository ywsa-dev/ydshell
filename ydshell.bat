@echo off
title ydshell
set ver=ydshell version:[ywsa-dev:ydshell:2.0]
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
if "%second%" == "/?" (echo Displays help for each command.&goto LOOP)
echo help  Displays help for each command.
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
echo destroy  You can definitely delete the file.
echo ydshell  Ydshell in ydshell.
echo               /shutdown exit ydshell.
echo waitkey  pause and nul.
echo               /real only pause.
echo start  start program.
echo help:/?
) else if "%first%"=="veris" (
if "%second%" == "/?" (echo You can see computer os version.&goto LOOP)
ver
echo.
) else if "%first%"=="now" (
if "%second%" == "/?" (echo You can see time or date. &echo /date only see date.&echo /time only see time.&goto LOOP) else if "%second%"=="" (
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
if "%second%" == "/?" (echo You can organize the screen.&goto LOOP)
cls
) else if "%first%"=="exit" (
if "%second%" == "/?" (echo You can exit Ydshell.&goto LOOP) else if %noexit% == 0 (
echo shutdown ydshell...
timeout /t 1 /nobreak >nul
exit
) else (
set /a noexit-=1
)
) else if "%first%"=="cmdstart" (
if "%second%" == "/?" (echo start cmd.&echo /changepowershell not start cmd. start powershell.&goto LOOP) else if "%second%"=="" (
cmd
) else if "%second%" == "/changepowershell" (
powershell
) else (
echo The command is invalid.
)
) else if "%first%" == "rem" (
if "%second%" == "/?" (echo It's same:cmd rem.&goto LOOP)
rem rem
) else if "%first%" == "tsli" (
if "%second%" == "/?" (echo You can know what program running.&goto LOOP)
tasklist /fi "status eq running"
) else if "%first%" == "destroy" (
if "%second%" == "/?" (echo You can definitely delete the file.&goto LOOP)
takeown /f "%second%"
icacls "%second%" /grant Administrators:F
del "%second%"
) else if "%first%" == "ver" (
if "%second%" == "/?" (echo You can see ydshell version.&goto LOOP)
echo %ver%
) else if "%first%" == "ydshell" (
if "%second%" == "/?" (echo ydshell  Ydshell in ydshell.&echo /shutdown exit ydshell.&goto LOOP) else if "%second%" == "" (
echo.
echo ywsa-dev cmd command launcher
echo You can view the help information using the "help" command.
echo %ver%
echo.
set /a noexit=%noexit%+1
) else if "%second%" == "/shutdown" (
if %noexit% == 0 (
echo shutdown ydshell...
timeout /t 1 /nobreak >nul
exit
) else (
set /a noexit-=1
)
) else (
echo The command is invalid.
)
) else if "%first%" == "waitkey" (
if "%second%" == "/?" (echo waitkey  pause and nul.&echo /real only pause.&goto LOOP)
if "%second%" == "" (pause >nul) else if "%second%" == "/real" (pause) else (echo The command is invalid.)
) else if "%first%" == "start" (
if "%second%" == "/?" (echo start program.&goto LOOP)
start %second%
) else (
echo "%first%" is an unknown command.
)
goto LOOP
