#include "..\script_component.hpp"
/*
 * Author: Garth 'L-H' de Wet
 * Handles rotating of Explosives
 *
 * Arguments:
 * Amount scrolled <NUMBER>
 *
 * Return Value:
 * Handled <BOOL>
 *
 * Example:
 * 1.2 call ace_explosives_fnc_HandleScrollWheel
 *
 * Public: No
 */

if (!GVAR(pfeh_running)) exitWith {
    false // return
};

GVAR(tweakedAngle) = ((GVAR(tweakedAngle) + 7.2 * _this) + 360) % 360;

true // return
