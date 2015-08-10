/*
 * Author: Glowbal
 * Get the cargo size of an object
 *
 * Arguments:
 * 0: Object <OBJECT>
 *
 * Return value:
 * Cargo size. -1 is not a size defined <NUMBER>
 *
 * Public: No
 */

#include "script_component.hpp"

params ["_item"];
if (isNumber (configFile >> "CfgVehicles" >> typeof _item >> QGVAR(size))) exitwith {
    _item getvariable [QGVAR(size), getNumber (configFile >> "CfgVehicles" >> typeof _item >> QGVAR(size))];
};
-1;
