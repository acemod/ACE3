/*
 * Author: jaynus / nou / rufix
 * Change a bombs's direction, maintaining initial velocity vector.
 *
 * Arguments:
 * 0: Projectile <OBJECT>
 * 1: Direction (unit vector) <ARRAY>
 *
 * Return Value:
 * None
 *
 * Example:
 * [bomb, [0,1,0]] call ace_missileguidance_fnc_changeBombDirection;
 *
 * Public: No
 */
// #define DEBUG_MODE_FULL
#include "script_component.hpp"

params ["_projectile", "_vector"];

private _velocity = velocity _projectile;

private _l = sqrt ((_vector select 0) ^ 2 + (_vector select 1) ^ 2);
private _r = -(_vector select 2) / _l;

_projectile setVectorDirAndUp [ _vector, [(_vector select 0) * _r, (_vector select 1) * _r, _l] ];

// Revert to initial velocity, let engine handle further movement.
_projectile setVelocity _velocity;