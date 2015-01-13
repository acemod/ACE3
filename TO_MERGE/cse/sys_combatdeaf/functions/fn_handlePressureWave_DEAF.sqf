#define PAIN_THRESHOLD 5
#define DAMAGE_THRESHOLD 40
#define HEARING_CAPABILITY_MAP_ID 1713

private ["_sp", "_deafness"];
_sp = _this;

if !(alive player) exitWith {};

if (_sp > 0.5 && cse_DeafnessIntensity > 0.0) then {
	_deafness = ((player getVariable ["cse_combatdeaf_deafness", 0]) + _sp) min (DAMAGE_THRESHOLD / cse_DeafnessIntensity);
	player setVariable ["cse_combatdeaf_deafness", _deafness, false];

	if (!cse_sys_combatdeaf_deafness_running) then {
		[] spawn {
			private ["_deafness", "_ringing", "_ringingStart", "_img", "_volume"];
			cse_sys_combatdeaf_deafness_running = true;
			_deafness = player getVariable ["cse_combatdeaf_deafness", 0];
			_ringing = false;
			_ringingStart = time - 120;
			while {alive player && _deafness > 0.01} do {
				if (_deafness > DAMAGE_THRESHOLD / cse_DeafnessIntensity) then {
					["cse_sys_combatdeaf_deafIcon", true, "cse\cse_sys_combatdeaf\data\cse_combatdeaf_deafness.paa", [1,1,1,1]] call cse_fnc_gui_displayIcon;
				} else {
					["cse_sys_combatdeaf_deafIcon", false, "", [1,1,1,1]] call cse_fnc_gui_displayIcon;
					if (!cse_DisableEarRinging && _deafness > PAIN_THRESHOLD / cse_DeafnessIntensity) then {
						if (!_ringing || time - _ringingStart > 120) then {
							playSound "cse_combatdeaf_ear_ringing";
							_ringingStart = time;
							_ringing = true;
						};
					} else {
						_ringing = false;
					};
				};
				_deafness = player getVariable ["cse_combatdeaf_deafness", 0];
				_volume = 0 max (1 - (_deafness / (DAMAGE_THRESHOLD / cse_DeafnessIntensity)));
				[format["hearingCapability_%1", HEARING_CAPABILITY_MAP_ID], _volume, true] call cse_fnc_setHearingCapability;
				player setVariable ["cse_combatdeaf_deafness", 0 max (_deafness - 0.5 / (1 max _deafness min (DAMAGE_THRESHOLD / cse_DeafnessIntensity))), false];
				sleep 1;
			};
			cse_sys_combatdeaf_deafness_running = false;
			[format["hearingCapability_%1", HEARING_CAPABILITY_MAP_ID], 1, false] call cse_fnc_setHearingCapability;
		};
	};
};