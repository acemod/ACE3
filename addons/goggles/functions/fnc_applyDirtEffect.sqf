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
 * _applied = call ace_goggles_fnc_applyDirtEffect
 *
 * Public: Yes
 */
#include "script_component.hpp"

if (GVAR(showInThirdPerson)) exitWith {false};
if (call FUNC(externalCamera)) exitWith {false};

private ["_unit", "_effects"];

_unit = ACE_player;

_effects = GETGLASSES(_unit);
_effects set [DIRT, true];

SETGLASSES(_unit,_effects);

if ([_unit] call FUNC(isGogglesVisible)) then {
    local _dirtImage = getText (configFile >> "CfgGlasses" >> goggles _unit >> "ACE_OverlayDirt");

    if (_dirtImage != "") then {
        (QGVAR(GogglesEffectsLayer) call BIS_fnc_RSCLayer) cutRsc ["RscACE_GogglesEffects", "PLAIN", 0.1, false]; // @todo init as 100
        (GETUVAR(GVAR(DisplayEffects),displayNull) displayCtrl 10660) ctrlSetText _dirtImage;
    };
};

true
