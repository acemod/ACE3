#include "script_component.hpp"
/*
 * Author: Dslyecxi, MikeMatrix
 * Returns all players in a given range and in the units vehicle.
 *
 * Arguments:
 * 0: Unit <OBJECT, ARRAY>
 * 1: Range <NUMBER>
 *
 * Return Value:
 * All units in proximity <ARRAY>
 *
 * Example:
 * [player, 7] call ace_map_gestures_fnc_getProximityPlayers
 *
 * Public: No
 */

params ["_unit", "_range"];

private _proximityPlayers = _unit nearEntities [["CAMAnBase"], _range];
if (_unit isEqualType objNull) then {
    _proximityPlayers append (crew vehicle _unit);
};

_proximityPlayers = _proximityPlayers select {[_x, false] call EFUNC(common,isPlayer);}
_proximityPlayers arrayIntersect _proximityPlayers;
