[
    QGVAR(convertExplosives),
    "CHECKBOX",
    [LSTRING(convertExplosives_DisplayName), LSTRING(convertExplosives_Description)],
    LSTRING(Settings_DisplayName),
    true,
    1,
    {[QGVAR(convertExplosives), _this] call EFUNC(common,cbaSettings_settingChanged)},
    true // Needs mission restart
] call CBA_fnc_addSetting;
