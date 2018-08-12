// CBA Settings [ADDON: ace_csw]:

[
    QGVAR(defaultAssemblyMode), "CHECKBOX",
    ["defaultAssemblyMode"],
    format ["ACE %1", localize LSTRING(DisplayName)],
    false, // default value
    true, // isGlobal
    {[QGVAR(defaultAssemblyMode), _this] call EFUNC(common,cbaSettings_settingChanged)}
] call CBA_settings_fnc_init;

[
    QGVAR(handleExtraMagazines), "CHECKBOX",
    ["handleExtraMagazines"],
    format ["ACE %1", localize LSTRING(DisplayName)],
    true, // default value
    true, // isGlobal
    {[QGVAR(handleExtraMagazines), _this] call EFUNC(common,cbaSettings_settingChanged)}
] call CBA_settings_fnc_init;

[
    QGVAR(ammoHandling), "CHECKBOX",
    ["ammoHandling"],
    format ["ACE %1", localize LSTRING(DisplayName)],
    true, // default value
    true, // isGlobal
    {[QGVAR(ammoHandling), _this] call EFUNC(common,cbaSettings_settingChanged)}
] call CBA_settings_fnc_init;

