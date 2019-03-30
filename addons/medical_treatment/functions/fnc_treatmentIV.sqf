#include "script_component.hpp"
/*
 * Author: Glowbal
 * Patient IV Treatment callback
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

params ["_caller", "_target", "_bodyPart", "_className", "_items"];

if (_items isEqualTo []) exitWith {false};

_items params ["_removeItem"];

[QGVAR(treatmentIVLocal), [_target, _className, _bodyPart], _target] call CBA_fnc_targetEvent;

[_target, _removeItem] call FUNC(addToTriageCard);
[_target, "activity", ELSTRING(medical_treatment,Activity_gaveIV), [[_caller, false, true] call EFUNC(common,getName)]] call FUNC(addToLog);
[_target, "activity_view", ELSTRING(medical_treatment,Activity_gaveIV), [[_caller, false, true] call EFUNC(common,getName)]] call FUNC(addToLog); // TODO expand message

true
