/*
 * Author: Garth 'L-H' de Wet
 * Starts a timer for an explosive.
 *
 * Arguments:
 * 0: Explosive <OBJECT>
 * 1: Time till detonate <NUMBER>
 * 2: Trigger Item Classname <STRING> (default: "#timer")
 *
 * Return Value:
 * None
 *
 * Example:
 * [_explosive, 10] call ace_explosives_fnc_startTimer
 *
 * Public: Yes
 */
#include "script_component.hpp"

params ["_explosive", "_delay", ["_triggerClassname", "#timer", [""]]];
TRACE_3("startTimer",_explosive,_delay,_triggerClassname);

[{
    params ["_explosive", "_triggerClassname"];
    TRACE_1("Explosive Going Boom",_explosive);
    if (!isNull _explosive) then {
        [_explosive, -1, [_explosive, 0], _triggerClassname] call FUNC(detonateExplosive);
    };
}, [_explosive, _triggerClassname], _delay] call CBA_fnc_waitAndExecute;
