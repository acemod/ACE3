/*
 * Author: commy2
 * Angle Slider Pos changed
 *
 * Arguments:
 * 0: Slider (idc 1210) <CONTROL>
 * 1: Slider Data (angle: -180..180) <NUMBER>
 *
 * Return Value:
 * Nothing
 *
 * Example:
 * [Slider, 2] call ace_markers_fnc_onSliderPosChangedAngle;
 *
 * Public: No
 */
#include "script_component.hpp"

private ["_direction"];

PARAMS_2(_ctrl,_data);

_direction = round _data;
if (_direction < 0) then {
    _direction = _direction + 360;
};

((ctrlParent _ctrl) displayCtrl 1221) ctrlSetText format [localize LSTRING(MarkerDirection), _direction];

GVAR(currentMarkerAngle) = _data;
