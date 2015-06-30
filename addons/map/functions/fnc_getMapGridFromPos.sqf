/*
 * Author: VKing
 * Gets a 10-digit map grid for the given world position
 *
 * Argument:
 * 0: Position (2D Position) <ARRAY>
 * 1: Return type; false for array of easting and northing, true for single string <Bool>
 *
 * Return values:
 * 0: Easting <String>
 * 1: Northing <String>
 *
 * Example:
 * [(getPos player)] call ace_map_fnc_getMapGridFromPos;
 *
 * Public: Yes
 */

// #define DEBUG_MODE_FULL
#include "script_component.hpp"

PARAMS_1(_pos);
DEFAULT_PARAM(1,_returnSingleString,false);

if ((count GVAR(mapGridData)) == 0) exitWith {
    if (_returnSingleString) then {
        mapGridPosition _pos
    } else {
        [(mapGridPosition _pos) select [0,5], (mapGridPosition _pos) select [5,5]]
    };
};

EXPLODE_4_PVT(GVAR(mapGridData),_offsetX,_realOffsetY,_stepXat5,_stepYat5);
_easting = str floor (((_pos select 0) - _offsetX) / _stepXat5);
_northing = str floor (((_pos select 1) - _realOffsetY) / _stepYat5);

while {count _easting < 5} do {_easting = "0" + _easting;};
while {count _northing < 5} do {_northing = "0" + _northing;};

if (_returnSingleString) then {
    _easting+_northing
} else {
    [_easting, _northing]
};
