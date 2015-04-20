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
_zeroRange = Round(parseNumber(ctrlText 120060));
if (GVAR(currentUnit) == 1) then {
    _zeroRange = _zeroRange / 1.0936133;
};
if (_zeroRange < 10) exitWith {
    GVAR(workingMemory) set [2, _zeroRange];
    GVAR(workingMemory) set [3, 0];
};

private ["_altitude", "_temperature", "_barometricPressure", "_relativeHumidity"];
_altitude = GVAR(altitude);
_temperature = GVAR(temperature);
_barometricPressure = GVAR(barometricPressure);
_relativeHumidity = GVAR(relativeHumidity);

private ["_result"];
_result = [_scopeBaseAngle, _bulletMass, _boreHeight, _airFriction, _muzzleVelocity, _temperature, _barometricPressure, _relativeHumidity, 1000, [0, 0], 0, 0, 0, _zeroRange, _bc, _dragModel, _atmosphereModel, false, 1.5, 0, 0, 0] call FUNC(calculate_solution);

GVAR(workingMemory) set [2, _zeroRange];
GVAR(workingMemory) set [3, _scopeBaseAngle + (_result select 0) / 60];
