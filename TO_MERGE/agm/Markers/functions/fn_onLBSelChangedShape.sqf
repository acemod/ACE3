// by commy2

private ["_ctrl", "_data", "_config", "_icon"];

_ctrl = _this select 0;
_data = _ctrl lbValue (_this select 1);

uiNamespace setVariable ["AGM_Markers_curSelMarkerShape", _this select 1];

_config = (configfile >> "CfgMarkers") select _data;

_icon = getText (_config >> "icon");

((ctrlParent _ctrl) displayCtrl 102) ctrlSetText _icon;

uiNamespace setVariable ["AGM_Markers_currentMarkerShape", _data];
