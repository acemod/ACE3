#include "..\script_component.hpp"
/*
 * Author: Ruthberg
 * Calculates the stability factor of a bullet.
 *
 * Arguments:
 * 0: Caliber - mm <NUMBER>
 * 1: Bullet length - mm <NUMBER>
 * 2: Bullet mass - grams <NUMBER>
 * 3: Barrel twist - mm <NUMBER>
 * 4: Muzzle velocity shift - m/s <NUMBER>
 * 5: Temperature - °C <NUMBER>
 * 6: Barometric pressure - hPA <NUMBER>
 *
 * Return Value:
 * Stability factor <NUMBER>
 *
 * Example:
 * [6, 23, 4, 177.8, -23.76, 0, 1013.25] call ace_advanced_ballistics_fnc_calculateStabilityFactor
 *
 * Public: No
 */

params ["_caliber", "_bulletLength", "_bulletMass", "_barrelTwist", "_muzzleVelocity", "_temperature", "_barometricPressure"];

// Source: http://www.jbmballistics.com/ballistics/bibliography/articles/miller_stability_1.pdf
private _twist = _barrelTwist / _caliber;
private _length = _bulletLength / _caliber;

private _stabilityFactor = 7587000 * _bulletMass / (_twist^2 * _caliber^3 * _length * (1 + _length^2));

(_stabilityFactor * (_muzzleVelocity / ([341.376, 853.44] select (_muzzleVelocity > 341.376))) ^ (1/3)) * KELVIN(_temperature) / KELVIN(15) * 1013.25 / _barometricPressure // return
