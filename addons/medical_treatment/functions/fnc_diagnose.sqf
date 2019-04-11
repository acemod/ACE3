#include "script_component.hpp"
/*
 * Author: Glowbal
 * Action for diagnosing in basic medical
 *
 * Arguments:
 * 0: Medic <OBJECT>
 * 1: Patient <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, cursorObject] call ace_medical_treatment_fnc_diagnose
 *
 * Public: No
 */

params ["_medic", "_patient"];

private _messages = [LSTRING(diagnoseMessage), _patient call EFUNC(common,getName)];

if (alive _patient) then {
    _messages pushBack LSTRING(diagnoseAlive);
} else {
    _messages pushBack LSTRING(diagnoseDead);
};

private _hemorrhage = GET_HEMORRHAGE(_patient);
if (_hemorrhage > 0) then {
    if (_hemorrhage > 1) then {
        _messages pushBack LSTRING(lostBloodALot);
    } else {
        _messages pushBack LSTRING(lostBlood);
    };
} else {
    _messages pushBack LSTRING(noBloodloss);
};

// todo: mirror pain visualization logic of medical_gui?
if (alive _patient) then {
    if IS_IN_PAIN(_patient) then {
        _messages pushBack LSTRING(inPain);
    } else {
        _messages pushBack LSTRING(noPain);
    };
};

[_messages, 3] call EFUNC(common,displayTextStructured);
