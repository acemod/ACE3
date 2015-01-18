/*
	Name: ACE_Goggles_fnc_RemoveGlassesEffect
	
	Author: Garth de Wet (LH)
	
	Description:
	Removes the glasses effect from the screen, removes dirt effect, removes rain effect,
	removes dust effect. Does not reset array (glasses will still be broken, dirty, ect.)
	
	Parameters: 
	Nothing
	
	Returns:
	Nothing
	
	Example:
	call ACE_Goggles_fnc_RemoveGlassesEffect;
*/
#include "\ACE_Goggles\script.sqf"
ACE_Goggles_EffectsActive = false;
ACE_Goggles_PostProcess ppEffectEnable false;

if (!isNull(GLASSDISPLAY)) then {
	GLASSDISPLAY closeDisplay 0;
};

call ACE_Goggles_fnc_RemoveDirtEffect;
call ACE_Goggles_fnc_RemoveRainEffect;
call ACE_Goggles_fnc_RemoveDustEffect;
