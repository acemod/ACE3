/*
 * Author: Glowbal
 *
 * Check if unit is underwater
 *
 * Arguments:
 * 0: Unit (OBJECT)
 *
 * Return Value:
 * if unit is in the water (BOOLEAN)
 *
 * Public: Yes
 */
#include "script_component.hpp"

private ["_return","_aslPos"];

params ["_unit"];

_return = if ((surfaceIsWater getPos _unit)) then {
    _aslPos = _unit modelToWorldVisual (_unit selectionPosition "head");
    if ((_aslPos select 2) <= 0) then {
        true;
    } else {
        false
    };
} else {
    false
};

_return
