@echo off

::SHUTDOWN BECMONITOR IF IT IS ALREADY RUNNING - WE RESTART IT AT THE END OF THIS
taskkill /f /im cmd.exe /fi "WINDOWTITLE eq Administrator:  becmonitor.cmd"
taskkill /f /im conhost.exe /fi "WINDOWTITLE eq Administrator:  becmonitor.cmd"
echo Make sure all is clear
timeout 1

:: KILL BATTLEYE IF IT ISN'T ALREADY
taskkill /im Bec.exe
echo Stopped BattlEye Extended Controls
timeout 3

::RESTARTING BATTLEYE
set becpath="C:\ServerHosting\Bec\"
cd /d %becpath%
start "" "Bec.exe" -f Config.cfg
echo BattlEye Extended Controls is started
timeout 10

:: THIS RUNS THE SERVER MONITOR FOR YOU SO YOU DON'T FORGET
set BecMonitorPath="C:\ServerHosting\A3Startup\"
cd /d %BecMonitorPath%
start "" /MIN "becmonitor.cmd"
echo Bec Monitor has started. Have Fun
timeout 1
exit