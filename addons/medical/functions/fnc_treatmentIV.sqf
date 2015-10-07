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
 * Public: Yes
 */

#include "script_component.hpp"

private "_removeItem";
params ["_caller", "_target", "_selectionName", "_className", "_items"];

if (count _items == 0) exitwith {false};

_removeItem = _items select 0;
[[_target, _className], QUOTE(DFUNC(treatmentIVLocal)), _target] call EFUNC(common,execRemoteFnc); /* TODO Replace by event system */
[_target, _removeItem] call FUNC(addToTriageCard);
[_target, "activity", LSTRING(Activity_gaveIV), [[_caller] call EFUNC(common,getName)]] call FUNC(addToLog);
[_target, "activity_view", LSTRING(Activity_gaveIV), [[_caller] call EFUNC(common,getName)]] call FUNC(addToLog); // TODO expand message

true
