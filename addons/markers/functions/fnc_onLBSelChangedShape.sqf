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
#include "script_component.hpp"

params ["_ctrl", "_index"];
TRACE_2("params",_ctrl,_index);

private _data = _ctrl lbValue _index;

GVAR(curSelMarkerShape) = _index;

private _config = (configFile >> "CfgMarkers") select _data;

GVAR(currentMarkerConfigName) = configName _config;

//Set map display to same shape:
private _bisShapeLB = switch (false) do {
    case (isNull findDisplay 12): {(findDisplay 12) displayCtrl 1091};
    case (isNull findDisplay 52): {(findDisplay 52) displayCtrl 1091};
    case (isNull findDisplay 53): {(findDisplay 53) displayCtrl 1091};
    case (isNull findDisplay 37): {(findDisplay 37) displayCtrl 1091};
    default {controlNull};
};
if (_ctrl != _bisShapeLB) then { //Don't set what we got a EH from
    _bisShapeLB lbSetCurSel GVAR(curSelMarkerShape);
};
