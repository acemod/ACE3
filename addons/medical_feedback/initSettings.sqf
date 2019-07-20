[
    QGVAR(painEffectType),
    "LIST",
    [LSTRING(PainEffectType_DisplayName), LSTRING(PainEffectType_Description)],
    [ELSTRING(medical,Category), LSTRING(SubCategory)],
    [[0, 1], [LSTRING(PainEffectType_WhiteFlashing), LSTRING(PainEffectType_PulsingBlur)], 0],
    false,
    {
        if (isNil QGVAR(ppPain)) exitWith {
            TRACE_1("painEffectType setting - before postInit",_this);
        };

        TRACE_1("painEffectType setting - resetting effect",_this);
        [true] call FUNC(initEffects);
    }
] call CBA_Settings_fnc_init;

[
    QGVAR(painIntensity),
    "SLIDER",
    [LSTRING(PainIntensity_DisplayName), LSTRING(PainIntensity_Description)],
    [ELSTRING(medical,Category), LSTRING(SubCategory)],
    [0, 25, 0.6 , 2],
    true
] call CBA_settings_fnc_init;