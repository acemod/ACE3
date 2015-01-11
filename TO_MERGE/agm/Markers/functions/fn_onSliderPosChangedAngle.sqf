// by commy2

private ["_ctrl", "_data", "_direction"];

_ctrl = _this select 0;
_data = _this select 1;

uiNamespace setVariable ["AGM_Markers_curSelMarkerAngle", _data];

_direction = round _data;
if (_direction < 0) then {
  _direction = _direction + 360;
};

((ctrlParent _ctrl) displayCtrl 1221) ctrlSetText format [localize "STR_AGM_Markers_MarkerDirection", _direction];

uiNamespace setVariable ["AGM_Markers_currentMarkerAngle", _data];
