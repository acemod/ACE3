#include "script_component.hpp"
/*
 * Author: LorenLuke
 * Calculates the muzzleVelocity change with advanced calculations.
 *
 * Arguments:
 * 0: initial muzzle velocity <NUMBER>
 * 1: temperature (in C) <NUMBER>
 * 2: air density (kg/m^3) <NUMBER>
 *
 * Return Value:
 * Adjusted muzzle Velocity <NUMBER>
 *
 * Example:
 * [200, 15, 1.225] call ace_artilleryTables_fnc_calculateMuzzleVelocity
 *
 * Public: No
 */

params ["_muzzleVelocity", "_temperature", "_airDensity"];

// Calculate air density
private _relativeDensity = _airDensity / 1.225;
private _newMuzzleVelocityCoefficient = (((_temperature + 273.13) / 288.13 - 1) / 40 + 1);

private _newMuzzleVelocity = _muzzleVelocity * _newMuzzleVelocityCoefficient;

_newMuzzleVelocity;
