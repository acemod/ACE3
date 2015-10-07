/*
 * Author: Glowbal
 * Check if unit is underwater
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * if unit is in the water (BOOLEAN)
 *
 * Public: Yes
 */
#include "script_component.hpp"

params ["_unit"];

private "_return";
_return = false;

if (surfaceIsWater getPosASL _unit) then {
    private "_pos";
    _pos = _unit modelToWorldVisual (_unit selectionPosition "head");

    if (_pos select 2 < 0) then {
        _return = true;
    };
};

_return
