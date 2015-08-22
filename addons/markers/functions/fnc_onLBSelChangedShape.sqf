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

private ["_data", "_config"];

params ["_ctrl", "_index"];
_data = _ctrl lbValue _index;

GVAR(curSelMarkerShape) = _index;

_config = (configfile >> "CfgMarkers") select _data;

GVAR(currentMarkerConfigName) = (configName _config);
