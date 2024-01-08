#include "script_component.hpp"
/*
 * Author: Lambda.Tiger
 * Fades a trace over time based on given parameters
 *
 * Arguments:
 * 0: PFEH arguments <ARRAY>
 * 1: PHEH handle <SCALAR>
 *
 * Return Value:
 * None
 *
 * Example:
 *
 * Public: No
 */
params ["_args", "_h"];
        
private _arr = GVAR(dev_trackLines) getOrDefault [(_args#0), []];
if (count _arr < 3) exitWith
{
    [_h] call CBA_fnc_removePerFrameHandler;
};

private _alpha = _arr#0;
private _color = _arr#2;
_alpha = (_alpha - __FADE_RATE) min 1;
_arr set [0, _alpha];
_color set [3, _alpha];
_color set [1, (0.5 - _alpha/2) max 0];
if (_alpha <= 0 ) then
{
    [_h] call CBA_fnc_removePerFrameHandler;
};