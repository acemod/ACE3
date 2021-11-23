#include "script_component.hpp"
/*
 * Authors: Brett Mayson
 * Checks if a flag can be placed by a unit
 *
 * Arguments:
 * 0: Player <OBJECT>
 *
 * Return Value:
 * Can place <BOOLEAN>
 *
 * Example:
 * ace_player call ace_marker_flags_canPlace
 *
 * Public: No
 */

params ["_unit"];

GVAR(placeAnywhere) || { _unit call EFUNC(common,canDig) }
