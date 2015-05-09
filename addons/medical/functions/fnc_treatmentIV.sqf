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
 *
 * Return Value:
 * <BOOL>
 *
 * Public: Yes
 */

#include "script_component.hpp"

private ["_caller", "_target", "_selectionName", "_className", "_items", "_removeItem"];
_caller = _this select 0;
_target = _this select 1;
_selectionName = _this select 2;
_className = _this select 3;
_items = _this select 4;

if (count _items == 0) exitwith {};

_removeItem = _items select 0;
[[_target, _removeItem], QUOTE(DFUNC(treatmentIVLocal)), _target] call EFUNC(common,execRemoteFnc); /* TODO Replace by event system */
[_target, _removeItem] call FUNC(addToTriageCard);
[_target, "activity", "STR_ACE_Medical_Activity_gaveIV", [[_caller] call EFUNC(common,getName)]] call FUNC(addToLog);
