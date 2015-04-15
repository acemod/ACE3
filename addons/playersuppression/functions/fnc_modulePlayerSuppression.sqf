#include "script_component.hpp"

private ["_logic"];
_logic = _this select 0;
GVAR(intensity)         = _logic getVariable "intensity";
GVAR(enablePlayerSuppression) = true;
if (isDedicated) exitWith {};

GVAR(threshold)         = 0;	 // Changing value
GVAR(lastShotAt)        = 0;	 // The time the player got shot at last time (Just creates the variable)
GVAR(isSuppressed)      = false;

// PPEffects
// Color Correction
GVAR(cc) = ppEffectCreate ["colorCorrections", 1501];
GVAR(cc) ppEffectAdjust [1, 1, 0, [0,0,0,0], [1,1,1,1],[1,1,1,0]];
GVAR(cc) ppEffectEnable true;
GVAR(cc) ppEffectCommit 0;

// Blur
GVAR(blur) = ppEffectCreate ["DynamicBlur", 800];
GVAR(blur) ppEffectAdjust [0];
GVAR(blur) ppEffectCommit 0.3;
GVAR(blur) ppEffectEnable true;

// RBlur
GVAR(rBlur) = ppEffectCreate ["RadialBlur", 1003]; 
GVAR(rBlur) ppEffectAdjust [0, 0, 0, 0];
GVAR(rBlur) ppEffectCommit 0;
GVAR(rBlur) ppEffectEnable true;

[FUNC(main), 1, [] ] call CBA_fnc_addPerFrameHandler;	

true