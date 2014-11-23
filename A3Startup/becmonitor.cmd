@echo off
::IMPORTANT TO NAME IT SO WE CAN KILL IT
title becmonitor.cmd
:start
C:\Windows\System32\tasklist /FI "IMAGENAME eq Bec.exe" 2>NUL | C:\Windows\System32\find /I /N "Bec.exe">NUL
if "%ERRORLEVEL%"=="0" goto loop
echo Bec is not running, will be started now 
start "" /min /wait "C:\ServerHosting\A3Startup\restartbec.cmd"
timeout 30
echo Bec started succesfully
goto started
:loop
cls
echo Bec is already running, running monitoring loop
:started
::THE 80 REFERS TO SECONDS AND HOW OFTEN IT WILL CHECK,YOU CAN SET IT TO WHATEVER YOU WANT. I JUST DONT WANT MY SERVER DOWN FOR MUCH LONGER THAN THAT!
::New error fault kill, will check for err fault and clear it and hopefully restart, a little more promise but no guarantee :)
taskkill /f /im WerFault.exe /fi "WINDOWTITLE eq Administrator:  ~ Bec:"
C:\Windows\System32\timeout /t 80
C:\Windows\System32\tasklist /FI "IMAGENAME eq Bec.exe" 2>NUL | C:\Windows\System32\find /I /N "Bec.exe">NUL
if "%ERRORLEVEL%"=="0" goto loop
goto start