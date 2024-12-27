#include "..\script_component.hpp"
/*
 * Author: LorenLuke
 * Calculates the best possible angle to shoot farthest based on muzzle velocity and air friction.
 *
 * Arguments:
 * 0: Initial Muzzle Velocity; meters/second <NUMBER>
 * 1: Air Friction; meters^-1 (m/s^2)/(m^2/s^2) <NUMBER>
 *
 * Return Values: <ARRAY>
 * 1: Best Angle; Milliradians <NUMBER>
 * 2: Furthest Distance; Meters <NUMBER>
 *
 * Example:
 * [200, -0.00006] call ace_artilleryTables_fnc_calculateMaxAngle
 *
 * Public: No
 */

params ["_muzzleVelocity", "_airFriction"];

TRACE_2("callExtension:artillery:find_max_angle",_muzzleVelocity,_airFriction);
(
    "ace" callExtension ["artillery:find_max_angle", [_muzzleVelocity, _airFriction]]
) params ["_data", "_code"];
TRACE_1("",_code);
(parseSimpleArray _data) params ["_bestAngle", "_bestDistance"];
[deg _bestAngle * 6400 / 360, _bestDistance] // return
