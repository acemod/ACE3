#include "defines.h"

private ["_unit", "_attenuation"];
_unit = _this;

_attenuation = 1;

if (player getVariable ["cse_combatdeaf_earplugs", NO_EARPLUGS] != NO_EARPLUGS) then {
	_attenuation = _attenuation * 0.125; // -30 dB
};
// TODO: Use a headgear config entry instead
if (headgear player == "H_Cap_headphones") then {
	_attenuation = _attenuation * 0.25; // -20 dB
};

_attenuation
