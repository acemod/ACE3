/*
	Name: AGM_Goggles_fnc_RemoveGlassesEffect
	
	Author: Garth de Wet (LH)
	
	Description:
	Removes the glasses effect from the screen, removes dirt effect, removes rain effect,
	removes dust effect. Does not reset array (glasses will still be broken, dirty, ect.)
	
	Parameters: 
	Nothing
	
	Returns:
	Nothing
	
	Example:
	call AGM_Goggles_fnc_RemoveGlassesEffect;
*/
#include "\AGM_Goggles\script.sqf"
AGM_Goggles_EffectsActive = false;
AGM_Goggles_PostProcess ppEffectEnable false;

if (!isNull(GLASSDISPLAY)) then {
	GLASSDISPLAY closeDisplay 0;
};

call AGM_Goggles_fnc_RemoveDirtEffect;
call AGM_Goggles_fnc_RemoveRainEffect;
call AGM_Goggles_fnc_RemoveDustEffect;
