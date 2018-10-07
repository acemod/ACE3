// CBA Settings [ADDON: ace_nightVision]:

[
    QGVAR(effectScaling), "SLIDER",
    [LSTRING(effectScaling_DisplayName), LSTRING(effectScaling_Description)],
    localize LSTRING(Category),
    [0,2,1,1], // [min, max, default value, trailing decimals (-1 for whole numbers only)]
    true, // isGlobal
    {
        GVAR(ppEffectNVGBrightness) ppEffectEnable (
            (GVAR(effectScaling) == 0) && {currentVisionMode ACE_player == 1}
        );

        if (GVAR(effectScaling) == 0) then {
            // Destroy PFH & PP effects
            GVAR(running) = false;
            [false] call FUNC(setupDisplayEffects);
            [GVAR(PFID)] call CBA_fnc_removePerFrameHandler;
            GVAR(PFID) = -1;
            GVAR(nextEffectsUpdate) = -1;
        } else {
            // Start PFH if scaling was previously set to 0
            if ((currentVisionMode ACE_player == 1) && {!GVAR(running)}) then {
                GVAR(running) = true;
                [true] call FUNC(setupDisplayEffects);
                [] call FUNC(refreshGoggleType);

                if (!isMultiplayer && {!isNull findDisplay 49}) then {
                    // Prevent duplicate effects when paused
                    GVAR(nextEffectsUpdate) = CBA_missionTime + 0.1;
                };

                GVAR(PFID) = [LINKFUNC(pfeh), 0, []] call CBA_fnc_addPerFrameHandler;
            };
        };
    }
] call CBA_settings_fnc_init;
[
    QGVAR(fogScaling), "SLIDER",
    [LSTRING(fogScaling_DisplayName), LSTRING(fogScaling_Description)],
    localize LSTRING(Category),
    [0,2,1,1], // [min, max, default value, trailing decimals (-1 for whole numbers only)]
    true // isGlobal
] call CBA_settings_fnc_init;

[
    QGVAR(noiseScaling), "SLIDER",
    [LSTRING(noiseScaling_DisplayName), LSTRING(noiseScaling_Description)],
    localize LSTRING(Category),
    [0,2,1,1], // [min, max, default value, trailing decimals (-1 for whole numbers only)]
    true // isGlobal
] call CBA_settings_fnc_init;

[
    QGVAR(aimDownSightsBlur), "SLIDER",
    [LSTRING(aimDownSightsBlur_DisplayName)],
    localize LSTRING(Category),
    [0,2,1,1], // [min, max, default value, trailing decimals (-1 for whole numbers only)]
    true // isGlobal
] call CBA_settings_fnc_init;

[
    QGVAR(disableNVGsWithSights), "CHECKBOX",
    [LSTRING(DisableNVGsWithSights_DisplayName), LSTRING(DisableNVGsWithSights_description)],
    localize LSTRING(Category),
    false, // default value
    true // isGlobal
] call CBA_settings_fnc_init;

[
    QGVAR(shutterEffects), "CHECKBOX",
    [LSTRING(shutterEffects_DisplayName), LSTRING(shutterEffects_description)],
    localize LSTRING(Category),
    true, // default value
    false // isGlobal
] call CBA_settings_fnc_init;
