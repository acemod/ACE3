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
    private ["_explosive", "_params", "_pfhId", "_placeTime", "_fuseTime"];
    _params = _this select 0;
    _pfhId = _this select 1;

    _placeTime = _params select 1;
    _fuseTime = _params select 0 select 1;

    // Skip first execution
    if (diag_tickTime < _placeTime + _fuseTime / 2) exitWith {};

    _explosive = (_params select 0) select 0;
    if (!isNull _explosive) then {
        [_explosive, -1, [_explosive, 0], true] call FUNC(detonateExplosive);
    };

    // Remove the PFH
    [_pfhId] call cba_fnc_removePerFrameHandler;
},_this select 1, [_this, diag_tickTime]] call CBA_fnc_addPerFrameHandler;
