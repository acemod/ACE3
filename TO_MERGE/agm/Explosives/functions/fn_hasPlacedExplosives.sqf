/*
	Name: AGM_Explosives_fnc_hasPlacedExplosives
	
	Author: Garth de Wet (LH)
	
	Description:
		Whether the passed unit has placed any explosives or has a clacker that was used when explosives were placed.
	
	Parameters: 
		0: OBJECT - unit
	
	Returns:
		BOOLEAN - True if the unit has explosives.
	
	Example:
		_hasPLacedExplosives = [player] call AGM_Explosives_fnc_hasPlacedExplosives;
*/
(count (_this call AGM_Explosives_fnc_getPlacedExplosives) > 0)