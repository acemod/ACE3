/*
 * Author: Ruthberg
 * Updates the scope base angle based on the zero range input
 *
 * Arguments:
 * Nothing
 *
 * Return Value:
 * Nothing
 *
 * Example:
 * call ace_atragmx_fnc_update_zero_range
 *
 * Public: No
 */
#include "script_component.hpp"

private ["_zeroRange","_altitude", "_temperature", "_barometricPressure", "_relativeHumidity","_result"];

GVAR(workingMemory) params [
    "", // 0
    "_muzzleVelocity", // 1
    "_range", // 2
    "_scopeBaseAngle", // 3
    "_airFriction", // 4
    "_boreHeight", // 5
    "", // 6
    "", // 7
    "", // 8
    "", // 9
    "", // 10
    "", // 11
    "_bulletMass", // 12
    "_bulletDiameter", // 13
    "_barrelTwist", // 14
    "_bc", // 15
    "_dragModel", // 16
    "_atmosphereModel" // 17
];

_zeroRange = Round(parseNumber(ctrlText 120060));
if (GVAR(currentUnit) == 1) then {
    _zeroRange = _zeroRange / 1.0936133;
};
if (_zeroRange < 10) exitWith {
    GVAR(workingMemory) set [2, _zeroRange];
    GVAR(workingMemory) set [3, 0];
};

_altitude = GVAR(altitude);
_temperature = GVAR(temperature);
_barometricPressure = GVAR(barometricPressure);
_relativeHumidity = GVAR(relativeHumidity);

_result = [_scopeBaseAngle, _bulletMass, _boreHeight, _airFriction, _muzzleVelocity, _temperature, _barometricPressure, _relativeHumidity, 1000, [0, 0], 0, 0, 0, _zeroRange, _bc, _dragModel, _atmosphereModel, false, 1.5, 0, 0, 0] call FUNC(calculate_solution);

GVAR(workingMemory) set [2, _zeroRange];
GVAR(workingMemory) set [3, _scopeBaseAngle + (_result select 0) / 60];
