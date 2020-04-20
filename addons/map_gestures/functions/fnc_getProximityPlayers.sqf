#include "script_component.hpp"
/*
 * Author: Dslyecxi, MikeMatrix
 * Returns all players in a given range and in the units vehicle.
 *
 * Arguments:
 * 0: Positions <ARRY<OBJECT, ARRAY>>
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

if (_positions isEqualType objNull || _positions isEqualTypeArray [0, 0, 0] || _positions isEqualTypeArray [0, 0]) then {
    _positions = [_positions];
};
private _proximityPlayers = [];
{
    _proximityPlayers append (_x nearEntities [["CAMAnBase"], _range]);
    if (_x isEqualType objNull) then {
        _proximityPlayers append (crew vehicle _x);
    };
} forEach _positions;

_proximityPlayers = _proximityPlayers select {[_x, false] call EFUNC(common,isPlayer);}
_proximityPlayers arrayIntersect _proximityPlayers;
