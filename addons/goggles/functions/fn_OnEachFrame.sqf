/*
	Name: ACE_Goggles_fnc_OnEachFrame
	
	Author: Garth de Wet (LH)
	
	Description:
	Runs every frame checking for helicopters.
	
	Parameters:
	Nothing
	
	Returns:
	Nothing
	
	Example:
	["ACE_Goggles_RotorWash", "OnEachFrame", "call ACE_Goggles_fnc_OnEachFrame;"] call BIS_fnc_addStackedEventHandler;
*/
#include "\ACE_Goggles\script.sqf"
if (isNull(player)) then {
	["ACE_Goggles_RotorWash", "OnEachFrame"] call BIS_fnc_removeStackedEventHandler;
};
ACE_Goggles_FrameEvent set [0, !(ACE_Goggles_FrameEvent select 0)];
if (ACE_Goggles_FrameEvent select 0) exitWith {
	if (vehicle player != player && {!([player] call ACE_Core_fnc_isTurnedOut)}) exitWith {(ACE_Goggles_FrameEvent select 1) set [0, false]; };
	ACE_Goggles_FrameEvent set [1, ([player] call ACE_Goggles_fnc_isInRotorWash)];
};
private ["_rotorWash","_safe"];
_rotorWash = ACE_Goggles_FrameEvent select 1;
_safe = false;
if !(_rotorWash select 0) exitWith {
	if (ACE_Goggles_PostProcessEyes_Enabled) then {
		ACE_Goggles_PostProcessEyes_Enabled = false;
		if (!scriptDone (ACE_Goggles_DustHandler)) then {
			terminate ACE_Goggles_DustHandler;
		};
		ACE_Goggles_DustHandler = [] spawn {
			ACE_Goggles_PostProcessEyes ppEffectAdjust [1, 1, 0, [0,0,0,0], [0,0,0,1],[1,1,1,0]];
			ACE_Goggles_PostProcessEyes ppEffectCommit 2;
			sleep 2;
			ACE_Goggles_PostProcessEyes ppEffectEnable false;
		};
	};
};
if ((headgear player) != "") then {
	_safe = (getNumber (ConfigFile >> "CfgWeapons" >> (headgear player) >> "ACE_Protection") == 1);
};
if !(_safe) then {
	if !(player call ACE_Goggles_fnc_isGogglesVisible) exitWith{};
	if (GETDUSTT(DAMOUNT) < 2) then {
		if (!GETDUSTT(DACTIVE)) then {
			SETDUST(DACTIVE,true);
			call ACE_Goggles_fnc_ApplyDust;
		} else {
			if ((_rotorWash select 1) > 0.5) then {
				call ACE_Goggles_fnc_ApplyDust;
			};
		};
	};
	_safe = (getNumber (ConfigFile >> "CfgGlasses" >> ACE_Goggles_Current >> "ACE_Protection") == 1);
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
	if (!scriptDone (ACE_Goggles_DustHandler)) then {
		terminate ACE_Goggles_DustHandler;
	};
	if !(player getVariable ["ACE_EyesDamaged", false]) then {
		ACE_Goggles_PostProcessEyes_Enabled = true;
		ACE_Goggles_PostProcessEyes ppEffectAdjust [1, 1, 0, [0,0,0,0], [_scale,_scale,_scale,_scale],[1,1,1,0]];
		ACE_Goggles_PostProcessEyes ppEffectCommit 0.5;
		ACE_Goggles_PostProcessEyes ppEffectEnable true;
	};
};
