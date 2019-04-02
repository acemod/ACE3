#include "script_component.hpp"
/*
 * Author: Glowbal
 * Full heal treatment
 *
 * Arguments:
 * 0: The medic <OBJECT>
 * 1: The patient <OBJECT>
 * 2: Body part <STRING>
 * 3: Treatment class name <STRING>
 * 4: Item <STRING>
 *
 * Return Value:
 * Succesful treatment started <BOOL>
 *
 * Public: No
 */

params ["_caller", "_target"];

[QGVAR(treatmentFullHealLocal), [_target], _target] call CBA_fnc_targetEvent;

[_target, "activity", ELSTRING(medical_treatment,Activity_fullHeal), [[_caller, false, true] call EFUNC(common,getName)]] call FUNC(addToLog);
[_target, "activity_view", ELSTRING(medical_treatment,Activity_fullHeal), [[_caller, false, true] call EFUNC(common,getName)]] call FUNC(addToLog); // TODO expand message

true
