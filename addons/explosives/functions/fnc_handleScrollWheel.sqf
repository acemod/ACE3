/*
 	Name: ACE_Explosives_fnc_HandleScrollWheel

 	Author(s):
		L-H

 	Description:
		Handles rotating of Explosives

	Parameters:
		Number: Scroll amount

 	Returns:
		Boolean: Handled or not.

 	Example:
		1.2 call ACE_Explosives_fnc_HandleScrollWheel;
*/
#include "script_component.hpp"
private ["_obj"];
if (isNull(GVAR(Setup)) || {ACE_Modifier == 0} || !GVAR(pfeh_running)) exitWith {false};
_this = _this * 5;
GVAR(Setup) setDir ((getDir GVAR(Setup) + _this);
GVAR(TweakedAngle) = GVAR(TweakedAngle) + _this;

true
