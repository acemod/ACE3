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
 * _applied = call ace_goggles_fnc_ApplyDirtEffect;
 *
 * Public: Yes
 */
#include "script_component.hpp"

_unit = GETUNIT;

if (cameraOn != _unit || {call FUNC(externalCamera)}) exitWith {false};
private ["_dirtImage", "_applied", "_effects"];
_effects = GETGLASSES(_unit);
_effects set [DIRT, true];
SETGLASSES(_unit,_effects);

if ([_unit] call FUNC(isGogglesVisible)) then {
    _dirtImage = getText (ConfigFile >> "CfgGlasses" >> (goggles _unit) >> "ACE_OverlayDirt");
    if (_dirtImage != "") then {
        100 cutRsc["RscACE_GogglesEffects", "PLAIN",0.1, false];

        (GETUVAR(GVAR(DisplayEffects),displayNull) displayCtrl 10660) ctrlSetText _dirtImage;
    };
};

true
