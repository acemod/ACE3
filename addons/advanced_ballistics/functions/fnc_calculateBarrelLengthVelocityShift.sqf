#include "..\script_component.hpp"
/*
 * Author: Ruthberg, MikeMatrix, joko // Jonas
 * Calculates the muzzle velocity shift caused by different barrel lengths.
 *
 * Arguments:
 * 0: Barrel length - mm <NUMBER>
 * 1: Muzzle velocity lookup table - m/s <ARRAY>
 * 2: Barrel length lookup table - mm <ARRAY>
 * 3: Reference muzzle velocity - m/s <NUMBER>
 *
 * Return Value:
 * Muzzle velocity shift - m/s <NUMBER>
 *
 * Example:
 * [508, [624, 816, 832, 838], [190.5, 368.3, 457.2, 508.0], 0] call ace_advanced_ballistics_fnc_calculateBarrelLengthVelocityShift
 *
 * Public: No
 */

params ["_barrelLength", "_muzzleVelocityTable", "_barrelLengthTable", "_muzzleVelocity"];
TRACE_4("params",_barrelLength,_muzzleVelocityTable,_barrelLengthTable,_muzzleVelocity);

// If barrel length is not defined, then there is no point in calculating muzzle velocity
if (_barrelLength == 0) exitWith {
    0 // return
};

private _muzzleVelocityTableCount = count _muzzleVelocityTable;

// Exit if tables are different sizes, have no elements or have only one element
if (_muzzleVelocityTableCount != count _barrelLengthTable || _muzzleVelocityTableCount == 0) exitWith {
    0 // return
};

if (_muzzleVelocityTableCount == 1) exitWith {
    (_muzzleVelocityTable select 0) - _muzzleVelocity // return
};

private _index = _barrelLengthTable find _barrelLength;

// If we have the precise barrel length value, return result immediately
if (_index != -1) exitWith {
    (_muzzleVelocityTable select _index) - _muzzleVelocity // return
};

// Limit values to lower and upper bound of data we have available
if (_barrelLength <= (_barrelLengthTable select 0)) exitWith {
    (_muzzleVelocityTable select 0) - _muzzleVelocity // return
};

if (_barrelLength >= (_barrelLengthTable select -1)) exitWith {
    (_muzzleVelocityTable select -1) - _muzzleVelocity // return
};

private _upperDataIndex = 0;
private _lowerDataIndex = 1;

// Find closest bordering values for barrel length
{
    if (_barrelLength <= _x) exitWith {
        _upperDataIndex = _forEachIndex;
        _lowerDataIndex = _upperDataIndex - 1;
    };
} forEach _barrelLengthTable;

(linearConversion [_barrelLengthTable select _lowerDataIndex, _barrelLengthTable select _upperDataIndex, _barrelLength, _muzzleVelocityTable select _lowerDataIndex, _muzzleVelocityTable select _upperDataIndex]) - _muzzleVelocity // return
