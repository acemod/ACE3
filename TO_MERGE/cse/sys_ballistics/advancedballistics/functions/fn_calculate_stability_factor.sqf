#include "defines.h"

private ["_caliber", "_bulletLength", "_bulletMass", "_barrelTwist", "_muzzleVelocity", "_temperature", "_barometricPressure", "_l", "_t", "_stabilityFactor"];
_caliber            = _this select 0;
_bulletLength       = _this select 1;
_bulletMass         = _this select 2;
_barrelTwist        = _this select 3;
_muzzleVelocity     = _this select 4;
_temperature        = _this select 5;
_barometricPressure = _this select 6;

// Source: http://www.jbmballistics.com/ballistics/bibliography/articles/miller_stability_1.pdf
_t = _barrelTwist / _caliber;
_l = _bulletLength / _caliber;

_stabilityFactor = 30 * _bulletMass / (_t^2 * _caliber^3 * _l * (1 + _l^2));

_muzzleVelocity = _muzzleVelocity * 3.2808399;
if (_muzzleVelocity > 1120) then {
	_stabilityFactor = _stabilityFactor * (_muzzleVelocity / 2800) ^ (1/3);
} else {
	_stabilityFactor = _stabilityFactor * (_muzzleVelocity / 1120) ^ (1/3);
};

_stabilityFactor = _stabilityFactor * (_temperature + 273) / (15 + 273) * 1013.25 / _barometricPressure;

_stabilityFactor
