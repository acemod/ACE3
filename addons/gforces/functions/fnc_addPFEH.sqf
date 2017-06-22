/*
 * Author: KoffeinFlummi and esteldunedain
 * Adds the PFEH
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * call ace_gforces_fnc_addPFEH
 *
 * Public: No
 */
#include "script_component.hpp"

//Reset forces array
GVAR(GForces) = [];
// init array to full array of neutral g-forces
GVAR(GForces) resize 30;
GVAR(GForces) = GVAR(GForces) apply {1};

GVAR(GForces_Index) = 0;

// Setup ppEffect
GVAR(GForces_CC) = ppEffectCreate ["ColorCorrections", 4215];
GVAR(GForces_CC) ppEffectEnable true;
GVAR(GForces_CC) ppEffectForceInNVG true;
GVAR(GForces_CC) ppEffectAdjust [1,1,0,[0,0,0,1],[0,0,0,0],[1,1,1,1],[10,10,0,0,0,0.1,0.5]];
GVAR(GForces_CC) ppEffectCommit 0.4;

GVAR(lastUpdateTime) = 0;
GVAR(oldVel) = [0,0,0];

GVAR(pfID) = [LINKFUNC(pfhUpdateGForces), 0, []] call CBA_fnc_addPerFrameHandler;
