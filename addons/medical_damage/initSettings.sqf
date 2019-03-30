// CBA Settings [ADDON: ace_medical_damage]:

private _categoryArray = [LELSTRING(medical,Category_DisplayName), LLSTRING(subCategory)];

[
    QEGVAR(medical,playerDamageThreshold), "SLIDER",
    [LSTRING(playerDamageThreshold_DisplayName), LSTRING(playerDamageThreshold_Description)],
    _categoryArray,
    [0,25,1,2], // [min, max, default value, trailing decimals (-1 for whole numbers only)]
    true, // isGlobal
    {[QEGVAR(medical,playerDamageThreshold), _this] call EFUNC(common,cbaSettings_settingChanged)},
    true // Needs mission restart
] call CBA_settings_fnc_init;

[
    QEGVAR(medical,AIDamageThreshold), "SLIDER",
    [LSTRING(AIDamageThreshold_DisplayName), LSTRING(AIDamageThreshold_Description)],
    _categoryArray,
    [0,25,1,2], // [min, max, default value, trailing decimals (-1 for whole numbers only)]
    true, // isGlobal
    {[QEGVAR(medical,AIDamageThreshold), _this] call EFUNC(common,cbaSettings_settingChanged)},
    true // Needs mission restart
] call CBA_settings_fnc_init;
