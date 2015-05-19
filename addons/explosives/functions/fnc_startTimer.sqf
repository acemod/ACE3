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

EXPLODE_2_PVT(_this,_explosive,_delay);

[{
    private ["_explosive"];
    _explosive = _this;
    if (!isNull _explosive) then {
        [_explosive, -1, [_explosive, 0]] call FUNC(detonateExplosive);
    };
}, _explosive, _delay, 0] call EFUNC(common,waitAndExecute);
