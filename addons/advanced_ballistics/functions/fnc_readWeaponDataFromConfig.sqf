/*
 * Author: Ruthberg
 *
 * Reads the weapon class config and updates the config cache
 *
 * Arguments:
 * weapon - classname <STRING>
 *
 * Return Value:
 * 0: _barrelTwist
 * 1: _twistDirection
 * 2: _barrelLength
 *
 * Public: No
 */
#include "script_component.hpp"

private _weaponConfig = (configFile >> "CfgWeapons" >> _this);

private _barrelTwist = getNumber(_weaponConfig >> "ACE_barrelTwist");
private _twistDirection = 1;
if (isNumber (_weaponConfig >> "ACE_twistDirection")) then {
    _twistDirection = getNumber (_weaponConfig >> "ACE_twistDirection");
    if !(_twistDirection in [-1, 0, 1]) then {
        _twistDirection = 1;
    };
};

private _barrelLength = getNumber(_weaponConfig >> "ACE_barrelLength");

private _result = [_barrelTwist, _twistDirection, _barrelLength];

uiNamespace setVariable [format[QGVAR(%1), _this], _result];

_result
