/*
	RemoveRainEffect

	Author: Garth de Wet (LH)

	Description:
	Removes rain effects from the screen. Resets the rain array.

	Parameters:
	Nothing

	Returns:
	Nothing

	Example:
	call FUNC(RemoveRainEffect);
*/
#include "script_component.hpp"
if (!isNull (GVAR(RainDrops))) then {
	deleteVehicle (GVAR(RainDrops));
};
GVAR(RainActive) = false;
GVAR(RainLastLevel) = 0;
