//fnc_m137_adjustOpticElevation.sqf
#include "script_component.hpp"
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
_count = _gun animationPhase "M137OpticElevate";
_increment = ((_count+(_size*_dir)) min 300) max -300;
_gun animate ["M137OpticElevate", _increment];