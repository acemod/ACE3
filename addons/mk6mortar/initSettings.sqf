// CBA Settings [ADDON: ace_mk6mortar]:
// These settings effect gameplay difficutly:  defaults will leave the mortar the same as vanilla

private _category = [format ["ACE %1", localize "str_a3_cfgmarkers_nato_art"], localize LSTRING(DisplayName)];

[
    QGVAR(airResistanceEnabled), "CHECKBOX",
    [LSTRING(airResistanceEnabled_DisplayName), LSTRING(airResistanceEnabled_Description)],
    _category,
    false, // default value
    true, // isGlobal
    {[QGVAR(airResistanceEnabled), _this] call EFUNC(common,cbaSettings_settingChanged)},
    true // Needs mission restart
] call CBA_settings_fnc_init;

[
    QGVAR(allowComputerRangefinder), "CHECKBOX",
    [LSTRING(allowComputerRangefinder_DisplayName), LSTRING(allowComputerRangefinder_Description)],
    _category,
    true, // default value
    true, // isGlobal
    {[QGVAR(allowComputerRangefinder), _this] call EFUNC(common,cbaSettings_settingChanged)},
    true // Needs mission restart
] call CBA_settings_fnc_init;

[
    QGVAR(allowCompass), "CHECKBOX",
    [LSTRING(allowCompass_DisplayName), LSTRING(allowCompass_Description)],
    _category,
    true, // default value
    true, // isGlobal
    {[QGVAR(allowCompass), _this] call EFUNC(common,cbaSettings_settingChanged)},
    true // Needs mission restart
] call CBA_settings_fnc_init;

[
    QGVAR(useAmmoHandling), "CHECKBOX",
    [LSTRING(useAmmoHandling_DisplayName), LSTRING(useAmmoHandling_Description)],
    _category,
    false, // default value
    true, // isGlobal
    {[QGVAR(useAmmoHandling), _this] call EFUNC(common,cbaSettings_settingChanged)},
    true // Needs mission restart
] call CBA_settings_fnc_init;
