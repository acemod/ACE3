/*
 * Author: Glowbal
 * Get the cargo size of an object.
 *
 * Arguments:
 * 0: Object <OBJECT>
 *
 * Return value:
 * Cargo size <NUMBER> (default: -1)
 *
 * Example:
 * [object] call ace_cargo_fnc_getSizeItem
 *
 * Public: No
 */
#include "script_component.hpp"

private "_config";

params ["_item"];

_config = (configFile >> "CfgVehicles" >> typeof _item >> QGVAR(size));

if (isNumber (_config)) exitWith {
    _item getVariable [QGVAR(size), getNumber (_config)]
};

-1
