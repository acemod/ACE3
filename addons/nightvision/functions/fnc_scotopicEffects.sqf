#include "script_component.hpp"
/*
 * Author: PabstMirror
 * Adjusts color and luminosity when in dark conditions. 
 * Simulates rod and cones vision by decreasing color intensity when dark.
 *
 * Arguments:
 * 0: Last Intensity <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [0] call ace_nightvision_fnc_scotopicEffects
 *
 * Public: No
 */
#define TIME_INTERVAL 0.333
private _unit = ACE_player;

if (EGVAR(common,OldIsCamera) || {!alive _unit} || {currentVisionMode _unit != 0}) exitWith {
    GVAR(scotopicCC) ppEffectEnable false;
    [FUNC(scotopicEffects), [0], 0.1] call CBA_fnc_waitAndExecute;
};

(getLightingAt _unit) params ["", "_ambientLight", "", "_dynamiclight"];
private _light = _ambientLight + 2 * _dynamiclight;

#ifdef DEBUG_MODE_FULL
systemChat format ["[%1, %2] = %3", [_ambientLight,1,1] call CBA_fnc_formatNumber, [_dynamiclight,1,1] call CBA_fnc_formatNumber, _light];
#endif

if ((_light > 50) && {(param [0, 0]) == 0}) exitWith { // make sure we've faded out before disabling
    GVAR(scotopicCC) ppEffectEnable false;
    // if it's day, we can go to sleep for a long while (won't be responsive to scripted-skipTime)
    [FUNC(scotopicEffects), [0], [TIME_INTERVAL, 60] select (_ambientLight > 100)] call CBA_fnc_waitAndExecute;
};

private _intensity = if (_light > 5) then {
    linearConversion [5, 50, _light, 0.3, 0, true]; // Mesopic
} else {
    linearConversion [0, 6, _light, 0.6, 0.3, true]; // Scotopic
};

#ifdef DEBUG_MODE_FULL
systemChat format ["@%1", _intensity];
#endif

GVAR(scotopicCC) ppEffectEnable GVAR(scoTestToggle); // true;
// "players like the night blue"
GVAR(scotopicCC) ppEffectAdjust  [1,1,0,[1,1,1,0],[_intensity*.95,_intensity*.95,_intensity*1.1,1-_intensity],[0.15, 1.0, 1.50, 1]];
GVAR(scotopicCC) ppEffectCommit TIME_INTERVAL;

[FUNC(scotopicEffects), [_intensity], TIME_INTERVAL] call CBA_fnc_waitAndExecute;
