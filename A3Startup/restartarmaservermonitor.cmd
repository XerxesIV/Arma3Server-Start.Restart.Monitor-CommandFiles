@echo off

:: KILL ARMASERVERMONITOR
taskkill /t /im ArmaServerMonitor.exe
echo Stopped ArmaServerMonitor
timeout 3

::RESTARTING ARMASERVERMONITOR
cd /d C:\ServerHosting\A3Server\
start "" "ArmaServerMonitor.exe"
echo ArmaServerMonitor is started
timeout 3
exit