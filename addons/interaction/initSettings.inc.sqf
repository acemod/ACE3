[
    QGVAR(enableTeamManagement), "CHECKBOX",
    [LSTRING(EnableTeamManagement_DisplayName), LSTRING(EnableTeamManagement_Description)],
    format ["ACE %1", LLSTRING(DisplayName)],
    true,
    true
] call CBA_fnc_addSetting;

[
    QGVAR(remoteTeamManagement), "CHECKBOX",
    [LSTRING(remoteTeamManagement_DisplayName), LSTRING(remoteTeamManagement_Description)],
    format ["ACE %1", LLSTRING(DisplayName)],
    true,
    true
] call CBA_fnc_addSetting;

[
    QGVAR(enableMagazinePassing), "CHECKBOX",
    LSTRING(PassMagazineSetting),
    format ["ACE %1", LLSTRING(DisplayName)],
    true
] call CBA_fnc_addSetting;

[
    QGVAR(enableThrowablePassing), "CHECKBOX",
    LSTRING(PassThrowableSetting),
    format ["ACE %1", LLSTRING(DisplayName)],
    true
] call CBA_fnc_addSetting;

[
    QGVAR(disableNegativeRating), "CHECKBOX",
    [LSTRING(DisableNegativeRating_DisplayName), LSTRING(DisableNegativeRating_Description)],
    format ["ACE %1", LLSTRING(DisplayName)],
    false,
    true,
    {[QGVAR(disableNegativeRating), _this] call EFUNC(common,cbaSettings_settingChanged)},
    true // Needs mission restart
] call CBA_fnc_addSetting;

[
    QGVAR(enableWeaponAttachments), "CHECKBOX",
    ["str_a3_cfgeditorcategories_edcat_weaponattachments0", LSTRING(weaponAttachments_Description)],
    format ["ACE %1", LLSTRING(DisplayName)],
    true
] call CBA_fnc_addSetting;

[
    QGVAR(enableGroupRenaming), "CHECKBOX",
    [LSTRING(EnableRenameGroup_DisplayName), LSTRING(EnableRenameGroup_Description)],
    format ["ACE %1", LLSTRING(DisplayName)],
    true,
    true
] call CBA_fnc_addSetting;

[
    QGVAR(enableAnimActions), "CHECKBOX",
    LSTRING(SettingAnimActionsName),
    format ["ACE %1", LLSTRING(DisplayName)],
    true,
    true,
    {[QGVAR(enableAnimActions), _this] call EFUNC(common,cbaSettings_settingChanged)},
    true // Needs mission restart
] call CBA_fnc_addSetting;

[
    QGVAR(interactWithTerrainObjects), "CHECKBOX",
    ["str_a3_modules_moduleomquest_defend_f_attributes_useterrainobject0", LSTRING(interactWithTerrainObjects_Description)],
    format ["ACE %1", LLSTRING(DisplayName)],
    false,
    true
] call CBA_fnc_addSetting;

[
    QGVAR(interactWithEnemyCrew), "LIST",
    [LSTRING(interactWithEnemyCrew_DisplayName), LSTRING(interactWithEnemyCrew_Description)],
    format ["ACE %1", LLSTRING(DisplayName)],
    [[0, 1, 2], [ELSTRING(common,Never), LSTRING(interactWithEnemyCrew_allowCSW), ELSTRING(common,Always)], 0],
    true
] call CBA_fnc_addSetting;
