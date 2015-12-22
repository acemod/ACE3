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

params ["_caller", "_target", "_selectionName", "_className", "_items"];

[[_target, _className], QUOTE(DFUNC(treatmentAdvanced_medicationLocal)), _target] call EFUNC(common,execRemoteFnc); /* TODO Replace by event system */

{
    if (_x != "") then {
        [_target, _x] call FUNC(addToTriageCard);
        [_target, "activity", LSTRING(Activity_usedItem), [[_caller] call EFUNC(common,getName), getText (configFile >> "CfgWeapons" >> _x >> "displayName")]] call FUNC(addToLog);
        [_target, "activity_view", LSTRING(Activity_usedItem), [[_caller] call EFUNC(common,getName), getText (configFile >> "CfgWeapons" >> _x >> "displayName")]] call FUNC(addToLog);
    };
} forEach _items;


true;
