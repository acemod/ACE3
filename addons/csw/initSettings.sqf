// CBA Settings [ADDON: ace_csw]:

private _categoryArray = [format ["ACE %1", localize LSTRING(DisplayName)]];

[
    QGVAR(defaultAssemblyMode), "CHECKBOX",
    [LSTRING(defaultAssemblyMode_displayName), LSTRING(defaultAssemblyMode_description)],
    _categoryArray,
    false, // default value
    true, // isGlobal
    {[QGVAR(defaultAssemblyMode), _this] call EFUNC(common,cbaSettings_settingChanged)},
    true // Needs mission restart
] call CBA_settings_fnc_init;

[
    QGVAR(handleExtraMagazines), "CHECKBOX",
    [LSTRING(handleExtraMagazines_displayName), LSTRING(handleExtraMagazines_description)],
    _categoryArray,
    true, // default value
    true, // isGlobal
    {[QGVAR(handleExtraMagazines), _this] call EFUNC(common,cbaSettings_settingChanged)},
    true // Needs mission restart
] call CBA_settings_fnc_init;

[
    QGVAR(ammoHandling), "LIST",
    [LSTRING(ammoHandling_displayName), LSTRING(ammoHandling_description)],
    _categoryArray,
    [[0, 1, 2], [LELSTRING(common,Disabled), LELSTRING(common,playerOnly), LELSTRING(common,playersAndAI)], 2], //  [_values, _valueTitles, _defaultIndex]
    true, // isGlobal
    {[QGVAR(ammoHandling), _this] call EFUNC(common,cbaSettings_settingChanged)},
    true // Needs mission restart
] call CBA_settings_fnc_init;

[
    QGVAR(progressBarTimeCoefficent), "SLIDER",
    [LSTRING(progressBarTimeCoefficent_displayName), LSTRING(progressBarTimeCoefficent_description)],
    _categoryArray,
    [0,2,1,2], // [min, max, default value, trailing decimals (-1 for whole numbers only)]
    true, // isGlobal
    {[QGVAR(progressBarTimeCoefficent), _this] call EFUNC(common,cbaSettings_settingChanged)},
    false // Needs mission restart
] call CBA_settings_fnc_init;

[
    QGVAR(dragAfterDeploy), "CHECKBOX",
    [LSTRING(dragAfterDeploy_displayName), LSTRING(dragAfterDeploy_description)],
    _categoryArray,
    false, // default value
    false, // isGlobal
    {[QGVAR(dragAfterDeploy), _this] call EFUNC(common,cbaSettings_settingChanged)},
    false // Needs mission restart
] call CBA_settings_fnc_init;
