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
 * 9: wind speed <NUMBER>
 * 10: wind direction <NUMBER>
 * 11: inclination angle <NUMBER>
 * 12: target speed <NUMBER>
 * 13: target range <NUMBER>
 * 14: ballistic coefficient <NUMBER>
 * 15: drag model <NUMBER>
 * 16: atmosphere model <STRING>
 * 17: Store range card data? <BOOL>
 *
 * Return Value:
 * 0: Elevation <NUMBER>
 * 1: Windage <NUMBER>
 * 2: Lead <NUMBER>
 * 3: Time of fligth <NUMBER>
 * 4: Remaining velocity <NUMBER>
 * 4: Remaining kinetic energy <NUMBER>
 *
 * Example:
 * call ace_atragmx_calculate_target_range_assist
 *
 * Public: No
 */
#include "script_component.hpp"

private ["_scopeBaseAngle", "_bulletMass", "_boreHeight", "_airFriction", "_muzzleVelocity", "_temperature", "_barometricPressure", "_relativeHumidity", "_simSteps", "_windSpeed", "_windDirection", "_inclinationAngle", "_targetSpeed", "_targetRange", "_bc", "_dragModel", "_atmosphereModel", "_storeRangeCardData"];
_scopeBaseAngle     = _this select 0;
_bulletMass         = _this select 1;
_boreHeight         = _this select 2;
_airFriction        = _this select 3;
_muzzleVelocity     = _this select 4;
_temperature        = _this select 5;
_barometricPressure = _this select 6;
_relativeHumidity   = _this select 7;
_simSteps           = _this select 8;
_windSpeed          = _this select 9;
_windDirection      = _this select 10;
_inclinationAngle   = _this select 11;
_targetSpeed        = _this select 12;
_targetRange        = _this select 13;
_bc                 = _this select 14;
_dragModel          = _this select 15;
_atmosphereModel    = _this select 16;
_storeRangeCardData = _this select 17;

private ["_bulletPos", "_bulletVelocity", "_bulletAccel", "_bulletSpeed", "_gravity", "_deltaT"];
_bulletPos = [0, 0, 0];
_bulletVelocity = [0, 0, 0];
_bulletAccel = [0, 0, 0];
_bulletSpeed = 0;
_gravity = [0, sin(_scopeBaseAngle + _inclinationAngle) * -9.80665, cos(_scopeBaseAngle + _inclinationAngle) * -9.80665];
_deltaT = 1 / _simSteps;

private ["_elevation", "_windage", "_lead", "_TOF", "_trueVelocity", "_trueSpeed", "_kineticEnergy"];
_elevation = 0;
_windage = 0;
_lead = 0;
_TOF = 0;
_trueVelocity = [0, 0, 0];
_trueSpeed = 0;

private ["_n", "_range", "_rangeFactor"];
_n = 0;
_range = 0;
_rangeFactor = 1;
if (_storeRangeCardData) then {
    if (GVAR(currentUnit) != 2) then {
        _rangeFactor = 1.0936133;
    };
    GVAR(rangeCardData) = [];
};

private ["_wind"];
_wind = [cos(270 - _windDirection * 30) * _windSpeed, sin(270 - _windDirection * 30) * _windSpeed, 0];
if ((missionNamespace getVariable [QEGVAR(advanced_ballistics,enabled), false]) && (missionNamespace getVariable [QEGVAR(advanced_ballistics,AdvancedAirDragEnabled), false])) then {
    _bc = [_bc, _temperature, _barometricPressure, _relativeHumidity, _atmosphereModel] call EFUNC(advanced_ballistics,calculateAtmosphericCorrection);
};

_TOF = 0;

_bulletPos set [0, 0];
_bulletPos set [1, 0];
_bulletPos set [2, -(_boreHeight / 100)];

_bulletVelocity set [0, 0];
_bulletVelocity set [1, Cos(_scopeBaseAngle) * _muzzleVelocity];
_bulletVelocity set [2, Sin(_scopeBaseAngle) * _muzzleVelocity];

while {_TOF < 15 && (_bulletPos select 1) < _targetRange} do {
    _bulletSpeed = vectorMagnitude _bulletVelocity;

    _trueVelocity = _bulletVelocity vectorDiff _wind;
    _trueSpeed = vectorMagnitude _trueVelocity;

    if (missionNamespace getVariable [QEGVAR(advanced_ballistics,enabled), false]) then {
        if (missionNamespace getVariable [QEGVAR(advanced_ballistics,AdvancedAirDragEnabled), false]) then {
            private ["_drag"];
            _drag = if (missionNamespace getVariable [QEGVAR(advanced_ballistics,extensionAvailable), false]) then {
                parseNumber(("ace_advanced_ballistics" callExtension format["retard:%1:%2:%3", _dragModel, _bc, _trueSpeed]))
            } else {
                ([_dragModel, _bc, _trueSpeed] call EFUNC(advanced_ballistics,calculateRetardation))
            };
            _bulletAccel = (vectorNormalized _trueVelocity) vectorMultiply (-1 * _drag);
        };
    } else {
        _bulletAccel = _trueVelocity vectorMultiply (_trueSpeed * _airFriction);
    };

    _bulletAccel = _bulletAccel vectorAdd _gravity;

    _bulletVelocity = _bulletVelocity vectorAdd (_bulletAccel vectorMultiply _deltaT);
    _bulletPos = _bulletPos vectorAdd (_bulletVelocity vectorMultiply _deltaT);

    _TOF = _TOF + _deltaT;

    if (_storeRangeCardData) then {
        _range = GVAR(rangeCardStartRange) + _n * GVAR(rangeCardIncrement);
        if ((_bulletPos select 1) * _rangeFactor >= _range && _range <= GVAR(rangeCardEndRange)) then {
            if ((_bulletPos select 1) > 0) then {
                _elevation = - atan((_bulletPos select 2) / (_bulletPos select 1));
                _windage = - atan((_bulletPos select 0) / (_bulletPos select 1));
            };
            if (_range != 0) then {
                _lead = (_targetSpeed * _TOF) / (Tan(3.38 / 60) * _range);
            };
            _kineticEnergy = 0.5 * (_bulletMass / 1000 * (_bulletSpeed ^ 2));
            _kineticEnergy = _kineticEnergy * 0.737562149;

            GVAR(rangeCardData) set [_n, [_range, _elevation * 60, _windage * 60, _lead, _TOF, _bulletSpeed, _kineticEnergy]];
            _n = _n + 1;
        };
    };
};

if ((_bulletPos select 1) > 0) then {
    _elevation = - atan((_bulletPos select 2) / (_bulletPos select 1));
    _windage = - atan((_bulletPos select 0) / (_bulletPos select 1));
};

if (_targetRange != 0) then {
    _lead = (_targetSpeed * _TOF) / (Tan(3.38 / 60) * _targetRange);
};

_kineticEnergy = 0.5 * (_bulletMass / 1000 * (_bulletSpeed ^ 2));
_kineticEnergy = _kineticEnergy * 0.737562149;

[_elevation * 60, _windage * 60, _lead, _TOF, _bulletSpeed, _kineticEnergy]
