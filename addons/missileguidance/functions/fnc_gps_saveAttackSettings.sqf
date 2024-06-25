#include "..\script_component.hpp"
/*
 * Author: tcvm
 * Saves all textboxes to whatever settings say for PB mode
 *
 * Arguments:
 * Current PB mode. If -1 no mode is used <NUMBER>
 *
 * Return Value:
 * current settings
 *
 * Example:
 * [-1] call ace_missileguidance_fnc_gps_saveAttackSettings
 *
 * Public: No
 */
params ["_mode"];
private _display = uiNamespace getVariable QGVAR(gpsAttackOptionDisplay);

private _easting = ctrlText (_display displayCtrl GPS_UI_EASTING);
private _northing = ctrlText (_display displayCtrl GPS_UI_NORTHING);
private _height = ctrlText (_display displayCtrl GPS_UI_HEIGHT);
private _angle = ctrlText (_display displayCtrl GPS_UI_ANGLE);
private _heading = ctrlText (_display displayCtrl GPS_UI_HEADING);

if (_height isEqualTo "") then {
    _height = 0
} else {
    _height = parseNumber _height;
};

if (_angle isEqualTo "") then {
    _angle = -1
} else {
    _angle = parseNumber _angle;
};

if (_heading isEqualTo "") then {
    _heading = -1
} else {
    _heading = parseNumber _heading;
};

private _minGridCount = (count _easting) min (count _northing);

private _grid = (_easting select [0, _minGridCount]) + (_northing select [0, _minGridCount]);
private _position = if (_grid isEqualTo "") then {
    [0, 0, 0]
} else {
    [_grid, false] call EFUNC(common,getMapPosFromGrid);
};
_position set [2, _height];

TRACE_3("settings gps pos",_position,_angle,_heading);

private _settings = [
    _position,     // attack position
    _angle,        // impact angle
    _heading    // attack heading
];

if (_mode != -1) then {
    GVAR(gps_settings) set [_mode, _settings];
};
_settings
