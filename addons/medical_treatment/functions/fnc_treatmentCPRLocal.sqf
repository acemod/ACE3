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

params ["_caller", "_target"];

if (_target getVariable [QEGVAR(medical,inReviveState), false]) then {
    private _reviveStartTime = _target getVariable [QEGVAR(medical,reviveStartTime),0];

    if (_reviveStartTime > 0) then {
        _target setVariable [QEGVAR(medical,reviveStartTime), (_reviveStartTime + random(20)) min CBA_missionTime];
    };
};

if ((random 1) >= 0.6) then {
    _target setVariable [QEGVAR(medical,inCardiacArrest), nil,true];
    _target setVariable [QEGVAR(medical,heartRate), 40];
    _target setVariable [QEGVAR(medical,bloodPressure), [50,70]];
    [QGVAR(CPRSucceeded), _target] call CBA_fnc_localEvent;
};

[_target, "activity", ELSTRING(medical,Activity_CPR), [[_caller, false, true] call EFUNC(common,getName)]] call FUNC(addToLog);
[_target, "activity_view", ELSTRING(medical,Activity_CPR), [[_caller, false, true] call EFUNC(common,getName)]] call FUNC(addToLog); // TODO expand message

true
