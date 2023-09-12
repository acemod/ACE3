#include "..\script_component.hpp"
/*
 * Authors: Brett Mayson
 * Get the placeable flags in the unit's inventory.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * flags <ARRAY>
 *
 * Example:
 * [_unit] call ace_marker_flags_fnc_getFlags
 *
 * Public: No
 */

params ["_unit"];

(_unit call EFUNC(common,uniqueItems)) arrayIntersect keys GVAR(flagCache)
