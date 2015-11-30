/*
 * Author: Glowbal
 * Get whatever or not a unit should be or stay unconscious.
 *
 * Arguments:
 * 0: The Unit <OBJECT>
 *
 * ReturnValue:
 * Should the unit stay unconscious? <BOOL>
 *
 * Public: Yes
 */

#include "script_component.hpp"

private ["_unit","_return"];
params ["_unit"];

if (isNil QGVAR(unconsciousConditions)) then {
    GVAR(unconsciousConditions) = [];
};

_return = false;
{
    if (typeName _x == typeName {} && {([_unit] call _x)}) exitWith {
       _return = true;
    };
} forEach GVAR(unconsciousConditions);

_return
