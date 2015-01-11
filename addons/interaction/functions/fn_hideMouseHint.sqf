/*
	Name: AGM_Interaction_fnc_hideMouseHint
	
	Author(s):
		Garth de Wet (LH)
	
	Description:
		Hides the interaction helper text with the mouse buttons at the bottom middle of the screen
	
	Parameters:
		Nothing
	
	Returns:
		Nothing
	
	Example:
		call AGM_Interaction_fnc_hideMouseHint;
*/
if (isNull (uiNamespace getVariable ["AGM_Helper_Display", objNull])) exitWith{};

("AGM_InteractionHelper" call BIS_fnc_rscLayer) cutText ["", "PLAIN"];
showHUD true;