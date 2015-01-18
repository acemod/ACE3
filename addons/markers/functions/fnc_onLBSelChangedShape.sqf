// by commy2
#include "script_component.hpp"

private ["_ctrl", "_data", "_config", "_icon"];

_ctrl = _this select 0;
_data = _ctrl lbValue (_this select 1);

GVAR(curSelMarkerShape) = _this select 1;

_config = (configfile >> "CfgMarkers") select _data;

_icon = getText (_config >> "icon");

((ctrlParent _ctrl) displayCtrl 102) ctrlSetText _icon;

GVAR(currentMarkerShape) = _data;
