private _category = localize LSTRING(ACEKeybindCategoryCommon);

[
    QGVAR(checkPBOsAction),
    "LIST",
    [LSTRING(CheckPBOsAction), LSTRING(CheckPBOsActionDesc)],
    _category,
    [[0, 1, 2], [LSTRING(CheckPBO_Action_WarnOnce), LSTRING(CheckPBO_Action_WarnPerm), LSTRING(CheckPBO_Action_Kick)], 0],
    1
] call CBA_fnc_addSetting;

[
    QGVAR(checkPBOsCheckAll),
    "CHECKBOX",
    [LSTRING(CheckPBOsCheckAll), LSTRING(CheckPBOsCheckAllDesc)],
    _category,
    false,
    1
] call CBA_fnc_addSetting;

[
    QGVAR(checkPBOsWhitelist),
    "EDITBOX",
    [LSTRING(CheckPBOsWhitelist), LSTRING(CheckPBOsWhiteListDesc)],
    _category,
    "[]",
    1
] call CBA_fnc_addSetting;

[
    QGVAR(settingFeedbackIcons),
    "LIST",
    [LSTRING(SettingFeedbackIconsName), LSTRING(SettingFeedbackIconsDesc)],
    _category,
    [[0, 1, 2, 3, 4], [ELSTRING(optionsmenu,Hide), ELSTRING(optionsmenu,TopRightDown), ELSTRING(optionsmenu,TopRightLeft), ELSTRING(optionsmenu,TopLeftDown), ELSTRING(optionsmenu,TopLeftRight)], 1],
    0
] call CBA_fnc_addSetting;

[
    QGVAR(settingProgressBarLocation),
    "LIST",
    [LSTRING(SettingProgressBarLocationName), LSTRING(SettingProgressBarLocationDesc)],
    _category,
    [[0, 1], [ELSTRING(optionsmenu,Top), ELSTRING(optionsmenu,Bottom)], 0],
    0
] call CBA_fnc_addSetting;

[
    QGVAR(displayTextColor),
    "COLOR",
    [LSTRING(SettingDisplayTextColorName),LSTRING(SettingDisplayTextColorDesc)],
    _category,
    [0, 0, 0, 0.1],
    0
] call CBA_fnc_addSetting;

[
    QGVAR(displayTextFontColor),
    "COLOR",
    [LSTRING(SettingDisplayTextFontColorName),LSTRING(SettingDisplayTextFontColorDesc)],
    _category,
    [1, 1, 1, 1],
    0
] call CBA_fnc_addSetting;

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
    _category,
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
