#include "script_component.hpp"
/*
 * Author: Ruthberg
 * Returns the the first intersection with terrain between two positions.
 *
 * Arguments:
 * 0: PositionASL <ARRAY>
 * 1: PositionATL <ARRAY>
 * 2: Accuracy <NUMBER>
 *
 * Return Value:
 * 0: Intersects <BOOL>
 * 1: Intersection Position ASL <ARRAY>
 *
 * Example:
 * [[1,2,3], [0,0,5], 5] call ace_common_fnc_getFirstObjectIntersection
 *
 * Public: Yes
 */

params ["_source", "_destination"];

private _result = [false, [0, 0, 0]];
private _hits = lineIntersectsSurfaces [_source, _destination, objNull, objNull, true, -1];
{
    _x params ["_pos", "", "_obj"];
    if (!isNull _obj) exitWith {
        _result = [true, _pos];
    };
} forEach _hits;
_result
