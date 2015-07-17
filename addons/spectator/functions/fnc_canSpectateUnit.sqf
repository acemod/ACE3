/*
    Author:
    voiper

    Description:
    Check if a unit is suitable to spectate.

    Arguments:
    0: Unit to check <Object>

    Example:
    [unit] call ace_spectator_canSpectateUnit;

    Return Value:
    Whether is suitable to spectate <Bool>

    Public:
    No
*/

#include "script_component.hpp"

_unit = _this select 0;

if (_unit distance GVAR(penPos) < 200) exitWith {false};
if (_unit distance [0,0,0] < 100) exitWith {false};
if (!GVAR(AI) && !isPlayer _unit) exitWith {false};
if (GVAR(limitSide) && (([_unit] call FUNC(unitSide)) != GVAR(playerSide))) exitWith {false};

true