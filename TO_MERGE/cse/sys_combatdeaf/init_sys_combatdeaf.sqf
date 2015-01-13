#include "functions\defines.h"

if (!hasInterface) exitwith {};
waituntil{!isnil "cse_gui" && !isnil "cse_main"};

waitUntil {!isNull player};

private ["_args"];
_args = _this;
{
	_varName = "cse_"+(_x select 0);
	missionNamespace setVariable[_varName, _x select 1];
} forEach _args;

if (isNil "cse_DeafnessIntensity") then { cse_DeafnessIntensity = cse_DEAFNESS_EFFECT_INTENSITY };
if (isNil "cse_DisableEarRinging") then { cse_DisableEarRinging = cse_DISABLE_EAR_RINGING };

["cse_combatdeaf_deafness", 0, false, "cd"] call cse_fnc_defineVariable;
["cse_combatdeaf_earplugs", NO_EARPLUGS, false, "cd"] call cse_fnc_defineVariable;

call cse_fnc_register_ear_protection_actions_DEAF;

player addEventHandler ["FiredNear", {_this call cse_fnc_handleFiredNear_DEAF}];
player addEventHandler ["Explosion", {_this call cse_fnc_explosion_DEAF}];

cse_sys_combatdeaf_blurEffect = ppEffectCreate ["dynamicBlur", -11723];
cse_sys_combatdeaf_deafness_running = false;

cse_sys_combatdeaf = true;