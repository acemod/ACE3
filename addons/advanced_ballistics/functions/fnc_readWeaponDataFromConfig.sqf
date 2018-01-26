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
#include "script_component.hpp"

private _weaponConfig = (configFile >> "CfgWeapons" >> _this);

private _barrelTwist = 0 max getNumber(_weaponConfig >> "ACE_barrelTwist");
private _twistDirection = [0, 1] select (_barrelTwist != 0);
if (isNumber (_weaponConfig >> "ACE_twistDirection")) then {
    _twistDirection = getNumber (_weaponConfig >> "ACE_twistDirection");
    if !(_twistDirection in [-1, 0, 1]) then {
        _twistDirection = 1;
    };
};

private _barrelLength = 0 max getNumber(_weaponConfig >> "ACE_barrelLength");

private _result = [_barrelTwist, _twistDirection, _barrelLength];

uiNamespace setVariable [format[QGVAR(%1), _this], _result];

_result
