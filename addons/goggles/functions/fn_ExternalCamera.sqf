/*
	Name: ACE_Goggles_fnc_ExternalCamera
	
	Author: Garth de Wet (LH)
	
	Description:
	Returns if the camera is external or not.
	
	Parameters: 
	Nothing
	
	Returns:
	Boolean - whether the camera is in external view or not.
	
	Example:
	call ACE_Goggles_fnc_ExternalCamera;
*/
if (profileNamespace getVariable ["ACE_showInThirdPerson", false]) exitWith { false };
(cameraView == "External")
