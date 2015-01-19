/*
	fnc_ExternalCamera.sqf

	Author: Garth de Wet (LH)

	Description:
	Returns if the camera is external or not.

	Parameters:
	Nothing

	Returns:
	Boolean - whether the camera is in external view or not.

	Example:
	call FUNC(ExternalCamera);
*/
#include "script_component.hpp"
if (GETVAR(profileNamespace,ACE_showInThirdPerson,false)) exitWith { false };
(cameraView == "External")
