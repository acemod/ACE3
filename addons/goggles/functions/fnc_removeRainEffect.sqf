/*
 * Author: Garth 'L-H' de Wet
 * Removes rain effects from the screen.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * call ace_goggles_fnc_removeRainEffect;
 *
 * Public: Yes
 */
#include "script_component.hpp"
if (!isNull (GVAR(RainDrops))) then {
    deleteVehicle (GVAR(RainDrops));
};
GVAR(RainActive) = false;
GVAR(RainLastLevel) = 0;
