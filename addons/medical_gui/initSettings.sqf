// CBA Settings [ADDON: ace_medical_gui]:

private _categoryArray = [LELSTRING(medical,Category_DisplayName), LLSTRING(subCategory)];

[
    QGVAR(allow), "LIST",
    [LSTRING(allow), LSTRING(allow_Descr)],
    _categoryArray,
    [[0,1,2],[LELSTRING(common,Disabled), LELSTRING(common,Enabled), LELSTRING(common,VehiclesOnly)],1], // [values, titles, defaultIndex]
    true, // isGlobal
    {[QGVAR(allow), _this] call EFUNC(common,cbaSettings_settingChanged)},
    true // Needs mission restart
] call CBA_settings_fnc_init;

[
    QGVAR(useMenu), "LIST",
    [LSTRING(useMenu), LSTRING(useMenu_Descr)],
    _categoryArray,
    [[0,1,2],[LELSTRING(common,Disabled), LELSTRING(common,Enabled), LELSTRING(common,VehiclesOnly)],1], // [values, titles, defaultIndex]
    false, // isGlobal
    {[QGVAR(useMenu), _this] call EFUNC(common,cbaSettings_settingChanged)},
    false // Needs mission restart
] call CBA_settings_fnc_init;

[
    QGVAR(openAfterTreatment), "CHECKBOX",
    [LSTRING(openAfterTreatment), LSTRING(openAfterTreatment_Descr)],
    _categoryArray,
    true, // default value
    false, // isGlobal
    {[QGVAR(openAfterTreatment), _this] call EFUNC(common,cbaSettings_settingChanged)},
    false // Needs mission restart
] call CBA_settings_fnc_init;

[ // for ref: 3d interaction (MEDICAL_ACTION_DISTANCE) is 1.75
    QGVAR(maxRange), "SLIDER",
    QGVAR(maxRange-localizeMe),
    _categoryArray,
    [0,10,3,1], // [min, max, default value, trailing decimals (-1 for whole numbers only)]
    true, // isGlobal
    {[QGVAR(maxRange), _this] call EFUNC(common,cbaSettings_settingChanged)},
    true // Needs mission restart
] call CBA_settings_fnc_init;

[
    QEGVAR(medical,menuTypeStyle), "LIST",
    [LSTRING(menuTypeDisplay), LSTRING(menuTypeDescription)],
    _categoryArray,
    [[0,1,2],[LLSTRING(useSelection), LLSTRING(useRadial),"Disabled"],0], // [values, titles, defaultIndex]
    false, // isGlobal
    {[QEGVAR(medical,menuTypeStyle), _this] call EFUNC(common,cbaSettings_settingChanged)},
    false // Needs mission restart
] call CBA_settings_fnc_init;

[
    QGVAR(painVisualization), "LIST",
    [LSTRING(menuTypeDisplay), LSTRING(menuTypeDescription)],
    _categoryArray,
    [[0,1,2],["Anyone","Medics only","Doctors only"],0], // [values, titles, defaultIndex] // ToDo: Localize
    true, // isGlobal
    {[QGVAR(painVisualization), _this] call EFUNC(common,cbaSettings_settingChanged)},
    true // Needs mission restart
] call CBA_settings_fnc_init;

[
    QGVAR(showPainInMenu), "CHECKBOX",
    [LSTRING(showPainInMenu_DisplayName), LSTRING(showPainInMenu_Description)],
    _categoryArray,
    false, // default value
    true, // isGlobal
    {[QGVAR(showPainInMenu), _this] call EFUNC(common,cbaSettings_settingChanged)},
    true // Needs mission restart
] call CBA_settings_fnc_init;
