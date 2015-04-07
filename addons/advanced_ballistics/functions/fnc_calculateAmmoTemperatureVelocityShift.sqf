/*
 * Author: Ruthberg
 *
 * Calculates the ammo temperature induced muzzle velocity shift
 *
 * Arguments:
 * 0: ammo - classname <string>
 * 1: temperature - degrees celcius <NUMBER>
 *
 * Return Value:
 * 0: muzzle velocity shift - m/s <NUMBER>
 *
 * Return value:
 * None
 */
#include "script_component.hpp"

private ["_ammo", "_temperature", "_muzzleVelocityTable", "_muzzleVelocityShift", "_temperatureIndexA", "_temperatureIndexB", "_temperatureRatio"];
_ammo           = _this select 0;
_temperature    = _this select 1;

_muzzleVelocityTable = [];

if (isArray(configFile >> "cfgAmmo" >> _ammo >> "ACE_ammoTempMuzzleVelocityShifts")) then {
    _muzzleVelocityTable = getArray(configFile >> "cfgAmmo" >> _ammo >> "ACE_ammoTempMuzzleVelocityShifts");
};

if (count _muzzleVelocityTable != 11) exitWith { 0 };

_temperatureIndexA = floor((_temperature + 15) / 5);
_temperatureIndexA = 0 max _temperatureIndexA;
_temperatureIndexA = _temperatureIndexA min 10;

_temperatureIndexB = ceil((_temperature + 15) / 5);
_temperatureIndexB = 0 max _temperatureIndexB;
_temperatureIndexB = _temperatureIndexB min 10;

_temperatureRatio = ((_temperature + 15) / 5) - floor((_temperature + 15) / 5);

_muzzleVelocityShift = (_muzzleVelocityTable select _temperatureIndexA) * (1 - _temperatureRatio) + (_muzzleVelocityTable select _temperatureIndexB) * _temperatureRatio;

_muzzleVelocityShift
