// CBA Settings [ADDON: ace_fastroping]:

[
    QGVAR(requireRopeItems), "CHECKBOX",
    [LSTRING(setting_requireRopeItems_displayName)],
    ["ACE Uncategorized", QUOTE(COMPONENT_BEAUTIFIED)],
    false, // default value
    true, // isGlobal
    {[QGVAR(requireRopeItems), _this] call EFUNC(common,cbaSettings_settingChanged)},
    false // needRestart
] call CBA_settings_fnc_init;
