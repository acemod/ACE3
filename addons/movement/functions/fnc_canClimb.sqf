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

params ["_unit"];

private _pos = getPosASL _unit;
private _dir = getDir _unit;

_dir = [sin _dir, cos _dir, 0];

private _checkPos0beg = _pos vectorAdd [0, 0, 0.9];
private _checkPos0end = _checkPos0beg vectorAdd (_dir vectorMultiply 1.3);

private _checkPos1beg = _pos vectorAdd [0, 0, 1.75];
private _checkPos1end = _checkPos1beg vectorAdd (_dir vectorMultiply 1.3);

private _checkPos2beg = _pos vectorAdd [0.3 * (_dir select 1), 0.3 * -(_dir select 0), 2.0];
private _checkPos2end = _checkPos2beg vectorAdd (_dir vectorMultiply 1.3);

private _checkPos3beg = _pos vectorAdd [-0.2 * (_dir select 1), -0.2 * -(_dir select 0), 2.0];
private _checkPos3end = _checkPos3beg vectorAdd (_dir vectorMultiply 1.3);

private _checkPos4beg = _pos vectorAdd [0.3 * (_dir select 1), 0.3 * -(_dir select 0), 1.5];
private _checkPos4end = _checkPos4beg vectorAdd (_dir vectorMultiply 1.3);

private _checkPos5beg = _pos vectorAdd [-0.2 * (_dir select 1), -0.2 * -(_dir select 0), 1.5];
private _checkPos5end = _checkPos5beg vectorAdd (_dir vectorMultiply 1.3);

#ifdef DEBUG_MODE_FULL
    [{
        params ["_args", "_idPFH"];

        if (diag_tickTime > (_args select 0) + 5) exitWith {
            [_idPFH] call CBA_fnc_removePerFrameHandler;
        };

        drawLine3D [ASLToATL (_args select 1), ASLToATL (_args select 2), [0,1,0,1]];
        drawLine3D [ASLToATL (_args select 3), ASLToATL (_args select 4), [1,0,0,1]];
        drawLine3D [ASLToATL (_args select 5), ASLToATL (_args select 6), [1,0.5,0.5,1]];
        drawLine3D [ASLToATL (_args select 7), ASLToATL (_args select 8), [1,0.5,0.5,1]];
        drawLine3D [ASLToATL (_args select 9), ASLToATL (_args select 10), [1,0.5,0.5,1]];
        drawLine3D [ASLToATL (_args select 11), ASLToATL (_args select 12), [1,0.5,0.5,1]];
    }, 0, [ diag_tickTime,
            _checkPos0beg, _checkPos0end,
            _checkPos1beg, _checkPos1end,
            _checkPos2beg, _checkPos2end,
            _checkPos3beg, _checkPos3end,
            _checkPos4beg, _checkPos4end,
            _checkPos5beg, _checkPos5end
    ]] call CBA_fnc_addPerFrameHandler;
#endif

      lineIntersects [_checkPos0beg, _checkPos0end]
&& {!(lineIntersects [_checkPos1beg, _checkPos1end])}
&& {!(lineIntersects [_checkPos2beg, _checkPos2end])}
&& {!(lineIntersects [_checkPos3beg, _checkPos3end])}
&& {!(lineIntersects [_checkPos4beg, _checkPos4end])}
&& {!(lineIntersects [_checkPos5beg, _checkPos5end])}
