/*
 	Name: AGM_Explosives_fnc_HandleScrollWheel
 	
 	Author(s):
		L-H

 	Description:
		Handles rotating of Explosives
	
	Parameters:
		Number: Scroll amount
 	
 	Returns:
		Boolean: Handled or not.
 	
 	Example:
		1.2 call AGM_Explosives_fnc_HandleScrollWheel;
*/
private ["_obj"];
if (isNull(AGM_Explosives_Setup) || {AGM_Modifier == 0} || !AGM_Explosives_pfeh_running) exitWith {false};

AGM_Explosives_Setup setDir ((getDir AGM_Explosives_Setup) + (_this*5));
AGM_Explosives_TweakedAngle = AGM_Explosives_TweakedAngle + _this*5;

true
