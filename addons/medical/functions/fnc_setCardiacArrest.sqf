/*
 * Author: Glowbal
 * Triggers a unit into the Cardiac Arrest state from CMS. Will put the unit in an unconscious state and run a countdown timer until unit dies.
 * Timer is a random value between 120 and 720 seconds.
 *
 * Arguments:
 * 0: The unit that will be put in cardiac arrest state <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [bob] call ace_medical_fnc_setCardiacArrest
 *
 * Public: yes
 */

#include "script_component.hpp"

params ["_unit"];

if (_unit getVariable [QGVAR(inCardiacArrest),false]) exitWith {};
_unit setVariable [QGVAR(inCardiacArrest), true,true];
_unit setVariable [QGVAR(heartRate), 0];

["ace_cardiacArrestEntered", [_unit]] call CBA_fnc_localEvent;

[_unit, true] call FUNC(setUnconscious);
private _timeInCardiacArrest = 120 + round(random(600));

[{
    params ["_args", "_idPFH"];
    _args params ["_unit", "_startTime", "_timeInCardiacArrest"];

    private _heartRate = _unit getVariable [QGVAR(heartRate), 80];
    if (_heartRate > 0 || !alive _unit) exitWith {
        [_idPFH] call CBA_fnc_removePerFrameHandler;
        _unit setVariable [QGVAR(inCardiacArrest), nil,true];
    };
    if (CBA_missionTime - _startTime >= _timeInCardiacArrest) exitWith {
        [_idPFH] call CBA_fnc_removePerFrameHandler;
        _unit setVariable [QGVAR(inCardiacArrest), nil,true];
        [_unit] call FUNC(setDead);
    };
}, 1, [_unit, CBA_missionTime, _timeInCardiacArrest] ] call CBA_fnc_addPerFrameHandler;
