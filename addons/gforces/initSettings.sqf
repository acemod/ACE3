
[
    QGVAR(enabledFor),
    "LIST",
    [LLSTRING(enabledFor_displayName)],
    LLSTRING(Category),
    [[0, 1, 2], [LELSTRING(Common,Disabled), LLSTRING(enabledFor_onlyAircraft), LELSTRING(Common,Enabled)], 1],
    true,
    {[QGVAR(enabledFor), _this] call EFUNC(common,cbaSettings_settingChanged)},
    true // Needs mission restart
] call CBA_fnc_addSetting;
