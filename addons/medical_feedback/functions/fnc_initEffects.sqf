#include "script_component.hpp"
/*
 * Author: BaerMitUmlaut
 * Initializes visual effects of medical.
 *
 * Arguments:
 * 0: Just Pain Effects <BOOL>
 *
 * Return Value:
 * None
 *
 * Example:
 * [false] call ace_medical_feedback_fnc_initEffects
 *
 * Public: No
 */

params [["_justPain", false]];

TRACE_1("initEffects",_justPain);

private _fnc_createEffect = {
    params ["_type", "_layer", "_default"];

    private _effect = ppEffectCreate [_type, _layer];
    _effect ppEffectForceInNVG true;
    _effect ppEffectAdjust _default;
    _effect ppEffectCommit 0;

    _effect
};

// - Pain ---------------------------------------------------------------------
if (!isNil QGVAR(ppPain)) then {
    TRACE_1("delete pain",GVAR(ppPain));
    ppEffectDestroy GVAR(ppPain)
};
if (GVAR(painEffectType) == 0) then {
    GVAR(ppPain) = [
        "ColorCorrections",
        13502,
        [1, 1, 0, [1, 1, 1, 0], [1, 1, 1, 1], [0.33, 0.33, 0.33, 0], [0.59, 0.64, 0, 0, 0, 0, 4]]
    ] call _fnc_createEffect;
} else {
    GVAR(ppPain) = [
        "RadialBlur", // "Will not do anything if RADIAL BLUR is disabled in Video Options."
        13502,
        [0, 0, 0.3, 0.39]
    ] call _fnc_createEffect;
};
TRACE_1("created pain",GVAR(ppPain));

if (_justPain) exitWith {};

// - Unconscious --------------------------------------------------------------
GVAR(ppUnconsciousBlur) = [
    "DynamicBlur",
    813, // 135xx does not work
    [0]
] call _fnc_createEffect;

GVAR(ppUnconsciousBlackout) = [
    "ColorCorrections",
    13500,
    [1, 1, 0, [0, 0, 0, 0], [0, 0, 0, 0], [0, 0, 0, 0]]
] call _fnc_createEffect;


// - Blood volume -------------------------------------------------------------
GVAR(ppBloodVolume) = [
    "ColorCorrections",
    13503,
    [1, 1, 0,  [0, 0, 0, 0],  [1, 1, 1, 1],  [0.2, 0.2, 0.2, 0]]
] call _fnc_createEffect;

// - Incapacitation -----------------------------------------------------------
GVAR(ppIncapacitationGlare) = [
    "ColorCorrections",
    13504,
    [1, 1, 0, [0, 0, 0, 0], [1, 1, 1, 1], [0, 0, 0, 0]]
] call _fnc_createEffect;

GVAR(ppIncapacitationBlur) = [
    "DynamicBlur",
    814, // 135xx does not work
    [0]
] call _fnc_createEffect;
