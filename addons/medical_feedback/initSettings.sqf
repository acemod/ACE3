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
] call CBA_Settings_fnc_init;
