/*
 * Author: LorenLuke
 * Rotates the first vector around the second, clockwise by angle theta
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
 * [eyeDirection player, weaponDirection (currentWeapon player), 45] call ace_common_fnc_rotateVectorAroundVector;
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_vector1", "_vector2", "_theta"];

private _normalVector = vectorNormalized _vector2;
private = _s_theta = sin(_theta);
private = _c_theta = cos(_theta);

// Rodrigues Rotation Formula;
// https://wikimedia.org/api/rest_v1/media/math/render/svg/2d63efa533bdbd776434af1a7af3cdafaff1d578
private _returnVector = (_vector1 vectorMultiply _c_theta) vectorAdd ((_normalVector vectorCrossProduct _vector1) vectorMultiply _s_theta) vectorAdd (_normalVector vectorMultiply ((_normalVector vectorDotProduct _vector1) * (1 - _c_theta)));

_returnVector
