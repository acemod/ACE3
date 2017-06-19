/*
 * Author: Glowbal
 * IV Treatment callback
 *
 * Arguments:
 * 0: The medic <OBJECT>
 * 1: The patient <OBJECT>
 * 2: SelectionName <STRING>
 * 3: Treatment classname <STRING>
 * 4: Items Used <ARRAY>
 *
 * Return Value:
 * Succesful treatment started <BOOL>
 *
 * Example:
 * [medic, patient, "selectionName", "bandage", 2] call ace_medical_fnc_treatmentAdvanced_medication
 *
 * Public: Yes
 */

#include "script_component.hpp"

params ["_caller", "_target", "_selectionName", "_className", "_items"];
TRACE_5("params",_caller,_target,_selectionName,_className,_items);

private _part = [_selectionName] call FUNC(selectionNameToNumber);

[QGVAR(treatmentAdvanced_medicationLocal), [_target, _className, _part], [_target]] call CBA_fnc_targetEvent;

{
    if (_x != "") then {
        [_target, _x] call FUNC(addToTriageCard);
        [_target, "activity", LSTRING(Activity_usedItem), [[_caller, false, true] call EFUNC(common,getName), getText (configFile >> "CfgWeapons" >> _x >> "displayName")]] call FUNC(addToLog);
        [_target, "activity_view", LSTRING(Activity_usedItem), [[_caller, false, true] call EFUNC(common,getName), getText (configFile >> "CfgWeapons" >> _x >> "displayName")]] call FUNC(addToLog);
    };
} forEach _items;


true;
