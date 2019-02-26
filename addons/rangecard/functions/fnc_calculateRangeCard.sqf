#include "script_component.hpp"
/*
 * Author: Ruthberg
 * Calculates the range card data
 *
 * Arguments:
 * 0: Scope base angle <NUMBER>
 * 1: Bore height <NUMBER>
 * 2: air friction <NUMBER>
 * 3: muzzle velocity <NUMBER>
 * 4: temperature <NUMBER>
 * 5: barometric pressure <NUMBER>
 * 6: relative humidity <NUMBER>
 * 7: simulation steps <NUMBER>
 * 8: wind speed <NUMBER>
 * 9: target speed <NUMBER>
 * 10: target range <NUMBER>
 * 11: ballistic coefficient <NUMBER>
 * 12: drag model <NUMBER>
 * 13: atmosphere model <STRING>
 * 14: transonicStabilityCoef <NUMBER>
 * 15: Range Card Slot <NUMBER>
 * 16: Use advanced ballistics config? <BOOL>
 *
 * Return Value:
 * None
 *
 * Example:
 * [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13 ,14, 15, 16, true] call ace_rangecard_fnc_calculateRangeCard
 *
 * Public: No
 */
params [
    "_scopeBaseAngle", "_boreHeight", "_airFriction", "_muzzleVelocity",
    "_temperature", "_barometricPressure", "_relativeHumidity", "_simSteps",
    "_windSpeed", "_targetSpeed", "_targetRange", "_bc", "_dragModel", "_atmosphereModel",
    "_transonicStabilityCoef", "_rangeCardSlot", "_useABConfig"
];

GVAR(rangeCardDataMVs) set [_rangeCardSlot, format[" %1", round(_muzzleVelocity)]];

private _tx = 0;
private _tz = 0;
private _lastBulletPos = [0, 0, 0];
private _bulletPos = [0, 0, 0];
private _bulletVelocity = [0, 0, 0];
private _bulletAccel = [0, 0, 0];
private _bulletSpeed = 0;
private _gravity = [0, sin(_scopeBaseAngle) * -GRAVITY, cos(_scopeBaseAngle) * -GRAVITY];
private _deltaT = 1 / _simSteps;
private _speedOfSound = 0;
if (missionNamespace getVariable [QEGVAR(advanced_ballistics,enabled), false]) then {
    _speedOfSound = _temperature call EFUNC(weather,calculateSpeedOfSound);
};

private _elevation = 0;
private _windage = 0;
private _lead = 0;
private _TOF = 0;
private _trueVelocity = [0, 0, 0];
private _trueSpeed = 0;

private _n = 0;
private _range = 0;

if (_useABConfig) then {
    _bc = parseNumber(("ace_advanced_ballistics" callExtension format["atmosphericCorrection:%1:%2:%3:%4:%5", _bc, _temperature, _barometricPressure, _relativeHumidity, _atmosphereModel]));
};

private _airFrictionCoef = 1;
if (!_useABConfig && (missionNamespace getVariable [QEGVAR(advanced_ballistics,enabled), false])) then {
    private _airDensity = [_temperature, _barometricPressure, _relativeHumidity] call EFUNC(weather,calculateAirDensity);
    _airFrictionCoef = _airDensity / 1.22498;
};

private _speedTotal = 0;
private _stepsTotal = 0;
private _speedAverage = 0;

_bulletPos set [0, 0];
_bulletPos set [1, 0];
_bulletPos set [2, -(_boreHeight / 100)];

_bulletVelocity set [0, 0];
_bulletVelocity set [1, Cos(_scopeBaseAngle) * _muzzleVelocity];
_bulletVelocity set [2, Sin(_scopeBaseAngle) * _muzzleVelocity];

while {_TOF < 6 && (_bulletPos select 1) < _targetRange} do {
    _bulletSpeed = vectorMagnitude _bulletVelocity;

    _speedTotal = _speedTotal + _bulletSpeed;
    _stepsTotal = _stepsTotal + 1;
    _speedAverage = (_speedTotal / _stepsTotal);

    if (_transonicStabilityCoef < 1.0 && _speedAverage > 450 && _bulletSpeed < _speedOfSound) exitWith {};

    _trueVelocity = _bulletVelocity vectorDiff [-_windSpeed, 0, 0];
    _trueSpeed = vectorMagnitude _trueVelocity;

    if (_useABConfig) then {
        private _drag = parseNumber(("ace_advanced_ballistics" callExtension format["retard:%1:%2:%3:%4", _dragModel, _bc, _trueSpeed, _temperature]));
        _bulletAccel = (vectorNormalized _trueVelocity) vectorMultiply (-1 * _drag);
    } else {
        _bulletAccel = _trueVelocity vectorMultiply (_trueSpeed * _airFriction * _airFrictionCoef);
    };

    _bulletAccel = _bulletAccel vectorAdd _gravity;

    _lastBulletPos = _bulletPos;
    _bulletPos = _bulletPos vectorAdd (_bulletVelocity vectorMultiply (_deltaT * 0.5));
    _bulletVelocity = _bulletVelocity vectorAdd (_bulletAccel vectorMultiply _deltaT);
    _bulletPos = _bulletPos vectorAdd (_bulletVelocity vectorMultiply (_deltaT * 0.5));

    if (atan((_bulletPos select 2) / (abs(_bulletPos select 1) + 1)) < -2.254) exitWith {};

    _TOF = _TOF + _deltaT;

    _range = GVAR(rangeCardStartRange) + _n * GVAR(rangeCardIncrement);
    if ((_bulletPos select 1) >= _range && _range <= GVAR(rangeCardEndRange)) then {
        if (_range != 0) then {
            _tx = (_lastBulletPos select 0) + (_range - (_lastBulletPos select 1)) * ((_bulletPos select 0) - (_lastBulletPos select 0)) / ((_bulletPos select 1) - (_lastBulletPos select 1));
            _tz = (_lastBulletPos select 2) + (_range - (_lastBulletPos select 1)) * ((_bulletPos select 2) - (_lastBulletPos select 2)) / ((_bulletPos select 1) - (_lastBulletPos select 1));
            _elevation = - atan(_tz / _range);
            _windage = - atan(_tx / _range);
            _lead = (_targetSpeed * _TOF) / (Tan(MRAD_TO_DEG(1)) * _range);
        };

        private _elevationString = Str(round(-DEG_TO_MRAD(_elevation) * 10) / 10);
        if (_elevationString == "0") then {
            _elevationString = "-0.0";
        };
        if (_elevationString find "." == -1) then {
            _elevationString = _elevationString + ".0";
        };
        private _windageString = Str(round(DEG_TO_MRAD(_windage) * 10) / 10);
        if (_windageString find "." == -1) then {
            _windageString = _windageString + ".0";
        };
        private _leadString = Str(round(_lead * 10) / 10);
        if (_leadString find "." == -1) then {
            _leadString = _leadString + ".0";
        };
        (GVAR(rangeCardDataElevation) select _rangeCardSlot) set [_n, _elevationString];
        (GVAR(rangeCardDataWindage) select _rangeCardSlot) set [_n, _windageString];
        (GVAR(rangeCardDataLead) select _rangeCardSlot) set [_n, _leadString];
        _n = _n + 1;
    };
};
