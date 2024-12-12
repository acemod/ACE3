#include "..\script_component.hpp"
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

params ["_player", "_glasses"];
TRACE_2("applyGlassesEffect",_player,_glasses);

// remove old effect
call FUNC(removeGlassesEffect);

if ((getNumber (configOf _player >> "isPlayableLogic")) == 1) exitWith {
    TRACE_1("skipping playable logic",typeOf _player); // VirtualMan_F (placeable logic zeus / spectator)
};

private _config = configFile >> "CfgGlasses" >> _glasses;

private _postProcessColour = getArray (_config >> "ACE_Color");
private _postProcessTintAmount = getNumber (_config >> "ACE_TintAmount");

if (_postProcessTintAmount != 0 && {GVAR(UsePP)} && GVAR(effects) in [1, 2]) then {
    _postProcessColour set [3, _postProcessTintAmount/100];
    GVAR(PostProcess) ppEffectAdjust[0.9, 1.1, 0.004, _postProcessColour, [0,0,0,1],[0,0,0,0]];
    GVAR(PostProcess) ppEffectCommit 0;
    GVAR(PostProcess) ppEffectEnable true;
    _postProcessColour set [3, _postProcessTintAmount/250];
    GVAR(PostProcess) ppEffectAdjust[0.9, 1.1, 0.004, _postProcessColour, [0,0,0,1],[0,0,0,0]];
    GVAR(PostProcess) ppEffectCommit 30;
};

private _imagePath = getText (_config >> ["ACE_Overlay", "ACE_OverlayCracked"] select GETBROKEN);
private _angle = getNumber (_config >> "ACE_Overlay_Angle");

if (_imagePath != "") then {
    GVAR(GogglesLayer) cutRsc ["RscACE_Goggles", "PLAIN", 1, false, false];
    private _overlay = (GLASSDISPLAY displayCtrl 10650);
    _overlay ctrlSetText _imagePath;

    if ((_angle != 0) && {((ctrlAngle _overlay) # 0) != _angle}) then {
        _overlay ctrlSetAngle [_angle, 0.5, 0.5, true];
    };
};

if (GVAR(effects) in [2, 3]) then {
    if (GETDIRT) then {
        call FUNC(applyDirtEffect);
    };

    if (GETDUSTT(DACTIVE)) then {
        SETDUST(DAMOUNT,CLAMP(GETDUSTT(DAMOUNT)-1,0,2));
        call FUNC(applyDustEffect);
    };
};

GVAR(EffectsActive) = true;
