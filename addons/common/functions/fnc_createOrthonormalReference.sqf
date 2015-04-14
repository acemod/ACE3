/*
 * Author: esteldunedain
 *
 * Returns a orthonormal system of reference aligned with the supplied vector
 *
 * Argument:
 * Vector to align the coordinate system with (Array)
 *
 * Return value:
 * 0: v1 (Array)
 * 1: v2 (Array)
 * 2: v3 (Array)
 */
#include "script_component.hpp"

private ["_v1","_v2","_v3"];
_v1 = vectorNormalized _this;
_v2 = vectorNormalized (_v1 vectorCrossProduct [0,0,1]);
_v3 = _v2 vectorCrossProduct _v1;

[_v1,_v2,_v3]
