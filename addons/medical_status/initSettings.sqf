// CBA Settings [ADDON: ace_medical_status]:

private _categoryArray = [LELSTRING(medical,Category_DisplayName), LLSTRING(subCategory)];

[
    QEGVAR(medical,bleedingCoefficient), "SLIDER",
    [LSTRING(bleedingCoefficient_DisplayName), LSTRING(bleedingCoefficient_Description)],
    _categoryArray,
    [0,25,1,1], // [min, max, default value, trailing decimals (-1 for whole numbers only)]
    true, // isGlobal
    {[QEGVAR(medical,bleedingCoefficient), _this] call EFUNC(common,cbaSettings_settingChanged)},
    true // Needs mission restart
] call CBA_settings_fnc_init;

[
    QEGVAR(medical,painCoefficient), "SLIDER",
    [LSTRING(painCoefficient_DisplayName), LSTRING(painCoefficient_Description)],
    _categoryArray,
    [0,25,1,1], // [min, max, default value, trailing decimals (-1 for whole numbers only)]
    true, // isGlobal
    {[QEGVAR(medical,painCoefficient), _this] call EFUNC(common,cbaSettings_settingChanged)},
    true // Needs mission restart
] call CBA_settings_fnc_init;

[
    QGVAR(ivFlowRate), "SLIDER",
    [LSTRING(ivFlowRate_DisplayName), LSTRING(ivFlowRate_Description)],
    _categoryArray,
    [0,25,1,1], // [min, max, default value, trailing decimals (-1 for whole numbers only)]
    true, // isGlobal
    {[QGVAR(ivFlowRate), _this] call EFUNC(common,cbaSettings_settingChanged)},
    true // Needs mission restart
] call CBA_settings_fnc_init;
