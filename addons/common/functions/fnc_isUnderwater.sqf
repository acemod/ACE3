/*
 * Author: Glowbal
 * Check if unit's head is underwater
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * If unit's head is underwater <BOOL>
 *
 * Example:
 * [bob] call ace_common_fnc_isUnderwater
 *
 * Public: Yes
 */
#include "script_component.hpp"

params [["_unit", objNull, [objNull]]];

private _return = false;

if (surfaceIsWater getPosASL _unit) then {
    private _pos = _unit modelToWorldVisual (_unit selectionPosition "head");

    if (_pos select 2 < 0) then {
        _return = true;
    };
};

_return
