/*
 * Author: Dslyecxi, PabstMirror
 * PFEH to handle refreshing effects.
 * Updates UI scale on every frame, effects are updated less often.
 *
 * Arguments:
 * 1: PFEH ID <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [[], 1] call ace_nightvision_fnc_pfeh
 *
 * Public: No
 */
#include "script_component.hpp"

if ((currentVisionMode ACE_player) != 1) exitWith {
    GVAR(running) = false;
    [false] call FUNC(setupDisplayEffects);
    [GVAR(PFID)] call CBA_fnc_removePerFrameHandler;
    GVAR(PFID) = -1;
};
if (EGVAR(common,OldIsCamera)) exitWith {
    if (GVAR(running)) then {
        TRACE_2("pausing NVG for scripted camera",alive ACE_player,EGVAR(common,OldIsCamera));
        GVAR(running) = false;
        [false] call FUNC(setupDisplayEffects);
    };
};
if (!GVAR(running)) then {
    TRACE_1("Un-Pausing", GVAR(paused));
    GVAR(running) = true;
    [true] call FUNC(setupDisplayEffects);
    [] call FUNC(refreshGoggleType);
};

// Scale Border / Hex
BEGIN_COUNTER(borderScaling);
private _scale = (call EFUNC(common,getZoom)) * 1.12513;
if (!(GVAR(defaultPositionBorder) isEqualTo [])) then {
    // Prevents issues when "zooming out" on ultra wide monitors - The square mask would be narrower than the screen
    if (((GVAR(defaultPositionBorder) select 2) * _scale) < safeZoneW) then {
        _scale = safeZoneW / (GVAR(defaultPositionBorder) select 2);
    };
    [(uiNamespace getVariable QGVAR(titleDisplay)) displayCtrl 1000, GVAR(defaultPositionHex), _scale] call FUNC(scaleCtrl);
    [(uiNamespace getVariable QGVAR(titleDisplay)) displayCtrl 1001, GVAR(defaultPositionBorder), _scale] call FUNC(scaleCtrl);
    // Fade out hexes with high zoom (optics are doing the magnifying, not the player "focusing in")
    ((uiNamespace getVariable QGVAR(titleDisplay)) displayCtrl 1000) ctrlSetFade (linearConversion [4, 6, _scale, 0.2, 1, true]);
};
END_COUNTER(borderScaling);

if (CBA_missionTime < GVAR(nextEffectsUpdate)) then {
    // Update radial blur as it depends on zoom level, so should be changed each frame like the border/hex
    if (GVAR(ppeffectRadialBlur) != -1) then {
        GVAR(ppeffectRadialBlur) ppEffectAdjust [.005, .005, _scale * GVAR(nvgBlurRadius), _scale * .16];
        GVAR(ppeffectRadialBlur) ppEffectCommit 0;
    };
    // Need to rapidly update fog or it will try to resync from the server
    if (GVAR(fogScaling) > 0) then {
        0 setFog GVAR(nvgFog);
    };
} else {
    // Redo full effects less often
    BEGIN_COUNTER(updateAllEffects);
    GVAR(nextEffectsUpdate) = CBA_missionTime + 5;

    // Detecting the efficiency of the nightvision.
    private _lightFinal = 0 max (moonIntensity - ((overcast * .8) min .275) - (rain * .5));
    private _effectiveLight = _lightFinal * linearConversion [1, 3, GVAR(nvgGeneration), 0.25, 1];
    private _effectMod = linearConversion [1, 3, GVAR(nvgGeneration), 1.5, 1];
    // This has become a little weird. Basically means that lightfinal is unlikely to reach zero with any moon in the sky
    // buuut it just so happens that setting it like this means that the lighting progression from clear -> cloudy -> rainy works particularly well.

    private _grainFinal = linearConversion [1, 0, _effectiveLight, ST_NVG_GRAIN_MIN, ST_NVG_GRAIN_MAX, true];
    private _blurFinal = _effectMod *_effectMod * linearConversion [1, 0, _effectiveLight, ST_NVG_BLUR_MIN, ST_NVG_BLUR_MAX, true];
    private _brightFinal = linearConversion [0, 1, _effectiveLight, ST_NVG_BRIGHT_MIN, ST_NVG_BRIGHT_MAX, true];
    private _contrastFinal = linearConversion [0, 1, _effectiveLight, ST_NVG_CONTRAST_MIN, ST_NVG_CONTRAST_MAX, true];
    private _grainIntensityFinal = _effectMod * linearConversion [1, 0, _effectiveLight, ST_NVG_NOISEINTENSITY_MIN, ST_NVG_NOISEINTENSITY_MAX, true];
    private _noiseSharpnessFinal = linearConversion [1, 0, _effectiveLight, ST_NVG_NOISESHARPNESS_MIN, ST_NVG_NOISESHARPNESS_MAX, true];

    private _fogApply = linearConversion [0, 1, _effectiveLight, ST_NVG_MAXFOG, ST_NVG_MINFOG, true];

    // Modify blur if looking down scope
    if ((cameraView == "GUNNER") && {[ACE_player] call CBA_fnc_canUseWeapon}) then {
        if (currentWeapon ACE_player == "") exitWith {};
        if (currentWeapon ACE_player == primaryWeapon ACE_player) exitWith {_blurFinal = _blurFinal * linearConversion [0, 1, GVAR(aimDownSightsBlur), 1, ST_NVG_CAMERA_BLUR_SIGHTS_RIFLE]}; // Rifles are bad
        if (currentWeapon ACE_player == handgunWeapon ACE_player) exitWith {_blurFinal = _blurFinal * linearConversion [0, 1, GVAR(aimDownSightsBlur), 1, ST_NVG_CAMERA_BLUR_SIGHTS_PISTOL]}; // Pistols aren't so bad
    };

    // Scale general effects based on ace_nightvision_effectScaling setting
    private _radialBlurPower = 0.0025 * GVAR(effectScaling);
    _brightFinal = linearConversion [0, 1, GVAR(effectScaling), 1, _brightFinal];
    _contrastFinal = linearConversion [0, 1, GVAR(effectScaling), 1, _contrastFinal];

    // Add adjusted NVG brightness
    private _playerBrightSetting = ACE_player getVariable [QGVAR(NVGBrightness), 0];
    _brightFinal = _brightFinal + (_playerBrightSetting / 20);

    // Scale grain effects based on ace_nightvision_noiseScaling setting
    _grainIntensityFinal = _grainIntensityFinal * GVAR(noiseScaling);
    _noiseSharpnessFinal = linearConversion [0, 1, GVAR(noiseScaling), 2.5, _noiseSharpnessFinal];

    // Setup all effects
    // This is hacky but... works. This prevents the effects from being cancelled by various things - alt-tabbing, resizing, going into AT sights, etc. A nicer method would be welcome but I don't have time to spend on it. TODO.

    // FilmGrain - Electronic Noise
    // Params: [intensity(0..1), sharpness(0..20), grainsize(1..8), intensityX0, intensityX1, monochromatic(bool)]
    GVAR(ppeffectGrain) = ppEffectCreate ["FilmGrain", 200];
    GVAR(ppeffectGrain) ppEffectAdjust [_grainIntensityFinal, _noiseSharpnessFinal, _grainFinal, 0.3, 0.3];
    // OldNVG:  [0.25, 2.5, 2.5, _grainSetting, _grainSetting, false]
    GVAR(ppeffectGrain) ppEffectCommit 0;
    GVAR(ppeffectGrain) ppEffectForceInNVG true;
    GVAR(ppeffectGrain) ppEffectEnable true;

    // RadialBlur - Blurs closer to the edge nvg border (radius based on GVAR(bluRadius) config; e.g. larger for quadtube)
    // Note: "Will not do anything if RADIAL BLUR is disabled in Video Options." - So should try to keep this effect to a minimum to prevent balance issues
    // Params: [powerX, powerY, offsetX, offsetY]
    if (GVAR(nvgBlurRadius) != -1) then {
        GVAR(ppeffectRadialBlur) = ppEffectCreate ["RadialBlur", 451];
        GVAR(ppeffectRadialBlur) ppEffectAdjust [_radialBlurPower, _radialBlurPower, _scale * GVAR(nvgBlurRadius), _scale * .16];
        GVAR(ppeffectRadialBlur) ppEffectCommit 0;
        GVAR(ppeffectRadialBlur) ppEffectForceInNVG true;
        GVAR(ppeffectRadialBlur) ppEffectEnable true;
    };

    // ColorCorrections - Changes brightness, contrast and "green" color of nvg
    // Params: [brightness(0..2), contrast(0..inf), offset(-x..+x), blendArray, colorizeArray, weightArray]
    GVAR(ppeffectColorCorrect) = ppEffectCreate ["ColorCorrections", 2003];
    GVAR(ppeffectColorCorrect) ppEffectAdjust [_brightFinal, _contrastFinal, 0, [0.0, 0.0, 0.0, 0.0], [1.3, 1.2, 0.0, 0.9], [6, 1, 1, 0.0]];
    GVAR(ppeffectColorCorrect) ppEffectCommit 0;
    GVAR(ppeffectColorCorrect) ppEffectForceInNVG true;
    GVAR(ppeffectColorCorrect) ppEffectEnable true;

    // DynamicBlur - Increases overall screen blur when aiming down sights (which would be hard/impossible with NVG)
    // Params: [value(0..inf)]
    GVAR(ppeffectBlur) = ppEffectCreate ["DynamicBlur", 190];
    GVAR(ppeffectBlur) ppEffectAdjust [_blurFinal];
    GVAR(ppeffectBlur) ppEffectCommit 0;
    GVAR(ppeffectBlur) ppEffectForceInNVG true;
    GVAR(ppeffectBlur) ppEffectEnable true;


    // Modify local fog:
    if (GVAR(fogScaling) > 0) then {
        if (((vehicle ACE_player) != ACE_player) && {(vehicle ACE_player) isKindOf "Air"}) then {  // For flying in particular, can refine nicer later.
            _fogApply = _fogApply * ST_NVG_AIR_FOG_MULTIPLIER;
        };
        _fogApply = linearConversion [0, 1, GVAR(priorFog) select 0, (GVAR(fogScaling) * _fogApply), 1]; // mix in old fog if present
        GVAR(nvgFog) = [_fogApply, 0, 0];
        0 setFog GVAR(nvgFog)
    };

    #ifdef DEBUG_MODE_FULL
    private _aceAmbient = [] call EFUNC(common,ambientBrightness);
    hintSilent format [
        "EffectiveLight %1\nLight: %2\nACE Ambient: %3\nBrightness: %4\nContrast: %5\nGrain: %6\nBlur: %7\nFog: %8\nScaling %9",
        _effectiveLight,
        _lightFinal,
        _aceAmbient,
        _brightFinal,
        _contrastFinal,
        [_grainIntensityFinal, _noiseSharpnessFinal, _grainFinal],
        _blurFinal,
        _fogApply,
        [GVAR(effectScaling), GVAR(fogScaling), GVAR(noiseScaling)]
    ];
    #endif

    END_COUNTER(updateAllEffects);
};
