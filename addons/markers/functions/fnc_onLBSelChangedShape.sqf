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
