#include "script_component.hpp"
/*
 * Author: Garth 'L-H' de Wet
 * Removes the glasses effect from the screen, removes dirt effect, removes rain effect, removes dust effect. Does not reset array (glasses will still be broken, dirty, ect.)
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * call ace_goggles_fnc_removeGlassesEffect
 *
 * Public: Yes
 */

GVAR(EffectsActive) = false;
GVAR(PostProcess) ppEffectEnable false;

if (!isNull (GLASSDISPLAY)) then {
    GLASSDISPLAY closeDisplay 0;
};

if (GVAR(effects) == 2) then {
    call FUNC(removeDirtEffect);
    call FUNC(removeRainEffect);
    call FUNC(removeDustEffect);
};
