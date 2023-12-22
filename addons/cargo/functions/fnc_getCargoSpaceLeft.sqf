#include "..\script_component.hpp"
/*
 * Author: Glowbal
 * Gets the object's remaining cargo space.
 *
 * Arguments:
 * 0: Holder object (vehicle) <OBJECT>
 *
 * Return Value:
 * Cargo space left <NUMBER>
 *
 * Example:
 * cursorObject call ace_cargo_fnc_getCargoSpaceLeft
 *
 * Public: No
 */

params ["_vehicle"];

_vehicle getVariable [QGVAR(space), getNumber (configOf _vehicle >> QGVAR(space))]
