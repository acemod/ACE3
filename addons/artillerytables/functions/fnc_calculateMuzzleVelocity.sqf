#include "..\script_component.hpp"
/*
 * Author: LorenLuke
 * Calculates the muzzleVelocity change with advanced calculations.
 *
 * Arguments:
 * 0: Initial Muzzle velocity; meters/second <NUMBER>
 * 1: Temperature; degrees Celsius <NUMBER>
 *
 * Return Value:
 * Adjusted Muzzle Velocity; Meters <NUMBER>
 *
 * Example:
 * [200, 15] call ace_artilleryTables_fnc_calculateMuzzleVelocity
 *
 * Public: No
 */

params ["_muzzleVelocity", "_temperature"];

// Calculate air density
private _newMuzzleVelocityCoefficient = (((_temperature + 273.13) / 288.13 - 1) / 40 + 1);

private _newMuzzleVelocity = _muzzleVelocity * _newMuzzleVelocityCoefficient;

_newMuzzleVelocity
