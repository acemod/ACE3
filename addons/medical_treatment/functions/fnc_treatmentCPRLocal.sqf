/*
 * Author: Glowbal
 * local Callback for the CPR treatment action on success.
 *
 * Arguments:
 * 0: The medic <OBJECT>
 * 1: The patient <OBJECT>
 *
 * Return Value:
 * Succesful treatment started <BOOL>
 *
 * Public: Yes
 */

#include "script_component.hpp"

params ["_caller", "_target"];

if ((random 1) >= 0.6) then {
    [QEGVAR(medical,CPRSucceeded), _target] call CBA_fnc_localEvent;
};

[_target, "activity", ELSTRING(medical_treatment,Activity_CPR), [[_caller, false, true] call EFUNC(common,getName)]] call FUNC(addToLog);
[_target, "activity_view", ELSTRING(medical_treatment,Activity_CPR), [[_caller, false, true] call EFUNC(common,getName)]] call FUNC(addToLog); // TODO expand message

true
