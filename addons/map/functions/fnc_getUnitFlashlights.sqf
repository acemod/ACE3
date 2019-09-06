#include "script_component.hpp"
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
 * player call ace_map_fnc_getUnitFlashlights
 *
 * Public: No
 */

params ["_unit"];

private _flashlights = [];
private _cfgWeapons = configFile >> "CfgWeapons";

{
    private _weaponConfig = _cfgWeapons >> _x;
    if (
        -1 < [
            _weaponConfig >> "ItemInfo" >> "FlashLight",
            _weaponConfig >> "FlashLight"
        ] findIf {
            isText (_x >> "ACE_Flashlight_Colour")
            || {!(getArray (_x >> "ambient") in [[], [0,0,0]])}
        }
    ) then {
        _flashlights pushBack _x;
    };
} forEach ([_unit, true] call CBA_fnc_uniqueUnitItems);

_flashlights
