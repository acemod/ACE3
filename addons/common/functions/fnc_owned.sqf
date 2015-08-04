/*
 * Author: commy2
 *
 * Counterpart of ace_common_fnc_claim. Check if the given object is claimed by another unit.
 *
 * Arguments:
 * 0: Any object. (Object)
 *
 * Return Value:
 * Is this object claimed by someone?
 *
 */
#include "script_component.hpp"

params ["_target"];

!isNull (_target getVariable [QGVAR(owner), objNull])
