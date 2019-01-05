// CBA Settings [ADDON: ace_rearm]:

[
    QGVAR(level), "LIST",
    [LSTRING(RearmSettings_level_DisplayName), LSTRING(RearmSettings_level_Description)],
    [localize ELSTRING(OptionsMenu,CategoryLogistics), localize LSTRING(DisplayName)],
    [[0,1,2],[LSTRING(RearmSettings_vehicle), LSTRING(RearmSettings_magazine), LSTRING(RearmSettings_caliber)],0], // [values, titles, defaultIndex]
    true, // isGlobal
    {[QGVAR(level), _this] call EFUNC(common,cbaSettings_settingChanged)}
] call CBA_settings_fnc_init;

[
    QGVAR(supply), "LIST",
    [LSTRING(RearmSettings_supply_DisplayName), LSTRING(RearmSettings_supply_Description)],
    [localize ELSTRING(OptionsMenu,CategoryLogistics), localize LSTRING(DisplayName)],
    [[0,1,2],[LSTRING(RearmSettings_unlimited), LSTRING(RearmSettings_limited), LSTRING(RearmSettings_magazineSupply)],0], // [values, titles, defaultIndex]
    true, // isGlobal
    {[QGVAR(supply), _this] call EFUNC(common,cbaSettings_settingChanged)}
] call CBA_settings_fnc_init;
