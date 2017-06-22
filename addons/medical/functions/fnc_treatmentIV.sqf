/*
 * Author: Glowbal
 * Patient IV Treatment callback
 *
 * Arguments:
 * 0: The medic <OBJECT>
 * 1: The patient <OBJECT>
 * 2: SelectionName <STRING>
 * 3: Treatment classname <STRING>
 *
 * Return Value:
 * Succesful treatment started <BOOL>
 *
 * Example:
 * [medic, patient, "SelectionName", "bandage"] call ace_medical_fnc_treatmentIV
 *
 * Public: Yes
 */

#include "script_component.hpp"

params ["_caller", "_target", "_selectionName", "_className", "_items"];

if (_items isEqualTo []) exitWith {false};

_items params ["_removeItem"];
if (local _target) then {
    [QGVAR(treatmentIVLocal), [_target, _className]] call CBA_fnc_localEvent;
} else {
    [QGVAR(treatmentIVLocal), [_target, _className], _target] call CBA_fnc_targetEvent;
};

[_target, _removeItem] call FUNC(addToTriageCard);
[_target, "activity", LSTRING(Activity_gaveIV), [[_caller, false, true] call EFUNC(common,getName)]] call FUNC(addToLog);
[_target, "activity_view", LSTRING(Activity_gaveIV), [[_caller, false, true] call EFUNC(common,getName)]] call FUNC(addToLog); // TODO expand message

true
