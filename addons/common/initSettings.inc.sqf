private _category = format ["ACE %1", LLSTRING(DisplayName)];
private _categoryColors = [_category, LSTRING(subcategory_colors)];
private _categorySway = [_category, LSTRING(subcategory_sway)];

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
    [[0, 1, 2, 3, 4], [LSTRING(Hide), LSTRING(TopRightDown), LSTRING(TopRightLeft), LSTRING(TopLeftDown), LSTRING(TopLeftRight)], 1],
    0
] call CBA_fnc_addSetting;

[
    QGVAR(settingProgressBarLocation),
    "LIST",
    [LSTRING(SettingProgressBarLocationName), LSTRING(SettingProgressBarLocationDesc)],
    _category,
    [[0, 1], [LSTRING(Top), LSTRING(Bottom)], 0],
    0
] call CBA_fnc_addSetting;

[
    QGVAR(displayTextColor),
    "COLOR",
    [LSTRING(SettingDisplayTextColorName),LSTRING(SettingDisplayTextColorDesc)],
    _categoryColors,
    [0, 0, 0, 0.1],
    0
] call CBA_fnc_addSetting;

[
    QGVAR(displayTextFontColor),
    "COLOR",
    [LSTRING(SettingDisplayTextFontColorName),LSTRING(SettingDisplayTextFontColorDesc)],
    _categoryColors,
    [1, 1, 1, 1],
    0
] call CBA_fnc_addSetting;

[
    QGVAR(persistentLaserEnabled),
    "CHECKBOX",
    [LSTRING(SettingPersistentLaserName), LSTRING(SettingPersistentLaserDesc)],
    LSTRING(ACEKeybindCategoryWeapons),
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
    _category,
    false,
    2
] call CBA_fnc_addSetting;

[
    QGVAR(progressBarInfo),
    "LIST",
    [LSTRING(progressBarInfoName), LSTRING(progressBarInfoDesc)],
    _category,
    [[0, 1, 2], [LSTRING(None), LSTRING(progressBarInfoPercentage), LSTRING(progressBarInfoTime)], 2],
    0
] call CBA_fnc_addSetting;

[
    QGVAR(enableSway),
    "CHECKBOX",
    [LSTRING(enableSway), LSTRING(enableSway_Description)],
    _categorySway,
    true,
    1,
    {},
    true
] call CBA_fnc_addSetting;

[
    QGVAR(swayFactor),
    "SLIDER",
    [LSTRING(SwayFactor), LSTRING(SwayFactor_Description)],
    _categorySway,
    [0, 5, 1, 2],
    1
] call CBA_fnc_addSetting;

[
    QGVAR(restedSwayFactor),
    "SLIDER",
    [LSTRING(RestedSwayFactor), LSTRING(RestedSwayFactor_Description)],
    _categorySway,
    [0, 5, 1, 2],
    1
] call CBA_fnc_addSetting;

[
    QGVAR(deployedSwayFactor),
    "SLIDER",
    [LSTRING(DeployedSwayFactor), LSTRING(DeployedSwayFactor_Description)],
    _categorySway,
    [0, 5, 1, 2],
    1
] call CBA_fnc_addSetting;
