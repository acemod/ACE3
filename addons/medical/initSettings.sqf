// CBA Settings [ADDON: ace_medical]:

private _categoryArray = [LELSTRING(medical,Category_DisplayName), "?"];

// todo: Check the description is still accurate
[
    QGVAR(spontaneousWakeUpChance), "SLIDER",
    [LSTRING(MedicalSettings_spontaneousWakeUpChance_DisplayName), LSTRING(MedicalSettings_spontaneousWakeUpChance_Description)],
    _categoryArray,
    [0,1,0.05,2], // [min, max, default value, trailing decimals (-1 for whole numbers only)]
    true, // isGlobal
    {[QGVAR(spontaneousWakeUpChance), _this] call EFUNC(common,cbaSettings_settingChanged)},
    true // Needs mission restart
] call CBA_settings_fnc_init;

[
    QEGVAR(medical,limping), "LIST",
    LSTRING(setting_limping_DisplayName), LSTRING(setting_limping_Description)],
    _categoryArray,
    [[0,1,2],[LELSTRING(common,disabled), LLSTRING(setting_limping_limpOnOpenWounds), LLSTRING(setting_limping_limpRequiresStitching)], 1], // [values, titles, defaultIndex]
    true, // isGlobal
    {[QEGVAR(medical,limping), _this] call EFUNC(common,cbaSettings_settingChanged)},
    true // Needs mission restart
] call CBA_settings_fnc_init;

[
    QEGVAR(medical,fractures), "LIST",
    LSTRING(setting_fractures_DisplayName), LSTRING(setting_fractures_Description)],
    _categoryArray,
    [[0,1,2],[LELSTRING(common,disabled), LLSTRING(setting_fractures_splintHealsFully), LLSTRING(setting_fractures_splintHasEffects)]"Splints fully heal", "Splints heal (but cannot sprint)"], 1], // [values, titles, defaultIndex]
    true, // isGlobal
    {[QEGVAR(medical,fractures), _this] call EFUNC(common,cbaSettings_settingChanged)},
    true // Needs mission restart
] call CBA_settings_fnc_init;
