/*
 * Author: Ruthberg
 *
 * Calculates the stability factor of a bullet
 *
 * Arguments:
 * 0: caliber - mm <NUMBER>
 * 1: bullet length - mm <NUMBER>
 * 2: bullet mass - grams <NUMBER>
 * 3: barrel twist - mm <NUMBER>
 * 4: muzzle velocity shift - m/s <NUMBER>
 * 5: temperature - degrees celcius <NUMBER>
 * 6: barometric Pressure - hPA <NUMBER>
 *
 * Return Value:
 * stability factor <NUMBER>
 *
 * Public: No
 */
#include "script_component.hpp"

private ["_l", "_t", "_stabilityFactor"];
params ["_caliber", "_bulletLength", "_bulletMass", "_barrelTwist", "_muzzleVelocity", "_temperature", "_barometricPressure"];

// Source: http://www.jbmballistics.com/ballistics/bibliography/articles/miller_stability_1.pdf
_t = _barrelTwist / _caliber;
_l = _bulletLength / _caliber;

_stabilityFactor = 7587000 * _bulletMass / (_t^2 * _caliber^3 * _l * (1 + _l^2));

if (_muzzleVelocity > 341.376) then {
    _stabilityFactor = _stabilityFactor * (_muzzleVelocity / 853.44) ^ (1/3);
} else {
    _stabilityFactor = _stabilityFactor * (_muzzleVelocity / 341.376) ^ (1/3);
};

_stabilityFactor = _stabilityFactor * KELVIN(_temperature) / KELVIN(15) * 1013.25 / _barometricPressure;

_stabilityFactor
