#include "script_component.hpp"
/*
 * Authors: Brett Mayson
 * Get the placeable flags in the player's inventory
 *
 * Arguments:
 * None
 *
 * Return Value:
 * flags <ARRAY>
 *
 * Example:
 * call ace_marker_flags_getFlags
 *
 * Public: No
 */

(items player) arrayIntersect keys GVAR(weaponCache)
