/*
 * Author: ?
 * Checked if something is in Line of View
 *
 * Arguments:
 * 0: Postition 1 <ARRAY>
 * 1: Postion 2 <ARRAY>
 *
 * Return Value:
 * is View Free <BOOL>
 *
 * Example:
 * [[0,0,7],[13,3,7]] call ace_laser_fnc_checkLos
 *
 * Public: No
 */
#include "script_component.hpp"

private "_vectorTo";
params ["_pos1", "_pos2"];

_vectorTo = [_pos2, _pos1] call BIS_fnc_vectorFromXToY;

_vectorTo params ["_x", "_y", "_z"];
_x = _x * 0.25;
_y = _y * 0.25;
_z = _z * 0.25;

_pos2 params ["_pos2X", "_pos2Y", "_pos2Z"];
_pos2 = [_pos2X + _x, _pos2Y + _y, _pos2Z + _z];

// player sideChat format["new los check"];

if (terrainIntersect [_pos2, _pos1]) exitWith { false };
if (lineIntersects [_pos2, _pos1]) exitWith { false };  // should take as arguments and add to this command objects to exclude - target and observer
true
