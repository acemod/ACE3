[
    QGVAR(enabled), "CHECKBOX",
    [LSTRING(setting_enable), LSTRING(setting_description)],
    LSTRING(category_displayName),
    false, // default value
    true, // isGlobal
    {[QGVAR(advancedVehicleDamageEnabled), _this] call EFUNC(common,cbaSettings_settingChanged)},
    true // Needs mission restart
] call CBA_settings_fnc_init;

[
    QGVAR(enableCarDamage), "CHECKBOX",
    [LSTRING(carDamage_setting_enable), LSTRING(carDamage_setting_description)],
    LSTRING(category_displayName),
    false, // default value
    true, // isGlobal
    {[QGVAR(advancedCarDamageEnabled), _this] call EFUNC(common,cbaSettings_settingChanged)},
    true // Needs mission restart
] call CBA_settings_fnc_init;

[
    QGVAR(enableEjectFromDestroyed), "CHECKBOX",
    [LSTRING(carDamage_setting_enable), LSTRING(carDamage_setting_description)],
    LSTRING(category_displayName),
    false, // default value
    true, // isGlobal
    {[QGVAR(advancedCarDamageEnabled), _this] call EFUNC(common,cbaSettings_settingChanged)},
    true // Needs mission restart
] call CBA_settings_fnc_init;

