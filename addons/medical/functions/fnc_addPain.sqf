/*
 * Author: commy2
 * Adds or removes pain to/from unit.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Pain to add. Negative to remove <NUMBER>
 *
 * Return Value:
 * Nothing
 *
 * Example:
 * [player, 0.5] call ace_medical_fnc_addPain
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_unit", "_painToAdd"];

private _pain = _unit getVariable [QEGVAR(medical,pain), 0];

if (_pain > 0) then {
    _pain = _pain + (_painToAdd min 1) * (1 - _pain);
} else {
    _pain = _pain + _painToAdd;
};

_unit setVariable [QEGVAR(medical,pain), 0 max _pain min 1];

if (_painToAdd > 0 && {_pain >= PAIN_UNCONSCIOUS} && {random 1 < 0.1}) then {
    [_unit, true, PAIN_KNOCK_OUT_DURATION] call FUNC(setUnconscious);
};
