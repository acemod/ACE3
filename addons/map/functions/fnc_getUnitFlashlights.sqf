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

{
    private _item = _x;
    private _weaponConfig = configFile >> "CfgWeapons" >> _item;
    {
        if (
            isText (_x >> "ACE_Flashlight_Colour")
            || {!(getArray (_x >> "ambient") in [[], [0,0,0]])}
        ) then {
            _flashlights pushBackUnique _item;
        };
    } forEach [
        _weaponConfig >> "ItemInfo" >> "FlashLight",
        _weaponConfig >> "FlashLight"
    ];
} forEach ([_unit, true] call CBA_fnc_uniqueUnitItems);

_flashlights
