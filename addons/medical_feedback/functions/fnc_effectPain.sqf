#include "script_component.hpp"
/*
 * Author: BaerMitUmlaut
 * Triggers the pain effect (single flash).
 *
 * Arguments:
 * 0: Enable <BOOL>
 * 1: Intensity <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [true, 0.5] call ace_medical_feedback_fnc_effectPain
 *
 * Public: No
 */

params ["_enable", "_intensity"];

if (!_enable || {_intensity == 0}) exitWith {
    GVAR(ppPain) ppEffectEnable false;
    GVAR(ppPainBlur) ppEffectEnable false;
};
GVAR(ppPain) ppEffectEnable true;
GVAR(ppPainBlur) ppEffectEnable true;

// Trigger effect every 2s
private _showNextTick = missionNamespace getVariable [QGVAR(showPainNextTick), true];
GVAR(showPainNextTick) = !_showNextTick;
if (_showNextTick) exitWith {};

private _blurIntensity = linearConversion [0.8, 1, _intensity, 0, 1, true];
GVAR(ppPainBlur) ppEffectAdjust [_blurIntensity];
GVAR(ppPainBlur) ppEffectCommit 0.1;

if (GVAR(painEffectType) == FX_PAIN_ONLY_BASE) exitWith {};

private _initialAdjust = [];
private _delayedAdjust = [];

switch (GVAR(painEffectType)) do {
    case FX_PAIN_WHITE_FLASH: {
        _intensity     = linearConversion [0, 1, _intensity, 0, 0.6, true];
        _initialAdjust = [1, 1, 0, [1, 1, 1, _intensity      ], [1, 1, 1, 1], [0.33, 0.33, 0.33, 0], [0.55, 0.5, 0, 0, 0, 0, 4]];
        _delayedAdjust = [1, 1, 0, [1, 1, 1, _intensity * 0.3], [1, 1, 1, 1], [0.33, 0.33, 0.33, 0], [0.55, 0.5, 0, 0, 0, 0, 4]];
    };
    case FX_PAIN_PULSATING_BLUR: {
        _intensity     = linearConversion [0, 1, _intensity, 0, 0.008, true];
        _initialAdjust = [_intensity      , _intensity      , 0.15, 0.15];
        _delayedAdjust = [_intensity * 0.2, _intensity * 0.2, 0.25, 0.25];
    };
    case FX_PAIN_CHROMATIC_ABERRATION: {
        _intensity     = linearConversion [0, 1, _intensity, 0, 0.06, true];
        _initialAdjust = [_intensity       , _intensity       , true];
        _delayedAdjust = [_intensity * 0.15, _intensity * 0.15, true];
    };
};

GVAR(ppPain) ppEffectAdjust _initialAdjust;
GVAR(ppPain) ppEffectCommit FX_PAIN_FADE_IN;
[{
    params ["_adjust", "_painEffectType"];
    if (GVAR(painEffectType) != _painEffectType) exitWith {TRACE_1("Effect type changed",_this);};
    GVAR(ppPain) ppEffectAdjust _adjust;
    GVAR(ppPain) ppEffectCommit FX_PAIN_FADE_OUT;
}, [_delayedAdjust, GVAR(painEffectType)], FX_PAIN_FADE_IN] call CBA_fnc_waitAndExecute;
