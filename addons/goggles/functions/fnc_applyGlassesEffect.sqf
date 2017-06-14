/*
 * Author: Garth 'L-H' de Wet
 * Sets screen tint for glasses.
 * Sets screen overlay for glasses. (broken/fixed)
 * Sets dirt/rain overlay for glasses.
 *
 * Arguments:
 * 0: Player <OBJECT>
 * 1: Glasses classname to be applied <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * [ace_player, goggles ace_player] call ace_goggles_fnc_applyGlassesEffect
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_player", "_glasses"];
TRACE_2("applyGlassesEffect",_player,_glasses);

// remove old effect
call FUNC(removeGlassesEffect);

if ((getNumber (configFile >> "CfgVehicles" >> (typeOf _player) >> "isPlayableLogic")) == 1) exitWith {
    TRACE_1("skipping playable logic",typeOf _player); // VirtualMan_F (placeable logic zeus / spectator)
};

private ["_config", "_postProcessColour", "_postProcessTintAmount", "_imagePath"];

_config = configFile >> "CfgGlasses" >> _glasses;

_postProcessColour = getArray (_config >> "ACE_Color");
_postProcessTintAmount = getNumber (_config >> "ACE_TintAmount");

if (_postProcessTintAmount != 0 && {GVAR(UsePP)}) then {
    _postProcessColour set [3, _postProcessTintAmount/100];
    GVAR(PostProcess) ppEffectAdjust[0.9, 1.1, 0.004, _postProcessColour, [0,0,0,1],[0,0,0,0]];
    GVAR(PostProcess) ppEffectCommit 0;
    GVAR(PostProcess) ppEffectEnable true;
    _postProcessColour set [3, _postProcessTintAmount/250];
    GVAR(PostProcess) ppEffectAdjust[0.9, 1.1, 0.004, _postProcessColour, [0,0,0,1],[0,0,0,0]];
    GVAR(PostProcess) ppEffectCommit 30;
};

_imagePath = getText (_config >> ["ACE_Overlay", "ACE_OverlayCracked"] select GETBROKEN);

if (_imagePath != "") then {
    GVAR(GogglesLayer) cutRsc ["RscACE_Goggles", "PLAIN", 1, false];
    (GLASSDISPLAY displayCtrl 10650) ctrlSetText _imagePath;
};

if (GVAR(effects) == 2) then {
    if (GETDIRT) then {
        call FUNC(applyDirtEffect);
    };

    if (GETDUSTT(DACTIVE)) then {
        SETDUST(DAMOUNT,CLAMP(GETDUSTT(DAMOUNT)-1,0,2));
        call FUNC(applyDustEffect);
    };
};

GVAR(EffectsActive) = true;
