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
 * muzzle velocity shift - m/s <NUMBER>
 *
 * Example:
 * [[], 5] call ace_advanced_ballistics_fnc_calcilateAmmoTemperatureVelocityShift
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_muzzleVelocityShiftTable", "_temperature"];

// Check if muzzleVelocityShiftTable is Less Than 11 Entrys
if ((count _muzzleVelocityShiftTable) < 11) exitWith {0};
private _muzzleVelocityShiftTableUpperLimit = _muzzleVelocityShiftTable select 10;
if (isNil "_muzzleVelocityShiftTableUpperLimit") exitWith { 0 };

// Find exact data index required for given temperature
private _temperatureIndexFunction = (_temperature + 15) / 5;

// lower and upper data index used for interpolation
private _temperatureIndexA = (0 max (floor(_temperatureIndexFunction))) min 10;
private _temperatureIndexB = (0 max (ceil(_temperatureIndexFunction))) min 10;

// Interpolation ratio
private _interpolationRatio = _temperatureIndexFunction - floor(_temperatureIndexFunction);

// Interpolation
(_muzzleVelocityShiftTable select _temperatureIndexA) * (1 - _interpolationRatio) + (_muzzleVelocityShiftTable select _temperatureIndexB) * _interpolationRatio // Return
