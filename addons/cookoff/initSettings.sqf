// CBA Settings [ADDON: ace_cookoff]:

[
    QGVAR(enable), "LIST",
    [LSTRING(enable_hd_name), LSTRING(enable_hd_tooltip)],
    LSTRING(category_displayName),
    [[0, 1, 2], ["STR_A3_OPTIONS_DISABLED", ELSTRING(common,playerOnly), ELSTRING(common,playersAndAI)], 2],
    true, // isGlobal
    {[QGVAR(enable), _this] call EFUNC(common,cbaSettings_settingChanged)},
    true // Needs mission restart
] call CBA_fnc_addSetting;

[
    QGVAR(enableFire), "CHECKBOX",
    [LSTRING(enableFire_name), LSTRING(enableFire_tooltip)],
    LSTRING(category_displayName),
    true, // default value
    true, // isGlobal
    {[QGVAR(enableFire), _this] call EFUNC(common,cbaSettings_settingChanged)},
    false // Needs mission restart
] call CBA_fnc_addSetting;

[
    QGVAR(enableAmmoCookoff), "CHECKBOX",
    [LSTRING(enableAmmoCookoff_name), LSTRING(enableAmmoCookoff_tooltip)],
    LSTRING(category_displayName),
    true, // default value
    true, // isGlobal
    {[QGVAR(enableAmmoCookoff), _this] call EFUNC(common,cbaSettings_settingChanged)},
    false // Needs mission restart
] call CBA_fnc_addSetting;

[
    QGVAR(enableAmmobox), "CHECKBOX",
    [LSTRING(enableBoxCookoff_name), LSTRING(enableBoxCookoff_tooltip)],
    LSTRING(category_displayName),
    true, // default value
    true, // isGlobal
    {[QGVAR(enableAmmobox), _this] call EFUNC(common,cbaSettings_settingChanged)},
    true // Needs mission restart
] call CBA_fnc_addSetting;

[
    QGVAR(ammoCookoffDuration), "SLIDER",
    [LSTRING(ammoCookoffDuration_name), LSTRING(ammoCookoffDuration_tooltip)],
    LSTRING(category_displayName),
    [0,5,1,1], // [min, max, default value, trailing decimals (-1 for whole numbers only)]
    true, // isGlobal
    {[QGVAR(ammoCookoffDuration), _this] call EFUNC(common,cbaSettings_settingChanged)},
    true // Needs mission restart
] call CBA_fnc_addSetting;

[
    QGVAR(probabilityCoef), "SLIDER",
    [LSTRING(probabilityCoef_name), LSTRING(probabilityCoef_tooltip)],
    LSTRING(category_displayName),
    [0,5,1,1], // [min, max, default value, trailing decimals (-1 for whole numbers only)]
    true, // isGlobal
    {[QGVAR(probabilityCoef), _this] call EFUNC(common,cbaSettings_settingChanged)},
    true // Needs mission restart
] call CBA_fnc_addSetting;
