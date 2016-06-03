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
 * Public: No
 */

#include "script_component.hpp"

private ["_caller","_target","_part","_selectionName","_removeItem", "_tourniquets", "_items", "_output", "_className"];
_caller = _this select 0;
_target = _this select 1;
_selectionName = _this select 2;
_className = _this select 3;
_items = _this select 4;

if (count _items == 0) exitWith {false};

_part = [_selectionName] call FUNC(selectionNameToNumber);
if (_part == 0 || _part == 1) exitWith {
    // ["ace_displayTextStructured", ["You cannot apply a CAT on this body part!"], [_caller]] call CBA_fnc_targetEvent;
    false;
};

_tourniquets = _target getVariable [QGVAR(tourniquets), [0,0,0,0,0,0]];
if ((_tourniquets select _part) > 0) exitWith {
   _output = "There is already a tourniquet on this body part!"; // TODO localization
   ["ace_displayTextStructured", [_output, 1.5, _caller], [_caller]] call CBA_fnc_targetEvent;
    false;
};

_removeItem = _items select 0;
if (local _target) then {
    [QGVAR(treatmentTourniquetLocal), [_target, _removeItem, _selectionName]] call CBA_fnc_localEvent;
} else {
    [QGVAR(treatmentTourniquetLocal), [_target, _removeItem, _selectionName], _target] call CBA_fnc_targetEvent;
};

[_target, _removeItem] call FUNC(addToTriageCard);
[_target, "activity", LSTRING(Activity_appliedTourniquet), [[_caller, false, true] call EFUNC(common,getName)]] call FUNC(addToLog);
[_target, "activity_view", LSTRING(Activity_appliedTourniquet), [[_caller, false, true] call EFUNC(common,getName)]] call FUNC(addToLog); // TODO expand message


true
