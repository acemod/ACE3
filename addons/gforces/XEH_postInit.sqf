#include "script_component.hpp"

if (!hasInterface) exitWith {};

// Setup ppEffect
GVAR(GForces_CC) = ppEffectCreate ["ColorCorrections", 4215];
GVAR(GForces_CC) ppEffectEnable true;
GVAR(GForces_CC) ppEffectForceInNVG true;
GVAR(GForces_CC) ppEffectAdjust [1,1,0,[0,0,0,1],[0,0,0,0],[1,1,1,1],[10,10,0,0,0,0.1,0.5]];
GVAR(GForces_CC) ppEffectCommit 0.4;

GVAR(lastUpdateTime) = 0;
GVAR(oldVel) = [0,0,0];

[FUNC(pfhUpdateGForces), 0, []] call CBA_fnc_addPerFrameHandler;
