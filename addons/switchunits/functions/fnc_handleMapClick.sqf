/*
 * Author: bux578
 * Switches to a unit close to a clicked map position
 *
 * Arguments:
 * 0: unit <OBJECT>
 * 1: sides <ARRAY<OBJECT>>
 *
 * Return Value:
 * None
 *
 * Example:
 * [unit, _sides] call FUNC(handleMapClick)
 *
 * Public: No
 */

#include "script_component.hpp"

private ["_sides", "_pos", "_sideNearest"];

_sides = (_this select 0) select 1;
_pos = _this select 1;

_sideNearest = [];

{
    if ([_x] call FUNC(isValidAi) && (side group _x in _sides)) then {
        _sideNearest pushBack _x;
    };
} forEach (nearestObjects [_pos, ["Man"], 15]);

if (count _sideNearest > 0) then {
    [_sideNearest select 0] call FUNC(switchUnit);
    openMap false;
};
