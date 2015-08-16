/*
 * Author: Glowbal
 * Get the cargo space left on object.
 *
 * Arguments:
 * 0: Object <OBJECT>
 *
 * Return value:
 * Cargo space left <NUMBER>
 *
 * Example:
 * [object] call ace_cargo_fnc_getCargoSpaceLeft
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_object"];

_object getVariable [QGVAR(space), getNumber (configFile >> "CfgVehicles" >> typeof _object >> QGVAR(space))];
