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

local _flashlights = [];

{
    if ((isText (configFile >> "CfgWeapons" >> _x >> "ItemInfo" >> "FlashLight" >> "ACE_Flashlight_Colour")) && !(_x in _flashlights)) then {
        _flashlights pushBack _x;
    };
} forEach (items _unit);

_flashlights
