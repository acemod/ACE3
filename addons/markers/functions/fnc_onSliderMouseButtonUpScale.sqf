#include "script_component.hpp"
/*
 * Author: 10Dozen
 * Scale slider clicked handler. Resets slider pos to 1 on RMB button up.
 *
 * Arguments:
 * 0: Slider (idc 1420) is expected <CONTROL>
 * 1: Button released (0 - Left mouse btn, 1 - Right mouse btn) <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [Slider, 1] call ace_markers_fnc_onSliderMouseButtonUpScale
 *
 * Public: No
 */

params ["_aceScaleSlider", "_button"];
TRACE_2("params",_aceScaleSlider,_button);

if (_button isNotEqualTo 1) exitWith {};

_aceScaleSlider sliderSetPosition 1;
[_aceScaleSlider, 1] call FUNC(onSliderPosChangedScale);
