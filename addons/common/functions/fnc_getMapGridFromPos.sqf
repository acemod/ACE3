#include "script_component.hpp"
/*
 * Author: VKing, PabstMirror
 * Gets a 10-digit map grid for the given world position
 *
 * Arguments:
 * 0: Position (2D Position) <ARRAY>
 * 1: Return type; false for array of easting and northing, true for single string (default: false) <BOOL>
 *
 * Return Value:
 * 0: Easting <String>
 * 1: Northing <String>
 *
 * Example:
 * [getPos player] call ace_common_fnc_getMapGridFromPos
 *
 * Public: Yes
 */

params ["_pos", ["_returnSingleString", false]];

//Fallback, when map data is weird (letters)
if (GVAR(mapGridData) isEqualTo []) exitWith {
    private _nativeGrid = mapGridPosition _pos;

    if (_returnSingleString) then {
        _nativeGrid
    } else {
        private _count = floor ((count _nativeGrid) / 2);
        [_nativeGrid select [0, _count], _nativeGrid select [_count, _count]]
    };
};

GVAR(mapGridData) params ["_offsetX", "_realOffsetY", "_stepXat5", "_stepYat5"];

private _easting = floor (((_pos select 0) - _offsetX) / _stepXat5);
private _northing = floor (((_pos select 1) - _realOffsetY) / _stepYat5);

//Attempt to handle negative east/north (e.g.: moving west of map bounds)
if (_easting > 0) then {
    _easting = str _easting;
    while {count _easting < 5} do {_easting = "0" + _easting};
} else {
    _easting = str abs _easting;
    while {count _easting < 4} do {_easting = "0" + _easting};
    _easting = "-" + _easting;
};

if (_northing > 0) then {
    _northing = str _northing;
    while {count _northing < 5} do {_northing = "0" + _northing};
} else {
    _northing = str abs _northing;
    while {count _northing < 4} do {_northing = "0" + _northing};
    _northing = "-" + _northing;
};

if (_returnSingleString) then {
    _easting + _northing
} else {
    [_easting, _northing]
}; // return
