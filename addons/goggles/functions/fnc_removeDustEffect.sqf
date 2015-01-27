/*
	fnc_removeDustEffect.sqf

	Author: Garth de Wet (LH)

	Description:
	Removes dust from the glasses.

	Parameters:
	Nothing

	Returns:
	Nothing

	Example:
	call FUNC(RemoveDustEffect);
*/
#include "script_component.hpp"
if (!isNull(GETUVAR(GVAR(DisplayEffects),displayNull))) then {
	(GETUVAR(GVAR(DisplayEffects),displayNull) displayCtrl 10662) ctrlSetText "";
};
