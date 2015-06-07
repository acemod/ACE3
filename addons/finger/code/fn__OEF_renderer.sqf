#include "addon.hpp"
#include "main.hpp"

#define BASE_SIZE 44


PV(_pos) = [0,0,0];
PV(_name) = "";


PV(_fov_corr) = ((worldToScreen (positionCameraToWorld [1000, 0, 10000])) select 0) - 0.5;
PV(_sz) = BASE_SIZE * _fov_corr;

{
	_pos = _x select 0;
	_name = _x select 1;
	
	drawIcon3D [FP_ICON, [
		GVAR(FP_indicator_color) select 0, 
		GVAR(FP_indicator_color) select 1, 
		GVAR(FP_indicator_color) select 2, 
		(GVAR(FP_indicator_color) select 3) max MIN_OPAQUE
	], _pos, _sz, _sz, 0, _name, 1, 0.03, "PuristaMedium"];
} forEach MAP_VALUES(GVAR(cur_fps));
