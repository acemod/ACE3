/*
	Name: AGM_Goggles_fnc_RemoveDustEffect
	
	Author: Garth de Wet (LH)
	
	Description:
	Removes dust from the glasses.
	
	Parameters: 
	Nothing
	
	Returns:
	Nothing
	
	Example:
	call AGM_Goggles_fnc_RemoveDustEffect;
*/
if (!isNull(uiNamespace getVariable ["AGM_Goggles_DisplayEffects", displayNull])) then {
	(uiNamespace getVariable ["AGM_Goggles_DisplayEffects", displayNull] displayCtrl 10662) ctrlSetText "";
};
