#include "script_component.hpp"
/*
 * Author: Glowbal
 * IV Treatment callback
 *
 * Arguments:
 * 0: The medic <OBJECT>
 * 1: The patient <OBJECT>
 * 2: SelectionName <STRING>
 * 3: Treatment classname <STRING>
 * 4: Item <STRING>
 * 5: specific Spot <NUMBER> (default: -1)
 *
 * Return Value:
 * Succesful treatment started <BOOL>
 *
 * Example:
 * [medic, patient, "Selectionname", "bandage", "bandage", -1] call ace_medical_fnc_treatmentAdvanced_bandage
 *
 * Public: Yes
 */

params ["_caller", "_target", "_selectionName", "_className", "_items", "", ["_specificSpot", -1]];

[_target, "activity", LSTRING(Activity_bandagedPatient), [[_caller, false, true] call EFUNC(common,getName)]] call FUNC(addToLog);
[_target, "activity_view", LSTRING(Activity_bandagedPatient), [[_caller, false, true] call EFUNC(common,getName)]] call FUNC(addToLog); // TODO expand message

if (local _target) then {
    [QGVAR(treatmentAdvanced_bandageLocal), [_target, _className, _selectionName, _specificSpot]] call CBA_fnc_localEvent;
} else {
    [QGVAR(treatmentAdvanced_bandageLocal), [_target, _className, _selectionName, _specificSpot], _target] call CBA_fnc_targetEvent;
};

/*    {
    if (_x != "") then {
        [_target, _x] call FUNC(addToTriageCard);
    };
}forEach _items;*/

true;
