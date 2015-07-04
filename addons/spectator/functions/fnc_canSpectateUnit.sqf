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

(simulationEnabled _unit) && // Simulation enabled
//{!isObjectHidden _unit} && // Not hidden (currently dev branch only)
{!(_unit getVariable [QGVAR(isSpectator), false])} && // Who watches the watchmen?
{(GVAR(AI) || (isPlayer _unit))} && // Only allow AI when setting is enabled
{!GVAR(limitSide) || (([_unit] call FUNC(unitSide)) == GVAR(cachedSide))} // Only allow units of same side when setting is enabled
