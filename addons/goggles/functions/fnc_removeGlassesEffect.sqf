/*
	RemoveGlassesEffect

	Author: Garth de Wet (LH)

	Description:
	Removes the glasses effect from the screen, removes dirt effect, removes rain effect,
	removes dust effect. Does not reset array (glasses will still be broken, dirty, ect.)

	Parameters:
	Nothing

	Returns:
	Nothing

	Example:
	call FUNC(RemoveGlassesEffect);
*/
#include "script_component.hpp"
GVAR(EffectsActive) = false;
GVAR(PostProcess) ppEffectEnable false;

if (!isNull(GLASSDISPLAY)) then {
	GLASSDISPLAY closeDisplay 0;
};

call FUNC(removeDirtEffect);
call FUNC(removeRainEffect);
call FUNC(removeDustEffect);
