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

private [
    "_twistDirection", "_altitude", "_temperature", "_barometricPressure",
    "_relativeHumidity","_bulletLength", "_stabilityFactor","_latitude",
    "_directionOfFire", "_windSpeed1", "_windSpeed2", "_windDirection",
    "_inclinationAngle", "_targetSpeed", "_targetRange","_result"
];


GVAR(workingMemory) params [
    "_profile", // 0
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

_twistDirection = 0;
if (_barrelTwist > 0) then {
    _twistDirection = 1;
} else {
    if (_barrelTwist < 0) then {
        _twistDirection = -1;
    };
};
_barrelTwist = abs(_barrelTwist);

_altitude = GVAR(altitude);
_temperature = GVAR(temperature);
_barometricPressure = GVAR(barometricPressure);
_relativeHumidity = GVAR(relativeHumidity);
if (!GVAR(atmosphereModeTBH)) then {
    _barometricPressure = 1013.25 * (1 - (0.0065 * _altitude) / (273.15 + _temperature + 0.0065 * _altitude)) ^ 5.255754495;
    _relativeHumidity = 50;
};

_bulletLength = 45.72;
_stabilityFactor = 1.5;
if (missionNamespace getVariable [QEGVAR(advanced_ballistics,enabled), false]) then {
    if (_bulletDiameter > 0 && _bulletLength > 0 && _bulletMass > 0 && _barrelTwist > 0) then {
        _stabilityFactor = [_bulletDiameter, _bulletLength, _bulletMass, _barrelTwist * 10, _muzzleVelocity, _temperature, _barometricPressure] call EFUNC(advanced_ballistics,calculateStabilityFactor);
    };
};

_latitude = GVAR(latitude) select GVAR(currentTarget);
_directionOfFire = GVAR(directionOfFire) select GVAR(currentTarget);
_windSpeed1 = (GVAR(windSpeed1) select GVAR(currentTarget));
_windSpeed2 = (GVAR(windSpeed2) select GVAR(currentTarget));
_windDirection = (GVAR(windDirection) select GVAR(currentTarget));
_inclinationAngle = (GVAR(inclinationAngle) select GVAR(currentTarget));
_targetSpeed = (GVAR(targetSpeed) select GVAR(currentTarget));
_targetRange = GVAR(rangeCardEndRange);
if (GVAR(currentUnit) == 1) then {
    _targetRange = _targetRange / 1.0936133;
};

GVAR(rangeCardData) = [];

_result = [_scopeBaseAngle, _bulletMass, _boreHeight, _airFriction, _muzzleVelocity, _temperature, _barometricPressure, _relativeHumidity, 1000,
            [_windSpeed1, _windSpeed2], _windDirection, _inclinationAngle, _targetSpeed, _targetRange, _bc, _dragModel, _atmosphereModel, true, _stabilityFactor, _twistDirection, _latitude, _directionOfFire] call FUNC(calculate_solution);
