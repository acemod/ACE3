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
    QGVAR(epilepsyFriendlyMode),
    "CHECKBOX",
    [LSTRING(EpilepsyFriendlyMode), LSTRING(EpilepsyFriendlyModeTooltip)],
    format ["ACE %1", localize LSTRING(DisplayName)],
    false,
    2
] call CBA_fnc_addSetting;

[
    QGVAR(progressBarInfo),
    "LIST",
    [LSTRING(progressBarInfoName), LSTRING(progressBarInfoDesc)],
    format ["ACE %1", localize LSTRING(DisplayName)],
    [[0, 1, 2], [LSTRING(None), LSTRING(progressBarInfoPercentage), LSTRING(progressBarInfoTime)], 2],
    0
] call CBA_fnc_addSetting;
