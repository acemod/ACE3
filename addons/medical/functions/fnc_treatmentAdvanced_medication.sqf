/*
 * Author: Glowbal
 * IV Treatment callback
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
 * Public: Yes
 */

#include "script_component.hpp"

private ["_caller", "_target", "_selectionName", "_className", "_items"];
_caller = _this select 0;
_target = _this select 1;
_selectionName = _this select 2;
_className = _this select 3;
_items = _this select 4;

[[_target, _className], QUOTE(DFUNC(treatmentAdvanced_medicationLocal)), _target] call EFUNC(common,execRemoteFnc); /* TODO Replace by event system */

{
    if (_x != "") then {
        [_target, _x] call FUNC(addToTriageCard);
    };
}foreach _items;

[_target, "activity", LSTRING(Activity_usedItem), [[_caller] call EFUNC(common,getName), _className]] call FUNC(addToLog);
[_target, "activity_view", LSTRING(Activity_usedItem), [[_caller] call EFUNC(common,getName), _className]] call FUNC(addToLog); // TODO expand message

true;
