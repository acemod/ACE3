#include "script_component.hpp"

private ["_scopeBaseAngle"];
_scopeBaseAngle = ((GVAR(workingMemory) select GVAR(currentTarget)) select 3);

private ["_bulletMass", "_boreHeight", "_airFriction", "_muzzleVelocity", "_bc", "_dragModel", "_atmosphereModel"];
_bulletMass = (GVAR(workingMemory) select GVAR(currentTarget)) select 12;
_boreHeight = (GVAR(workingMemory) select GVAR(currentTarget)) select 5;
_airFriction = (GVAR(workingMemory) select GVAR(currentTarget)) select 4;
_muzzleVelocity = (GVAR(workingMemory) select GVAR(currentTarget)) select 1;
_bc = (GVAR(workingMemory) select GVAR(currentTarget)) select 15;
_dragModel = (GVAR(workingMemory) select GVAR(currentTarget)) select 16;
_atmosphereModel = (GVAR(workingMemory) select GVAR(currentTarget)) select 17;

private ["_zeroRange"];
_zeroRange = Round(parseNumber(ctrlText 140));
if (GVAR(currentUnit) != 2) then
{
    _zeroRange = _zeroRange / 1.0936133;
};
if (_zeroRange < 10) exitWith {
    (GVAR(workingMemory) select GVAR(currentTarget)) set [2, _zeroRange];
    (GVAR(workingMemory) select GVAR(currentTarget)) set [3, 0];
};

private ["_temperature", "_barometricPressure", "_relativeHumidity"];
_temperature = (GVAR(temperature) select GVAR(currentTarget));
_barometricPressure = (GVAR(barometricPressure) select GVAR(currentTarget));
_relativeHumidity = (GVAR(relativeHumidity) select GVAR(currentTarget));
if (GVAR(currentUnit) == 1) then
{
    _temperature = (_temperature - 32) / 1.8;
    _barometricPressure = _barometricPressure * 33.8638866667;
};

private ["_result"];
_result = [_scopeBaseAngle, _bulletMass, _boreHeight, _airFriction, _muzzleVelocity, _temperature, _barometricPressure, _relativeHumidity, 1000, 0, 0, 0, 0, _zeroRange, _bc, _dragModel, _atmosphereModel, false] call FUNC(calculate_solution);

(GVAR(workingMemory) select GVAR(currentTarget)) set [2, _zeroRange];
(GVAR(workingMemory) select GVAR(currentTarget)) set [3, _scopeBaseAngle + (_result select 0) / 60];
