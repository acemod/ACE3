//fnc_m137_adjustAzimuth.sqf
#include "script_component.hpp"

private["_gun", "_size", "_phase", "_newPhase"];

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
_phase = _gun animationPhase "M137OpticRevolve";

_newPhase = round(_phase+(_dir*_size));
_gun setVariable [QGVAR(resetPhase), _newPhase];
_gun animate ["M137OpticRevolve", _newPhase];