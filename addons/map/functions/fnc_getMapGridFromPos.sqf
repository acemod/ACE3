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

private["_posX", "_posY"];

TRACE_2("",_pos select 0, _pos select 1);

_posX = GVAR(gridOffsetX) + floor (_pos select 0);
TRACE_1("",_posX);
_posX = str ((100000 + _posX) % 100000);

if (cba_common_mapReversed) then {
    _posY = GVAR(gridOffsetY) - ceil(_pos select 1);
} else {
    _posY = GVAR(gridOffsetY) + floor(_pos select 1);
};
TRACE_1("",_posY);
_posY = str ((100000 + _posY) % 100000);

TRACE_2("",_posX,_posY);

_posX = switch (count _posX) do {
    case 1: {"0000"+_posX};
    case 2: {"000"+_posX};
    case 3: {"00"+_posX};
    case 4: {"0"+_posX};
    default {_posX};
};
_posY = switch (count _posY) do {
    case 1: {"0000"+_posY};
    case 2: {"000"+_posY};
    case 3: {"00"+_posY};
    case 4: {"0"+_posY};
    default {_posY};
};
TRACE_3("",mapGridPosition _pos,_posX,_posY);

if (_returnSingleString) then {
    _posX+_posY
} else {
    [_posX,_posY]
};
