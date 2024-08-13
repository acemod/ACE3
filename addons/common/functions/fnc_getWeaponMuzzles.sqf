#include "..\script_component.hpp"
/*
 * Author: commy2, johnb43
 * Get the muzzles of a weapon.
 *
 * Arguments:
 * 0: Weapon <STRING>
 *
 * Return Value:
 * All weapon muzzles <ARRAY>
 *
 * Example:
 * "arifle_AK12_F" call ace_common_fnc_getWeaponMuzzles
 *
 * Public: Yes
 */

params [["_weapon", "", [""]]];

private _config = configFile >> "CfgWeapons" >> _weapon;

if (!isClass _config) exitWith {
    [] // return
};

private _muzzles = [];

// Get config case muzzle names
{
    if (_x == "this") then {
        _muzzles pushBack (configName _config);
    } else {
        if (isClass (_config >> _x)) then {
            _muzzles pushBack (configName (_config >> _x));
        };
    };
} forEach getArray (_config >> "muzzles");

_muzzles // return
