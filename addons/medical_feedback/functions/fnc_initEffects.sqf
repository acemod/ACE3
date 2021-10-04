#include "script_component.hpp"
/*
 * Author: BaerMitUmlaut
 * Initializes visual effects of medical.
 *
 * Arguments:
 * 0: Update pain and low blood volume effects only <BOOL>
 *
 * Return Value:
 * None
 *
 * Example:
 * [false] call ace_medical_feedback_fnc_initEffects
 *
 * Public: No
 */

params [["_updateOnly", false]];

TRACE_1("initEffects",_updateOnly);

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
switch (GVAR(painEffectType)) do {
    case FX_PAIN_WHITE_FLASH: {
        GVAR(ppPain) = [
            "ColorCorrections",
            13502,
            [1, 1, 0, [1, 1, 1, 0], [1, 1, 1, 1], [0.33, 0.33, 0.33, 0], [0.55, 0.5, 0, 0, 0, 0, 4]]
        ] call _fnc_createEffect;
    };
    case FX_PAIN_PULSATING_BLUR: {
        GVAR(ppPain) = [
            "RadialBlur", // "Will not do anything if RADIAL BLUR is disabled in Video Options."
            13502,
            [0, 0, 0.25, 0.25]
        ] call _fnc_createEffect;
    };
    case FX_PAIN_CHROMATIC_ABERRATION: {
        GVAR(ppPain) = [
            "ChromAberration",
            13502,
            [0, 0, false]
        ] call _fnc_createEffect;
    };
};
// Base blur on high pain
if (isNil QGVAR(ppPainBlur)) then {
    GVAR(ppPainBlur) = [
        "DynamicBlur",
        813, // 135xx does not work
        [0]
    ] call _fnc_createEffect;
};

TRACE_1("created pain",GVAR(ppPain));

// - Blood volume -------------------------------------------------------------
private _ppBloodVolumeSettings = [
    "ColorCorrections",
    13503,
    [1, 1, 0,  [0, 0, 0, 0],  [1, 1, 1, 1],  [0.2, 0.2, 0.2, 0]]
];
GVAR(showBloodVolumeIcon) = false;

if (!isNil QGVAR(ppBloodVolume)) then {
    TRACE_1("delete blood volume",GVAR(ppBloodVolume));
    ppEffectDestroy GVAR(ppBloodVolume);
    GVAR(ppBloodVolume) = nil;
};
switch (GVAR(bloodVolumeEffectType)) do {
    case FX_BLOODVOLUME_COLOR_CORRECTION: {
        GVAR(ppBloodVolume) = _ppBloodVolumeSettings call _fnc_createEffect;
    };
    case FX_BLOODVOLUME_ICON: {
        GVAR(showBloodVolumeIcon) = true;
    };
    case FX_BLOODVOLUME_BOTH: {
        GVAR(showBloodVolumeIcon) = true;
        GVAR(ppBloodVolume) = _ppBloodVolumeSettings call _fnc_createEffect;
    };
};

if (_updateOnly) exitWith {};

// - Unconscious --------------------------------------------------------------
GVAR(ppUnconsciousBlur) = [
    "DynamicBlur",
    814, // 135xx does not work
    [0]
] call _fnc_createEffect;

GVAR(ppUnconsciousBlackout) = [
    "ColorCorrections",
    13500,
    [1, 1, 0, [0, 0, 0, 0], [0, 0, 0, 0], [0, 0, 0, 0]]
] call _fnc_createEffect;

// - Incapacitation -----------------------------------------------------------
GVAR(ppIncapacitationGlare) = [
    "ColorCorrections",
    13504,
    [1, 1, 0, [0, 0, 0, 0], [1, 1, 1, 1], [0, 0, 0, 0]]
] call _fnc_createEffect;

GVAR(ppIncapacitationBlur) = [
    "DynamicBlur",
    815, // 135xx does not work
    [0]
] call _fnc_createEffect;
