/*
	Name: AGM_Goggles_fnc_RemoveRainEffect
	
	Author: Garth de Wet (LH)
	
	Description:
	Removes rain effects from the screen. Resets the rain array.
	
	Parameters: 
	Nothing
	
	Returns:
	Nothing
	
	Example:
	call AGM_Goggles_fnc_RemoveRainEffect;
*/
if (!isNull (AGM_Goggles_RainDrops)) then {
	deleteVehicle (AGM_Goggles_RainDrops);
};
AGM_Goggles_Rain_Active = false;