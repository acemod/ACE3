#include "..\script_component.hpp"
/*
 * Author: jaynus / nou
 * Change a projectile's direction, maintaing speed
 * No longer used in guidancePFH, kept for backwards compatibility
 *
 * Arguments:
 * 0: Projectile <OBJECT>
 * 1: Direction Pitch <NUMBER>
 * 2: Direction Yaw <NUMBER>
 * 3: Direction Roll <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [missile, 0, 1, 0] call ace_missileguidance_fnc_changeMissileDirection;
 *
 * Public: No
 */

params ["_projectile", "_pitch", "_yaw", "_roll"];

private _dir = [sin _yaw * cos _pitch, cos _yaw * cos _pitch, sin _pitch];
private _up = [[sin _roll, -sin _pitch, cos _roll * cos _pitch], -_yaw] call BIS_fnc_rotateVector2D;

_projectile setVectorDirAndUp [_dir, _up];
