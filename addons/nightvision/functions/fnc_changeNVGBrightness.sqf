/*
 * Author: commy2
 * Change the brightness of the unit's NVG.
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
TRACE_2("changeNVGBrightness",_player,_changeInBrightness);

private _effectsEnabled    = GVAR(effectScaling) != 0;
private _defaultBrightness = [-3, 0] select _effectsEnabled;

private _brightness = _player getVariable [QGVAR(NVGBrightness), _defaultBrightness];
_brightness = ((_brightness + _changeInBrightness) min 0) max -6;
_player setVariable [QGVAR(NVGBrightness), _brightness, false];

// Display default setting as 0
[format [LLSTRING(NVGBrightness), _brightness - _defaultBrightness]] call EFUNC(common,displayTextStructured);
playSound "ACE_Sound_Click";

// Handle brightness only if effects are disabled
if (!_effectsEnabled) exitWith {
    _brightness = linearConversion [-6, 0, _brightness, 0.4, 1.6, true];
    GVAR(ppEffectNVGBrightness) ppEffectAdjust [1, _brightness, 0, [0, 0, 0, 0], [0, 0, 0, 1], [0, 0, 0, 1]];
    GVAR(ppEffectNVGBrightness) ppEffectCommit 0;
};

// Trigger full ppEffects update next time run in the PFEH
GVAR(nextEffectsUpdate) = -1;
