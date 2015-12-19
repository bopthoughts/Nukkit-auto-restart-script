@echo off
TITLE Nukkit : Auto restart
cd /d %~dp0
netstat -o -n -a | findstr 0.0.0.0:19132>nul
if %ERRORLEVEL% equ 0 (
    echo Your server is running.
    goto :loop
) ELSE (
    echo Starting your Nukkit server.
    goto :StartNt
)


:loop
echo Checking if server is online...
PING 127.0.0.1 -n 10 >NUL


netstat -o -n -a | findstr 0.0:19132>nul
if %ERRORLEVEL% equ 0 (
    echo Server is running.
    goto :loop
) ELSE (
    echo Starting Nukkit in 3 seconds...
    PING 127.0.0.1 -n 3 >NUL
    goto :StartPM
)


:StartNt

IF EXIST Nukkit.exe (
	start cmd /k echo hello
) ELSE (
	IF EXIST Nukkit_64bit.exe (
		start cmd /k @Nukkit_64bit.exe
	) ELSE (
		ECHO [FATAL] No nukkit.jar file found!
		ECHO [INFO] Download the file at nukkit.ru
	)
)
goto :loop
PAUSE
