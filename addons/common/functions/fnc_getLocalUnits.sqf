#include "script_component.hpp"
/*
 * Author: dedmen
 * Gets localUnits array filtering out nullObjects.
 * If you can handle null objects you can use the array `ace_common_localUnits` directly.
 * Should be equivalent to `allUnits select {local _x}`
 *
 * Arguments:
 * Nothing
 *
 * Return Value:
 * Array of local Units <ARRAY>
 *
 * Example:
 * [] call ace_common_fnc_getLocalUnits
 *
 * Public: Yes
 */

// Remove null objects
GVAR(localUnits) = GVAR(localUnits) - [objNull];

GVAR(localUnits)
