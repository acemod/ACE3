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

// Kill PFH when toolbar hidden (or display is closed)
if (isNil QGVAR(toolHandler)) exitWith { [_this select 1] call CBA_fnc_removePerFrameHandler; };

private ["_name","_vision","_fov","_speed","_mode","_time","_toolbar"];
_toolbar = _display displayCtrl IDC_TOOL;

// Find all tool values
if (GVAR(camMode) == 0) then {
    _vision = if (GVAR(camVision) >= 0) then {localize LSTRING(VisionThermal)} else { [localize LSTRING(VisionNight), localize LSTRING(VisionNormal)] select (GVAR(camVision) < -1) };
    _fov = format ["%1x", floor(GVAR(camZoom) * 100) * 0.01];
    _speed = format ["%1 m/s", floor(GVAR(camSpeed) * 100) * 0.01];
} else {
    _vision = format ["%1 m", floor(getPosASL GVAR(camUnit) select 2)];
    _fov = [side group GVAR(camUnit)] call BIS_fnc_sideName;
    _speed = format ["%1 km/h", floor(speed GVAR(camUnit)) max 0];
};

if (isNull GVAR(camUnit)) then {
    _name = localize "STR_VOICE_MASK_NONE";
} else {
    _name = GETVAR(GVAR(camUnit),GVAR(uName),"");
};

_mode = [localize LSTRING(ViewFree),localize LSTRING(ViewInternal),localize LSTRING(ViewExternal)] select GVAR(camMode);
_time = [daytime,"HH:MM"] call BIS_fnc_timeToString;

// Update the UI tools
(_toolbar controlsGroupCtrl IDC_TOOL_CLOCK) ctrlSetText _time;
(_toolbar controlsGroupCtrl IDC_TOOL_VISION) ctrlSetText _vision;
(_toolbar controlsGroupCtrl IDC_TOOL_FOV) ctrlSetText _fov;
(_toolbar controlsGroupCtrl IDC_TOOL_NAME) ctrlSetText _name;
(_toolbar controlsGroupCtrl IDC_TOOL_SPEED) ctrlSetText _speed;
(_toolbar controlsGroupCtrl IDC_TOOL_VIEW) ctrlSetText _mode;
