#include "..\script_component.hpp"
/*
 * Author: Ruthberg
 *
 * Reads the weapon class config and updates the config cache
 *
 * Arguments:
 * weapon - classname <STRING>
 *
 * Return Value:
 * 0: _barrelTwist <NUMBER>
 * 1: _twistDirection <NUMBER>
 * 2: _barrelLength <NUMBER>
 *
 * Example:
 * ["weapon"] call ace_advanced_ballistics_fnc_readWeaponDataFromConfig
 *
 * Public: No
 */

params ["_weapon", "_muzzle"];

if (isNil "_muzzle") then {_muzzle = _weapon};

// For most weapons muzzle == weapon (config value of "this" for muzzle)
private _weaponConfig = (configFile >> "CfgWeapons" >> _muzzle);

if (_muzzle != _weapon) then {
    _weaponConfig = (configFile >> "CfgWeapons" >> _weapon >> _muzzle);
};

private _barrelTwist = 0 max getNumber(_weaponConfig >> "ACE_barrelTwist");
private _twistDirection = parseNumber (_barrelTwist != 0);
if (isNumber (_weaponConfig >> "ACE_twistDirection")) then {
    _twistDirection = getNumber (_weaponConfig >> "ACE_twistDirection");
    if !(_twistDirection in [-1, 0, 1]) then {
        _twistDirection = 1;
    };
};

private _barrelLength = 0 max getNumber(_weaponConfig >> "ACE_barrelLength");

private _result = [_barrelTwist, _twistDirection, _barrelLength];

uiNamespace setVariable [format[QGVAR(%1_%2), _weapon, _muzzle], _result];

_result
