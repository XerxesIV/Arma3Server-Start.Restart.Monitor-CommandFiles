@echo off
::STARTING THE HEADLESS CLIENT
cd /d C:\ServerHosting\A3Server\
start "arma3headlessclient" /realtime /affinity FF "arma3client.exe" -client -connect=127.0.0.1 -port=2302 "-profiles=C:\ServerHosting\A3Startup\A3Wasteland" -name=headlessclient -malloc=fredmalloc -enableHT -cpuCount=4 -exThreads=7
echo ARMA 3 Headless Client is started
timeout 6