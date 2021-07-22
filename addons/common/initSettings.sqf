[
    QGVAR(persistentLaserEnabled),
    "CHECKBOX",
    [LSTRING(SettingPersistentLaserName), LSTRING(SettingPersistentLaserDesc)],
    localize LSTRING(ACEKeybindCategoryWeapons),
    false,
    false,
    LINKFUNC(switchPersistentLaser)
] call CBA_fnc_addSetting;

[
    QGVAR(allowFadeMusic),
    "CHECKBOX",
    [LSTRING(AllowFadeMusic), LSTRING(AllowFadeMusicTooltip)],
    format ["ACE %1", localize LSTRING(DisplayName)],
    true,
    true
] call CBA_fnc_addSetting;
