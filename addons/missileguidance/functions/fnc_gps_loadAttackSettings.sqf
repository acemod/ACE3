#include "..\script_component.hpp"
/*
 * Author: tcvm
 * Saves all textboxes to whatever settings say for PB mode
 *
 * Arguments:
 * Current PB mode <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call ace_missileguidance_fnc_gps_saveAttackSettings
 *
 * Public: No
 */
params ["_mode"];
private _display = uiNamespace getVariable QGVAR(gpsAttackOptionDisplay);

private _settings = GVAR(gps_settings) get _mode;

_settings params ["_position", "_angle", "_heading"];
private _height = _position select 2;

private _grid = [_position] call EFUNC(common,getMapGridFromPos);
_grid params ["_easting", "_northing"];

if (_angle < 0) then {
    _angle = "";
} else {
    _angle = str _angle;
};

if (_heading < 0) then {
    _heading = "";
} else {
    _heading = str _heading;
};

if (0 == parseNumber _easting) then {
    _easting = "";
};

if (0 == parseNumber _northing) then {
    _northing = "";
};

(_display displayCtrl GPS_UI_EASTING) ctrlSetText _easting;
(_display displayCtrl GPS_UI_NORTHING) ctrlSetText _northing;
(_display displayCtrl GPS_UI_HEIGHT) ctrlSetText str _height;
(_display displayCtrl GPS_UI_ANGLE) ctrlSetText _angle;
(_display displayCtrl GPS_UI_HEADING) ctrlSetText _heading;

