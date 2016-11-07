/*
 * Author: Ruthberg
 * Calculates zero angle
 *
 * Arguments:
 * 0: zero angle <NUMBER>
 * 1: zero range <NUMBER>
 * 2: muzzle velocity <NUMBER>
 * 3: air friction <NUMBER>
 * 4: simulation steps <NUMBER>
 * 5: bore height <NUMBER>
 * 6: temperature <NUMBER>
 * 7: barometric pressure <NUMBER>
 * 8: relative humidity <NUMBER>
 * 9: ballistic coefficient <NUMBER>
 * 10: drag model <NUMBER>
 * 11: atmosphere model <STRING>
 * 12: advanced_ballistics <BOOL>
 *
 * Return Value:
 * 0: zero angle (Degrees) <NUMBER>
 *
 * Example:
 * call ace_scopes_fnc_calculateZeroAngle
 *
 * Public: No
 */
#include "script_component.hpp"
params [
    "_zeroAngle", "_zeroRange", "_muzzleVelocity", "_airFriction", "_simSteps", "_boreHeight",
    "_temperature", "_barometricPressure", "_relativeHumidity", "_bc", "_dragModel", "_atmosphereModel",
    "_advancedBallistics"
];

private ["_bulletPos", "_bulletVelocity", "_bulletAccel", "_bulletSpeed", "_gravity", "_deltaT"];
_bulletPos = [0, 0, 0];
_bulletVelocity = [0, 0, 0];
_bulletAccel = [0, 0, 0];
_bulletSpeed = 0;
_gravity = [0, sin(_zeroAngle) * -9.80665, cos(_zeroAngle) * -9.80665];
_deltaT = 1 / _simSteps;

private ["_TOF"];
_TOF = 0;

if (_advancedBallistics) then {
    _bc = [_bc, _temperature, _barometricPressure, _relativeHumidity, _atmosphereModel] call EFUNC(advanced_ballistics,calculateAtmosphericCorrection);
};

_bulletPos set [0, 0];
_bulletPos set [1, 0];
_bulletPos set [2, -(_boreHeight / 100)];

_bulletVelocity set [0, 0];
_bulletVelocity set [1, Cos(_zeroAngle) * _muzzleVelocity];
_bulletVelocity set [2, Sin(_zeroAngle) * _muzzleVelocity];

while {_TOF < 15 && (_bulletPos select 1) < _zeroRange} do {
    _bulletSpeed = vectorMagnitude _bulletVelocity;

    if (_advancedBallistics) then {
        private _drag = if (missionNamespace getVariable [QEGVAR(advanced_ballistics,extensionAvailable), false]) then {
            parseNumber(("ace_advanced_ballistics" callExtension format["retard:%1:%2:%3", _dragModel, _bc, _bulletSpeed]))
        } else {
            ([_dragModel, _bc, _bulletSpeed] call EFUNC(advanced_ballistics,calculateRetardation))
        };
        _bulletAccel = (vectorNormalized _bulletVelocity) vectorMultiply (-1 * _drag);
    } else {
        _bulletAccel = _bulletVelocity vectorMultiply (_bulletSpeed * _airFriction);
    };

    _bulletAccel = _bulletAccel vectorAdd _gravity;

    _bulletVelocity = _bulletVelocity vectorAdd (_bulletAccel vectorMultiply _deltaT);
    _bulletPos = _bulletPos vectorAdd (_bulletVelocity vectorMultiply _deltaT);

    _TOF = _TOF + _deltaT;
};

if ((_bulletPos select 1) > 0) then {
    _zeroAngle = - atan((_bulletPos select 2) / (_bulletPos select 1));
};

_zeroAngle
