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

private ["_caller","_target", "_n"];
_caller = _this select 0;
_target = _this select 1;

_n = _target getvariable [QEGVAR(common,ENABLE_REVIVE_COUNTER),0];
if (_n > 0) then {
    _n = _n - random(20);
    if (_n < 0) then {
        _n = 0;
    };
    _target setvariable [QEGVAR(common,ENABLE_REVIVE_COUNTER), _n];
};

if (random(1)>= 0.6) exitwith {
    _target setvariable [QGVAR(inCardiacArrest), nil,true];
    _target setvariable [QGVAR(heartRate), 40];
    _target setvariable [QGVAR(bloodPressure), [50,70]];
};

true;
