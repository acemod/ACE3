/*
 * Author: commy2
 * Change the brightness of the unit's NVG
 *
 * Arguments:
 * 0: The Unit <OBJECT>
 * 1: Change in brightness (1 or -1) <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, 1] call ace_nightvision_fnc_changeNVGBrightness
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_player", "_changeInBrightness"];
TRACE_2("params",_player,_changeInBrightness);

if (!hasInterface) exitWith {};

private _brightness = _player getVariable [QGVAR(NVGBrightness), 0];

_brightness = ((round (10 * _brightness + _changeInBrightness) / 10) min 0.5) max -0.5;

_player setVariable [QGVAR(NVGBrightness), _brightness, false];

GVAR(ppEffectNVGBrightness) ppEffectAdjust [1, (_brightness + 1), 0, [0, 0, 0, 0], [0, 0, 0, 1], [0, 0, 0, 1]];
GVAR(ppEffectNVGBrightness) ppEffectCommit 0;

[format [(localize LSTRING(NVGBrightness)), (_brightness * 10)]] call EFUNC(common,displayTextStructured);
playSound "ACE_Sound_Click";
