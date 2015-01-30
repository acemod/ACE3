/*
	fnc_ExternalCamera.sqf

	Author: Garth de Wet (LH)

	Description:
	Returns if the camera is external or not.

	Parameters:
	Nothing

	Returns:
	Boolean - whether the camera is in external view or not.
	If the "showInThirdPerson" option is checked, this will always return false.

	Example:
	call FUNC(ExternalCamera);
*/

#include "script_component.hpp"

if ((missionNameSpace getVariable [QGVAR(showInThirdPerson), 0]) == 1) exitWith { false };
(cameraView == "External")
