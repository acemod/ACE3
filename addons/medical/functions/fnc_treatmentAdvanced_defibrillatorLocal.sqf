/*
 * Author: BaerMitUmlaut
 * Treatment with defibrillator (local).
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

if ((_target getVariable [QGVAR(heartRate), 80]) > 0) exitWith {
    [_target] call FUNC(setDead);
};

if (GVAR(exitReviveBy) > 0) then {
    _target setvariable [QGVAR(inReviveState), false, true];
    _target setvariable [QGVAR(inCardiacArrest), nil, true];
    _target setvariable [QGVAR(heartRate), 40];
    _target setvariable [QGVAR(bloodPressure), [50,70]];
};
