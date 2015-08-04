/*
 * Author: Ruthberg
 *
 * Calculates the ammo temperature induced muzzle velocity shift
 *
 * Arguments:
 * 0: muzzle velocity shift lookup table - m/s <ARRAY>
 * 1: temperature - degrees celcius <NUMBER>
 *
 * Return Value:
 * 0: muzzle velocity shift - m/s <NUMBER>
 *
 * Return value:
 * None
 */
#include "script_component.hpp"

private ["_muzzleVelocityShift", "_temperatureIndexA", "_temperatureIndexB", "_temperatureRatio"];
params["_muzzleVelocityShiftTable"."_temperature"];

if (count _muzzleVelocityShiftTable != 11) exitWith { 0 };

_temperatureIndexA = floor((_temperature + 15) / 5);
_temperatureIndexA = 0 max _temperatureIndexA;
_temperatureIndexA = _temperatureIndexA min 10;

_temperatureIndexB = ceil((_temperature + 15) / 5);
_temperatureIndexB = 0 max _temperatureIndexB;
_temperatureIndexB = _temperatureIndexB min 10;

_temperatureRatio = ((_temperature + 15) / 5) - floor((_temperature + 15) / 5);

_muzzleVelocityShift = (_muzzleVelocityShiftTable select _temperatureIndexA) * (1 - _temperatureRatio) + (_muzzleVelocityShiftTable select _temperatureIndexB) * _temperatureRatio;

_muzzleVelocityShift
