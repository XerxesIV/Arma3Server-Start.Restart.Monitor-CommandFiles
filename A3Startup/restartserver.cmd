@echo off
::SHUTDOWN SERVERMONITOR IF IT IS ALREADY RUNNING - WE RESTART IT AT THE END OF THIS
taskkill /f /im cmd.exe /fi "WINDOWTITLE eq Administrator:  servermonitor.cmd"
taskkill /f /im conhost.exe /fi "WINDOWTITLE eq Administrator:  servermonitor.cmd"
taskkill /f /im cmd.exe /fi "WINDOWTITLE eq Administrator:  becmonitor.cmd"
taskkill /f /im conhost.exe /fi "WINDOWTITLE eq Administrator:  becmonitor.cmd"
echo Make sure all is clear
timeout 1

::MAKE SURE ALL TASKS ARE REALLY STOPPED
taskkill /f /fi "status eq not responding" /im arma3server.exe
taskkill /f /im arma3server.exe
timeout 1

:: KILL BATTLEYE IF IT ISN'T STOPPED ALREADY
taskkill /im Bec.exe
timeout 1

:: KILL ARMASERVERMONITOR
taskkill /im ArmaServerMonitor.exe
timeout 1

:: COPY UPDATES
start "CopyUpdates" "xcopy.exe" "c:\ServerHosting\Updates" "c:\ServerHosting" /E /C /I /H /R /Y
timeout 3
echo Updates are copied

::RESTARTING THE ARMA 3 SERVER BE SURE TO EDIT THIS TO YOUR SERVER .EXE LOCATION -NOTE ALSO THIS IS WHERE YOU DEFINE WHERE YOU CONFIG.CFG IS
cd /d C:\ServerHosting\A3Server\
start "arma3" /realtime /affinity FF "arma3server.exe" -port=2302 "-config=C:\ServerHosting\A3Startup\A3Wasteland\config.cfg" "-cfg=C:\ServerHosting\A3Startup\A3Wasteland\basic.cfg" "-profiles=C:\ServerHosting\A3Startup\A3Wasteland" -name=A3Wasteland -pid=a3_prod.pid -ranking=a3_prod_ranking.log "-mod=@ASM" -malloc=tbbmalloc -enableHT -cpuCount=2 -exThreads=1
timeout 6
echo ARMA 3 Server is started

::RESTARTING ARMASERVERMONITOR
cd /d C:\ServerHosting\A3Server\
start "" "ArmaServerMonitor.exe"
timeout 15
echo ArmaServerMonitor is started

::RESTARTING BATTLEYE
set becpath="C:\ServerHosting\Bec\"
cd /d %becpath%
start "" "Bec.exe" -f Config.cfg
timeout 3
echo Battleye is started

:: THIS RUNS THE SERVER MONITOR FOR YOU SO YOU DON'T FORGET
set ServerMonitorPath="C:\ServerHosting\A3Startup\"
cd /d %ServerMonitorPath%
start "" /MIN "servermonitor.cmd"
echo Server Monitor is started
timeout 5

:: THIS RUNS THE SERVER MONITOR FOR YOU SO YOU DON'T FORGET
set BecMonitorPath="C:\ServerHosting\A3Startup\"
cd /d %BecMonitorPath%
start "" /MIN "becmonitor.cmd"
echo Bec Monitor is started
timeout 5
exit
