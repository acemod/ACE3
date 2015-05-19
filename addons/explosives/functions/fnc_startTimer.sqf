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
    EXPLODE_2_PVT(_this,_explosive,_delay);
    playSound "ACE_Sound_Click";
    [{
        if (!isNull _this) then {
            [_this, -1, [_this, 0]] call FUNC(detonateExplosive);
        };
    }, _explosive, _delay, 0] call EFUNC(common,waitAndExecute);
}, [_explosive, _delay], 5, 0.5] call EFUNC(common,waitAndExecute);
