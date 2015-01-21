#include "script_component.hpp"

call cse_ab_ATragMX_fnc_parse_input;

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

private ["_temperature", "_barometricPressure", "_relativeHumidity"];
_temperature = (cse_ab_ATragMX_temperature select cse_ab_ATragMX_currentTarget);
_barometricPressure = (cse_ab_ATragMX_barometricPressure select cse_ab_ATragMX_currentTarget);
_relativeHumidity = (cse_ab_ATragMX_relativeHumidity select cse_ab_ATragMX_currentTarget);
if (cse_ab_ATragMX_currentUnit == 1) then
{
	_temperature = (_temperature - 32) / 1.8;
	_barometricPressure = _barometricPressure * 33.8638866667;
};

private ["_windSpeed", "_windDirection", "_inclinationAngle", "_targetSpeed", "_targetRange"];
_windSpeed = (cse_ab_ATragMX_windSpeed select cse_ab_ATragMX_currentTarget);
_windDirection = (cse_ab_ATragMX_windDirection select cse_ab_ATragMX_currentTarget);
_inclinationAngle = (cse_ab_ATragMX_inclinationAngle select cse_ab_ATragMX_currentTarget);
_targetSpeed = (cse_ab_ATragMX_targetSpeed select cse_ab_ATragMX_currentTarget);
_targetRange = (cse_ab_ATragMX_targetRange select cse_ab_ATragMX_currentTarget);
if (cse_ab_ATragMX_currentUnit != 2) then
{
	_targetRange = _targetRange / 1.0936133;
};
if (cse_ab_ATragMX_currentUnit == 1) then
{
	_windSpeed = _windSpeed / 2.23693629;
	_targetSpeed = _targetSpeed / 2.23693629;
};

_result = [_scopeBaseAngle, _bulletMass, _boreHeight, _airFriction, _muzzleVelocity, _temperature, _barometricPressure, _relativeHumidity, 1000,
			_windSpeed, _windDirection, _inclinationAngle, _targetSpeed, _targetRange, _bc, _dragModel, _atmosphereModel, false] call cse_ab_ATragMX_fnc_calculate_solution;

cse_ab_ATragMX_elevationOutput set [cse_ab_ATragMX_currentTarget, _result select 0];
cse_ab_ATragMX_windageOutput set [cse_ab_ATragMX_currentTarget, _result select 1];
cse_ab_ATragMX_leadOutput set [cse_ab_ATragMX_currentTarget, _result select 2];
cse_ab_ATragMX_tofOutput set [cse_ab_ATragMX_currentTarget, _result select 3];
cse_ab_ATragMX_velocityOutput set [cse_ab_ATragMX_currentTarget, _result select 4];

call cse_ab_ATragMX_fnc_update_result;
