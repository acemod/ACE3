/*
 * Author: Glowbal
 * Get the cargo size of an object
 *
 * Arguments:
 * 0: Object <OBJECT>
 *
 * Return value:
 * Cargo size. <NUMBER> (default: -1)
 *
 * Public: No
 */

#include "script_component.hpp"

params ["_item", "_config"];
_config = (configFile >> "CfgVehicles" >> typeof _item >> QGVAR(size));
if (isNumber (_config)) exitwith {
    _item getvariable [QGVAR(size), getNumber (_config)];
};
-1
