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
* Public: No
*/
#include "script_component.hpp"

params ["_caller", "_target"];

private _genericMessages = [ELSTRING(medical,diagnoseMessage), _target call EFUNC(common,getName)];

if (alive _target) then {
    _genericMessages pushBack ELSTRING(medical,diagnoseAlive);
} else {
    _genericMessages pushBack ELSTRING(medical,diagnoseDead);
};

private _hemorrhage = GET_HEMORRHAGE(_target);
if (_hemorrhage > 0) then {
    if (_hemorrhage > 1) then {
        _genericMessages pushBack ELSTRING(medical,lostBloodALot);
    } else {
        _genericMessages pushBack ELSTRING(medical,lostBlood);
    };
} else {
    _genericMessages pushBack ELSTRING(medical,noBloodloss);
};

if (alive _target) then {
    if IS_IN_PAIN(_target) then {
        _genericMessages pushBack ELSTRING(medical,inPain);
    } else {
        _genericMessages pushBack ELSTRING(medical,noPain);
    };
};

[QEGVAR(common,displayTextStructured), [_genericMessages, 3.0, _caller], _caller] call CBA_fnc_targetEvent;
