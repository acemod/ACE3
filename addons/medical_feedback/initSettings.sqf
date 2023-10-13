[
    QGVAR(painEffectType),
    "LIST",
    [LSTRING(PainEffectType_DisplayName), LSTRING(PainEffectType_Description)],
    [ELSTRING(medical,Category), LSTRING(SubCategory)],
    [
        [FX_PAIN_WHITE_FLASH, FX_PAIN_PULSATING_BLUR, FX_PAIN_CHROMATIC_ABERRATION, FX_PAIN_ONLY_BASE],
        [LSTRING(painEffectType_whiteFlashing), LSTRING(painEffectType_pulsingBlur), LSTRING(painEffectType_chromAberration), LSTRING(painEffectType_onlyBase)],
        0
    ],
    false,
    {
        if (isNil QGVAR(ppPain)) exitWith {
            TRACE_1("painEffectType setting - before postInit",_this);
        };

        TRACE_1("painEffectType setting - resetting effect",_this);
        [true] call FUNC(initEffects);
    }
] call CBA_fnc_addSetting;

[
    QGVAR(bloodVolumeEffectType),
    "LIST",
    [LSTRING(BloodVolumeEffectType_DisplayName), LSTRING(BloodVolumeEffectType_Description)],
    [ELSTRING(medical,Category), LSTRING(SubCategory)],
    [
        [FX_BLOODVOLUME_COLOR_CORRECTION, FX_BLOODVOLUME_ICON, FX_BLOODVOLUME_BOTH],
        [LSTRING(BloodVolumeEffectType_colorCorrection), LSTRING(BloodVolumeEffectType_icon), LSTRING(BloodVolumeEffectType_both)],
        0
    ],
    false,
    {
        if (isNil QGVAR(showBloodVolumeIcon)) exitWith {
            TRACE_1("bloodVolumeEffect setting - before postInit",_this);
        };

        TRACE_1("bloodVolumeEffect setting - resetting effect",_this);
        [true] call FUNC(initEffects);
    }
] call CBA_fnc_addSetting;

[
    QGVAR(enableHUDIndicators),
    "CHECKBOX",
    [LSTRING(EnableHUDIndicators_DisplayName), LSTRING(EnableHUDIndicators_Description)],
    [ELSTRING(medical,Category), LSTRING(SubCategory)],
    true,
    false,
    {
        // --- Drop indication on disabling
        if (!_this) exitWith {
            [true] call FUNC(handleHUDIndicators);
        };
    }
] call CBA_fnc_addSetting;
