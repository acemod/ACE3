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
    ["limping"],//LSTRING(limping_DisplayName), LSTRING(limping_Description)],
    _categoryArray,
    [[0,1,2],["Disabled", "Limp on open wound", "Limp on open or bandaged wound"], 1], // [values, titles, defaultIndex]
    true, // isGlobal
    {[QEGVAR(medical,limping), _this] call EFUNC(common,cbaSettings_settingChanged)},
    true // Needs mission restart
] call CBA_settings_fnc_init;

[
    QEGVAR(medical,fractures), "LIST",
    ["fractures"],//LSTRING(limping_DisplayName), LSTRING(limping_Description)],
    _categoryArray,
    [[0,1,2],["Disabled", "Splints fully heal", "Splints heal (but cannot sprint)"], 1], // [values, titles, defaultIndex]
    true, // isGlobal
    {[QEGVAR(medical,fractures), _this] call EFUNC(common,cbaSettings_settingChanged)},
    true // Needs mission restart
] call CBA_settings_fnc_init;
