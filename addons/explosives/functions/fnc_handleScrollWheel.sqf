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
 * 1.2 call ACE_Explosives_fnc_HandleScrollWheel;
 *
 * Public: No
 */
#include "script_component.hpp"

if ((!GVAR(pfeh_running)) || {ACE_Modifier == 0}) exitWith {false};

GVAR(TweakedAngle) = ((GVAR(TweakedAngle) + 7.2 * _this) + 360) % 360;

true
