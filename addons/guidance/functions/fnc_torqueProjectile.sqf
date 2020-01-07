#include "script_component.hpp"
/*
 * Author: LorenLuke
 * Increases a projectile's angular momentum
 *
 * Arguments:
 * 0: Projectile <OBJECT>
 * 1: torque X (+right/-left) <NUMBER>
 * 2: torque Y (+up/-Down) <number>
 *
 * Return Value:
 * None
 *
 * Example:
 * [missile, [0,1,0]] call ace_guidance_fnc_torqueProjectile;
 *
 * Public: No
 */

params ["_projectile", "_torqueX", "_torqueY"];

private _l = sqrt ((_v select 0) ^ 2 + (_v select 1) ^ 2);
private _r = -(_v select 2) / _l;

_projectile setVectorDirAndUp [ _v, [(_v select 0) * _r,(_v select 1) * _r, _l] ];
_projectile setVelocity (_v vectorMultiply (vectorMagnitude (velocity _projectile)));
