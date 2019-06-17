// CBA Settings [ADDON: ace_medical_feedback]:

private _categoryArray = [LELSTRING(medical,Category), LLSTRING(subCategory)];

[
    QGVAR(painEffectType),
    "LIST",
    [localize LSTRING(painEffectType), "Selects the used pain effect type"], //@todo
    _categoryArray,
    [
        [0, 1],
        [LLSTRING(painEffectType_whiteFlashing), LLSTRING(painEffectType_pulsingBlur)],
        0
    ],
    false,
    {
        if (isNil QGVAR(ppPain)) exitWith {TRACE_1("Before Post-Init",_this)};
        TRACE_1("reseting ppEffect type",_this);
        [true] call FUNC(initEffects);
    }
] call CBA_Settings_fnc_init;
