#include "..\script_component.hpp"
/*
 * Author: frankplow
 * Applies scale from on slider position change.
 *
 * Arguments:
 * 0: Slider (idc 1420) <CONTROL>
 * 1: Slider Data (scale: 0.5...2.0) <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [slider, 1.5] call ace_markers_fnc_onSliderPosChangedScale
 *
 * Public: No
 */

params ["_ctrl", "_data"];
TRACE_2("params",_ctrl,_data);

private _scale = _data * 100;
_scale = round _scale;
_scale = _scale / 100;

((ctrlParent _ctrl) displayCtrl IDC_ACE_INSERT_MARKER_SCALE_TEXT) ctrlSetText format [localize LSTRING(MarkerScale), _scale];

GVAR(currentMarkerScale) = _data;
