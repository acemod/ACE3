/*
 * Author: Rosuto, Ruthberg
 * Converts any kind of position into a position string array
 *
 * Arguments:
 * 0: position <ARRAY|OBJECT|STRING>
 *
 * Return Value:
 * 0: x-pos <STRING>
 * 1: y-pos <STRING>
 *
 * Example:
 *
 * Public: No
 */
#include "script_component.hpp"

private ["_pos", "_grid", "_xGrid", "_yGrid"];
_pos = [0, 0];

switch (typeName _this) do {
    //--- Coordinates
    case "ARRAY": {
        _pos = _this;
    };
    //--- Unit
    case "OBJECT": {
        _pos = getPosASL _this;
    };
    //--- Marker
    case "STRING": {
        _pos = markerPos _this;
    };
};

_grid = toArray (mapGridPosition _pos);
if (count _grid > 4) then {
    if (count _grid > 6) then {
        _xGrid = toString [_grid select 0, _grid select 1, _grid select 2, _grid select 3];
        _yGrid = toString [_grid select 4, _grid select 5, _grid select 6, _grid select 7];
    } else {
        _xGrid = toString [_grid select 0, _grid select 1, _grid select 2];
        _yGrid = toString [_grid select 3, _grid select 4, _grid select 5];
    };
} else {
    _xGrid = toString [_grid select 0, _grid select 1];
    _yGrid = toString [_grid select 2, _grid select 3];
};

[_xGrid, _yGrid]
