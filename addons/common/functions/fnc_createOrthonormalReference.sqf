/*
 * Author: esteldunedain
 * Returns a orthonormal system of reference aligned with the supplied vector
 *
 * Arguments:
 * Vector to align the coordinate system with <ARRAY>
 *
 * Return Value:
 * 0: Vector Normalized <ARRAY>
 * 1: Normalized Cross Product Vector <ARRAY>
 * 2: Vector Cross Product <ARRAY>
 *
 * Example:
 * [[0,0,0]] call ace_common_fnc_createOrthonormalReference
 *
 * Public: Yes
 */
#include "script_component.hpp"

[_this] params [["_vector", [0,0,1], [[]], 3]];

private _v1 = vectorNormalized _this;
private _v2 = vectorNormalized (_v1 vectorCrossProduct [0,0,1]);
private _v3 = _v2 vectorCrossProduct _v1;

[_v1, _v2, _v3]
