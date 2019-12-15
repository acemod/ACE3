[
    QGVAR(showClearGlasses),
    "CHECKBOX",
    [LSTRING(SettingShowClearGlasses), LSTRING(SettingShowClearGlasses)],
    localize LSTRING(SettingsName),
    false, // default value
    0 // isGlobal
] call CBA_fnc_addSetting;
