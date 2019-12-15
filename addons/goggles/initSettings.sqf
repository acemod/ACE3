[
    QGVAR(showClearGlasses),
    "CHECKBOX",
    [LSTRING(SettingShowClearGlasses), LSTRING(SettingShowClearGlasses)],
    localize LSTRING(DisplayName),
    false, // default value
    2 // isGlobal
] call CBA_fnc_addSetting;
