// CBA Settings [ADDON: ace_medical]:

private _categoryArray = [LELSTRING(medical,Category), "?"];

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
