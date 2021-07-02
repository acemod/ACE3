[
    QGVAR(enabled), "CHECKBOX",
    [LSTRING(setting_enable), LSTRING(setting_description)],
    LSTRING(category_displayName),
    true, // default value
    true, // isGlobal
    {[QGVAR(enabled), _this] call EFUNC(common,cbaSettings_settingChanged)},
    true // Needs mission restart
] call CBA_settings_fnc_init;

[
    QGVAR(removeAmmoDuringCookoff), "CHECKBOX",
    [LSTRING(removeAmmoAfterCookoff_setting_enable), LSTRING(removeAmmoAfterCookoff_setting_description)],
    LSTRING(category_displayName),
    true, // default value
    true, // isGlobal
    {[QGVAR(removeAmmoDuringCookoff), _this] call EFUNC(common,cbaSettings_settingChanged)},
    false // Needs mission restart
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
