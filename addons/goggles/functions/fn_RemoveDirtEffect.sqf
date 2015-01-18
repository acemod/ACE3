/*
	Name: ACE_Goggles_fnc_RemoveDirtEffect
	
	Author: Garth de Wet (LH)
	
	Description:
	Removes dirt from the glasses.
	
	Parameters: 
	Nothing
	
	Returns:
	Nothing
	
	Example:
	call ACE_Goggles_fnc_RemoveDirtEffect;
*/
if (!isNull(uiNamespace getVariable ["ACE_Goggles_DisplayEffects", displayNull])) then {
	(uiNamespace getVariable ["ACE_Goggles_DisplayEffects", displayNull] displayCtrl 10660) ctrlSetText "";
};
