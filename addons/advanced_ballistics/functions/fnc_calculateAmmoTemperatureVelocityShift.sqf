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
 *
 * Public: No
 */
#include "script_component.hpp"

private ["_muzzleVelocityShiftTableUpperLimit", "_temperatureIndexFunction",
    "_temperatureIndexA", "_temperatureIndexB", "_interpolationRatio"];
params["_muzzleVelocityShiftTable", "_temperature"];

// Check if muzzleVelocityShiftTable is Larger Than 11 Entrys
_muzzleVelocityShiftTableUpperLimit = _muzzleVelocityShiftTable select 10;
if (isNil "_muzzleVelocityShiftTableUpperLimit") exitWith { 0 };

// Find exact data index required for given temperature
_temperatureIndexFunction = (_temperature + 15) / 5;

// lower and upper data index used for interpolation
_temperatureIndexA = (0 max (floor(_temperatureIndexFunction)) min 10;
_temperatureIndexB = (0 max (ceil(_temperatureIndexFunction))) min 10;

// Interpolation ratio
_interpolationRatio = _temperatureIndexFunction - floor(_temperatureIndexFunction);

// Interpolation
(_muzzleVelocityShiftTable select _temperatureIndexA) * (1 - _interpolationRatio) + (_muzzleVelocityShiftTable select _temperatureIndexB) * _interpolationRatio // Return
