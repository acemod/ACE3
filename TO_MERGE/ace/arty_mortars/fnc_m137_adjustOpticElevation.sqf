//fnc_m137_adjustOpticElevation.sqf
#include "script_component.hpp"
PARAMS_1(_dir);

_gun = GVAR(m137Gun);

_size = 1;
if (GVAR(m137_shift)) then {
	if(GVAR(m137_ctrl)) then {
		_size = 10;
	} else {
		_size = 0.1;
	};
};
_count = _gun animationPhase "OpticElevate";
_increment = ((_count+(_size*_dir)) min 1511) max 800;
_gun animate ["OpticElevate", _increment];