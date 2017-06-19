/*
 * Author: Ruthberg, MikeMatrix, joko // Jonas
 *
 * Calculates the muzzle velocity shift caused by different barrel lengths
 *
 * Arguments:
 * 0: barrel length - mm <NUMBER>
 * 1: muzzle velocity lookup table - m/s <ARRAY>
 * 2: barrel length lookup table - mm <ARRAY>
 * 3: muzzle velocity - m/s <NUMBER>
 *
 * Return Value:
 * muzzle velocity shift - m/s <NUMBER>
 *
 * Example:
 * [5, [0,5], [0,5], 5] call ace_advanced_ballistics_fnc_calculateBarrelLengthVelocityShift
 *
 * Public: No
 */
#include "script_component.hpp"

scopeName "main";

private ["_muzzleVelocityTableCount", "_barrelLengthTableCount", "_lowerDataIndex",
    "_upperDataIndex", "_lowerBarrelLength", "_upperBarrelLength", "_lowerMuzzleVelocity",
    "_upperMuzzleVelocity", "_interpolationRatio"];
params ["_barrelLength", "_muzzleVelocityTable", "_barrelLengthTable", "_muzzleVelocity"];
TRACE_4("params",_barrelLength,_muzzleVelocityTable,_barrelLengthTable,_muzzleVelocity);

// If barrel length is not defined, then there is no point in calculating muzzle velocity
if (_barrelLength == 0) exitWith { 0 };

_muzzleVelocityTableCount = count _muzzleVelocityTable;
_barrelLengthTableCount = count _barrelLengthTable;

// Exit if tables are different sizes, have no elements or have only one element
if (_muzzleVelocityTableCount != _barrelLengthTableCount || _muzzleVelocityTableCount == 0 || _barrelLengthTableCount == 0) exitWith { 0 };
if (_muzzleVelocityTableCount == 1) exitWith { (_muzzleVelocityTable select 0) - _muzzleVelocity };

// If we have the precise barrel length value, return result immediately
if (_barrelLength in _barrelLengthTable) exitWith {
    (_muzzleVelocityTable select (_barrelLengthTable find _barrelLength)) - _muzzleVelocity
};

// Limit values to lower and upper bound of data we have available
if (_barrelLength <= (_barrelLengthTable select 0)) exitWith { (_muzzleVelocityTable select 0) - _muzzleVelocity };
if (_barrelLength >= (_barrelLengthTable select _barrelLengthTableCount - 1)) exitWith { (_muzzleVelocityTable select _barrelLengthTableCount - 1) - _muzzleVelocity };

// Find closest bordering values for barrel length
{
    if (_barrelLength <= _x) then {
        _upperDataIndex = _forEachIndex;
        _lowerDataIndex = _upperDataIndex - 1;
        breakTo "main";
    };
} forEach _barrelLengthTable;

// Worst case scenario
if (isNil "_lowerDataIndex" || isNil "_upperDataIndex") exitWith {0};

_lowerBarrelLength = _barrelLengthTable select _lowerDataIndex;
_upperBarrelLength = _barrelLengthTable select _upperDataIndex;
_lowerMuzzleVelocity = _muzzleVelocityTable select _lowerDataIndex;
_upperMuzzleVelocity = _muzzleVelocityTable select _upperDataIndex;

// Calculate interpolation ratio
_interpolationRatio = if (abs (_lowerBarrelLength - _upperBarrelLength) > 0) then {
    (_upperBarrelLength - _barrelLength) / (_upperBarrelLength - _lowerBarrelLength)
} else {
    0
};

// Calculate interpolated muzzle velocity shift
(_lowerMuzzleVelocity + ((_upperMuzzleVelocity - _lowerMuzzleVelocity) * (1 - _interpolationRatio))) - _muzzleVelocity // Return
