// CBA Settings [ADDON: ace_medical_statemachine]:

private _categoryArray = [LELSTRING(medical,Category_DisplayName), LLSTRING(subCategory)];

[
    QGVAR(fatalInjuryCondition), "LIST",
    [LSTRING(fatalInjuryCondition_DisplayName), LSTRING(fatalInjuryCondition_Description)],
    _categoryArray,
    [[0,1,2],["Always","In Cardiac Arrest","Never"],0], // [values, titles, defaultIndex] //ToDo: Localize
    true, // isGlobal
    {[QGVAR(fatalInjuryCondition), _this] call EFUNC(common,cbaSettings_settingChanged)},
    true // Needs mission restart
] call CBA_settings_fnc_init;

[
    QGVAR(fatalInjuryConditionAI), "CHECKBOX",
    [LSTRING(fatalInjuryConditionAI_DisplayName), LSTRING(fatalInjuryConditionAI_Description)],
    _categoryArray,
    true, // default value
    true, // isGlobal
    {[QGVAR(fatalInjuryConditionAI), _this] call EFUNC(common,cbaSettings_settingChanged)},
    true // Needs mission restart
] call CBA_settings_fnc_init;

[
    QGVAR(unconsciousConditionAI), "CHECKBOX",
    [LSTRING(unconsciousConditionAI_DisplayName), LSTRING(unconsciousConditionAI_Description)],
    _categoryArray,
    true, // default value
    true, // isGlobal
    {[QGVAR(unconsciousConditionAI), _this] call EFUNC(common,cbaSettings_settingChanged)},
    true // Needs mission restart
] call CBA_settings_fnc_init;

[
    QGVAR(cardiacArrestTime), "SLIDER",
    [LSTRING(cardiacArrestTime_DisplayName), LSTRING(cardiacArrestTime_Description)],
    _categoryArray,
    [1,3600,30,0], // [min, max, default value, trailing decimals (-1 for whole numbers only)]
    true, // isGlobal
    {[QGVAR(cardiacArrestTime), _this] call EFUNC(common,cbaSettings_settingChanged)},
    true // Needs mission restart
] call CBA_settings_fnc_init;
