// CBA Settings [ADDON: ace_csw]:

private _categroyDisplayName = format ["ACE %1", localize LSTRING(DisplayName)];

[
    QGVAR(defaultAssemblyMode), "CHECKBOX",
    [LSTRING(defaultAssemblyMode_displayName)],
    _categroyDisplayName,
    false, // default value
    true, // isGlobal
    {[QGVAR(defaultAssemblyMode), _this] call EFUNC(common,cbaSettings_settingChanged)},
    true // Needs mission restart
] call CBA_settings_fnc_init;

[
    QGVAR(handleExtraMagazines), "CHECKBOX",
    [LSTRING(handleExtraMagazines_displayName)],
    _categroyDisplayName,
    true, // default value
    true, // isGlobal
    {[QGVAR(handleExtraMagazines), _this] call EFUNC(common,cbaSettings_settingChanged)},
    true // Needs mission restart
] call CBA_settings_fnc_init;

[
    QGVAR(ammoHandling), "CHECKBOX",
    [LSTRING(ammoHandling_displayName)],
    _categroyDisplayName,
    true, // default value
    true, // isGlobal
    {[QGVAR(ammoHandling), _this] call EFUNC(common,cbaSettings_settingChanged)},
    true // Needs mission restart
] call CBA_settings_fnc_init;

