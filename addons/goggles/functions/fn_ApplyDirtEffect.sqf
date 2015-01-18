/*
	Name: ACE_Goggles_fnc_ApplyDirtEffect
	
	Author: Garth de Wet (LH)
	
	Description:
	Adds dirt effect to the glasses.
	
	Parameters: 
	Nothing
	
	Returns:
	BOOLEAN - True if succeeded false if not
	
	Example:
	call ACE_Goggles_fnc_ApplyDirtEffect;
*/
#include "\ACE_Goggles\script.sqf"

if (cameraOn != player || call ACE_Goggles_fnc_ExternalCamera) exitWith{false};
private "_dirtImage";
ACE_Goggles_Effects set [DIRT, true];

if (player call ACE_Goggles_fnc_isGogglesVisible) then{
	_dirtImage = getText(ConfigFile >> "CfgGlasses" >> goggles player >> "ACE_OverlayDirt");
	if (_dirtImage != "") then {
		100 cutRsc["RscACE_GogglesEffects", "PLAIN",0.1, false];
		(uiNamespace getVariable ["ACE_Goggles_DisplayEffects", displayNull] displayCtrl 10660) ctrlSetText _dirtImage;
	};
};

true