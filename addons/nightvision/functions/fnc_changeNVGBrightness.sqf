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

private _brightness = _player getVariable [QGVAR(NVGBrightness), 0];

_brightness = ((_brightness + _changeInBrightness) min 0) max -6;

_player setVariable [QGVAR(NVGBrightness), _brightness, false];

[format [(localize LSTRING(NVGBrightness)), _brightness]] call EFUNC(common,displayTextStructured);
playSound "ACE_Sound_Click";

// Trigger full ppEffects update next time run in the PFEH:
GVAR(nextEffectsUpdate) = -1;
