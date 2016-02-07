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

if (local _target) then {
    ["treatmentAdvanced_medicationLocal", [_target, _className]] call EFUNC(common,localEvent);
} else {
    ["treatmentAdvanced_medicationLocal", _target, [_target, _className]] call EFUNC(common,targetEvent);
};

{
    if (_x != "") then {
        [_target, _x] call FUNC(addToTriageCard);
    };
}foreach _items;

[_target, "activity", "STR_ACE_Medical_Activity_usedItem", [[_caller] call EFUNC(common,getName), _className]] call FUNC(addToLog);

true;
