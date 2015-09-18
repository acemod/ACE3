/*
 * Author: esteldunedain
 * Returns a orthonormal system of reference aligned with the supplied vector
 *
 * Argument:
 * Vector to align the coordinate system with (Array)
 *
 * Return Value:
 * 0: Vector Normalized <ARRAY>
 * 1: Normalized Cross Product Vector <ARRAY>
 * 2: Vector Cross Product <ARRAY>
 *
 * Public: Yes
 */
#include "script_component.hpp"

private ["_v1", "_v2", "_v3"];

_v1 = vectorNormalized _this;
_v2 = vectorNormalized (_v1 vectorCrossProduct [0,0,1]);
_v3 = _v2 vectorCrossProduct _v1;

[_v1,_v2,_v3]
