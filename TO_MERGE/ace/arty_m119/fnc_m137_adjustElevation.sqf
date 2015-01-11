//fnc_m137_adjustElevation.sqf
#include "script_component.hpp"

private["_gun", "_size", "_count", "_increment"];

PARAMS_1(_dir);

_gun = GVAR(m137Gun);

_size = 1;
if(GVAR(m137_shift)) then {
	if(GVAR(m137_ctrl)) then {
		_size = 100;
	} else {
		_size = 10;
	};
};
_count = _gun getVariable QGVAR(elevationCounter);
_increment = ((_count+(_size*_dir)) min 1600) max -200;
_gun setVariable [QGVAR(elevationCounter), _increment];