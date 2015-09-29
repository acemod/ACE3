/*
 * Author: Glowbal
 * Triggers a unit into the Cardiac Arrest state from CMS. Will put the unit in an unconscious state and run a countdown timer until unit dies.
 * Timer is a random value between 120 and 720 seconds.
 *
 * Arguments:
 * 0: The unit that will be put in cardiac arrest state <OBJECT>
 *
 * ReturnValue:
 * None
 *
 * Public: yes
 */

#include "script_component.hpp"

private "_timeInCardiacArrest";
params ["_unit"];

if (_unit getvariable [QGVAR(inCardiacArrest),false]) exitwith {};
_unit setvariable [QGVAR(inCardiacArrest), true,true];
_unit setvariable [QGVAR(heartRate), 0];

["Medical_onEnteredCardiacArrest", [_unit]] call EFUNC(common,localEvent);

[_unit, true] call FUNC(setUnconscious);
_timeInCardiacArrest = 120 + round(random(600));

[{
    private ["_args","_unit","_startTime","_timeInCardiacArrest","_heartRate"];
    params ["_args", "_idPFH"];
    _args params ["_unit", "_startTime", "_timeInCardiacArrest"];

    _heartRate = _unit getvariable [QGVAR(heartRate), 80];
    if (_heartRate > 0 || !alive _unit) exitwith {
        [_idPFH] call CBA_fnc_removePerFrameHandler;
        _unit setvariable [QGVAR(inCardiacArrest), nil,true];
    };
    if (ACE_time - _startTime >= _timeInCardiacArrest) exitwith {
        [_idPFH] call CBA_fnc_removePerFrameHandler;
        _unit setvariable [QGVAR(inCardiacArrest), nil,true];
        [_unit] call FUNC(setDead);
    };
}, 1, [_unit, ACE_time, _timeInCardiacArrest] ] call CBA_fnc_addPerFrameHandler;
