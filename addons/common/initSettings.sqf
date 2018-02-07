[
    QGVAR(persistentLaserEnabled),
    "CHECKBOX",
    [LSTRING(SettingPersistentLaserName), LSTRING(SettingPersistentLaserDesc)],
    localize LSTRING(ACEKeybindCategoryWeapons),
    false,
    false,
    LINKFUNC(switchPersistentLaser)
] call CBA_settings_fnc_init;

[
    QGVAR(allowFadeMusic),
    "CHECKBOX",
    [LSTRING(AllowFadeMusic), LSTRING(AllowFadeMusicTooltip)],
    localize LSTRING(ACEKeybindCategoryCommon),
    true,
    true
] call CBA_settings_fnc_init;
