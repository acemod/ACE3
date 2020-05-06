#include "script_component.hpp"
/*
 * Author: voiper
 * Check a unit for any flashlights that can be used on map.
 *
 * Arguments:
 * 0: Unit to check <OBJECT>
 *
 * Return Value:
 * Flashlight classnames (empty for none) <ARRAY>
 *
 * Example:
 * player call ace_map_fnc_getUnitFlashlights
 *
 * Public: No
 */

params ["_unit"];

([_unit, true] call CBA_fnc_uniqueUnitItems) select {_x call FUNC(isFlashlight)} // return
