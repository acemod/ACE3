/*
 * Author: Orbis2358
 * Patient Cast Treatment callback
 *
 * Arguments:
 * 0: The medic <OBJECT>
 * 1: The patient <OBJECT>
 * 2: SelectionName <STRING>
 * 3: Treatment classname <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * [medic, patient, "SelectionName", "cast"] call ace_medical_fnc_treatmentOrthopedicCast
 *
 * Public: Yes
 */

#include "script_component.hpp"

params ["_caller", "_target", "_selectionName", "_className", "_items"];

if (_items isEqualTo []) exitWith {false};

private _part = [_selectionName] call FUNC(selectionNameToNumber);
if (_part == 0 || _part == 1) exitWith {false};

// private _cast = _target getVariable [QGVAR(orthopedicCast), [[0, 0], [0, 0], [0, 0], [0, 0], [0, 0], [0, 0]]];
// if ((_cast select _part select 0) > 0) exitWith {false};

private _removeItem = _items select 0;
if (local _target) then {
    [QGVAR(treatmentOrthopedicCastLocal), [_target, _removeItem, _selectionName]] call CBA_fnc_localEvent;
} else {
    [QGVAR(treatmentOrthopedicCastLocal), [_target, _removeItem, _selectionName], _target] call CBA_fnc_targetEvent;
};

[_target, _removeItem] call FUNC(addToTriageCard);
[_target, "activity", LSTRING(appliedOrthopedicCast), [[_caller, false, true] call EFUNC(common,getName)]] call FUNC(addToLog);
[_target, "activity_view", LSTRING(appliedOrthopedicCast), [[_caller, false, true] call EFUNC(common,getName)]] call FUNC(addToLog);

true
