//fnc_levelGun.sqf
#include "script_component.hpp"

_pb = GVAR(m137Gun) call BIS_fnc_getPitchBank;
_pitch = abs(_pb select 0);
_bank = abs(_pb select 1);

if(_pitch <= 2.5 && {_bank <= 2.5}) then {
	_p = getPos GVAR(m137Gun);
	_p set[2, 0];
	GVAR(m137Gun) setPosATL _p;
	GVAR(m137Gun) setVectorUp [0,0,0.0001];
	hintSilent "The gun has been leveled.";
} else {
	hintSilent "The ground is not level enough to properly level this gun.";
};