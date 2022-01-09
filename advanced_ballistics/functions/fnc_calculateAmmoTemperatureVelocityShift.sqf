#include "script_component.hpp"
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
 * [[], 5] call ace_advanced_ballistics_fnc_calculateAmmoTemperatureVelocityShift
 *
 * Public: No
 */

params ["_muzzleVelocityShiftTable", "_temperature"];

// Check if muzzleVelocityShiftTable is less than 11 Entrys
if ((count _muzzleVelocityShiftTable) < 11) exitWith {0};
private _muzzleVelocityShiftTableUpperLimit = _muzzleVelocityShiftTable select 10;
if (isNil "_muzzleVelocityShiftTableUpperLimit") exitWith {0};

// Find exact data index required for given temperature
private _temperatureIndexFunction = 0 max ((_temperature + 15) / 5) min 10;

// Lower and upper data index used for interpolation
private _temperatureIndexA = floor(_temperatureIndexFunction);
private _temperatureIndexB = ceil(_temperatureIndexFunction);

linearConversion [_temperatureIndexA, _temperatureIndexB, _temperatureIndexFunction, _muzzleVelocityShiftTable select _temperatureIndexA, _muzzleVelocityShiftTable select _temperatureIndexB, true] // Return
