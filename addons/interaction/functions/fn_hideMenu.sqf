/*
	Name: AGM_Interaction_fnc_hideMenu

	Author: Garth de Wet (LH)

	Description:
		Closes the Interaction menu

	Parameters:
		Nothing

	Returns:
		Nothing

	Example:
		call AGM_Interaction_fnc_hideMenu;
*/
#include "script_component.hpp"

closeDialog 0;
(findDisplay 1713999) closeDisplay 1;
(uiNameSpace getVariable QGVAR(Flow_Display)) closeDisplay 0;
GVAR(MainButton) = nil;
call FUNC(hideMouseHint);