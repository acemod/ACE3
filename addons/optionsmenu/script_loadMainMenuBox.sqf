/*
 * Author: PabstMirror
 * Loads the version info HTML box from main menu
 *
 * Arguments:
 * 0: Display (from onMouseMoving) <DISPLAY>
 *
 * Return Value:
 * None
 *
 * Example:
 * onMouseMovingEvent execVM "script_loadMainMenuBox.sqf";
 *
 * Public: No
 */
#include "script_component.hpp"

if (missionNamespace getVariable [QGVAR(newsLoaded), false]) exitWith {};
GVAR(newsLoaded) = true;

private ["_version"];
_version = getText (configFile >> "CfgPatches" >> "ace_main" >> "versionStr");

((_this select 0) displayCtrl 68) ctrlSetText format ["Installed Version: %1", _version];
((_this select 0) displayCtrl 69) htmlLoad "http://ace3mod.com/";