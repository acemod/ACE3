#include "script_component.hpp"
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

if (call FUNC(externalCamera)) exitWith {false};

private _unit = ACE_player;

private _effects = GETGLASSES(_unit);
_effects set [DIRT, true];

SETGLASSES(_unit,_effects);

if ([_unit] call FUNC(isGogglesVisible)) then {
    private _dirtImage = getText (configFile >> "CfgGlasses" >> goggles _unit >> "ACE_OverlayDirt");

    if (_dirtImage != "") then {
        GVAR(GogglesEffectsLayer) cutRsc ["RscACE_GogglesEffects", "PLAIN", 0.1, false];
        (GETUVAR(GVAR(DisplayEffects),displayNull) displayCtrl 10660) ctrlSetText _dirtImage;

        private _effectBrightness = linearConversion [0,1,([] call EFUNC(common,ambientBrightness)),0.25,1];
        (GETUVAR(GVAR(DisplayEffects),displayNull) displayCtrl 10660) ctrlSetTextColor [_effectBrightness, _effectBrightness, _effectBrightness, 1];
        TRACE_1("dirt",_effectBrightness);
    };
};

true
