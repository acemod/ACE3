@echo off

winget install hemtt
winget upgrade hemtt
pause

if not "%1"=="am_admin" (
    powershell -Command "Start-Process -Verb RunAs -FilePath '%0' -ArgumentList 'am_admin'"
    exit /b
)
set ROOTDIR=%~dp0
set ROOTDIR=%ROOTDIR:~0,-1%
cd /d "%ROOTDIR%"
for %%I in (.) do set CurrDirName=%%~nxI
echo %CurrDirName%

robocopy "%ROOTDIR%\addons\advanced_fatigue" "%ROOTDIR%\addonsx\advanced_fatigue" /s /move
robocopy "%ROOTDIR%\addons\advanced_throwing" "%ROOTDIR%\addonsx\advanced_throwing" /s /move
robocopy "%ROOTDIR%\addons\ai" "%ROOTDIR%\addonsx\ai" /s /move
robocopy "%ROOTDIR%\addons\apl" "%ROOTDIR%\addonsx\apl" /s /move
robocopy "%ROOTDIR%\addons\arsenal" "%ROOTDIR%\addonsx\arsenal" /s /move
robocopy "%ROOTDIR%\addons\cargo" "%ROOTDIR%\addonsx\cargo" /s /move
robocopy "%ROOTDIR%\addons\casings" "%ROOTDIR%\addonsx\casings" /s /move
robocopy "%ROOTDIR%\addons\common" "%ROOTDIR%\addonsx\common" /s /move
robocopy "%ROOTDIR%\addons\compat_cup_units" "%ROOTDIR%\addonsx\compat_cup_units" /s /move
robocopy "%ROOTDIR%\addons\compat_cup_vehicles" "%ROOTDIR%\addonsx\compat_cup_vehicles" /s /move
robocopy "%ROOTDIR%\addons\compat_cup_weapons" "%ROOTDIR%\addonsx\compat_cup_weapons" /s /move
robocopy "%ROOTDIR%\addons\disarming" "%ROOTDIR%\addonsx\disarming" /s /move
robocopy "%ROOTDIR%\addons\dragging" "%ROOTDIR%\addonsx\dragging" /s /move
robocopy "%ROOTDIR%\addons\explosives" "%ROOTDIR%\addonsx\explosives" /s /move
robocopy "%ROOTDIR%\addons\fieldmanual" "%ROOTDIR%\addonsx\fieldmanual" /s /move
robocopy "%ROOTDIR%\addons\finger" "%ROOTDIR%\addonsx\finger" /s /move
robocopy "%ROOTDIR%\addons\fonts" "%ROOTDIR%\addonsx\fonts" /s /move
robocopy "%ROOTDIR%\addons\fortify" "%ROOTDIR%\addonsx\fortify" /s /move
robocopy "%ROOTDIR%\addons\frag" "%ROOTDIR%\addonsx\frag" /s /move
robocopy "%ROOTDIR%\addons\interact_menu" "%ROOTDIR%\addonsx\interact_menu" /s /move
robocopy "%ROOTDIR%\addons\interaction" "%ROOTDIR%\addonsx\interaction" /s /move
robocopy "%ROOTDIR%\addons\magazinerepack" "%ROOTDIR%\addonsx\magazinerepack" /s /move
robocopy "%ROOTDIR%\addons\main" "%ROOTDIR%\addonsx\main" /s /move
robocopy "%ROOTDIR%\addons\map" "%ROOTDIR%\addonsx\map" /s /move
robocopy "%ROOTDIR%\addons\map_gestures" "%ROOTDIR%\addonsx\map_gestures" /s /move
robocopy "%ROOTDIR%\addons\maptools" "%ROOTDIR%\addonsx\maptools" /s /move
robocopy "%ROOTDIR%\addons\markers" "%ROOTDIR%\addonsx\markers" /s /move
robocopy "%ROOTDIR%\addons\medical" "%ROOTDIR%\addonsx\medical" /s /move
robocopy "%ROOTDIR%\addons\medical_ai" "%ROOTDIR%\addonsx\medical_ai" /s /move
robocopy "%ROOTDIR%\addons\medical_blood" "%ROOTDIR%\addonsx\medical_blood" /s /move
robocopy "%ROOTDIR%\addons\medical_damage" "%ROOTDIR%\addonsx\medical_damage" /s /move
robocopy "%ROOTDIR%\addons\medical_engine" "%ROOTDIR%\addonsx\medical_engine" /s /move
robocopy "%ROOTDIR%\addons\medical_feedback" "%ROOTDIR%\addonsx\medical_feedback" /s /move
robocopy "%ROOTDIR%\addons\medical_gui" "%ROOTDIR%\addonsx\medical_gui" /s /move
robocopy "%ROOTDIR%\addons\medical_statemachine" "%ROOTDIR%\addonsx\medical_statemachine" /s /move
robocopy "%ROOTDIR%\addons\medical_status" "%ROOTDIR%\addonsx\medical_status" /s /move
robocopy "%ROOTDIR%\addons\medical_treatment" "%ROOTDIR%\addonsx\medical_treatment" /s /move
robocopy "%ROOTDIR%\addons\medical_vitals" "%ROOTDIR%\addonsx\medical_vitals" /s /move
robocopy "%ROOTDIR%\addons\missionmodules" "%ROOTDIR%\addonsx\missionmodules" /s /move
robocopy "%ROOTDIR%\addons\modules" "%ROOTDIR%\addonsx\modules" /s /move
robocopy "%ROOTDIR%\addons\nametags" "%ROOTDIR%\addonsx\nametags" /s /move
robocopy "%ROOTDIR%\addons\optionsmenu" "%ROOTDIR%\addonsx\optionsmenu" /s /move
robocopy "%ROOTDIR%\addons\ui" "%ROOTDIR%\addonsx\ui" /s /move
robocopy "%ROOTDIR%\addons\weaponselect" "%ROOTDIR%\addonsx\weaponselect" /s /move

rd /s /q "%ROOTDIR%\.hemttout"
rd /s /q "%ROOTDIR%\addons"
rd /s /q "%ROOTDIR%\optionals"
rd /s /q "%ROOTDIR%\release"
robocopy "%ROOTDIR%\addonsx" "%ROOTDIR%\addons" /s /move
rd /s /q "%ROOTDIR%\addonsx"

cls
echo .
echo Press Enter to build ACE3
echo .
pause

hemtt ln sort

call push.bat

hemtt release

pause
