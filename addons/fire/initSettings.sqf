[
    QGVAR(enabled), "CHECKBOX",
    [LSTRING(setting_enable), LSTRING(setting_description)],
    LSTRING(category_displayName),
    false, // default value
    true, // isGlobal
    {[QGVAR(fireEnabled), _this] call EFUNC(common,cbaSettings_settingChanged)},
    true // Needs mission restart
] call CBA_settings_fnc_init;

[
    QGVAR(enableFlare), "CHECKBOX",
    [LSTRING(setting_flareEnable), LSTRING(setting_flareDescription)],
    LSTRING(category_displayName),
    true, // default value
    true, // isGlobal
    {[QGVAR(flareEnabled), _this] call EFUNC(common,cbaSettings_settingChanged)},
    true // Needs mission restart
] call CBA_settings_fnc_init;


