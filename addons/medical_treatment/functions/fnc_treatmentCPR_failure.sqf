#include "script_component.hpp"
/*
 * Author: Zakant
 * Handles the failure of the CPR treatment.
 *
 * Arguments:
 * 0: The medic <OBJECT>
 * 1: The patient <OBJECT>
 *
 * Return Value:
 * None
 *
 * Public: No
 */

params ["_caller", "_target"];

if (!(_target call EFUNC(common,isAwake)) || {IN_CRDC_ARRST(_target)}) then {
    _target setVariable [VAR_HEART_RATE, 0, true];
};
_target setVariable [QGVAR(receiveCPR), false, true];
[_target] call FUNC(calculateBlood);
