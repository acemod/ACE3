// CBA Settings [ADDON: ace_fastroping]:

private _category = ["ACE Uncategorized", LLSTRING(setting_categoryMenu_displayName)];

[
    QGVAR(requireRopeItems), "CHECKBOX",
    [LSTRING(setting_requireRopeItems_displayName)],
    _category,
    false, // default value
    true, // isGlobal
    {[QGVAR(requireRopeItems), _this] call EFUNC(common,cbaSettings_settingChanged)},
    false // needRestart
] call CBA_settings_fnc_init;
