// CBA Settings [ADDON: ace_medical_feedback]:

private _categoryArray = [LELSTRING(medical,Category_DisplayName), LLSTRING(subCategory)];

[
    QGVAR(painEffectType),
    "LIST",
    [localize LSTRING(painEffectType), "Selects the used pain effect type"], //@todo
    _categoryArray,
    [
        [FX_PAIN_WHITE_FLASH, FX_PAIN_PULSATING_BLUR, FX_PAIN_CHROMATIC_ABERRATION],
        [LLSTRING(painEffectType_whiteFlashing), LLSTRING(painEffectType_pulsingBlur), LLSTRING(painEffectType_chromAberration)],
        0
    ],
    false,
    {
        if (isNil QGVAR(ppPain)) exitWith {TRACE_1("Before Post-Init",_this)};
        TRACE_1("reseting ppEffect type",_this);
        [true] call FUNC(initEffects);
    }
] call CBA_Settings_fnc_init;
