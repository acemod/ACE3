/*
	Name: AGM_Goggles_fnc_ApplyDirtEffect
	
	Author: Garth de Wet (LH)
	
	Description:
	Adds dirt effect to the glasses.
	
	Parameters: 
	Nothing
	
	Returns:
	BOOLEAN - True if succeeded false if not
	
	Example:
	call AGM_Goggles_fnc_ApplyDirtEffect;
*/
#include "\AGM_Goggles\script.sqf"

if (cameraOn != player || call AGM_Goggles_fnc_ExternalCamera) exitWith{false};
private "_dirtImage";
AGM_Goggles_Effects set [DIRT, true];

if (player call AGM_Goggles_fnc_isGogglesVisible) then{
	_dirtImage = getText(ConfigFile >> "CfgGlasses" >> goggles player >> "AGM_OverlayDirt");
	if (_dirtImage != "") then {
		100 cutRsc["RscAGM_GogglesEffects", "PLAIN",0.1, false];
		(uiNamespace getVariable ["AGM_Goggles_DisplayEffects", displayNull] displayCtrl 10660) ctrlSetText _dirtImage;
	};
};

true