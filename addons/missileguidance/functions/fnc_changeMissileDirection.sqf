/*
 * Author: jaynus / nou
 * Change a projectile's direction, maintaing speed
 *
 * Arguments:
 * 0: Projectile <OBJECT>
 * 1: Direction (unit vector) <ARRAY>
 *
 * Return Value:
 * None
 *
 * Example:
 * [missile, [0,1,0]] call ace_missileguidance_fnc_changeMissileDirection;
 *
 * Public: No
 */
// #define DEBUG_MODE_FULL
#include "script_component.hpp"

params ["_projectile", "_v"];

private _l = sqrt ((_v select 0) ^ 2 + (_v select 1) ^ 2);
private _r = -(_v select 2) / _l;

_projectile setVectorDirAndUp [ _v, [(_v select 0) * _r,(_v select 1) * _r, _l] ];
_projectile setVelocity (_v vectorMultiply (vectorMagnitude (velocity _projectile)));
