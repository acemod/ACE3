#include "..\script_component.hpp"
/*
 * Author: Timi007
 * Get the placeable and carryable flags in the unit's inventory.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * Flag items <ARRAY>
 *
 * Example:
 * [player] call ace_flags_fnc_getFlags
 *
 * Public: No
 */

params ["_unit"];

(_unit call EFUNC(common,uniqueItems)) arrayIntersect keys GVAR(flagItemCache)
