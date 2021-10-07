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

[
    QGVAR(settingProgressBarInfo),
    "LIST",
    [LSTRING(SettingProgressBarInfoName), LSTRING(SettingProgressBarInfoDesc)],
    format ["ACE %1", localize LSTRING(DisplayName)],
    [[0, 1, 2], [LSTRING(None), LSTRING(SettingProgressbarInfoPercentage), LSTRING(SettingProgressbarInfoTime)], 2],
    0
] call CBA_fnc_addSetting;
