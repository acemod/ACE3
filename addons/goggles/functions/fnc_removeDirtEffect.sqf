#include "script_component.hpp"
/*
 * Author: Garth 'L-H' de Wet
 * Removes dirt from the glasses.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * call ace_goggles_fnc_removeDirtEffect
 *
 * Public: Yes
 */

if (!isNull (GETUVAR(GVAR(DisplayEffects),displayNull))) then {
    (GETUVAR(GVAR(DisplayEffects),displayNull) displayCtrl 10660) ctrlSetText "";
};
