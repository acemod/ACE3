#include "script_component.hpp"
/*
 * Author: Glowbal
 * Apply a tourniquet to the patient
 *
 * Arguments:
 * 0: The medic <OBJECT>
 * 1: The patient <OBJECT>
 * 2: SelectionName <STRING>
 * 3: Treatment classname <STRING>
 *
 *
 * Return Value:
 * Succesful treatment started <BOOL>
 *
 * Example:
 * [bob, kevin, "selection", "classname"] call ACE_medical_fnc_treatmentTourniquet
 *
 * Public: No
 */

params ["_caller", "_target", "_selectionName", "_className", "_items"];

if (count _items == 0) exitWith {false};

private _part = [_selectionName] call FUNC(selectionNameToNumber);
if (_part == 0 || _part == 1) exitWith {
    // [QEGVAR(common,displayTextStructured), ["You cannot apply a CAT on this body part!"], [_caller]] call CBA_fnc_targetEvent;
    false;
};

private _tourniquets = _target getVariable [QGVAR(tourniquets), [0,0,0,0,0,0]];
if ((_tourniquets select _part) > 0) exitWith {
   _output = "There is already a tourniquet on this body part!"; // TODO localization
   [QEGVAR(common,displayTextStructured), [_output, 1.5, _caller], [_caller]] call CBA_fnc_targetEvent;
    false;
};

private _removeItem = _items select 0;
if (local _target) then {
    [QGVAR(treatmentTourniquetLocal), [_target, _removeItem, _selectionName]] call CBA_fnc_localEvent;
} else {
    [QGVAR(treatmentTourniquetLocal), [_target, _removeItem, _selectionName], _target] call CBA_fnc_targetEvent;
};

[_target, _removeItem] call FUNC(addToTriageCard);
[_target, "activity", LSTRING(Activity_appliedTourniquet), [[_caller, false, true] call EFUNC(common,getName)]] call FUNC(addToLog);
[_target, "activity_view", LSTRING(Activity_appliedTourniquet), [[_caller, false, true] call EFUNC(common,getName)]] call FUNC(addToLog); // TODO expand message

true
