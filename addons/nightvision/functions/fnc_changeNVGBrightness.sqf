/*
 * Author: commy2
 * Change the brightness of the unit's NVG
 *
 * Arguments:
 * 0: The Unit <OBJECT>
 * 1: Change in brightness (1 or -1) <SCALAR>
 *
 * Return Value:
 * Nothing
 *
 * Example:
 * [player, 1] call ace_nightvision_fnc_changeNVGBrightness
 *
 * Public: No
 */
#include "script_component.hpp"

private ["_brightness"];

PARAMS_2(_player,_changeInBrightness);

_brightness = _player getVariable [QGVAR(NVGBrightness), 0];

_brightness = ((round (10 * _brightness + _changeInBrightness) / 10) min 1) max -1;

_player setVariable [QGVAR(NVGBrightness), _brightness, false];

GVAR(ppEffectNVGBrightness) ppEffectAdjust [1, 1, _brightness / 4, [0, 0, 0, 0], [0, 0, 0, 1], [0, 0, 0, 1]];
GVAR(ppEffectNVGBrightness) ppEffectCommit 0;

[format [(localize LSTRING(NVGBrightness)), (_brightness * 100)]] call EFUNC(common,displayTextStructured);
playSound "ACE_Sound_Click";
