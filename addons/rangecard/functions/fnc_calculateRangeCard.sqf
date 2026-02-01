#include "..\script_component.hpp"
/*
 * Author: Ruthberg
 * Calculates the range card data.
 *
 * Arguments:
 * 0: Scope base angle <NUMBER>
 * 1: Bore height <NUMBER>
 * 2: Air friction <NUMBER>
 * 3: Muzzle velocity <NUMBER>
 * 4: Temperature <NUMBER>
 * 5: Barometric pressure <NUMBER>
 * 6: Relative humidity <NUMBER>
 * 7: Simulation steps <NUMBER>
 * 8: Wind speed <NUMBER>
 * 9: Target speed <NUMBER>
 * 10: Target range <NUMBER>
 * 11: Ballistic coefficient <NUMBER>
 * 12: Drag model <NUMBER>
 * 13: Atmosphere model <STRING>
 * 14: TransonicStabilityCoef <NUMBER>
 * 15: Use advanced ballistics config? <BOOL>
 *
 * Return Value:
 * 0: Formatted muzzle velocity <STRING>
 * 1: Formatted elevation array <ARRAY of STRINGs>
 * 2: Formatted windage array <ARRAY of STRINGs>
 * 3: Formatted lead array <ARRAY of STRINGs>
 *
 * Example:
 * [0, 3.81, -0.00130094, 800, 15, 1013.25, 0.5, 10, 10, 0, 200, 0.4, 1, "ICAO", 0.5, true] call ace_rangecard_fnc_calculateRangeCard
 *
 * Public: No
 */

params [
    "_scopeBaseAngle", "_boreHeight", "_airFriction", "_muzzleVelocity",
    "_temperature", "_barometricPressure", "_relativeHumidity", "_simSteps",
    "_windSpeed", "_targetSpeed", "_targetRange", "_bc", "_dragModel",
    "_atmosphereModel", "_transonicStabilityCoef", "_useABConfig"
];

private _rangeCardDataMV = format [" %1", round _muzzleVelocity];
private _rangeCardDataElevation = [];
private _rangeCardDataWindage = [];
private _rangeCardDataLead = [];

private _tx = 0;
private _tz = 0;
private _lastBulletPos = [0, 0, 0];
private _bulletAccel = [0, 0, 0];
private _bulletSpeed = 0;
private _gravity = [0, sin _scopeBaseAngle, cos _scopeBaseAngle] vectorMultiply -GRAVITY;
private _deltaT = 1 / _simSteps;
private _isABenabled = missionNamespace getVariable [QEGVAR(advanced_ballistics,enabled), false];

private _speedOfSound = if (_isABenabled) then {
    _temperature call EFUNC(weather,calculateSpeedOfSound)
} else {
    0
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
    _bc = parseNumber (("ace" callExtension ["ballistics:atmospheric_correction", [_bc, _temperature, _barometricPressure, _relativeHumidity, _atmosphereModel]]) select 0);
};

private _airFrictionCoef = if (!_useABConfig && _isABenabled) then {
    private _airDensity = [_temperature, _barometricPressure, _relativeHumidity] call EFUNC(weather,calculateAirDensity);
    _airDensity / STD_AIR_DENSITY_ICAO
} else {
    1
};

private _speedTotal = 0;
private _stepsTotal = 0;
private _speedAverage = 0;

private _bulletPos = [0, 0, -_boreHeight / 100];
private _bulletVelocity = [0, cos _scopeBaseAngle, sin _scopeBaseAngle] vectorMultiply _muzzleVelocity;

private _elevationString = "";
private _windageString = "";
private _leadString = "";

while {_TOF < 6 && (_bulletPos select 1) < _targetRange} do {
    _bulletSpeed = vectorMagnitude _bulletVelocity;

    _speedTotal = _speedTotal + _bulletSpeed;
    _stepsTotal = _stepsTotal + 1;
    _speedAverage = (_speedTotal / _stepsTotal);

    if (_transonicStabilityCoef < 1.0 && _speedAverage > 450 && _bulletSpeed < _speedOfSound) exitWith {};

    _trueVelocity = _bulletVelocity vectorDiff [-_windSpeed, 0, 0];
    _trueSpeed = vectorMagnitude _trueVelocity;

    _bulletAccel = if (_useABConfig) then {
        private _drag = parseNumber (("ace" callExtension ["ballistics:retard", [_dragModel, _bc, _trueSpeed, _temperature]]) select 0);
        (vectorNormalized _trueVelocity) vectorMultiply -_drag
    } else {
        _trueVelocity vectorMultiply (_trueSpeed * _airFriction * _airFrictionCoef)
    };

    _bulletAccel = _bulletAccel vectorAdd _gravity;

    _lastBulletPos = _bulletPos;
    _bulletPos = _bulletPos vectorAdd (_bulletVelocity vectorMultiply (_deltaT * 0.5));
    _bulletVelocity = _bulletVelocity vectorAdd (_bulletAccel vectorMultiply _deltaT);
    _bulletPos = _bulletPos vectorAdd (_bulletVelocity vectorMultiply (_deltaT * 0.5));

    if (atan ((_bulletPos select 2) / (abs (_bulletPos select 1) + 1)) < -2.254) exitWith {};

    _TOF = _TOF + _deltaT;

    _range = RANGE_CARD_START_RANGE + _n * RANGE_CARD_INCREMENT;

    if ((_bulletPos select 1) < _range || _range > RANGE_CARD_END_RANGE) then {
        continue;
    };

    if (_range != 0) then {
        _tx = linearConversion [_lastBulletPos select 1, _bulletPos select 1, _range, _lastBulletPos select 0, _bulletPos select 0];
        _tz = linearConversion [_lastBulletPos select 1, _bulletPos select 1, _range, _lastBulletPos select 2, _bulletPos select 2];
        _elevation = -atan (_tz / _range);
        _windage = -atan (_tx / _range);
        _lead = (_targetSpeed * _TOF) / (tan (MRAD_TO_DEG(1)) * _range);
    };

    _elevationString = str (round (-DEG_TO_MRAD(_elevation) * 10) / 10);

    if (_elevationString == "0") then {
        _elevationString = "-0.0";
    } else {
        if !("." in _elevationString) then {
            _elevationString = _elevationString + ".0";
        };
    };

    _windageString = str (round (DEG_TO_MRAD(_windage) * 10) / 10);

    if !("." in _windageString) then {
        _windageString = _windageString + ".0";
    };

    _leadString = str (round (_lead * 10) / 10);

    if !("." in _leadString) then {
        _leadString = _leadString + ".0";
    };

    _rangeCardDataElevation pushBack _elevationString;
    _rangeCardDataWindage pushBack _windageString;
    _rangeCardDataLead pushBack _leadString;

    _n = _n + 1;
};

[_rangeCardDataMV, _rangeCardDataElevation, _rangeCardDataWindage, _rangeCardDataLead] // return
