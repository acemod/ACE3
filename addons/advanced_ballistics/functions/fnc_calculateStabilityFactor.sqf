#include "script_component.hpp"
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
 * Example:
 * [1, 2, 3, 4, 5, 6, 7] call ace_advanced_ballistics_fnc_calculateStabilityFactor
 *
 * Public: No
 */

params ["_caliber", "_bulletLength", "_bulletMass", "_barrelTwist", "_muzzleVelocity", "_temperature", "_barometricPressure"];

// Source: http://www.jbmballistics.com/ballistics/bibliography/articles/miller_stability_1.pdf
private _twist = _barrelTwist / _caliber;
private _length = _bulletLength / _caliber;

private _stabilityFactor = 7587000 * _bulletMass / (_twist^2 * _caliber^3 * _length * (1 + _length^2));

if (_muzzleVelocity > 341.376) then {
    (_stabilityFactor * (_muzzleVelocity / 853.44) ^ (1/3)) * KELVIN(_temperature) / KELVIN(15) * 1013.25 / _barometricPressure
} else {
    (_stabilityFactor * (_muzzleVelocity / 341.376) ^ (1/3)) * KELVIN(_temperature) / KELVIN(15) * 1013.25 / _barometricPressure
};
