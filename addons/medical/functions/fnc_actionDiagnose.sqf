#include "script_component.hpp"
/*
 * Author: Glowbal
 * Action for diagnosing in basic medical
 *
 * Arguments:
 * 0: The medic <OBJECT>
 * 1: The patient <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [bob, kevin] call ACE_medical_fnc_actionDiagnose
 *
 * Public: No
 */

params ["_caller", "_target"];

private _genericMessages = [LSTRING(diagnoseMessage), [_target] call EFUNC(common,getName)];

if (alive _target) then {
    _genericMessages pushBack LSTRING(diagnoseAlive);
} else {
    _genericMessages pushBack LSTRING(diagnoseDead);
};

if (_target getVariable[QGVAR(hasLostBlood), 0] > 0) then {
    if (_target getVariable[QGVAR(hasLostBlood), 0] > 1) then {
        _genericMessages pushBack LSTRING(lostBloodALot);
    } else {
        _genericMessages pushBack LSTRING(lostBlood);
    };
} else {
    _genericMessages pushBack LSTRING(noBloodloss);
};

if (alive _target) then {
    if (_target getVariable[QGVAR(hasPain), false]) then {
        _genericMessages pushBack LSTRING(inPain);
    } else {
        _genericMessages pushBack LSTRING(noPain);
    };
};

[QEGVAR(common,displayTextStructured), [_genericMessages, 3.0, _caller], [_caller]] call CBA_fnc_targetEvent;
