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
 * ["example value"] call ace_module_fnc_functionName
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_unit", "_range"];

_proximityPlayers = (getPos _unit) nearEntities [["CAMAnBase"], _range];
_proximityPlayers deleteAt (_proximityPlayers find _unit);
_proximityPlayers append (crew vehicle _unit)
_proximityPlayers
