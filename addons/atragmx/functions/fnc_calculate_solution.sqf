/*
 * Author: Ruthberg
 * Calculates the fireing solution
 *
 * Arguments:
 * 0: Scope base angle <NUMBER>
 * 1: Bullet mass <NUMBER>
 * 2: Bore height <NUMBER>
 * 3: air friction <NUMBER>
 * 4: muzzle velocity <NUMBER>
 * 5: temperature <NUMBER>
 * 6: barometric pressure <NUMBER>
 * 7: relative humidity <NUMBER>
 * 8: simulation steps <NUMBER>
 * 9: wind speed <ARRAY>
 * 10: wind direction <NUMBER>
 * 11: inclination angle <NUMBER>
 * 12: target speed <NUMBER>
 * 13: target range <NUMBER>
 * 14: ballistic coefficient <NUMBER>
 * 15: drag model <NUMBER>
 * 16: atmosphere model <STRING>
 * 17: Store range card data? <BOOL>
 * 18: Stability factor <NUMBER>
 * 19: Twist Direction <NUMBER>
 * 20: Latitude <NUMBER>
 *
 * Return Value:
 * 0: Elevation (MOA) <NUMBER>
 * 1: Windage (MOA) <ARRAY>
 * 2: Lead (MOA) <NUMBER>
 * 3: Time of fligth (SECONDS) <NUMBER>
 * 4: Remaining velocity (m/s) <NUMBER>
 * 5: Remaining kinetic energy (ft·lb) <NUMBER>
 * 6: Vertical coriolis drift (MOA) <NUMBER>
 * 7: Horizontal coriolis drift (MOA) <NUMBER>
 * 8: Spin drift (MOA) <NUMBER>
 *
 * Example:
 * call ace_atragmx_fnc_calculate_solution
 *
 * Public: No
 */
#include "script_component.hpp"
params [
    "_scopeBaseAngle", "_bulletMass", "_boreHeight", "_airFriction", "_muzzleVelocity",
    "_temperature", "_barometricPressure", "_relativeHumidity", "_simSteps", "_windSpeed",
    "_windDirection", "_inclinationAngle", "_targetSpeed", "_targetRange", "_bc", "_dragModel",
    "_atmosphereModel", "_storeRangeCardData", "_stabilityFactor", "_twistDirection", "_latitude",
    "_directionOfFire"
];
_windSpeed params ["_windSpeed1", "_windSpeed2"];

private ["_tx", "_tz", "_lastBulletPos", "_bulletPos", "_bulletVelocity", "_bulletAccel", "_bulletSpeed", "_gravity", "_deltaT"];
_tx = 0;
_tz = 0;
_lastBulletPos = [0, 0, 0];
_bulletPos = [0, 0, 0];
_bulletVelocity = [0, 0, 0];
_bulletAccel = [0, 0, 0];
_bulletSpeed = 0;
_gravity = [0, sin(_scopeBaseAngle + _inclinationAngle) * -9.80665, cos(_scopeBaseAngle + _inclinationAngle) * -9.80665];
_deltaT = 1 / _simSteps;

private ["_elevation", "_windage1", "_windage2", "_lead", "_TOF", "_trueVelocity", "_trueSpeed", "_kineticEnergy", "_verticalCoriolis", "_verticalDeflection", "_horizontalCoriolis", "_horizontalDeflection", "_spinDrift", "_spinDeflection"];
_elevation = 0;
_windage1 = 0;
_windage2 = 0;
_lead = 0;
_TOF = 0;
_trueVelocity = [0, 0, 0];
_trueSpeed = 0;
_verticalCoriolis = 0;
_verticalDeflection = 0;
_horizontalCoriolis = 0;
_horizontalDeflection = 0;
_spinDrift = 0;
_spinDeflection = 0;

private ["_n", "_range", "_trueRange", "_rangeFactor"];
_n = 0;
_range = 0;
_trueRange = 0;
_rangeFactor = 1;
if (_storeRangeCardData) then {
    if (GVAR(currentUnit) == 1) then {
        _rangeFactor = 1.0936133;
    };
    GVAR(rangeCardData) = [];
};

private ["_wind1", "_wind2", "_windDrift"];
_wind1 = [cos(270 - _windDirection * 30) * _windSpeed1, sin(270 - _windDirection * 30) * _windSpeed1, 0];
_wind2 = [cos(270 - _windDirection * 30) * _windSpeed2, sin(270 - _windDirection * 30) * _windSpeed2, 0];
_windDrift = 0;
if (missionNamespace getVariable [QEGVAR(advanced_ballistics,enabled), false]) then {
    _bc = parseNumber(("ace_advanced_ballistics" callExtension format["atmosphericCorrection:%1:%2:%3:%4:%5", _bc, _temperature, _barometricPressure, _relativeHumidity, _atmosphereModel]));
};

private ["_eoetvoesMultiplier"];
_eoetvoesMultiplier = 0;
if (missionNamespace getVariable [QEGVAR(advanced_ballistics,enabled), false]) then {
    _eoetvoesMultiplier = 2 * (0.0000729 * _muzzleVelocity / -9.80665) * cos(_latitude) * sin(_directionOfFire);
};

_bulletPos set [0, 0];
_bulletPos set [1, 0];
_bulletPos set [2, -(_boreHeight / 100)];

_bulletVelocity set [0, 0];
_bulletVelocity set [1, Cos(_scopeBaseAngle) * _muzzleVelocity];
_bulletVelocity set [2, Sin(_scopeBaseAngle) * _muzzleVelocity];

while {_TOF < 15 && (_bulletPos select 1) < _targetRange} do {
    _bulletSpeed = vectorMagnitude _bulletVelocity;

    _trueVelocity = _bulletVelocity vectorDiff _wind1;
    _trueSpeed = vectorMagnitude _trueVelocity;

    if (missionNamespace getVariable [QEGVAR(advanced_ballistics,enabled), false]) then {
        private _drag = parseNumber(("ace_advanced_ballistics" callExtension format["retard:%1:%2:%3", _dragModel, _bc, _trueSpeed]));
        _bulletAccel = (vectorNormalized _trueVelocity) vectorMultiply (-1 * _drag);
    } else {
        _bulletAccel = _trueVelocity vectorMultiply (_trueSpeed * _airFriction);
    };

    _bulletAccel = _bulletAccel vectorAdd _gravity;

    _lastBulletPos = _bulletPos;
    _bulletPos = _bulletPos vectorAdd (_bulletVelocity vectorMultiply (_deltaT * 0.5));
    _bulletVelocity = _bulletVelocity vectorAdd (_bulletAccel vectorMultiply _deltaT);
    _bulletPos = _bulletPos vectorAdd (_bulletVelocity vectorMultiply (_deltaT * 0.5));

    _TOF = _TOF + _deltaT;

    if (_storeRangeCardData) then {
        _range = GVAR(rangeCardStartRange) + _n * GVAR(rangeCardIncrement);
        if ((_bulletPos select 1) * _rangeFactor >= _range && _range <= GVAR(rangeCardEndRange)) then {
            _trueRange = _range / _rangeFactor;
            if (_trueRange != 0) then {
                _tx = (_lastBulletPos select 0) + (_trueRange - (_lastBulletPos select 1)) * ((_bulletPos select 0) - (_lastBulletPos select 0)) / ((_bulletPos select 1) - (_lastBulletPos select 1));
                _tz = (_lastBulletPos select 2) + (_trueRange - (_lastBulletPos select 1)) * ((_bulletPos select 2) - (_lastBulletPos select 2)) / ((_bulletPos select 1) - (_lastBulletPos select 1));
                _elevation = - atan(_tz / _trueRange);
                _windage1 = - atan(_tx / _trueRange);
                _windDrift = (_wind2 select 0) * (_TOF - _trueRange / _muzzleVelocity);
                _windage2 = - atan(_windDrift / _trueRange);
                _lead = (_targetSpeed * _TOF) / (Tan(3.38 / 60) * _trueRange);
            };
            _kineticEnergy = 0.5 * (_bulletMass / 1000 * (_bulletSpeed ^ 2));
            _kineticEnergy = _kineticEnergy * 0.737562149;

            if ((missionNamespace getVariable [QEGVAR(advanced_ballistics,enabled), false]) && (_bulletPos select 1) > 0) then {
                // Coriolis
                _horizontalDeflection = 0.0000729 * (_bulletPos select 1) * _TOF * sin(_latitude);
                _horizontalCoriolis = - atan(_horizontalDeflection / (_bulletPos select 1));
                _windage1 = _windage1 + _horizontalCoriolis;
                _windage2 = _windage2 + _horizontalCoriolis;
                // Eoetvoes
                _verticalDeflection = (_bulletPos select 2) * _eoetvoesMultiplier;
                _verticalCoriolis = - atan(_verticalDeflection / (_bulletPos select 1));
                _elevation = _elevation + _verticalCoriolis;
                // Spin drift
                _spinDeflection = _twistDirection * 0.0254 * 1.25 * (_stabilityFactor + 1.2) * _TOF ^ 1.83;
                _spinDrift = - atan(_spinDeflection / (_bulletPos select 1));
                _windage1 = _windage1 + _spinDrift;
                _windage2 = _windage2 + _spinDrift;
            };

            GVAR(rangeCardData) set [_n, [_range, _elevation * 60, [_windage1 * 60, _windage2 * 60], _lead, _TOF, _bulletSpeed, _kineticEnergy]];
            _n = _n + 1;
        };
    };
};

if (_targetRange != 0) then {
    _tx = (_lastBulletPos select 0) + (_targetRange - (_lastBulletPos select 1)) * ((_bulletPos select 0) - (_lastBulletPos select 0)) / ((_bulletPos select 1) - (_lastBulletPos select 1));
    _tz = (_lastBulletPos select 2) + (_targetRange - (_lastBulletPos select 1)) * ((_bulletPos select 2) - (_lastBulletPos select 2)) / ((_bulletPos select 1) - (_lastBulletPos select 1));
    _elevation = - atan(_tz / _targetRange);
    _windage1 = - atan(_tx / _targetRange);
    _windDrift = (_wind2 select 0) * (_TOF - _targetRange / _muzzleVelocity);
    _windage2 = - atan(_windDrift / _targetRange);
    _lead = (_targetSpeed * _TOF) / (Tan(3.38 / 60) * _targetRange);
};

_kineticEnergy = 0.5 * (_bulletMass / 1000 * (_bulletSpeed ^ 2));
_kineticEnergy = _kineticEnergy * 0.737562149;

if ((missionNamespace getVariable [QEGVAR(advanced_ballistics,enabled), false]) && (_bulletPos select 1) > 0) then {
    // Coriolis
    _horizontalDeflection = 0.0000729 * (_bulletPos select 1) * _TOF * sin(_latitude);
    _horizontalCoriolis = - atan(_horizontalDeflection / (_bulletPos select 1));
    _windage1 = _windage1 + _horizontalCoriolis;
    _windage2 = _windage2 + _horizontalCoriolis;
    // Eoetvoes
    _verticalDeflection = (_bulletPos select 2) * _eoetvoesMultiplier;
    _verticalCoriolis = - atan(_verticalDeflection / (_bulletPos select 1));
    _elevation = _elevation + _verticalCoriolis;
    // Spin drift
    _spinDeflection = _twistDirection * 0.0254 * 1.25 * (_stabilityFactor + 1.2) * _TOF ^ 1.83;
    _spinDrift = - atan(_spinDeflection / (_bulletPos select 1));
    _windage1 = _windage1 + _spinDrift;
    _windage2 = _windage2 + _spinDrift;
};

[_elevation * 60, [_windage1 * 60, _windage2 * 60], _lead, _TOF, _bulletSpeed, _kineticEnergy, _verticalCoriolis * 60, _horizontalCoriolis * 60, _spinDrift * 60]
