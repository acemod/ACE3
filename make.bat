@echo off
setlocal enabledelayedexpansion

if not exist "@ace" mkdir "@ace"
if not exist "@ace\addons" mkdir "@ace\addons"
if not exist "@ace\optionals" mkdir "@ace\optionals"

if "%PROCESSOR_ARCHITECTURE%"=="AMD64" (set armake=tools\armake_w64.exe) else (set armake=tools\armake_w32.exe)

for /d %%f in (addons\*) do (
    set folder=%%f
    set name=!folder:addons\=!
    echo   PBO  @ace\addons\ace_!name!.pbo
    !armake! build -i include -w unquoted-string -w redefinition-wo-undef -f !folder! @ace\addons\ace_!name!.pbo
)

for /d %%f in (optionals\*) do (
    set folder=%%f
    set name=!folder:optionals\=!
    echo   PBO  @ace\optionals\ace_!name!.pbo
    !armake! build -i include -w unquoted-string -w redefinition-wo-undef -f !folder! @ace\optionals\ace_!name!.pbo
)

pause
