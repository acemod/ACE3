#include "defines.h"

private ["_audibleFire", "_attenuation", "_totalAttenuation", "_ID"];
_audibleFire = _this;

if (_audibleFire < 1) exitWith {};

_totalAttenuation = 1;

if (_audibleFire > 1) then {
	// TODO: Use a headgear config entry instead
	if (headgear player == "H_Cap_headphones") then {
		_attenuation = 0.25 max (1 / _audibleFire) min 1; // max. -20 dB
		_totalAttenuation = _totalAttenuation * _attenuation;
		_audibleFire = _audibleFire * _attenuation;
	};
};

if (_audibleFire > 1) then {
	if (player getVariable ["cse_combatdeaf_earplugs", NO_EARPLUGS] == ELECTRONIC_EARPLUGS) then {
		_attenuation = 0.125 max (1 / _audibleFire) min 1; // max. -30 dB
		_totalAttenuation = _totalAttenuation * _attenuation;
		_audibleFire = _audibleFire * _attenuation;
	};
};

if (_totalAttenuation < 1) then {
	_ID = floor(random 1000000);
	[format["electronicHearingProtection_%1", _ID], _totalAttenuation, true] call cse_fnc_setHearingCapability;
	_ID spawn {
		sleep 2;
		[format["electronicHearingProtection_%1", _this], 1, false] call cse_fnc_setHearingCapability;
	};
};
