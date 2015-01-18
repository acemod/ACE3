// by commy2
#include "script_component.hpp"

private ["_ctrl", "_data", "_direction"];

_ctrl = _this select 0;
_data = _this select 1;

GVAR(curSelMarkerAngle) = _data;

_direction = round _data;
if (_direction < 0) then {
    _direction = _direction + 360;
};

((ctrlParent _ctrl) displayCtrl 1221) ctrlSetText format [localize "STR_ACE_Markers_MarkerDirection", _direction];

GVAR(currentMarkerAngle) = _data;
