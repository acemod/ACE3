/*
 * Author: Garth 'L-H' de Wet
 * Adds dirt effect to the glasses.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * Succeeded <BOOL>
 *
 * Example:
 * _applied = call ace_goggles_fnc_ApplyDirt;
 *
 * Public: Yes
 */
#include "script_component.hpp"

if (cameraOn != ace_player || {call FUNC(externalCamera)}) exitWith{false};
private ["_dirtImage", "_applied", "_effects"];
_effects = GETGLASSES(ace_player);
_effects set [DIRT, true];
SETGLASSES(ace_player,_effects);

if ([ace_player] call FUNC(isGogglesVisible)) then{
    _dirtImage = getText(ConfigFile >> "CfgGlasses" >> (goggles ace_player) >> "ACE_OverlayDirt");
    if (_dirtImage != "") then {
        100 cutRsc["RscACE_GogglesEffects", "PLAIN",0.1, false];

        (GETUVAR(GVAR(DisplayEffects),displayNull) displayCtrl 10660) ctrlSetText _dirtImage;
    };
};

true
