#include "script_component.hpp"
/*
 * Authors: Brett Mayson
 * Get the placeable flags in the player's inventory
 *
 * Arguments:
 * 0: Player <OBJECT>
 *
 * Return Value:
 * flags <ARRAY>
 *
 * Example:
 * call ace_marker_flags_getFlags
 *
 * Public: No
 */

params [["_unit", ace_player, [objNull]]];

(items _unit) arrayIntersect keys GVAR(weaponCache)
