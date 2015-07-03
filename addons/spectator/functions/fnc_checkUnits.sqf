/*
    Author:
    voiper

    Description:
    Compile array of units to spectate.
    
    Arguments:
    None.
    
    Example:
    call ace_spectator_fnc_checkUnits;

    Return Value:
    None
    
    Public:
    No
*/

#include "script_component.hpp"

_units = allUnits;
_units append allDead;
GVAR(units) = [];

{
    _listed = _x getVariable [QGVAR(listed), false];
    if (!_listed) then {
        [_x] call FUNC(unitVar);
        _x addEventHandler ["Killed", {_this call FUNC(killed)}];
        _x addEventHandler ["Respawn", {_this call FUNC(respawn)}];
        _x setVariable [QGVAR(listed), true];
    };
    
    if ([_x] call FUNC(canSpectateUnit)) then {GVAR(units) pushback _x};
} forEach _units;