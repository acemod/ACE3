/*
 * Author: Garth 'L-H' de Wet
 * Sets screen tint for glasses.
 * Sets screen overlay for glasses. (broken/fixed)
 * Sets dirt/rain overlay for glasses.
 *
 * Arguments:
 * 0: Glasses classname to be applied <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * [goggles ace_player] call ace_goggles_fnc_ApplyGlassesEffect;
 *
 * Public: No
 */
#include "script_component.hpp"

private["_postProcessColour", "_postProcessTintAmount", "_glassesClassname", "_glassImagePath"];

_glassesClassname = _this select 0;
_postProcessColour = getArray(configFile >> "CfgGlasses" >> _glassesClassname >> "ACE_Color");
_postProcessTintAmount = getNumber(configFile >> "CfgGlasses" >> _glassesClassname >> "ACE_TintAmount");

call FUNC(removeGlassesEffect);
GVAR(EffectsActive) = true;

if (_postProcessTintAmount != 0 && {GVAR(UsePP)}) then {
    _postProcessColour set [3, _postProcessTintAmount/100];
    GVAR(PostProcess) ppEffectAdjust[0.9, 1.1, 0.004, _postProcessColour, [0,0,0,1],[0,0,0,0]];
    GVAR(PostProcess) ppEffectCommit 0;
    GVAR(PostProcess) ppEffectEnable true;
    _postProcessColour set [3, _postProcessTintAmount/250];
    GVAR(PostProcess) ppEffectAdjust[0.9, 1.1, 0.004, _postProcessColour, [0,0,0,1],[0,0,0,0]];
    GVAR(PostProcess) ppEffectCommit 30;
};

_glassImagePath = getText(configFile >> "CfgGlasses" >> _glassesClassname >> "ACE_Overlay");
if GETBROKEN then {
    _glassImagePath = getText(configFile >> "CfgGlasses" >> _glassesClassname >> "ACE_OverlayCracked");
};
if (_glassImagePath != "") then {
    150 cutRsc["RscACE_Goggles", "PLAIN",1, false];
    (GLASSDISPLAY displayCtrl 10650) ctrlSetText _glassImagePath;
};

if GETDIRT then {
    call FUNC(applyDirtEffect);
};

if GETDUSTT(DACTIVE) then {
    SETDUST(DAMOUNT,CLAMP(GETDUSTT(DAMOUNT)-1,0,2));
    call FUNC(applyDust);
};
