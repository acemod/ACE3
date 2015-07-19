/*
 * Author: Karel Moricky, SilentSpike
 * Handles the spectator UI toolbar values and applies them to the camera
 *
 * Arguments:
 * 0: Parameters <ANY>
 * 1: PFH handle <NUMBER>
 *
 * Return Value:
 * None <NIL>
 *
 * Example:
 * [ace_spectator_fnc_handleToolbar, 0, _display] call CBA_fnc_addPerFrameHandler;
 *
 * Public: No
 */

#include "script_component.hpp"

params ["_display"];

// Kill PFH when display is closed
if (isNull _display) exitWith { [_this select 1] call CBA_fnc_removePerFrameHandler; };

GVAR(camera) camSetFocus [GVAR(camFocus),1.5];
GVAR(camera) camSetFov -(linearConversion [0.1,2,GVAR(camZoom),-2,-0.1,true]);
GVAR(camera) camCommit 0;

// Reduce overhead when toolbar is hidden
if !(GVAR(showTool) && GVAR(showInterface)) exitWith {};

private ["_name","_focus","_fov","_speed","_mode","_time","_toolbar"];

// Find all tool values
if (GVAR(camMode) == 0) then {
    _name = "None";
    _speed = format ["%1 m/s", GVAR(camSpeed)];
} else {
    _name = name GVAR(camUnit);
    _speed = format ["%1 km/h", floor(speed GVAR(camUnit))];
};

_focus = format ["%1 m", GVAR(camFocus)];
_fov = format ["%1x", floor(GVAR(camZoom) * 100) * 0.01];
_mode = ["FREE","FIRST","THIRD"] select GVAR(camMode);
_time = [daytime,"HH:MM"] call BIS_fnc_timeToString;

// Update the UI tools
_toolbar = _display displayCtrl IDC_TOOL;
(_toolbar controlsGroupCtrl IDC_TOOL_CLOCK) ctrlSetText _time;
(_toolbar controlsGroupCtrl IDC_TOOL_FOCUS) ctrlSetText _focus;
(_toolbar controlsGroupCtrl IDC_TOOL_FOV) ctrlSetText _fov;
(_toolbar controlsGroupCtrl IDC_TOOL_NAME) ctrlSetText _name;
(_toolbar controlsGroupCtrl IDC_TOOL_SPEED) ctrlSetText _speed;
(_toolbar controlsGroupCtrl IDC_TOOL_VIEW) ctrlSetText _mode;
