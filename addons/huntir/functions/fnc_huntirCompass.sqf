/*
 * Author: Norrin, Rocko, Ruthberg
 *
 * HuntIR monitor compass
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * call ACE_huntir_fnc_huntirCompass
 *
 * Public: No
 */
#include "script_component.hpp"

disableSerialization;

#define __DSP (uiNamespace getVariable QGVAR(cam_rose))
#define __CHAR_N (__DSP displayCtrl 64432)
#define __CHAR_E (__DSP displayCtrl 64433)
#define __CHAR_S (__DSP displayCtrl 64434)
#define __CHAR_W (__DSP displayCtrl 64435)

#define __OFFSET_X 0.003
#define __OFFSET_Y 0.003
#define __WIDTH 0.1
#define __HEIGHT 0.1
#define __RADIUS 0.05
#define __CENTER_X 0.70
#define __CENTER_Y 0.65

private _fnc_correctIt = {
    params ["_pos", "_dir"];
    if (_dir >= 270 || {_dir <= 90}) then {
        _pos set [1, (_pos select 1) + __OFFSET_Y]
    };
    if (_dir >= 0 && {_dir <= 180}) then {
        _pos set [0, (_pos select 0) - __OFFSET_X]
    };
    if (_dir >= 90 && {_dir <= 270}) then {
        _pos set [1, (_pos select 1) - __OFFSET_Y]
    };
    if (_dir >= 180 && {_dir <= 360}) then {
        _pos set [0, (_pos select 0) + __OFFSET_X]
    };
    _pos
};

HUNTIR_CAM_ROSE_LAYER_ID cutRsc [QGVAR(cam_rose), "PLAIN"];

[{
    params ["_args", "_idPFH"];
    _args params ["_fnc_correctIt"];

    if (GVAR(stop)) exitWith {
        HUNTIR_CAM_ROSE_LAYER_ID cutText ["", "PLAIN"];
        [_idPFH] call CBA_fnc_removePerFrameHandler;
    };

    private _dir = getDir GVAR(cam); // direction player;

    private _x1 = __CENTER_X - (__RADIUS * sin(_dir));
    private _y1 = __CENTER_Y - (__RADIUS * cos(_dir));
    private _pos = [[_x1, _y1], _dir] call _fnc_correctIt;
    __CHAR_N ctrlSetPosition [_pos select 0, _pos select 1, __WIDTH, __HEIGHT];
    __CHAR_N ctrlCommit 0;

    _x1 = __CENTER_X - (__RADIUS * sin(_dir + 90));
    _y1 = __CENTER_Y - (__RADIUS * cos(_dir + 90));
    _pos = [[_x1, _y1], _dir] call _fnc_correctIt;
    __CHAR_W ctrlSetPosition [_pos select 0, _pos select 1, __WIDTH, __HEIGHT];
    __CHAR_W ctrlCommit 0;

    _x1 = __CENTER_X - (__RADIUS * sin(_dir + 180));
    _y1 = __CENTER_Y - (__RADIUS * cos(_dir + 180));
    _pos = [[_x1, _y1], _dir] call _fnc_correctIt;
    __CHAR_S ctrlSetPosition [_pos select 0, _pos select 1, __WIDTH, __HEIGHT];
    __CHAR_S ctrlCommit 0;

    _x1 = __CENTER_X - (__RADIUS * sin(_dir + 270));
    _y1 = __CENTER_Y - (__RADIUS * cos(_dir + 270));
    _pos = [[_x1, _y1], _dir] call _fnc_correctIt;
    __CHAR_E ctrlSetPosition [_pos select 0, _pos select 1, __WIDTH, __HEIGHT];
    __CHAR_E ctrlCommit 0;

}, 0.01, [_fnc_correctIt]] call CBA_fnc_addPerFrameHandler;
