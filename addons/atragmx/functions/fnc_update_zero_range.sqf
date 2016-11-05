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

[] call FUNC(parse_input);

private ["_scopeBaseAngle"];
_scopeBaseAngle = (GVAR(workingMemory) select 3);

private ["_bulletMass", "_boreHeight", "_airFriction", "_muzzleVelocity", "_bc", "_dragModel", "_atmosphereModel"];
_bulletMass = GVAR(workingMemory) select 12;
_boreHeight = GVAR(workingMemory) select 5;
_airFriction = GVAR(workingMemory) select 4;
_muzzleVelocity = GVAR(workingMemory) select 1;
_bc = GVAR(workingMemory) select 15;
_dragModel = GVAR(workingMemory) select 16;
_atmosphereModel = GVAR(workingMemory) select 17;

private ["_zeroRange"];
_zeroRange = GVAR(workingMemory) select 2;
if (_zeroRange < 10) exitWith {
    GVAR(workingMemory) set [2, _zeroRange];
    GVAR(workingMemory) set [3, 0];
};

private ["_altitude", "_temperature", "_barometricPressure", "_relativeHumidity"];
_altitude = GVAR(altitude);
_temperature = GVAR(temperature);
_barometricPressure = GVAR(barometricPressure);
_relativeHumidity = GVAR(relativeHumidity);
if (!GVAR(atmosphereModeTBH)) then {
    _barometricPressure = 1013.25 * (1 - (0.0065 * _altitude) / (273.15 + _temperature + 0.0065 * _altitude)) ^ 5.255754495;
    _relativeHumidity = 50;
};

{
    private _result = [_scopeBaseAngle, _bulletMass, _boreHeight, _airFriction, _muzzleVelocity, _temperature, _barometricPressure, _relativeHumidity, 1000, [0, 0], 0, 0, 0, _zeroRange, _bc, _dragModel, _atmosphereModel, false, 1.5, 0, 0, 0] call FUNC(calculate_solution);
    private _offset = (_result select 0) / 60;
    _scopeBaseAngle = _scopeBaseAngle + _offset;
    if (_offset < 0.01) exitWith {};
} forEach [1, 2, 3];

GVAR(workingMemory) set [2, _zeroRange];
GVAR(workingMemory) set [3, _scopeBaseAngle];
