[
    QGVAR(enabled),
    "CHECKBOX",
    [ELSTRING(common,Enabled), LSTRING(Setting_Description)],
    LSTRING(Category_DisplayName),
    true,
    1,
    {[QGVAR(enabled), _this] call EFUNC(common,cbaSettings_settingChanged)},
    true // Needs mission restart
] call CBA_fnc_addSetting;

[
    QGVAR(enableFlare),
    "CHECKBOX",
    [LSTRING(Setting_FlareEnable), LSTRING(Setting_FlareDescription)],
    LSTRING(Category_DisplayName),
    false,
    1
] call CBA_fnc_addSetting;

[
    QGVAR(dropWeapon),
    "LIST",
    [LSTRING(Setting_DropWeapon), LSTRING(Setting_DropWeapon_Description)],
    LSTRING(Category_DisplayName),
    [
        [0, 1, 2],
        ["STR_A3_OPTIONS_DISABLED", ELSTRING(common,aiOnly), ELSTRING(common,playersAndAI)],
        1
    ],
    1
] call CBA_fnc_addSetting;

[
    QGVAR(enableScreams),
    "CHECKBOX",
    [LSTRING(Setting_EnableScreams), LSTRING(Setting_EnableScreams_Description)],
    LSTRING(Category_DisplayName),
    true,
    2
] call CBA_fnc_addSetting;
