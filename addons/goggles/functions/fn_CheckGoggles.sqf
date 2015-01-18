/*
	Author: Garth de Wet (LH)
	
	Description:
	Performs rain checks and checks to see whether glasses effects have been applied or not.
	Checks for external camera and removes effects.
	
	Parameters: 
	Nothing
	
	Returns:
	Nothing
	
	Example:
	[] execVM "ACE_Goggles\functions\fn_CheckGoggles.sqf";
*/
#include "\ACE_Goggles\script.sqf"
waitUntil {sleep 0.46;alive player};
call ACE_Goggles_fnc_CheckGlasses;
["ACE_Goggles_RotorWash", "OnEachFrame", {call ACE_Goggles_fnc_OnEachFrame;}] call BIS_fnc_addStackedEventHandler;
[] spawn ACE_Goggles_fnc_RainEffect;
while {alive player} do {
	sleep 1;
	if (true) then {
		// Detect if curator interface is open and disable effects
		if (!isNull(findDisplay 312)) exitWith {
			if (ACE_Goggles_EffectsActive) then {
				call ACE_Goggles_fnc_RemoveGlassesEffect;
			};
		};
		call ACE_Goggles_fnc_CheckGlasses;
		if !(player call ACE_Goggles_fnc_isGogglesVisible) exitWith {
			if (ACE_Goggles_EffectsActive) then {
				call ACE_Goggles_fnc_RemoveGlassesEffect;
			};
		};
		if (call ACE_Goggles_fnc_ExternalCamera) exitWith {
			if (ACE_Goggles_EffectsActive) then {
				call ACE_Goggles_fnc_RemoveGlassesEffect;
			};
		};
		if !(ACE_Goggles_EffectsActive) then {
			(goggles player) call ACE_Goggles_fnc_ApplyGlassesEffect;
		} else {
			if ((goggles player) call ACE_Goggles_fnc_isDivingGoggles && {underwater player}) then {
				call ACE_Goggles_fnc_RemoveRainEffect;
				call ACE_Goggles_fnc_RemoveDirtEffect;
				call ACE_Goggles_fnc_RemoveDustEffect;
			};
		};
	};
};