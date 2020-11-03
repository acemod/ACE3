#include "script_component.hpp"
#include "\a3\ui_f\hpp\defineResincl.inc"
/*
 * Author: commy2
 * When the shape list box is changed.
 *
 * Arguments:
 * 0: Shape ListBox (idc 1210) <CONTROL>
 * 1: Selected Index <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [ColorLB, 5] call ace_markers_fnc_onLBSelChangedShape;
 *
 * Public: No
 */

params ["_ctrl", "_index"];
TRACE_2("params",_ctrl,_index);

private _data = _ctrl lbValue _index;

GVAR(curSelMarkerShape) = _index;

private _config = (configFile >> "CfgMarkers") select _data;

GVAR(currentMarkerConfigName) = configName _config;

//Set map display to same shape:
private _bisShapeLB = switch (false) do {
    case (isNull findDisplay 12): {(findDisplay 12) displayCtrl IDC_DIARY_MARKER_ICON};
    case (isNull findDisplay 52): {(findDisplay 52) displayCtrl IDC_DIARY_MARKER_ICON};
    case (isNull findDisplay 53): {(findDisplay 53) displayCtrl IDC_DIARY_MARKER_ICON};
    case (isNull findDisplay 37): {(findDisplay 37) displayCtrl IDC_DIARY_MARKER_ICON};
    default {controlNull};
};
if (_ctrl != _bisShapeLB) then { //Don't set what we got a EH from
    _bisShapeLB lbSetCurSel GVAR(curSelMarkerShape);
};
