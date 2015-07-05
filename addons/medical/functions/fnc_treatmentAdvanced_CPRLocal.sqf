/*
 * Author: Glowbal
 * local Callback for the CPR treatment action on success.
 *
 * Arguments:
 * 0: The medic <OBJECT>
 * 1: The patient <OBJECT>
 *
 * Return Value:
 * Succesful treatment started <BOOL>
 *
 * Public: Yes
 */

#include "script_component.hpp"

private ["_caller","_target", "_reviveStartTime"];
_caller = _this select 0;
_target = _this select 1;

if (_target getvariable [QGVAR(inReviveState), false]) exitwith {
    _reviveStartTime = _target getvariable [QGVAR(reviveStartTime),0];
    if (_reviveStartTime > 0) then {
        _target setvariable [QGVAR(reviveStartTime), (_reviveStartTime + random(20)) min ACE_time];
    };
};

if (random(1)>= 0.6) exitwith {
    _target setvariable [QGVAR(inCardiacArrest), nil,true];
    _target setvariable [QGVAR(heartRate), 40];
    _target setvariable [QGVAR(bloodPressure), [50,70]];
};

true;
