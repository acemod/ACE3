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
#include "script_component.hpp"

private ["_data", "_config"];

params ["_ctrl", "_index"];
TRACE_2("params",_ctrl,_index);

_data = _ctrl lbValue _index;

GVAR(curSelMarkerColor) = _index;

_config = (configFile >> "CfgMarkerColors") select _data;

GVAR(currentMarkerColorConfigName) = (configName _config);
