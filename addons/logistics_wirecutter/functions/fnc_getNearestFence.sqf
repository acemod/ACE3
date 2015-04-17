/*
 * Author: PabstMirror
 * Gets nearest fence object (not actully used, left for utility)
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * The return value <OBJECT>
 *
 * Example:
 * [player] call ace_logistics_wirecutter_fnc_getNearestFence
 *
 * Public: Yes
 */
#include "script_component.hpp"

private "_nearestFence";
PARAMS_1(_unit);

_nearestFence = objNull;
{
    if ((isNull _nearestFence) && {[_x] call FUNC(isFence)}) then {
        _nearestFence = _x;
    };
} forEach nearestObjects [_unit, [], 15];

_nearestFence
