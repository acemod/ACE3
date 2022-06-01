#include "script_component.hpp"
/*
 * Author: Slatery
 * Triggers Pneumo
 *
 * Arguments:
 * 0: Enable <BOOL>
 * 1: SpO2   <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [true, 80] call ace_medical_feedback_fnc_effectPneumo
 *
 * Public: No
 */

params ["_enable", "_spo2"];
if (isNull findDisplay 46) exitWith {};

if (!_enable || _spo2 == 0 ) exitWith {
    if (GVAR(ppPneumothoraxBlackout) != -1) then { GVAR(ppPneumothoraxBlackout) ppEffectEnable false; };
    GVAR(ppPneumothoraxBlur) ppEffectEnable false;
};
if (GVAR(ppPneumothoraxBlackout) != -1) then { GVAR(ppPneumothoraxBlackout) ppEffectEnable true; };
GVAR(ppPneumothoraxBlur) ppEffectEnable true;

// Trigger effect every 2s
private _showNextTick = missionNamespace getVariable [QGVAR(showPainNextTick), true];
GVAR(showPainNextTick) = !_showNextTick;
if (_showNextTick) exitWith {};

private _blurIntensity = linearConversion [75, 100, _spo2, 0.4, 0];
GVAR(ppPneumothoraxBlur) ppEffectAdjust [_blurIntensity];
GVAR(ppPneumothoraxBlur) ppEffectCommit 0.1;

private _initialAdjust = [];
private _delayedAdjust = [];
_spo2     = linearConversion [75, 100, _spo2, 1, 0];
_initialAdjust = [1, 1, 0, [0, 0, 0, _spo2      ], [0,0,0,1], [0.33, 0.33, 0.33, 0], [0.55, 0.5, 0, 0, 0, 0, 4]];
_delayedAdjust = [1, 1, 0, [0, 0, 0, _spo2 * 0.9], [0,0,0,1], [0.33, 0.33, 0.33, 0], [0.55, 0.5, 0, 0, 0, 0, 4]];

GVAR(ppPneumothoraxBlackout) ppEffectAdjust _initialAdjust;
GVAR(ppPneumothoraxBlackout) ppEffectCommit FX_PNEUMO_FADE_IN;
[{
    params ["_adjust"];
    GVAR(ppPneumothoraxBlackout) ppEffectAdjust _adjust;
    GVAR(ppPneumothoraxBlackout) ppEffectCommit FX_PNEUMO_FADE_OUT;
}, [_delayedAdjust], FX_PNEUMO_FADE_IN] call CBA_fnc_waitAndExecute;
