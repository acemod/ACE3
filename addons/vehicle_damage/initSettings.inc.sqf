[
    QGVAR(enabled),
    "CHECKBOX",
    [ELSTRING(common,Enabled), LSTRING(setting_description)],
    LSTRING(category_displayName),
    false,
    1,
    {[QGVAR(enabled), _this] call EFUNC(common,cbaSettings_settingChanged)},
    true // Needs mission restart
] call CBA_fnc_addSetting;

[
    QGVAR(enableCarDamage),
    "CHECKBOX",
    [LSTRING(carDamage_setting_enable), LSTRING(carDamage_setting_description)],
    LSTRING(category_displayName),
    false,
    1,
    {[QGVAR(enableCarDamage), _this] call EFUNC(common,cbaSettings_settingChanged)},
    true // Needs mission restart
] call CBA_fnc_addSetting;
