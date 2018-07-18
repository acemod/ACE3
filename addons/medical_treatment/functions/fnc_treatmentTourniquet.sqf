/*
 * Author: Glowbal
 * Apply a tourniquet to the patient
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
 * Public: No
 */
#include "script_component.hpp"

params ["_caller", "_target", "_bodyPart", "_className", "_items"];

if (count _items == 0) exitWith {false};

private _partIndex = ALL_BODY_PARTS find toLower _bodyPart;

private _tourniquets = _target getVariable [QEGVAR(medical,tourniquets), [0,0,0,0,0,0]];

if (_tourniquets select _partIndex > 0) exitWith {
   private _output = "There is already a tourniquet on this body part!"; // TODO localization
   [QEGVAR(common,displayTextStructured), [_output, 1.5, _caller], _caller] call CBA_fnc_targetEvent;
    false
};

private _removeItem = _items select 0;

[QGVAR(treatmentTourniquetLocal), [_target, _removeItem, _bodyPart], _target] call CBA_fnc_targetEvent;

[_target, _removeItem] call FUNC(addToTriageCard);
[_target, "activity", ELSTRING(medical_treatment,Activity_appliedTourniquet), [[_caller, false, true] call EFUNC(common,getName)]] call FUNC(addToLog);
[_target, "activity_view", ELSTRING(medical_treatment,Activity_appliedTourniquet), [[_caller, false, true] call EFUNC(common,getName)]] call FUNC(addToLog); // TODO expand message

true
