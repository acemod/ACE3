//fnc_adjustTraverse.sqf
#include "script_component.hpp"

private["_gun", "_phase", "_newPhase", "_m"];

PARAMS_1(_dir);

_gun = GVAR(activeGun);
_phase = (_gun animationPhase "MainTurretTraverse");
_m = 0.25;
_newPhase = (((_phase+(_dir*_m))) min 100) max -100;
_gun animate ["MainTurretTraverse", _newPhase];
false