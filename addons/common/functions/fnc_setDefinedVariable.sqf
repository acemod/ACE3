/*
 * Author: Glowbal
 *
 * Setvariable value
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: variableName <STRING>
 * 2: value <ANY>
 *
 * Return value:
 * None
 *
 * Public: Yes
 */
#include "script_component.hpp"

private ["_definedVariable"];

params ["_unit", "_variable", "_value", "_global"];

if (isNil "_global") then {
    _definedVariable = ([_variable] call FUNC(getDefinedVariableInfo));
    _definedVariable params ["", "",  ["_global",false]];
};

if (!isNil "_value") exitwith {
    _unit setvariable [_variable, _value, _global];
};
_unit setvariable [_variable, nil, _global];
