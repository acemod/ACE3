/*
	fnc_removeDirtEffect.sqf

	Author: Garth de Wet (LH)

	Description:
	Removes dirt from the glasses.

	Parameters:
	Nothing

	Returns:
	Nothing

	Example:
	call FUNC(RemoveDirtEffect);
*/
#include "script_component.hpp"
if (!isNull(GETUVAR(GVAR(DisplayEffects),displayNull))) then {
	(GETUVAR(GVAR(DisplayEffects),displayNull) displayCtrl 10660) ctrlSetText "";
};
