#include "script_component.hpp"

[] call FUNC(parse_input);

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

private ["_temperature", "_barometricPressure", "_relativeHumidity"];
_temperature = (GVAR(ATragMX_temperature) select GVAR(ATragMX_currentTarget));
_barometricPressure = (GVAR(ATragMX_barometricPressure) select GVAR(ATragMX_currentTarget));
_relativeHumidity = (GVAR(ATragMX_relativeHumidity) select GVAR(ATragMX_currentTarget));
if (GVAR(ATragMX_currentUnit) == 1) then
{
    _temperature = (_temperature - 32) / 1.8;
    _barometricPressure = _barometricPressure * 33.8638866667;
};

private ["_windSpeed", "_windDirection", "_inclinationAngle", "_targetSpeed", "_targetRange"];
_windSpeed = (GVAR(ATragMX_windSpeed) select GVAR(ATragMX_currentTarget));
_windDirection = (GVAR(ATragMX_windDirection) select GVAR(ATragMX_currentTarget));
_inclinationAngle = (GVAR(ATragMX_inclinationAngle) select GVAR(ATragMX_currentTarget));
_targetSpeed = (GVAR(ATragMX_targetSpeed) select GVAR(ATragMX_currentTarget));
_targetRange = (GVAR(ATragMX_targetRange) select GVAR(ATragMX_currentTarget));
if (GVAR(ATragMX_currentUnit) != 2) then
{
    _targetRange = _targetRange / 1.0936133;
};
if (GVAR(ATragMX_currentUnit) == 1) then
{
    _windSpeed = _windSpeed / 2.23693629;
    _targetSpeed = _targetSpeed / 2.23693629;
};

_result = [_scopeBaseAngle, _bulletMass, _boreHeight, _airFriction, _muzzleVelocity, _temperature, _barometricPressure, _relativeHumidity, 1000,
            _windSpeed, _windDirection, _inclinationAngle, _targetSpeed, _targetRange, _bc, _dragModel, _atmosphereModel, false] call FUNC(calculate_solution);

GVAR(ATragMX_elevationOutput) set [GVAR(ATragMX_currentTarget), _result select 0];
GVAR(ATragMX_windageOutput) set [GVAR(ATragMX_currentTarget), _result select 1];
GVAR(ATragMX_leadOutput) set [GVAR(ATragMX_currentTarget), _result select 2];
GVAR(ATragMX_tofOutput) set [GVAR(ATragMX_currentTarget), _result select 3];
GVAR(ATragMX_velocityOutput) set [GVAR(ATragMX_currentTarget), _result select 4];

[] call FUNC(update_result);
