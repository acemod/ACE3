// by commy2

private ["_ctrl", "_data", "_config", "_color"];

_ctrl = _this select 0;
_data = _ctrl lbValue (_this select 1);

uiNamespace setVariable ["AGM_Markers_curSelMarkerColor", _this select 1];

_config = (configfile >> "CfgMarkerColors") select _data;

_color = getArray (_config >> "color");

{
  if (typeName _x != "SCALAR") then {
    _color set [_forEachIndex, call compile _x];
  };
} forEach _color;

((ctrlParent _ctrl) displayCtrl 102) ctrlSetTextColor _color;

uiNamespace setVariable ["AGM_Markers_currentMarkerColor", _data];
