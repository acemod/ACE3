[
    QGVAR(enabled), "CHECKBOX",
    ["STR_A3_OPTIONS_ENABLED", LSTRING(Setting_Description)],
    LSTRING(Category_DisplayName),
    true, // default value
    true, // isGlobal
    {[QGVAR(fireEnabled), _this] call EFUNC(common,cbaSettings_settingChanged)},
    true // Needs mission restart
] call CBA_settings_fnc_init;

[
    QGVAR(enableFlare), "CHECKBOX",
    [LSTRING(Setting_FlareEnable), LSTRING(Setting_FlareDescription)],
    LSTRING(Category_DisplayName),
    false, // default value
    true, // isGlobal
    {[QGVAR(flareEnabled), _this] call EFUNC(common,cbaSettings_settingChanged)},
    true // Needs mission restart
] call CBA_settings_fnc_init;
