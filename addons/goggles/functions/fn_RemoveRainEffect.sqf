/*
	Name: ACE_Goggles_fnc_RemoveRainEffect
	
	Author: Garth de Wet (LH)
	
	Description:
	Removes rain effects from the screen. Resets the rain array.
	
	Parameters: 
	Nothing
	
	Returns:
	Nothing
	
	Example:
	call ACE_Goggles_fnc_RemoveRainEffect;
*/
if (!isNull (ACE_Goggles_RainDrops)) then {
	deleteVehicle (ACE_Goggles_RainDrops);
};
ACE_Goggles_Rain_Active = false;