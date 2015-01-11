/*
 	Name: AGM_Drag_fnc_Initialise
 	
 	Author(s):
		L-H

 	Description:
		Adds an EventHandler to check if a weapon has been assembled.
	
	Parameters:
		Nothing
 	
 	Returns:
		Nothing
 	
 	Example:
		// Called by ArmA via Function Library
		call AGM_Drag_fnc_Initialise;
*/
AGM_Drag_CurrentHeightChange = 0;
[{(_this select 0) call AGM_Drag_fnc_HandleScrollWheel;}] call AGM_Core_fnc_addScrollWheelEventHandler;

if (isNil "AGM_Drag_MaxWeight") then {
	AGM_Drag_MaxWeight = 800;
};
