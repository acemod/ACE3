[
    QGVAR(enabledFor),
    "LIST",
    [LSTRING(EnabledFor_DisplayName), LSTRING(EnabledFor_Description)],
    ELSTRING(medical,Category),
    [[0, 1, 2], [ELSTRING(Common,Disabled), LSTRING(OnlyPlayers), ELSTRING(Common,Enabled)], 2],
    true,
    {[QGVAR(enabledFor), _this] call EFUNC(common,cbaSettings_settingChanged)},
    true
] call CBA_settings_fnc_init;
