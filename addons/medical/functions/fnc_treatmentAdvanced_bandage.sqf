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
 * Public: Yes
 */

#include "script_component.hpp"
params ["_caller", "_target", "_selectionName", "_className", "_items", "", ["_specificSpot", -1]];

if !([_target] call FUNC(hasMedicalEnabled)) exitWith {
    _this call FUNC(treatmentBasic_bandage);
};

[[_target, _className, _selectionName, _specificSpot], QUOTE(DFUNC(treatmentAdvanced_bandageLocal)), _target] call EFUNC(common,execRemoteFnc); /* TODO Replace by event system */
/*    {
    if (_x != "") then {
        [_target, _x] call FUNC(addToTriageCard);
    };
}forEach _items;*/

[_target, "activity", LSTRING(Activity_bandagedPatient), [[_caller] call EFUNC(common,getName)]] call FUNC(addToLog);
[_target, "activity_view", LSTRING(Activity_bandagedPatient), [[_caller] call EFUNC(common,getName)]] call FUNC(addToLog); // TODO expand message

true;
