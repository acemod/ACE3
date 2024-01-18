#include "..\script_component.hpp"
/*
 * Author: LorenLuke
 * Calculates the muzzleVelocity change with advanced calculations.
 *
 * Arguments:
 * 0: Initial Muzzle velocity; meters/second <NUMBER>
 * 1: Temperature; degrees Celsius <NUMBER>
 * 2: Atmospheric Density; kg/(meters^3) <NUMBER>
 *
 * Return Value:
 * Adjusted Muzzle Velocity; Meters <NUMBER>
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

_newMuzzleVelocity
