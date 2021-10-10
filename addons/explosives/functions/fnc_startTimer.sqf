#include "script_component.hpp"
/*
 * Author: Garth 'L-H' de Wet
 * Starts a timer for an explosive.
 *
 * Arguments:
 * 0: Explosive <OBJECT>
 * 1: Time till detonate <NUMBER>
 * 2: Trigger classname <STRING> (default: "#timer")
 *
 * Return Value:
 * None
 *
 * Example:
 * [_explosive, 10] call ace_explosives_fnc_startTimer
 *
 * Public: Yes
 */

params ["_explosive", "_delay", ["_trigger", "#timer", [""]]];
TRACE_3("Starting timer",_explosive,_delay,_trigger);

[{
    params ["_explosive", "_trigger"];
    TRACE_1("Explosive detonating from timer",_explosive);
    if (!isNull _explosive) then {
        [_explosive, -1, [_explosive, 0], _trigger] call FUNC(detonateExplosive);
    };
}, [_explosive, _trigger], _delay] call CBA_fnc_waitAndExecute;
