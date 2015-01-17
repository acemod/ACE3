/*
    Author(s):
        Garth de Wet (LH)

    Description:
        Starts a timer for an explosive.

    Parameters:
        0: OBJECT - Explosive
        1: NUMBER - time till detonation

    Returns:
        Nothing

    Example:
        [_explosive, 10] call ACE_Explosives_fnc_startTimer;
*/
#include "script_component.hpp"

EXPLODE_2_PVT(_this,_explosive,_delay);

[{
    _explosive = _this;
    if (!isNull _explosive) then {
        [_explosive, -1, [_explosive, 0], true] call FUNC(detonateExplosive);
    };
}, _explosive, _delay, 0] call EFUNC(common,waitAndExecute);