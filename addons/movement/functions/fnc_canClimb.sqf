/*
 * Author: commy2
 * Tests the the player can climb.
 *
 * Arguments:
 * 0: The Unit (usually the player) <OBJECT>
 *
 * Return Value:
 * The return value <BOOL>
 *
 * Example:
 * _bool = [player] call ace_movement_fnc_canClimb
 *
 * Public: No
 */
#include "script_component.hpp"

private ["_unit", "_pos", "_dir"];

_unit = _this select 0;

_pos = getPosASL _unit;
_dir = getDir _unit;
_dir = [sin _dir, cos _dir, 0];

private ["_checkPos0beg", "_checkPos0end", "_checkPos1beg", "_checkPos1end"];

_checkPos0beg = _pos vectorAdd [0, 0, 1.0];
_checkPos0end = _checkPos0beg vectorAdd (_dir vectorMultiply 1.3);

_checkPos1beg = _pos vectorAdd [0, 0, 1.5];
_checkPos1end = _checkPos1beg vectorAdd _dir;

/*
drawLine3D [ASLToATL _checkPos0beg, ASLToATL _checkPos0end, [1,0,0,1]];
drawLine3D [ASLToATL _checkPos1beg, ASLToATL _checkPos1end, [1,0,0,1]];
 */

lineIntersects [_checkPos0beg, _checkPos0end] && {!(lineIntersects [_checkPos1beg, _checkPos1end])}
