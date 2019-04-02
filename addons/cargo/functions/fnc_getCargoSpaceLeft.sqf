#include "script_component.hpp"
/*
 * Author: Glowbal
 * Get the cargo space left on object.
 *
 * Arguments:
 * 0: Object <OBJECT>
 *
 * Return Value:
 * Cargo space left <NUMBER>
 *
 * Example:
 * [object] call ace_cargo_fnc_getCargoSpaceLeft
 *
 * Public: No
 */

params ["_object"];
// TRACE_1("params",_object);

(_object getVariable [QGVAR(space), getNumber (configFile >> "CfgVehicles" >> typeOf _object >> QGVAR(space))]) max 0
