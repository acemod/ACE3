#include "..\script_component.hpp"
/*
 * Author: Garth 'L-H' de Wet
 * Starts a timer for an explosive.
 *
 * Arguments:
 * 0: Explosive <OBJECT>
 * 1: Time till detonate <NUMBER>
 * 2: Trigger classname <STRING> (default: "#timer")
 * 3: Unit <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [_explosive, 10] call ace_explosives_fnc_startTimer
 *
 * Public: Yes
 */

params ["_explosive", "_delay", ["_trigger", "#timer", [""]], ["_unit", objNull, [objNull]]];
TRACE_4("Starting timer",_explosive,_delay,_trigger,_unit);

[{
    params ["_explosive", "_trigger", "_unit"];
    TRACE_1("Explosive detonating from timer",_explosive);
    if (!isNull _explosive) then {
        [_unit, -1, [_explosive, 0], _trigger] call FUNC(detonateExplosive);
    };
}, [_explosive, _trigger, _unit], _delay] call CBA_fnc_waitAndExecute;
