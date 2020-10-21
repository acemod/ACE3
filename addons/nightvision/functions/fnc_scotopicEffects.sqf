#include "script_component.hpp"
/*
 * Author: PabstMirror
 * Adjusts color and luminosity when in dark conditions. 
 * Simulates rod and cones vision by decreasing color intensity when dark.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call ace_nightvision_fnc_scotopicEffects
 *
 * Public: No
 */
private _unit = ACE_player;

if (EGVAR(common,OldIsCamera) || {!alive _unit} || {currentVisionMode _unit != 0}) exitWith {
    GVAR(scotopicCC) ppEffectEnable false;
    [FUNC(scotopicEffects), [], 0.1] call CBA_fnc_waitAndExecute;
};

getLighting params ["", "_ambientLightBrightness"];
(getLightingAt _unit) params ["", "", "", "_dynamiclightBrightness"];

private _light = _ambientLightBrightness + 5 * _dynamiclightBrightness;
if (_light > 30) exitWith {   
    GVAR(scotopicCC) ppEffectEnable false;
    // if it's day, we can go to sleep for a long while (but won't be responsive to skipTime?)
    [FUNC(scotopicEffects), [], [1, 120] select (_ambientLightBrightness > 100)] call CBA_fnc_waitAndExecute;
};

private _intensity = if (_light > 5) then {
    linearConversion [5, 30, _light, 0.3, 0, true]; // Mesopic
} else {
    linearConversion [0, 5, _light, 0.6, 0.3, true]; // Scotopic
};

systemChat format ["%1 - %2", _light, _intensity];

GVAR(scotopicCC) ppEffectEnable GVAR(scoTestToggle) && true;
// "players like the night blue"
GVAR(scotopicCC) ppEffectAdjust  [1,1,0,[1,1,1,0],[_intensity*.95, _intensity*.95,_intensity*1.1, 1-_intensity], [0.15, 1.0, 1.50, 1]];
GVAR(scotopicCC) ppEffectCommit 1;

[FUNC(scotopicEffects), [], 1] call CBA_fnc_waitAndExecute;
