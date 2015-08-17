/*
 * Author: Glowbal
 * Get the cargo space left on object
 *
 * Arguments:
 * 0: Object <OBJECT>
 *
 * Return value:
 * Cargo space left <NUMBER>
 *
 * Public: No
 */

#include "script_component.hpp"

params ["_vehicle"];
_vehicle getvariable [QGVAR(space), getNumber (configFile >> "CfgVehicles" >> typeof _vehicle >> QGVAR(space))];
