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
[{
    EXPLODE_2_PVT(_this,_params,_pfhId);

    private ["_placeTime", "_fuseTime", "_explosive"];
    _placeTime = _params select 1;
    _fuseTime = _params select 0 select 1;

    // Exit if it's not time to detonate yet
    if (time < _placeTime + _fuseTime) exitWith {};

    // Remove the PFH
    [_pfhId] call cba_fnc_removePerFrameHandler;

    _explosive = (_params select 0) select 0;
    if (!isNull _explosive) then {
        [_explosive, -1, [_explosive, 0], true] call FUNC(detonateExplosive);
    };

},0, [_this, time]] call CBA_fnc_addPerFrameHandler;
