/*
 * Author: LorenLuke
 * Rotates the first vector around the second, clockwise by theta
 *
 * Arguments:
 * 0: Vector <ARRAY>
 * 1: Rotation Axis <ARRAY>
 * 2: Angle <NUMBER>
 *
 * Return Value:
 * Transformed Vector <ARRAY>
 *
 * Example:
 * [eyeDirection player, weaponDirection (currentWeapon player), 45] call ace_common_fnc_rotateVector;
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_vector1", "_vector2", "_theta"];
_vector1 params ["_vx", "_vy", "_vz"];

private _normalVector = vectorNormalized _vector2;
_normalVector params ["_ux", "_uy", "_uz"];

private _rotationMatrix = [
	[cos(_theta) + ((_ux^2) * (1 - cos(_theta))), (_ux * _uy * (1-cos(_theta))) - (_uz * sin(_theta)), (_ux * _uz * (1 - cos(_theta))) + (_uy * sin (_theta))],
	[(_uy * _ux * (1-cos(_theta))) + (_uz * sin(_theta)), cos(_theta) + ((_uy^2) * (1 - cos(_theta))), (_uy * _uz * (1 - cos(_theta))) - (_ux * sin (_theta))],
	[(_uz * _ux * (1-cos(_theta))) - (_uy * sin(_theta)), (_uz * _uy * (1 - cos(_theta))) + (_ux * sin (_theta)), cos(_theta) + ((_uz^2) * (1 - cos(_theta)))]
];

private _vxp = (_vx * ((_rotationMatrix select 0) select 0)) + (_vy * ((_rotationMatrix select 0) select 1)) + (_vz * ((_rotationMatrix select 0) select 2));
private _vyp = (_vx * ((_rotationMatrix select 1) select 0)) + (_vy * ((_rotationMatrix select 1) select 1)) + (_vz * ((_rotationMatrix select 1) select 2));
private _vzp = (_vz * ((_rotationMatrix select 2) select 0)) + (_vy * ((_rotationMatrix select 2) select 1)) + (_vz * ((_rotationMatrix select 2) select 2));

private _returnVector = [_vxp, _vyp, _vzp];

[_vxp, _vyp, _vzp];