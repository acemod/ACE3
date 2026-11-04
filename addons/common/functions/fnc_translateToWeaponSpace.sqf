#include "..\script_component.hpp"
/*
 * Author: ACE-Team
 * Translates a world position (ASL) into coordinates relative to an object in the given basis.
 *
 * Arguments:
 * 0: Object, its position is used as origin <OBJECT>
 * 1: Basis vectors <ARRAY>
 *     0: X axis vector <ARRAY>
 *     1: Y axis vector <ARRAY>
 *     2: Z axis vector <ARRAY>
 * 2: Position ASL <ARRAY>
 *
 * Return Value:
 * Coordinates in the basis [x, y, z] <ARRAY>
 *
 * Example:
 * [player, [[1,0,0], [0,1,0], [0,0,1]], getPosASL car] call ace_common_fnc_translateToWeaponSpace
 *
 * Public: No
 */

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
