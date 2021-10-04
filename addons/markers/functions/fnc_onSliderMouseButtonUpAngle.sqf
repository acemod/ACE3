#include "script_component.hpp"
/*
 * Author: 10Dozen
 * Angle slider clicked handler. Resets slider pos to 0 on RMB button up.
 *
 * Arguments:
 * 0: Slider (idc 1210) is expected <CONTROL>
 * 1: Button released (0 - Left mouse btn, 1 - Right mouse btn) <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [Slider, 1] call ace_markers_fnc_onSliderMouseButtonUpAngle
 *
 * Public: No
 */

params ["_aceAngleSlider", "_button"];
TRACE_2("params",_aceAngleSlider,_button);

if (_button isNotEqualTo 1) exitWith {};

_aceAngleSlider sliderSetPosition 0;
[_aceAngleSlider, 0] call FUNC(onSliderPosChangedAngle);
