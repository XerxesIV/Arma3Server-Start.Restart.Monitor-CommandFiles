@echo off
::KILL ARMA3 SERVER
taskkill /f /fi "status eq not responding" /im arma3server.exe
taskkill /f /im arma3server.exe
timeout 1
::DOUBLE CHECK KILL
taskkill /f /fi "status eq not responding" /im arma3server.exe
taskkill /f /im arma3server.exe
timeout 1
::KILL ARMA3 CLIENT
taskkill /f /fi "status eq not responding" /im arma3client.exe
taskkill /f /im arma3client.exe
timeout 1
::DOUBLE CHECK KILL
taskkill /f /fi "status eq not responding" /im arma3client.exe
taskkill /f /im arma3client.exe
timeout 1
:: KILL BATTLEYE
taskkill /im Bec.exe
timeout 1
::KILL SERVER MONITOR
taskkill /f /im cmd.exe /fi "WINDOWTITLE eq Administrator:  servermonitor.cmd" /T
taskkill /f /im conhost.exe /fi "WINDOWTITLE eq Administrator:  servermonitor.cmd" /T
timeout 1
::KILL ARMASERVERMONITOR
taskkill /im ArmaServerMonitor.exe
timeout 1
::KILL ALL COMMAND.EXE THAT ARE OPEN
taskkill /f /fi "status eq not responding" /im cmd.exe
taskkill /f /im cmd.exe
taskkill /f /fi "status eq not responding" /im conhost.exe
taskkill /f /im conhost.exe
timeout 1
::DOUBLE TAP
taskkill /f /fi "status eq not responding" /im cmd.exe
taskkill /f /im cmd.exe
taskkill /f /fi "status eq not responding" /im conhost.exe
taskkill /f /im conhost.exe
timeout 1
:: BACKUP DATABASE
::start "BackupDB" "xcopy.exe" "E:\db" "D:\Serverhosting\Backup\db" /E /C /I /H /R /Y
::start "BackupRamDisk" "xcopy.exe" "D:\Serverhosting\Ramdisk" "D:\Serverhosting\Backup\Ramdisk" /E /C /I /H /R /Y
::timeout 3
::echo The backup is made