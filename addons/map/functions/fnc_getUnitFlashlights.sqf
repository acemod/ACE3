/*
 * Author: voiper
 * Check a unit for any flashlights that can be used on map.
 *
 * Arguments:
 * 0: Unit to check <OBJECT>
 *
 * Return value:
 * Flashlight classnames (empty for none) <ARRAY>
 *
 * Example:
 * [unit] call ace_map_fnc_getUnitFlashlights;
 *
 * Public: No
 */

#include "script_component.hpp"

params ["_unit"];

(items _unit) select {isText (configFile >> "CfgWeapons" >> _x >> "ItemInfo" >> "Flashlight" >> "ACE_Flashlight_Colour")}