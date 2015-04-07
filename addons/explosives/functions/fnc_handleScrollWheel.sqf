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
if (isNull(GVAR(Setup)) || {ACE_Modifier == 0} || !GVAR(pfeh_running)) exitWith {false};
_this = _this * 5;
GVAR(Setup) setDir ((getDir GVAR(Setup)) + _this);
GVAR(TweakedAngle) = GVAR(TweakedAngle) + _this;

true
