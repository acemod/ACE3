#include "..\script_component.hpp"
/*
 * Author: PabstMirror, Ruthberg (Based on ace_atragmx_fnc_calculate_solution)
 * Calculates elevation and windage
 *
 * Arguments:
 * 0: Range <NUMBER>
 * 1: Direction of Fire (deg) - Yaw <NUMBER>
 * 2: Inlination (deg) - Pitch <NUMBER>
 * 3: Bank (deg) - Roll <NUMBER>
 *
 * Return Value:
 * Elevation and Windage in MRAD, Time Of Flight <ARRAY>
 *
 * Example:
 * [500, 90, 0, 0] call ace_xm157_fnc_ballistics_calculator
 *
 * Public: No
 */

params ["_targetRange", "_directionOfFire", "_inclinationAngle", "_bank"];

private _weaponInfo = [] call FUNC(ballistics_getData);

if (_weaponInfo isEqualTo []) exitWith {
    [0, 0, 0] // return
};

_weaponInfo params [
    "_scopeBaseAngle",
    "_boreHeight",
    "_airFriction",
    "_muzzleVelocity",
    "_bc",
    "_dragModel",
    "_atmosphereModel",
    "_barrelTwist",
    "_twistDirection",
    "_caliber",
    "_bulletLength",
    "_bulletMass"
];

private _latitude = GVAR(data) getOrDefault ["latitude", 0];

// Get Wind
private _windSpeed = GVAR(data) getOrDefault ["wind_speed", 0];
private _windDirection = 22.5 * (GVAR(data) getOrDefault ["wind_dir", 0]);
private _wind = [sin (_directionOfFire - _windDirection), -cos (_directionOfFire - _windDirection), 0] vectorMultiply _windSpeed;

// Get atmosphere
private _altitude = (getPosASL ACE_player) select 2;
private _relativeHumidity = EGVAR(weather,currentHumidity);
private _temperature = _altitude call EFUNC(weather,calculateTemperatureAtHeight);
private _barometricPressure = _altitude call EFUNC(weather,calculateBarometricPressure);


private _bulletPos = [0, 0, -_boreHeight / 100];
private _lastBulletPos = +_bulletPos;
private _bulletVelocity = [0, cos _scopeBaseAngle, sin _scopeBaseAngle] vectorMultiply _muzzleVelocity;
private _gravity = [(-sin _bank) * cos (_scopeBaseAngle + _inclinationAngle),
                    sin (_scopeBaseAngle + _inclinationAngle),
                    (cos _bank) * cos (_scopeBaseAngle + _inclinationAngle)] vectorMultiply -GRAVITY;

private _useAB = missionNamespace getVariable [QEGVAR(advanced_ballistics,enabled), false];

if (_useAB) then {
    _bc = parseNumber (("ace" callExtension ["ballistics:atmospheric_correction", [_bc, _temperature, _barometricPressure, _relativeHumidity, _atmosphereModel]]) select 0);
};

private _deltaT = 1 / 60;
private _TOF = 0; // Limit TOF to 5 seconds!

while {(_TOF < 5) && {(_bulletPos # 1) < _targetRange}} do {
    private _trueVelocity = _bulletVelocity vectorDiff _wind;
    private _trueSpeed = vectorMagnitude _trueVelocity;

    private _bulletAccel = if (_useAB) then {
        private _drag = parseNumber (("ace" callExtension ["ballistics:retard", [_dragModel, _bc, _trueSpeed, _temperature]]) select 0);
        (vectorNormalized _trueVelocity) vectorMultiply -_drag;
    } else {
        _trueVelocity vectorMultiply (_trueSpeed * _airFriction);
    };

    _bulletAccel = _bulletAccel vectorAdd _gravity;
    _lastBulletPos = _bulletPos;
    _bulletPos = _bulletPos vectorAdd (_bulletVelocity vectorMultiply (_deltaT * 0.5));
    _bulletVelocity = _bulletVelocity vectorAdd (_bulletAccel vectorMultiply _deltaT);
    _bulletPos = _bulletPos vectorAdd (_bulletVelocity vectorMultiply (_deltaT * 0.5));

    _TOF = _TOF + _deltaT;
};

private _tx = linearConversion [_lastBulletPos select 1, _bulletPos select 1, _targetRange, _lastBulletPos select 0, _bulletPos select 0];
private _tz = linearConversion [_lastBulletPos select 1, _bulletPos select 1, _targetRange, _lastBulletPos select 2, _bulletPos select 2];
private _elevation = -atan (_tz / _targetRange);
private _windage = -atan (_tx / _targetRange);

if (_useAB && {(_bulletPos select 1) > 0}) then {
    // Coriolis
    private _horizontalDeflection = 0.0000729 * (_bulletPos select 1) * _TOF * (sin _latitude);
    private _horizontalCoriolis = -atan (_horizontalDeflection / (_bulletPos select 1));
    _windage = _windage + _horizontalCoriolis;

    // Eoetvoes
    private _eoetvoesMultiplier = 2 * (0.0000729 * _muzzleVelocity / -GRAVITY) * (cos _latitude) * (sin _directionOfFire);
    private _verticalDeflection = (_bulletPos select 2) * _eoetvoesMultiplier;
    private _verticalCoriolis = -atan (_verticalDeflection / (_bulletPos select 1));
    _elevation = _elevation + _verticalCoriolis;

    // Spin drift
    private _stabilityFactor = if (_caliber * _bulletLength * _bulletMass * _barrelTwist > 0) then {
        [_caliber, _bulletLength, _bulletMass, _barrelTwist, _muzzleVelocity, _temperature, _barometricPressure] call EFUNC(advanced_ballistics,calculateStabilityFactor)
    } else {
        1.5
    };

    private _spinDeflection = _twistDirection * 0.0254 * 1.25 * (_stabilityFactor + 1.2) * _TOF ^ 1.83;
    private _spinDrift = -atan (_spinDeflection / (_bulletPos select 1));
    _windage = _windage + _spinDrift;
};

[17.453*_elevation, 17.453*_windage, _TOF] // Convert to MRAD and return
