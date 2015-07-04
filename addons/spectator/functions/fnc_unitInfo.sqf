/*
    Author:
    voiper

    Description:
    Retrieve unit name, side, and colour.

    Arguments:
    0: Unit <Object>

    Example:
    [player] call ace_spectator_fnc_unitInfo;

    Return Value:
    Name <String>, Side <Scalar>, Colour <Array>

    Public:
    No
*/

#include "script_component.hpp"

PARAMS_1(_unit);

_name = [_unit] call EFUNC(common,getName);
_side = [_unit] call FUNC(unitSide);
_colour = [_side] call FUNC(sideColour);

if (!alive _unit) then {
    {_colour set [_forEachIndex, _x / 2.5]} forEach _colour;
    _colour set [3, 0.8];
};

[_name, _side, _colour]
