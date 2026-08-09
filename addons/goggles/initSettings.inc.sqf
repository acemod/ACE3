private _category = [LELSTRING(common,ACEKeybindCategoryEquipment), LLSTRING(SettingsName)];

[
    QGVAR(effects), "LIST",
    LSTRING(effects_displayName),
    _category,
    [[0, 1, 2, 3], [ELSTRING(common,Disabled), LSTRING(effects_tintOnly), LSTRING(enabled_tintAndEffects), LSTRING(effects_effectsOnly)], 2],
    0,
    {[QGVAR(effects), _this] call EFUNC(common,cbaSettings_settingChanged)},
    true // Needs mission restart
] call CBA_fnc_addSetting;

[
    QGVAR(showInThirdPerson), "CHECKBOX",
    LSTRING(ShowInThirdPerson),
    _category,
    false,
    0
] call CBA_fnc_addSetting;

[
    QGVAR(showClearGlasses), "CHECKBOX",
    [LSTRING(SettingShowClearGlasses), LELSTRING(common,showActionInSelfInteraction)],
    _category,
    false, // default value
    0 // isGlobal
] call CBA_fnc_addSetting;

[
    QGVAR(drawOverlay), "CHECKBOX",
    LSTRING(SettingDrawOverlay),
    _category,
    true,
    0
] call CBA_fnc_addSetting;
