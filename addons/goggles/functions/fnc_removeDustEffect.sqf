#include "script_component.hpp"
/*
 * Author: Garth 'L-H' de Wet
 * Removes dust from the glasses.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * call ace_goggles_fnc_removeDustEffect
 *
 * Public: Yes
 */

if (!isNull (GETUVAR(GVAR(DisplayEffects),displayNull))) then {
    (GETUVAR(GVAR(DisplayEffects),displayNull) displayCtrl 10662) ctrlSetText "";
};
