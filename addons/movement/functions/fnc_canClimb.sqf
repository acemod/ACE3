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
 * [player] call ace_movement_fnc_canClimb
 *
 * Public: No
 */
#include "script_component.hpp"

private ["_pos", "_dir"];

PARAMS_1(_unit);

_pos = getPosASL _unit;
_dir = getDir _unit;
_dir = [sin _dir, cos _dir, 0];

private ["_checkPos0beg", "_checkPos0end", "_checkPos1beg", "_checkPos1end"];

_checkPos0beg = _pos vectorAdd [0, 0, 0.9];
_checkPos0end = _checkPos0beg vectorAdd (_dir vectorMultiply 1.3);

_checkPos1beg = _pos vectorAdd [0, 0, 1.75];
_checkPos1end = _checkPos1beg vectorAdd (_dir vectorMultiply 1.3);

_checkPos2beg = _pos vectorAdd [0.3 * (_dir select 1), 0.3 * -(_dir select 0), 2.0];
_checkPos2end = _checkPos2beg vectorAdd (_dir vectorMultiply 1.3);

_checkPos3beg = _pos vectorAdd [-0.2 * (_dir select 1), -0.2 * -(_dir select 0), 2.0];
_checkPos3end = _checkPos3beg vectorAdd (_dir vectorMultiply 1.3);

_checkPos4beg = _pos vectorAdd [0.3 * (_dir select 1), 0.3 * -(_dir select 0), 1.5];
_checkPos4end = _checkPos4beg vectorAdd (_dir vectorMultiply 1.3);

_checkPos5beg = _pos vectorAdd [-0.2 * (_dir select 1), -0.2 * -(_dir select 0), 1.5];
_checkPos5end = _checkPos5beg vectorAdd (_dir vectorMultiply 1.3);

/*
drawLine3D [ASLToATL _checkPos0beg, ASLToATL _checkPos0end, [0,1,0,1]];
drawLine3D [ASLToATL _checkPos1beg, ASLToATL _checkPos1end, [1,0,0,1]];
drawLine3D [ASLToATL _checkPos2beg, ASLToATL _checkPos2end, [1,0.5,0.5,1]];
drawLine3D [ASLToATL _checkPos3beg, ASLToATL _checkPos3end, [1,0.5,0.5,1]];
drawLine3D [ASLToATL _checkPos4beg, ASLToATL _checkPos4end, [1,0.5,0.5,1]];
drawLine3D [ASLToATL _checkPos5beg, ASLToATL _checkPos5end, [1,0.5,0.5,1]];
*/

      lineIntersects [_checkPos0beg, _checkPos0end]
&& {!(lineIntersects [_checkPos1beg, _checkPos1end])}
&& {!(lineIntersects [_checkPos2beg, _checkPos2end])}
&& {!(lineIntersects [_checkPos3beg, _checkPos3end])}
&& {!(lineIntersects [_checkPos4beg, _checkPos4end])}
&& {!(lineIntersects [_checkPos5beg, _checkPos5end])}
