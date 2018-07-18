/*
 * Author: Glowbal
 * IV Treatment callback
 *
 * Arguments:
 * 0: The medic <OBJECT>
 * 1: The patient <OBJECT>
 * 2: Body part <STRING>
 * 3: Treatment class name <STRING>
 * 4: Items Used <ARRAY>
 *
 * Return Value:
 * Succesful treatment started <BOOL>
 *
 * Public: Yes
 */
#include "script_component.hpp"

params ["_caller", "_target", "_bodyPart", "_className", "_items"];
TRACE_5("params",_caller,_target,_bodyPart,_className,_items);

private _partIndex = ALL_BODY_PARTS find toLower _bodyPart;

[QGVAR(treatmentMedicationLocal), [_target, _className, _partIndex], _target] call CBA_fnc_targetEvent;

{
    if (_x != "") then {
        [_target, _x] call FUNC(addToTriageCard);
        [_target, "activity", ELSTRING(medical_treatment,Activity_usedItem), [[_caller, false, true] call EFUNC(common,getName), getText (configFile >> "CfgWeapons" >> _x >> "displayName")]] call FUNC(addToLog);
        [_target, "activity_view", ELSTRING(medical_treatment,Activity_usedItem), [[_caller, false, true] call EFUNC(common,getName), getText (configFile >> "CfgWeapons" >> _x >> "displayName")]] call FUNC(addToLog);
    };
} forEach _items;

true
