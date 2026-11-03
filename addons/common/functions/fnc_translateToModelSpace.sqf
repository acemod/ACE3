#include "..\script_component.hpp"
/*
 * Author: ACE-Team
 * Translates an offset given in an object-relative basis into a world position (ASL).
 *
 * Arguments:
 * 0: Object, its position is used as origin <OBJECT>
 * 1: Basis vectors <ARRAY>
 *     0: X axis vector <ARRAY>
 *     1: Y axis vector <ARRAY>
 *     2: Z axis vector <ARRAY>
 * 2: Offset in the basis [x, y, z] <ARRAY>
 *
 * Return Value:
 * Position ASL <ARRAY>
 *
 * Example:
 * [player, [[1,0,0], [0,1,0], [0,0,1]], [0, 1, 0]] call ace_common_fnc_translateToModelSpace
 *
 * Public: No
 */

params ["_object", "_matrix", "_offset"];

private _origin = getPosASL _object;

_matrix params ["_xVec", "_yVec", "_zVec"];

_offset params ["_x", "_y", "_z"];

(_xVec vectorMultiply _x) vectorAdd (_yVec vectorMultiply _y) vectorAdd (_zVec vectorMultiply _z) vectorAdd _origin // return
