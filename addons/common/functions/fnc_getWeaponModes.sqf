#include "..\script_component.hpp"
/*
 * Author: commy2, johnb43
 * Get the available firing modes of a weapon. Will ignore the AI helper modes.
 *
 * Arguments:
 * 0: Weapon <STRING>
 * 1: Muzzle <STRING> (default: weapon)
 *
 * Return Value:
 * Firing Modes <ARRAY>
 *
 * Example:
 * "arifle_AK12_F" call ace_common_fnc_getWeaponModes
 *
 * Public: Yes
 */

params [["_weapon", "", [""]], ["_muzzle", nil, [""]]];

private _config = configFile >> "CfgWeapons" >> _weapon;

if (!isNil "_muzzle") then {
    _config = _config >> _muzzle
};

if (!isClass _config) exitWith {
    [] // return
};

private _modes = [];

{
    if (getNumber (_config >> _x >> "showToPlayer") == 1) then {
        if (_x == "this") then {
            _modes pushBack (configName _config);
        } else {
            if (isClass (_config >> _x)) then {
                _modes pushBack (configName (_config >> _x));
            };
        };
    };
} forEach getArray (_config >> "modes");

_modes // return
