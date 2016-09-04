/*
 * Author: voiper
 * Check a unit for any flashlights that can be used on map.
 *
 * Arguments:
 * 0: Unit to check <OBJECT>
 *
 * Return Value:
 * Flashlight classnames (empty for none) <ARRAY>
 *
 * Example:
 * [unit] call ace_map_fnc_getUnitFlashlights;
 *
 * Public: No
 */

#include "script_component.hpp"

params ["_unit"];

private _flashlights = [];

{
    if (isText (configFile >> "CfgWeapons" >> _x >> "ItemInfo" >> "FlashLight" >> "ACE_Flashlight_Colour")) then {
        _flashlights pushBackUnique _x;
    };
} forEach (items _unit);

_flashlights
