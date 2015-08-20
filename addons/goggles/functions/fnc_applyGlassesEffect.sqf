/*
 * Author: Garth 'L-H' de Wet
 * Sets screen tint for glasses.
 * Sets screen overlay for glasses. (broken/fixed)
 * Sets dirt/rain overlay for glasses.
 *
 * Arguments:
 * 0: Unit wearing glasses <STRING>
 * 1: Glasses classname to be applied <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call ace_goggles_fnc_applyGlassesEffect;
 *
 * Public: No
 */
#include "script_component.hpp"

private ["_unit","_goggles","_postProcessColour", "_postProcessTintAmount", "_glassImagePath"];

_unit = GETUNIT;
_goggles = goggles _unit;
_postProcessColour = getArray (configFile >> "CfgGlasses" >> _goggles >> "ACE_Color");
_postProcessTintAmount = getNumber (configFile >> "CfgGlasses" >> _goggles >> "ACE_TintAmount");

[] call FUNC(removeGlassesEffect);
GVAR(EffectsActive) = true;

if (_postProcessTintAmount != 0 && GVAR(UsePP)) then {
    _postProcessColour set [3, _postProcessTintAmount/100];
    GVAR(PostProcess) ppEffectAdjust[0.9, 1.1, 0.004, _postProcessColour, [0,0,0,1],[0,0,0,0]];
    GVAR(PostProcess) ppEffectCommit 0;
    GVAR(PostProcess) ppEffectEnable true;
    _postProcessColour set [3, _postProcessTintAmount/250];
    GVAR(PostProcess) ppEffectAdjust[0.9, 1.1, 0.004, _postProcessColour, [0,0,0,1],[0,0,0,0]];
    GVAR(PostProcess) ppEffectCommit 30;
};

_glassImagePath = ["ACE_Overlay","ACE_OverlayCracked"] select GETBROKEN(_unit);
_glassImagePath = getText (configFile >> "CfgGlasses" >> _goggles >> _glassImagePath);

if (_glassImagePath != "") then {
    150 cutRsc ["RscACE_Goggles", "PLAIN",1, false];
    (GLASSDISPLAY displayCtrl 10650) ctrlSetText _glassImagePath;
};

if (GETDIRT(_unit)) then {
    [] call FUNC(applyDirtEffect);
};

if GETDUSTT(_unit,DACTIVE) then {
    SETDUST(_unit,DAMOUNT,CLAMP(GETDUSTT(_unit,DAMOUNT)-1,0,2));
    [] call FUNC(applyDust);
};
