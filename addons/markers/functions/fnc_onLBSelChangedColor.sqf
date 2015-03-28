/*
 * Author: commy2
 * When the color list box is changed.
 *
 * Arguments:
 * 0: Color ListBox (idc 1211) <CONTROL>
 * 1: Selected Index <NUMBER>
 *
 * Return Value:
 * Nothing
 *
 * Example:
 * [ColorLB, 5] call ace_markers_fnc_onLBSelChangedColor;
 *
 * Public: No
 */
#include "script_component.hpp"

private ["_data", "_config", "_color"];

PARAMS_2(_ctrl,_index);
_data = _ctrl lbValue _index;

GVAR(curSelMarkerColor) = _index;

_config = (configfile >> "CfgMarkerColors") select _data;

_color = getArray (_config >> "color");

//Array could be strings of code that need to be converted:
{
    if (typeName _x != "SCALAR") then {
        _color set [_forEachIndex, call compile _x];
    };
} forEach _color;

((ctrlParent _ctrl) displayCtrl 102) ctrlSetTextColor _color;

GVAR(currentMarkerColorConfigName) = (configName _config);
