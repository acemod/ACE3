//fnc_adjustElevation.sqf
#include "script_component.hpp"

private["_gun", "_phase", "_newPhase"];

PARAMS_1(_dir);
_gun = GVAR(activeGun);
_phase = round(_gun animationPhase "MainGun");

_newPhase = ((round(_phase+_dir)) min 1244) max -100;
_gun animate ["MainGun", _newPhase];
false