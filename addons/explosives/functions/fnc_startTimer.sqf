/*
 * Author: Garth 'L-H' de Wet
 * Starts a timer for an explosive.
 *
 * Arguments:
 * 0: Explosive <OBJECT>
 * 1: Time till detonate <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [_explosive, 10] call ACE_Explosives_fnc_startTimer;
 *
 * Public: Yes
 */
#include "script_component.hpp"

params ["_explosive", "_delay"];
TRACE_2("params",_explosive,_delay);

[{
    params ["_explosive"];
    TRACE_1("Explosive Going Boom",_explosive);
    if (!isNull _explosive) then {
        [_explosive, -1, [_explosive, 0]] call FUNC(detonateExplosive);
    };
}, [_explosive], _delay] call EFUNC(common,waitAndExecute);
