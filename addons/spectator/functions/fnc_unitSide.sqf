/*
    Author:
    voiper

    Description:
    Retrieve unit's side, even after they join grpNull.

    Arguments:
    0: Unit to check <Object>

    Example:
    [unit] call ace_spectator_unitSide;

    Return Value:
    Side <Side>

    Public:
    No
*/

#include "script_component.hpp"

PARAMS_1(_unit);

private ["_side"];

if (alive _unit) then {
    _side = side (group _unit);
} else {
    _sideNum = getNumber (configFile >> "CfgVehicles" >> (typeOf _unit) >> "side");
    _side = switch _sideNum do {
        case 0: {OPFOR};
        case 1: {BLUFOR};
        case 2: {INDEPENDENT};
        case 3: {CIVILIAN};
    };
};

_side
