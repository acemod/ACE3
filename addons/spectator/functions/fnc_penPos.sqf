/*
    Author:
    voiper

    Description:
    Determine spec pen position.

    Arguments:
    None

    Example:
    call ace_spectator_fnc_penPos;

    Return Value:
    None

    Public:
    No
*/

#include "script_component.hpp"

_mapSize = (configFile >> "CfgWorlds" >> worldName >> "mapSize");
_worldEdge = if (isNumber _mapSize) then {getNumber _mapSize} else {32768};
_pos = [_worldEdge * 2, _worldEdge * 2];

if (surfaceisWater _pos) then {
    _pos set [2, -1.4];
    GVAR(penPos) = ASLtoATL _pos;
} else {
    _pos set [2, 0];
    GVAR(penPos) = _pos;
};