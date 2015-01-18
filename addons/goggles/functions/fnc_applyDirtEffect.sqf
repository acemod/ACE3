/*
	ApplyDirtEffect

	Author: Garth de Wet (LH)

	Description:
	Adds dirt effect to the glasses.

	Parameters:
	Nothing

	Returns:
	BOOLEAN - True if succeeded false if not

	Example:
	call FUNC(ApplyDirtEffect);
*/
#include "script_component.hpp"

if (cameraOn != ace_player || {call FUNC(externalCamera)}) exitWith{false};
private "_dirtImage";
GVAR(Effects) set [DIRT, true];

if (ace_player call FUNC(isGogglesVisible)) then{
	_dirtImage = getText(ConfigFile >> "CfgGlasses" >> (goggles ace_player) >> "ACE_OverlayDirt");
	if (_dirtImage != "") then {
		100 cutRsc["RscACE_GogglesEffects", "PLAIN",0.1, false];

		(GETUVAR(GVAR(DisplayEffects),displayNull) displayCtrl 10660) ctrlSetText _dirtImage;
	};
};

true
