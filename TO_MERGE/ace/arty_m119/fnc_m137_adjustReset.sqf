//fnc_m137_adjustReset.sqf
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
_count = _gun getVariable QGVAR(resetCounter);
_gun setVariable [QGVAR(resetCounter), _count+(_size*_dir)];