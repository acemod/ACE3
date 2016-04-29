/*
 * Author: BaerMitUmlaut
 * Switches the turbine starter of any aircraft on or off. Internal function, disconnected from the switch.
 *
 * Arguments:
 * 0: Aircraft <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [_helo] call ace_cockpit_interaction_fnc_switchStarterInternal
 *
 * Public: No
 */

#include "script_component.hpp"
params ["_vehicle"];

[{
    params ["_args", "_pfhID"];
    _args params ["_vehicle", "_startTime"];

    if !(_vehicle getVariable [QGVAR(hasElectricalPower), false] && {_vehicle getVariable [QGVAR(starterOn), false]}) exitWith {
        [_pfhID] call CBA_fnc_removePerFrameHandler;
    };

    if ((ACE_time - _startTime) > (5 + random 3)) exitWith {
        [QGVAR(setEngineOn), _vehicle, [_vehicle, true]] call EFUNC(common,objectEvent);
        [_pfhID] call CBA_fnc_removePerFrameHandler;
    };
}, 0, [_vehicle, ACE_time]] call CBA_fnc_addPerFrameHandler;
