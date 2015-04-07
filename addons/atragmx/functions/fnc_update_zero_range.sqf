#include "script_component.hpp"

private ["_scopeBaseAngle"];
_scopeBaseAngle = ((GVAR(ATragMX_workingMemory) select GVAR(ATragMX_currentTarget)) select 3);

private ["_bulletMass", "_boreHeight", "_airFriction", "_muzzleVelocity", "_bc", "_dragModel", "_atmosphereModel"];
_bulletMass = (GVAR(ATragMX_workingMemory) select GVAR(ATragMX_currentTarget)) select 12;
_boreHeight = (GVAR(ATragMX_workingMemory) select GVAR(ATragMX_currentTarget)) select 5;
_airFriction = (GVAR(ATragMX_workingMemory) select GVAR(ATragMX_currentTarget)) select 4;
_muzzleVelocity = (GVAR(ATragMX_workingMemory) select GVAR(ATragMX_currentTarget)) select 1;
_bc = (GVAR(ATragMX_workingMemory) select GVAR(ATragMX_currentTarget)) select 15;
_dragModel = (GVAR(ATragMX_workingMemory) select GVAR(ATragMX_currentTarget)) select 16;
_atmosphereModel = (GVAR(ATragMX_workingMemory) select GVAR(ATragMX_currentTarget)) select 17;

private ["_zeroRange"];
_zeroRange = Round(parseNumber(ctrlText 140));
if (GVAR(ATragMX_currentUnit) != 2) then
{
    _zeroRange = _zeroRange / 1.0936133;
};

private ["_temperature", "_barometricPressure", "_relativeHumidity"];
_temperature = (GVAR(ATragMX_temperature) select GVAR(ATragMX_currentTarget));
_barometricPressure = (GVAR(ATragMX_barometricPressure) select GVAR(ATragMX_currentTarget));
_relativeHumidity = (GVAR(ATragMX_relativeHumidity) select GVAR(ATragMX_currentTarget));
if (GVAR(ATragMX_currentUnit) == 1) then
{
    _temperature = (_temperature - 32) / 1.8;
    _barometricPressure = _barometricPressure * 33.8638866667;
};

private ["_result"];
_result = [_scopeBaseAngle, _bulletMass, _boreHeight, _airFriction, _muzzleVelocity, _temperature, _barometricPressure, _relativeHumidity, 1000, 0, 0, 0, 0, _zeroRange, _bc, _dragModel, _atmosphereModel, false] call FUNC(calculate_solution);

(GVAR(ATragMX_workingMemory) select GVAR(ATragMX_currentTarget)) set [2, _zeroRange];
(GVAR(ATragMX_workingMemory) select GVAR(ATragMX_currentTarget)) set [3, _scopeBaseAngle + (_result select 0) / 60];
