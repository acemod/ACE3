/*
	Name: ACE_Goggles_fnc_ApplyGlassesEffect
	
	Author: Garth de Wet (LH)
	
	Description:
	Sets screen tint for glasses.
	Sets screen overlay for glasses. (broken/fixed)
	Sets dirt/rain overlay for glasses.
	
	Parameters: 
	0: STRING - Glasses class name to be applied.
	
	Returns:
	Nothing
	
	Example:
	(goggles player) call ACE_Goggles_fnc_ApplyGlassesEffect;
*/
#include "\ACE_Goggles\script.sqf"
private["_postProcessColour", "_postProcessTintAmount", "_glassesClassname", "_glassImagePath"];

_glassesClassname = _this;
_postProcessColour = getArray(configFile >> "CfgGlasses" >> _glassesClassname >> "ACE_Color");
_postProcessTintAmount = getNumber(configFile >> "CfgGlasses" >> _glassesClassname >> "ACE_TintAmount");

call ACE_Goggles_fnc_RemoveGlassesEffect;
ACE_Goggles_EffectsActive = true;

if (_postProcessTintAmount != 0 && {ACE_Goggles_UsePP}) then {
	_postProcessColour set [3, _postProcessTintAmount/100];
	ACE_Goggles_PostProcess ppEffectAdjust[0.9, 1.1, 0.004, _postProcessColour, [0,0,0,1],[0,0,0,0]];
	ACE_Goggles_PostProcess ppEffectCommit 0;
	ACE_Goggles_PostProcess ppEffectEnable true;
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
	call ACE_Goggles_fnc_ApplyDirtEffect;
};

if GETDUSTT(DACTIVE) then {
	SETDUST(DAMOUNT,CLAMP(GETDUSTT(DAMOUNT)-1,0,2));
	call ACE_Goggles_fnc_ApplyDust;
};
