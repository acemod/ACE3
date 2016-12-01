/*
 * Author: BaerMitUmlaut
 * Initializes visual effects of medical.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 */
#include "script_component.hpp"

_fnc_createEffect = {
    params ["_type", "_layer", "_default"];

    private _effect = ppEffectCreate [_type, _layer];
    _effect ppEffectForceInNVG true;
    _effect ppEffectAdjust _default;
    _effect ppEffectCommit 0;

    _effect
};

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

// - Pain ---------------------------------------------------------------------
if (GVAR(painEffectType) == 0) then {
    GVAR(ppPain) = [
        "ColorCorrections",
        13502,
        [1, 1, 0, [0, 0, 0, 0], [0, 0, 0, 0], [0, 0, 0, 0]]
    ] call _fnc_createEffect;
} else {
    GVAR(ppPain) = [
        "RadialBlur",
        13502,
        [0, 0, 0.3, 0.39]
    ] call _fnc_createEffect;
};

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
