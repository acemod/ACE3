/*
	Name: AGM_Goggles_fnc_OnEachFrame
	
	Author: Garth de Wet (LH)
	
	Description:
	Runs every frame checking for helicopters.
	
	Parameters:
	Nothing
	
	Returns:
	Nothing
	
	Example:
	["AGM_Goggles_RotorWash", "OnEachFrame", "call AGM_Goggles_fnc_OnEachFrame;"] call BIS_fnc_addStackedEventHandler;
*/
#include "\AGM_Goggles\script.sqf"
if (isNull(player)) then {
	["AGM_Goggles_RotorWash", "OnEachFrame"] call BIS_fnc_removeStackedEventHandler;
};
AGM_Goggles_FrameEvent set [0, !(AGM_Goggles_FrameEvent select 0)];
if (AGM_Goggles_FrameEvent select 0) exitWith {
	if (vehicle player != player && {!([player] call AGM_Core_fnc_isTurnedOut)}) exitWith {(AGM_Goggles_FrameEvent select 1) set [0, false]; };
	AGM_Goggles_FrameEvent set [1, ([player] call AGM_Goggles_fnc_isInRotorWash)];
};
private ["_rotorWash","_safe"];
_rotorWash = AGM_Goggles_FrameEvent select 1;
_safe = false;
if !(_rotorWash select 0) exitWith {
	if (AGM_Goggles_PostProcessEyes_Enabled) then {
		AGM_Goggles_PostProcessEyes_Enabled = false;
		if (!scriptDone (AGM_Goggles_DustHandler)) then {
			terminate AGM_Goggles_DustHandler;
		};
		AGM_Goggles_DustHandler = [] spawn {
			AGM_Goggles_PostProcessEyes ppEffectAdjust [1, 1, 0, [0,0,0,0], [0,0,0,1],[1,1,1,0]];
			AGM_Goggles_PostProcessEyes ppEffectCommit 2;
			sleep 2;
			AGM_Goggles_PostProcessEyes ppEffectEnable false;
		};
	};
};
if ((headgear player) != "") then {
	_safe = (getNumber (ConfigFile >> "CfgWeapons" >> (headgear player) >> "AGM_Protection") == 1);
};
if !(_safe) then {
	if !(player call AGM_Goggles_fnc_isGogglesVisible) exitWith{};
	if (GETDUSTT(DAMOUNT) < 2) then {
		if (!GETDUSTT(DACTIVE)) then {
			SETDUST(DACTIVE,true);
			call AGM_Goggles_fnc_ApplyDust;
		} else {
			if ((_rotorWash select 1) > 0.5) then {
				call AGM_Goggles_fnc_ApplyDust;
			};
		};
	};
	_safe = (getNumber (ConfigFile >> "CfgGlasses" >> AGM_Goggles_Current >> "AGM_Protection") == 1);
};
if (_safe) exitWith {};
if ((_rotorWash select 1) <= 15) then {
	private "_scale";
	_scale = 0.7;
	if ((_rotorWash select 1) != 0) then {
		_scale = CLAMP(0.3*(_rotorWash select 1),0.1,0.3);
	} else {
		_scale = 0.1;
	};
	_scale = 1 - _scale;
	if (!scriptDone (AGM_Goggles_DustHandler)) then {
		terminate AGM_Goggles_DustHandler;
	};
	if !(player getVariable ["AGM_EyesDamaged", false]) then {
		AGM_Goggles_PostProcessEyes_Enabled = true;
		AGM_Goggles_PostProcessEyes ppEffectAdjust [1, 1, 0, [0,0,0,0], [_scale,_scale,_scale,_scale],[1,1,1,0]];
		AGM_Goggles_PostProcessEyes ppEffectCommit 0.5;
		AGM_Goggles_PostProcessEyes ppEffectEnable true;
	};
};
