[
    QGVAR(enabled), "CHECKBOX",
    [ELSTRING(common,Enabled), LSTRING(setting_description)],
    LSTRING(category_displayName),
    false, // default value
    true, // isGlobal
    {[QGVAR(enabled), _this] call EFUNC(common,cbaSettings_settingChanged)},
    true // Needs mission restart
] call CBA_settings_fnc_init;

[
    QGVAR(enableCarDamage), "CHECKBOX",
    [LSTRING(carDamage_setting_enable), LSTRING(carDamage_setting_description)],
    LSTRING(category_displayName),
    false, // default value
    true, // isGlobal
    {[QGVAR(enableCarDamage), _this] call EFUNC(common,cbaSettings_settingChanged)},
    true // Needs mission restart
] call CBA_settings_fnc_init;
