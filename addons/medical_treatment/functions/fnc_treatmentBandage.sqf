/*
 * Author: Glowbal
 * Bandage treatment callback
 *
 * Arguments:
 * 0: The medic <OBJECT>
 * 1: The patient <OBJECT>
 * 2: Body part <STRING>
 * 3: Treatment class name <STRING>
 * 4: Item <STRING>
 * 5: specific Spot <NUMBER> (default: -1)
 *
 * Return Value:
 * Succesful treatment started <BOOL>
 *
 * Public: Yes
 */
#include "script_component.hpp"

params ["_caller", "_target", "_bodyPart", "_className", "_items", "", ["_specificSpot", -1]];

[_target, "activity", ELSTRING(medical_treatment,Activity_bandagedPatient), [[_caller, false, true] call EFUNC(common,getName)]] call FUNC(addToLog);
[_target, "activity_view", ELSTRING(medical_treatment,Activity_bandagedPatient), [[_caller, false, true] call EFUNC(common,getName)]] call FUNC(addToLog); // TODO expand message

[QGVAR(treatmentBandageLocal), [_target, _className, _bodyPart, _specificSpot], _target] call CBA_fnc_targetEvent;

/*{
    if (_x != "") then {
        [_target, _x] call FUNC(addToTriageCard);
    };
} forEach _items;*/

true
