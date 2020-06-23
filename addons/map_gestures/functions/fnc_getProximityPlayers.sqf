#include "script_component.hpp"
/*
 * Author: Dslyecxi, MikeMatrix
 * Returns all players in a given range and in the units vehicle.
 *
 * Arguments:
 * 0: Positions (objects or posAGLs) <ARRAY>
 * 1: Range <NUMBER>
 *
 * Return Value:
 * All units in proximity <ARRAY<OBJECT>>
 *
 * Example:
 * [[player], 7] call ace_map_gestures_fnc_getProximityPlayers
 *
 * Public: No
 */

params ["_positions", "_range"];

private _proximityPlayers = [];

{
    _proximityPlayers append (_x nearEntities [["CAMAnBase"], _range]);
    if (_x isEqualType objNull) then {
        _proximityPlayers append (crew vehicle _x);
    };
} forEach _positions;

_proximityPlayers = _proximityPlayers arrayIntersect _proximityPlayers;

_proximityPlayers = _proximityPlayers select { [_x, false] call EFUNC(common,isPlayer); };

if (GVAR(onlyShowFriendlys)) then {
    _proximityPlayers = _proximityPlayers select { [side group ace_player, side _x] call BIS_fnc_areFriendly; };
};

_proximityPlayers
