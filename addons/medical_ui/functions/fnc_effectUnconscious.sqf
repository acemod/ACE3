/*
 * Author: BaerMitUmlaut
 * Handles the unconscious effect.
 *
 * Arguments:
 * 0: Enable <BOOL>
 * 1: Animated wake up <BOOL>
 *
 * Return Value:
 * None
 */
#include "script_component.hpp"
params ["_enable", "_animated"];

if (!_enable && !_animated) exitWith {
    GVAR(ppUnconsciousBlur)     ppEffectEnable false;
    GVAR(ppUnconsciousBlackout) ppEffectEnable false;
};
GVAR(ppUnconsciousBlur)     ppEffectEnable true;
GVAR(ppUnconsciousBlackout) ppEffectEnable true;

if (_enable) then {
    GVAR(ppUnconsciousBlur)     ppEffectAdjust [5];
    GVAR(ppUnconsciousBlackout) ppEffectAdjust [1, 1, 0, [0, 0, 0, 1], [0, 0, 0, 0.5], [0, 0, 0, 0], [0.2, 0.12, 0, 0, 0, 0, 1]];
    GVAR(ppUnconsciousBlur)     ppEffectCommit 0.2;
    GVAR(ppUnconsciousBlackout) ppEffectCommit 0.2;
} else {
    // Animated wake up
    // Step 1: Widen eye "hole"
    GVAR(ppUnconsciousBlur)     ppEffectAdjust [5];
    GVAR(ppUnconsciousBlackout) ppEffectAdjust [1, 1, 0, [0, 0, 0, 0.83], [0, 0, 0, 0.5], [0, 0, 0, 0], [0.51, 0.17, 0, 0, 0, 0, 1]];
    GVAR(ppUnconsciousBlur)     ppEffectCommit 0.5;
    GVAR(ppUnconsciousBlackout) ppEffectCommit 0.5;

    // Step 2: Open it
    [{
        GVAR(ppUnconsciousBlur)     ppEffectAdjust [5];
        GVAR(ppUnconsciousBlackout) ppEffectAdjust [1, 1, 0, [0, 0, 0, 0.83], [0, 0, 0, 0.5], [0, 0, 0, 0], [0.7, 0.78, 0, 0, 0, 0, 1]];
        GVAR(ppUnconsciousBlur)     ppEffectCommit 1;
        GVAR(ppUnconsciousBlackout) ppEffectCommit 2;
    }, [], 0.5] call CBA_fnc_waitAndExecute;

    // Step 3: Fade away vignette
    [{
        GVAR(ppUnconsciousBlackout) ppEffectAdjust [1, 1, 0, [0, 0, 0, 0.83], [0, 0, 0, 0.0], [0, 0, 0, 0], [0.7, 0.78, 0, 0, 0, 0, 1]];
        GVAR(ppUnconsciousBlackout) ppEffectCommit 0.5;
    }, [], 1.5] call CBA_fnc_waitAndExecute;
};
