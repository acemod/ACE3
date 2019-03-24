// CBA Settings [ADDON: ace_medical_treatment]:

private _categoryArray = [LELSTRING(medical,Category_DisplayName), LLSTRING(subCategory)];

// todo: the strings for all three advanced bandages/medication/diagnose settings are terribly ambigious

[// todo: I don't like that wound reopening requires this setting to be enabled, they should be independent
    QGVAR(advancedBandages), "CHECKBOX",
    [LSTRING(advancedBandages_DisplayName), LSTRING(advancedBandages_Description)],
    _categoryArray,
    true, // default value
    true, // isGlobal
    {[QGVAR(advancedBandages), _this] call EFUNC(common,cbaSettings_settingChanged)},
    true // Needs mission restart
] call CBA_settings_fnc_init;

[// todo: this setting just disables some treatment options, remove?
    QGVAR(advancedDiagnose), "CHECKBOX",
    [LSTRING(advancedDiagnose_DisplayName), LSTRING(advancedDiagnose_Description)],
    _categoryArray,
    true, // default value
    true, // isGlobal
    {[QGVAR(advancedDiagnose), _this] call EFUNC(common,cbaSettings_settingChanged)},
    true // Needs mission restart
] call CBA_settings_fnc_init;

[
    QGVAR(advancedMedication), "CHECKBOX",
    [LSTRING(advancedMedication_DisplayName), LSTRING(advancedMedication_Description)],
    _categoryArray,
    true, // default value
    true, // isGlobal
    {[QGVAR(advancedMedication), _this] call EFUNC(common,cbaSettings_settingChanged)},
    true // Needs mission restart
] call CBA_settings_fnc_init;

[
    QGVAR(woundReopening), "CHECKBOX",
    [LSTRING(woundReopening_DisplayName), LSTRING(woundReopening_Description)],
    _categoryArray,
    true, // default value
    true, // isGlobal
    {[QGVAR(woundReopening), _this] call EFUNC(common,cbaSettings_settingChanged)},
    true // Needs mission restart
] call CBA_settings_fnc_init;

[
    QGVAR(allowSelfIV), "LIST", // This setting is list because we want number for treatment config
    [LSTRING(allowSelfIV_DisplayName), LSTRING(allowSelfIV_Description)],
    _categoryArray,
    [[0,1],["No","Yes"],0], // [values, titles, defaultIndex]
    true, // isGlobal
    {[QGVAR(allowSelfIV), _this] call EFUNC(common,cbaSettings_settingChanged)},
    true // Needs mission restart
] call CBA_settings_fnc_init;

// Ported Settings:
[
    QEGVAR(medical,convertItems), "LIST",
    [LSTRING(convertItems_DisplayName), LSTRING(convertItems_Description)],
    _categoryArray,
    [[0,1,2],[LELSTRING(common,Enabled),LLSTRING(convertItems_remove),LELSTRING(common,Disabled)],0], // [values, titles, defaultIndex]
    true, // isGlobal
    {[QEGVAR(medical,convertItems), _this] call EFUNC(common,cbaSettings_settingChanged)},
    true // Needs mission restart
] call CBA_settings_fnc_init;

[
    QEGVAR(medical,allowLitterCreation), "CHECKBOX",
    [LSTRING(allowLitterCreation), LSTRING(allowLitterCreation_Description)],
    _categoryArray,
    true, // default value
    true, // isGlobal
    {[QEGVAR(medical,allowLitterCreation), _this] call EFUNC(common,cbaSettings_settingChanged)},
    true // Needs mission restart
] call CBA_settings_fnc_init;

[
    QEGVAR(medical,CPRcreatesPulse), "CHECKBOX",
    [LSTRING(CPRcreatesPulse), LSTRING(CPRcreatesPulse_Description)],
    _categoryArray,
    true, // default value
    true, // isGlobal
    {[QEGVAR(medical,CPRcreatesPulse), _this] call EFUNC(common,cbaSettings_settingChanged)},
    true // Needs mission restart
] call CBA_settings_fnc_init;

[
    QEGVAR(medical,litterCleanUpDelay), "SLIDER",
    [LSTRING(litterCleanUpDelay), LSTRING(litterCleanUpDelay_Description)],
    _categoryArray,
    [-1,5000,0,1], // [min, max, default value, trailing decimals (-1 for whole numbers only)]
    true, // isGlobal
    {[QEGVAR(medical,litterCleanUpDelay), _this] call EFUNC(common,cbaSettings_settingChanged)},
    true // Needs mission restart
] call CBA_settings_fnc_init;

[
    QEGVAR(medical,litterSimulationDetail), "LIST",
    [LSTRING(litterSimulationDetail), LSTRING(litterSimulationDetail_Description)],
    _categoryArray,
    [[0,1,2,3,4],["Off","Low","Medium","High","Ultra"],3], // [values, titles, defaultIndex]
    true, // isGlobal
    {[QEGVAR(medical,litterSimulationDetail), _this] call EFUNC(common,cbaSettings_settingChanged)},
    true // Needs mission restart
] call CBA_settings_fnc_init;

[
    QEGVAR(medical,increaseTrainingInLocations), "CHECKBOX",
    [LSTRING(increaseTrainingInLocations_DisplayName), LSTRING(increaseTrainingInLocations_Description)],
    _categoryArray,
    false, // default value
    true, // isGlobal
    {[QEGVAR(medical,increaseTrainingInLocations), _this] call EFUNC(common,cbaSettings_settingChanged)},
    true // Needs mission restart
] call CBA_settings_fnc_init;

[
    QEGVAR(medical,PAKTime), "SLIDER",
    [LSTRING(PAKTime), LSTRING(PAKTime_Description)],
    _categoryArray,
    [-1,5000,0,1], // [min, max, default value, trailing decimals (-1 for whole numbers only)]
    true, // isGlobal
    {[QEGVAR(medical,PAKTime), _this] call EFUNC(common,cbaSettings_settingChanged)},
    true // Needs mission restart
] call CBA_settings_fnc_init;

[
    QEGVAR(medical,medicSetting_Epi), "LIST",
    [LSTRING(medicSetting_Epi_DisplayName), LSTRING(medicSetting_Epi_Description)],
    _categoryArray,
    [[0,1,2],["Anyone","Medics only","Doctors only"],0], // [values, titles, defaultIndex]
    true, // isGlobal
    {[QEGVAR(medical,medicSetting_Epi), _this] call EFUNC(common,cbaSettings_settingChanged)},
    true // Needs mission restart
] call CBA_settings_fnc_init;

[
    QEGVAR(medical,medicSetting_PAK), "LIST",
    [LSTRING(medicSetting_PAK_DisplayName), LSTRING(medicSetting_PAK_Description)],
    _categoryArray,
    [[0,1,2],["Anyone","Medics only","Doctors only"],0], // [values, titles, defaultIndex]
    true, // isGlobal
    {[QEGVAR(medical,medicSetting_PAK), _this] call EFUNC(common,cbaSettings_settingChanged)},
    true // Needs mission restart
] call CBA_settings_fnc_init;

[
    QEGVAR(medical,medicSetting_SurgicalKit), "LIST",
    [LSTRING(medicSetting_SurgicalKit_DisplayName), LSTRING(medicSetting_SurgicalKit_Description)],
    _categoryArray,
    [[0,1,2],["Anyone","Medics only","Doctors only"],0], // [values, titles, defaultIndex]
    true, // isGlobal
    {[QEGVAR(medical,medicSetting_SurgicalKit), _this] call EFUNC(common,cbaSettings_settingChanged)},
    true // Needs mission restart
] call CBA_settings_fnc_init;

[
    QEGVAR(medical,consumeItem_PAK), "LIST",
    [LSTRING(consumeItem_PAK_DisplayName), LSTRING(consumeItem_PAK_Description)],
    _categoryArray,
    [[0,1],["No","Yes"],1], // [values, titles, defaultIndex]
    true, // isGlobal
    {[QEGVAR(medical,consumeItem_PAK), _this] call EFUNC(common,cbaSettings_settingChanged)},
    true // Needs mission restart
] call CBA_settings_fnc_init;

[
    QEGVAR(medical,consumeItem_SurgicalKit), "LIST",
    [LSTRING(consumeItem_SurgicalKit_DisplayName), LSTRING(consumeItem_SurgicalKit_Description)],
    _categoryArray,
    [[0,1],["No","Yes"],1], // [values, titles, defaultIndex]
    true, // isGlobal
    {[QEGVAR(medical,consumeItem_SurgicalKit), _this] call EFUNC(common,cbaSettings_settingChanged)},
    true // Needs mission restart
] call CBA_settings_fnc_init;

[
    QEGVAR(medical,useLocation_Epi), "LIST",
    [LSTRING(useLocation_Epi_DisplayName), LSTRING(useLocation_Epi_Description)],
    _categoryArray,
    [[0,1,2,3,4],[LELSTRING(common,Anywhere), LELSTRING(common,Vehicle), LLSTRING(medicalFacility), LLSTRING(vehicleAndFacility), LELSTRING(common,Disabled)],0], // [values, titles, defaultIndex]
    true, // isGlobal
    {[QEGVAR(medical,useLocation_Epi), _this] call EFUNC(common,cbaSettings_settingChanged)},
    true // Needs mission restart
] call CBA_settings_fnc_init;

[
    QEGVAR(medical,useLocation_PAK), "LIST",
    [LSTRING(useLocation_PAK_DisplayName), LSTRING(useLocation_PAK_Description)],
    _categoryArray,
    [[0,1,2,3,4],[LELSTRING(common,Anywhere), LELSTRING(common,Vehicle), LLSTRING(medicalFacility), LLSTRING(vehicleAndFacility), LELSTRING(common,Disabled)],0], // [values, titles, defaultIndex]
    true, // isGlobal
    {[QEGVAR(medical,useLocation_PAK), _this] call EFUNC(common,cbaSettings_settingChanged)},
    true // Needs mission restart
] call CBA_settings_fnc_init;

[
    QEGVAR(medical,useLocation_SurgicalKit), "LIST",
    [LSTRING(useLocation_SurgicalKit_DisplayName), LSTRING(useLocation_SurgicalKit_Description)],
    _categoryArray,
    [[0,1,2,3,4],[LELSTRING(common,Anywhere), LELSTRING(common,Vehicle), LLSTRING(medicalFacility), LLSTRING(vehicleAndFacility), LELSTRING(common,Disabled)],0], // [values, titles, defaultIndex]
    true, // isGlobal
    {[QEGVAR(medical,useLocation_SurgicalKit), _this] call EFUNC(common,cbaSettings_settingChanged)},
    true // Needs mission restart
] call CBA_settings_fnc_init;
