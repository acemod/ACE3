/*
 * Author: ACE-Team
 * ?
 *
 * Arguments:
 * <UNKOWN>
 *
 * Return Value:
 * Unknown <UNKNOWN>
 *
 * Example:
 * [UNKOWN] call ace_common_fnc_translateToWeaponSpace
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_object", "_matrix", "_offset"];

private _origin = getPosASL _object;

_matrix params ["_xVec", "_yVec", "_zVec"];

_offset = _offset vectorDiff _origin;

_offset params ["_x", "_y", "_z"];

[
    ((_xVec select 0) * _x) + ((_xVec select 1) * _y) + ((_xVec select 2) * _z),
    ((_yVec select 0) * _x) + ((_yVec select 1) * _y) + ((_yVec select 2) * _z),
    ((_zVec select 0) * _x) + ((_zVec select 1) * _y) + ((_zVec select 2) * _z)
] // return
