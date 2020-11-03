#include "script_component.hpp"
#include "\a3\ui_f\hpp\defineResincl.inc"
/*
 * Author: commy2
 * When the color list box is changed.
 *
 * Arguments:
 * 0: Color ListBox (idc 1211) <CONTROL>
 * 1: Selected Index <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [ColorLB, 5] call ace_markers_fnc_onLBSelChangedColor;
 *
 * Public: No
 */

params ["_ctrl", "_index"];
TRACE_2("params",_ctrl,_index);

private _data = _ctrl lbValue _index;

GVAR(curSelMarkerColor) = _index;

private _config = (configFile >> "CfgMarkerColors") select _data;

GVAR(currentMarkerColorConfigName) = configName _config;

//Set map display to same color:
private _bisColorLB = switch (false) do {
    case (isNull findDisplay 12): {(findDisplay 12) displayCtrl IDC_DIARY_MARKER_COLOR};
    case (isNull findDisplay 52): {(findDisplay 52) displayCtrl IDC_DIARY_MARKER_COLOR};
    case (isNull findDisplay 53): {(findDisplay 53) displayCtrl IDC_DIARY_MARKER_COLOR};
    case (isNull findDisplay 37): {(findDisplay 37) displayCtrl IDC_DIARY_MARKER_COLOR};
    default {controlNull};
};
if (_ctrl != _bisColorLB) then { //Don't set what we got a EH from
    _bisColorLB lbSetCurSel GVAR(curSelMarkerColor);
};
