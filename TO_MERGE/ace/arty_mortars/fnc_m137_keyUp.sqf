//fnc_m137_keyUp.sqf
#include "script_component.hpp"
PARAMS_4(_ctrl,_code,_shift,_ctrl);

_code = _this select 1;
if(_code == 0x2A) then {
	GVAR(m137_shift) = false;
};
if(_code == 29) then {
	GVAR(m137_ctrl) = false;
};