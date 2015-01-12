/*
	Author(s):
		Garth de Wet (LH)

	Description:
		Hides the interaction helper text with the mouse buttons at the bottom middle of the screen

	Parameters:
		Nothing

	Returns:
		Nothing

	Example:
		call FUNC(hideMouseHint);
*/
#include "script_component.hpp"

if (isNull (uiNamespace getVariable ["ACE_Helper_Display", objNull])) exitWith{};

("ACE_InteractionHelper" call BIS_fnc_rscLayer) cutText ["", "PLAIN"];
showHUD true;