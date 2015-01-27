#include "script_component.hpp"

private ["_scopeBaseAngle"];
_scopeBaseAngle = ((cse_ab_ATragMX_workingMemory select cse_ab_ATragMX_currentTarget) select 3);

private ["_bulletMass", "_boreHeight", "_airFriction", "_muzzleVelocity", "_bc", "_dragModel", "_atmosphereModel"];
_bulletMass = (cse_ab_ATragMX_workingMemory select cse_ab_ATragMX_currentTarget) select 12;
_boreHeight = (cse_ab_ATragMX_workingMemory select cse_ab_ATragMX_currentTarget) select 5;
_airFriction = (cse_ab_ATragMX_workingMemory select cse_ab_ATragMX_currentTarget) select 4;
_muzzleVelocity = (cse_ab_ATragMX_workingMemory select cse_ab_ATragMX_currentTarget) select 1;
_bc = (cse_ab_ATragMX_workingMemory select cse_ab_ATragMX_currentTarget) select 15;
_dragModel = (cse_ab_ATragMX_workingMemory select cse_ab_ATragMX_currentTarget) select 16;
_atmosphereModel = (cse_ab_ATragMX_workingMemory select cse_ab_ATragMX_currentTarget) select 17;

private ["_zeroRange"];
_zeroRange = Round(parseNumber(ctrlText 140));
if (cse_ab_ATragMX_currentUnit != 2) then
{
	_zeroRange = _zeroRange / 1.0936133;
};

private ["_temperature", "_barometricPressure", "_relativeHumidity"];
_temperature = (cse_ab_ATragMX_temperature select cse_ab_ATragMX_currentTarget);
_barometricPressure = (cse_ab_ATragMX_barometricPressure select cse_ab_ATragMX_currentTarget);
_relativeHumidity = (cse_ab_ATragMX_relativeHumidity select cse_ab_ATragMX_currentTarget);
if (cse_ab_ATragMX_currentUnit == 1) then
{
	_temperature = (_temperature - 32) / 1.8;
	_barometricPressure = _barometricPressure * 33.8638866667;
};

private ["_result"];
_result = [_scopeBaseAngle, _bulletMass, _boreHeight, _airFriction, _muzzleVelocity, _temperature, _barometricPressure, _relativeHumidity, 1000, 0, 0, 0, 0, _zeroRange, _bc, _dragModel, _atmosphereModel, false] call cse_ab_ATragMX_fnc_calculate_solution;

(cse_ab_ATragMX_workingMemory select cse_ab_ATragMX_currentTarget) set [2, _zeroRange];
(cse_ab_ATragMX_workingMemory select cse_ab_ATragMX_currentTarget) set [3, _scopeBaseAngle + (_result select 0) / 60];
