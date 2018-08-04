#include "script_component.hpp"
/*
 * Author: Glowbal
 * Callback for the CPR treatment action on success.
 *
 * Arguments:
 * 0: The medic <OBJECT>
 * 1: The patient <OBJECT>
 * 2: Body part <STRING>
 * 3: Treatment class name <STRING>
 *
 * Return Value:
 * Succesful treatment started <BOOL>
 *
 * Public: Yes
 */

params ["_caller", "_target", "_selectionName", "_className", "_items"];

_target setVariable [VAR_HEART_RATE, 0, true];
_target setVariable [QGVAR(receiveCPR), false, true]; // CPR finished
[_target] call FUNC(calculateBlood);

if (alive _target && {IN_CRDC_ARRST(_target)}) then {
    [_target, "activity_view", ELSTRING(medical_treatment,Activity_cpr), [[_caller, false, true] call EFUNC(common,getName)]] call FUNC(addToLog);

    [QGVAR(treatmentCPRLocal), [_caller, _target], _target] call CBA_fnc_targetEvent;
};

true
