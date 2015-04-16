/*
 * Author: Ruthberg
 * Calculates the range card output based on the current data set
 *
 * Arguments:
 * Nothing
 *
 * Return Value:
 * Nothing
 *
 * Example:
 * call ace_atragmx_calculate_range_card
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

private ["_temperature", "_barometricPressure", "_relativeHumidity"];
_temperature = GVAR(temperature);
_barometricPressure = GVAR(barometricPressure);
_relativeHumidity = GVAR(relativeHumidity);
if (GVAR(currentUnit) == 1) then
{
    _temperature = (_temperature - 32) / 1.8;
    _barometricPressure = _barometricPressure * 33.8638866667;
};

private ["_windSpeed", "_windDirection", "_inclinationAngle", "_targetSpeed", "_targetRange"];
_windSpeed = (GVAR(windSpeed) select GVAR(currentTarget));
_windDirection = (GVAR(windDirection) select GVAR(currentTarget));
_inclinationAngle = (GVAR(inclinationAngle) select GVAR(currentTarget));
_targetSpeed = (GVAR(targetSpeed) select GVAR(currentTarget));
_targetRange = GVAR(rangeCardEndRange);
if (GVAR(currentUnit) != 2) then
{
    _targetRange = _targetRange / 1.0936133;
};
if (GVAR(currentUnit) == 1) then
{
    _windSpeed = _windSpeed / 2.23693629;
    _targetSpeed = _targetSpeed / 2.23693629;
};

GVAR(rangeCardData) = [];

private ["_result"];
_result = [_scopeBaseAngle, _bulletMass, _boreHeight, _airFriction, _muzzleVelocity, _temperature, _barometricPressure, _relativeHumidity, 1000,
            _windSpeed, _windDirection, _inclinationAngle, _targetSpeed, _targetRange, _bc, _dragModel, _atmosphereModel, true] call FUNC(calculate_solution);
