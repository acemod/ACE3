#include "script_component.hpp"
/*
 * Author: commy2
 * Counterpart of ace_common_fnc_claim. Check if the given object is claimed by another unit.
 *
 * Arguments:
 * 0: Any object. <OBJECT>
 *
 * Return Value:
 * Is this object claimed by someone? <BOOL>
 *
 * Example:
 * [bob] call ace_common_fnc_owned
 *
 * Public: No
 */

params ["_target"];

!isNull (_target getVariable [QGVAR(owner), objNull])
