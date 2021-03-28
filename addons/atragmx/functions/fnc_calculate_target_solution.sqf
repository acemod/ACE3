#include "script_component.hpp"
/*
 * Author: Ruthberg
 * Calculates the fireing solution and updates the result input/output fields
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * call ace_atragmx_fnc_calculate_target_solution
 *
 * Public: No
 */

[] call FUNC(parse_input);

private _scopeBaseAngle = (GVAR(workingMemory) select 3);

private _bulletMass = GVAR(workingMemory) select 12;
private _bulletDiameter = GVAR(workingMemory) select 13;
private _boreHeight = GVAR(workingMemory) select 5;
private _airFriction = GVAR(workingMemory) select 4;
private _barrelTwist = GVAR(workingMemory) select 14;
private _muzzleVelocity = GVAR(workingMemory) select 1;
private _bc = GVAR(workingMemory) select 15;
private _dragModel = GVAR(workingMemory) select 16;
private _atmosphereModel = GVAR(workingMemory) select 17;

private _twistDirection = 0;
if (_barrelTwist > 0) then {
    _twistDirection = 1;
} else {
    if (_barrelTwist < 0) then {
        _twistDirection = -1;
    };
};
_barrelTwist = abs(_barrelTwist);

private _altitude = GVAR(altitude);
private _temperature = GVAR(temperature);
private _barometricPressure = GVAR(barometricPressure);
private _relativeHumidity = GVAR(relativeHumidity);
if (!GVAR(atmosphereModeTBH)) then {
    _barometricPressure = 1013.25 * (1 - (0.0065 * _altitude) / (273.15 + _temperature + 0.0065 * _altitude)) ^ 5.255754495;
    _relativeHumidity = 0.5;
};

private _bulletLength = 50 * _bulletMass / ((_bulletDiameter/2)^2);
private _stabilityFactor = 1.5;
if (missionNamespace getVariable [QEGVAR(advanced_ballistics,enabled), false]) then {
    if (_bulletDiameter > 0 && _bulletLength > 0 && _bulletMass > 0 && _barrelTwist > 0) then {
        _stabilityFactor = [_bulletDiameter, _bulletLength, _bulletMass, _barrelTwist * 10, _muzzleVelocity, _temperature, _barometricPressure] call EFUNC(advanced_ballistics,calculateStabilityFactor);
    };
};

private _latitude = GVAR(latitude) select GVAR(currentTarget);
private _directionOfFire = GVAR(directionOfFire) select GVAR(currentTarget);
private _windSpeed1 = GVAR(windSpeed1) select GVAR(currentTarget);
private _windSpeed2 = GVAR(windSpeed2) select GVAR(currentTarget);
private _windDirection = GVAR(windDirection) select GVAR(currentTarget);
private _inclinationAngle = GVAR(inclinationAngle) select GVAR(currentTarget);
private _targetSpeed = GVAR(targetSpeed) select GVAR(currentTarget);
private _targetRange = GVAR(targetRange) select GVAR(currentTarget);

GVAR(targetSolutionInput) = [_scopeBaseAngle, _bulletMass, _boreHeight, _airFriction, _muzzleVelocity, _temperature, _barometricPressure, _relativeHumidity, round(_muzzleVelocity),
            [_windSpeed1, _windSpeed2], _windDirection, _inclinationAngle, _targetSpeed, _targetRange, _bc, _dragModel, _atmosphereModel, false, _stabilityFactor, _twistDirection, _latitude, _directionOfFire];

private _result = GVAR(targetSolutionInput) call FUNC(calculate_solution);

GVAR(elevationOutput) set [GVAR(currentTarget), _result select 0];
GVAR(windage1Output) set [GVAR(currentTarget), (_result select 1) select 0];
GVAR(windage2Output) set [GVAR(currentTarget), (_result select 1) select 1];
GVAR(leadOutput) set [GVAR(currentTarget), _result select 2];
GVAR(tofOutput) set [GVAR(currentTarget), _result select 3];
GVAR(velocityOutput) set [GVAR(currentTarget), _result select 4];
GVAR(verticalCoriolisOutput) set [GVAR(currentTarget), _result select 6];
GVAR(horizontalCoriolisOutput) set [GVAR(currentTarget), _result select 7];
GVAR(spinDriftOutput) set [GVAR(currentTarget), _result select 8];

[] call FUNC(update_result);
