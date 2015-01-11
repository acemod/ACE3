/*
 	Name: AGM_Fortifications_fnc_Initialise
 	
 	Author(s):
		L-H, commy2

 	Description:
		Adds an EventHandler to check if a weapon has been assembled.
	
	Parameters:
		Nothing
 	
 	Returns:
		Nothing
 	
 	Example:
		// Called by ArmA via Function Library
		call AGM_Fortifications_fnc_Initialise;
*/

[{
	if (!isNull (missionNamespace getVariable ["AGM_Fortifications_Setup", objNull])) then {
		AGM_Fortifications_TweakedAngle = AGM_Fortifications_TweakedAngle + (_this select 0) min 240 max 120;
	};
}] call AGM_Core_fnc_addScrollWheelEventHandler;
