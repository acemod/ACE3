#include "script_component.hpp"
/*
 * Author: Dslyecxi, MikeMatrix
 * Returns all players in a given range and in the units vehicle.
 *
 * Arguments:
 * 0: Unit <OBJECT>
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
_proximityPlayers deleteAt (_proximityPlayers find _unit);
_proximityPlayers append (crew vehicle _unit);

_proximityPlayers select {[_x, false] call EFUNC(common,isPlayer);}
