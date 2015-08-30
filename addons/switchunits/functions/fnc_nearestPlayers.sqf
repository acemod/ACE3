/*
 * Author: bux578
 * Returns an array of alive players in a given radius around a given location
 *
 * Arguments:
 * 0: Center position <POSTION>
 * 1: Radius <NUMBER>
 *
 * Return Value:
 * Player units <ARRAY<OBJECT>>
 *
 * Example:
 * [[300,300,0], 100] call ace_switchunits_fnc_nearestPlayers
 *
 * Public: Yes
 */
#include "script_component.hpp"

private ["_nearestPlayers"];

params ["_position", "_radius"];

_nearestPlayers = [];

{
    if ([_x] call EFUNC(common,isPlayer) && {alive _x}) then {
        _nearestPlayers pushBack _x;
    };
} forEach (nearestObjects [_position, ["Man"], _radius]);

_nearestPlayers
