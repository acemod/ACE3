#include "script_component.hpp"
/*
 * Author: LorenLuke
 * Calculates the best possible angle to shoot farthest based on muzzle velocity and air friction.
 *
 * Arguments:
 * 0: initial muzzle velocity <NUMBER>
 * 1: air friction <NUMBER>
 *
 * Return Values: <ARRAY>
 * 1: Best Angle -- milliradiance
 * 2: Furthest Distance - meters
 *
 * Example:
 * [200, -0.00006] call ace_artilleryTables_fnc_calculateMuzzleVelocity
 *
 * Public: No
 */

params ["_muzzleVelocity", "_airFriction"];

private _returns = parseSimpleArray (("ace_artilleryTables" callExtension ["findMaxAngle", [_muzzleVelocity, _airFriction, 0]]) select 0); 
_returns = [deg(_returns select 0) * 6400 / 360, _returns select 1];
_returns params ["_bestAngle", "_bestDistance"];

_returns;
