#include "..\script_component.hpp"
/*
 * Author: Ruthberg
 * Reads the weapon class config and caches it.
 *
 * Arguments:
 * 0: Weapon <STRING>
 * 1: Muzzle <STRING> (optional)
 *
 * Return Value:
 * 0: Barrel twist <NUMBER>
 * 1: Twist direction <NUMBER>
 * 2: Barrel length <NUMBER>
 *
 * Example:
 * [currentWeapon player, currentMuzzle player] call ace_advanced_ballistics_fnc_readWeaponDataFromConfig
 *
 * Public: No
 */

params ["_weapon"];

private _muzzle = param [1, _weapon];

GVAR(weaponData) getOrDefaultCall [[_weapon, _muzzle], {
    // For most weapons muzzle == weapon (config value of "this" for muzzle)
    private _weaponConfig = if (_muzzle == _weapon) then {
        configFile >> "CfgWeapons" >> _weapon
    } else {
        configFile >> "CfgWeapons" >> _weapon >> _muzzle
    };

    private _barrelTwist = 0 max getNumber (_weaponConfig >> "ACE_barrelTwist");
    private _twistDirection = if (isNumber (_weaponConfig >> "ACE_twistDirection")) then {
        private _twistDirection = getNumber (_weaponConfig >> "ACE_twistDirection");

        [1, _twistDirection] select (_twistDirection in [-1, 0, 1])
    } else {
        parseNumber (_barrelTwist != 0)
    };

    private _barrelLength = 0 max getNumber (_weaponConfig >> "ACE_barrelLength");

    [_barrelTwist, _twistDirection, _barrelLength]
}, true] // return
