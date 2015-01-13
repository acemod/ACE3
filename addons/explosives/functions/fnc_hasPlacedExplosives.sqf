/*
	Name: ACE_Explosives_fnc_hasPlacedExplosives

	Author: Garth de Wet (LH)

	Description:
		Whether the passed unit has placed any explosives or has a clacker that was used when explosives were placed.

	Parameters:
		0: OBJECT - unit

	Returns:
		BOOLEAN - True if the unit has explosives.

	Example:
		_hasPLacedExplosives = [player] call ACE_Explosives_fnc_hasPlacedExplosives;
*/
#include "script_component.hpp"
(count (_this call FUNC(getPlacedExplosives)) > 0)
