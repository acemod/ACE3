/*
 * Author: commy2
 * Returns the weight (from the loadAbs command) in lbs/kg (based on user option)
 *
 * Arguments:
 * 0: The Unit (usually the player) <OBJECT>
 *
 * Return Value:
 * The return value <NUMBER>
 *
 * Example:
 * [player] call ace_movement_fnc_getWeight
 *
 * Public: No
 */
#include "script_component.hpp"

private ["_unit", "_weight"];

_unit = _this select 0;

_weight = loadAbs _unit * 0.1;

if (GVAR(useImperial)) then {
    _weight = format ["%1lb", (round (_weight * 100)) / 100];
} else {
    _weight = format ["%1kg", (round (_weight * FACTOR_POUND_TO_KILOGRAMM * 100)) / 100];
};

_weight
