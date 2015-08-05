/*
 * Author: Ruthberg
 *
 * Reads the weapon class config and updates the config cache
 *
 * Arguments:
 * 0: weapon - classname <STRING>
 *
 * Return Value:
 * 0: _barrelTwist
 * 1: _twistDirection
 * 2: _barrelLength
 *
 * Public: No
 */
#include "script_component.hpp"

private ["_weapon", "_barrelTwist", "_twistDirection", "_barrelLength", "_result"];
_weapon = _this;

_barrelTwist = getNumber(configFile >> "CfgWeapons" >> _weapon >> "ACE_barrelTwist");
_twistDirection = 1;
if (isNumber(configFile >> "CfgWeapons" >> _weapon >> "ACE_twistDirection")) then {
    _twistDirection = getNumber(configFile >> "CfgWeapons" >> _weapon >> "ACE_twistDirection");
    if (_twistDirection != -1 && _twistDirection != 0 &&  _twistDirection != 1) then {
        _twistDirection = 1;
    };
};
_barrelLength = getNumber(configFile >> "CfgWeapons" >> _weapon >> "ACE_barrelLength");

_result = [_barrelTwist, _twistDirection, _barrelLength];

uiNamespace setVariable [format[QGVAR(%1), _weapon], _result];

_result
