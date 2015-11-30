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

private "_reviveStartTime";
params ["_caller","_target"];

if (_target getvariable [QGVAR(inReviveState), false]) then {
    if (GVAR(exitReviveBy) == 2 && {(random 1) >= 0.3}) then {
        //Lower chance of success in revive state
        _target setvariable [QGVAR(inReviveState), false, true];
        _target setvariable [QGVAR(inCardiacArrest), nil, true];
        _target setvariable [QGVAR(heartRate), 40];
        _target setvariable [QGVAR(bloodPressure), [50,70]];
    } else {
        _reviveStartTime = _target getvariable [QGVAR(reviveStartTime),0];
        if (_reviveStartTime > 0) then {
            _target setvariable [QGVAR(reviveStartTime), (_reviveStartTime + random(20)) min ACE_time];
        };
    };
} else {
    if (GVAR(level) > 1 && {(random 1) >= 0.6}) then {
        _target setvariable [QGVAR(inCardiacArrest), nil, true];
        _target setvariable [QGVAR(heartRate), 40];
        _target setvariable [QGVAR(bloodPressure), [50,70]];
    };
};

[_target, "activity", LSTRING(Activity_CPR), [[_caller] call EFUNC(common,getName)]] call FUNC(addToLog);
[_target, "activity_view", LSTRING(Activity_CPR), [[_caller] call EFUNC(common,getName)]] call FUNC(addToLog); // TODO expand message

true;
