#include "..\script_component.hpp"
/*
 * Authors: Brett Mayson
 * Checks if a flag can be placed by a unit.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * Can place <BOOL>
 *
 * Example:
 * player call ace_marker_flags_fnc_canPlace
 *
 * Public: No
 */

params ["_unit"];

GVAR(placeAnywhere) || {_unit call EFUNC(common,canDig)}
