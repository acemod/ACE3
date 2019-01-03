// CBA Settings [ADDON: ace_nametags]:

[
    QGVAR(defaultNametagColor), "COLOR",
    [LSTRING(DefaultNametagColor)],
    [format ["ACE %1", localize LSTRING(Module_DisplayName)], localize "str_a3_rscdisplaygameoptions_buttongui"],
    [0.77, 0.51, 0.08, 1],
    false, // isGlobal
    {[QGVAR(defaultNametagColor), _this] call EFUNC(common,cbaSettings_settingChanged)}
] call CBA_settings_fnc_init;

[
    QGVAR(nametagColorMain), "COLOR",
    ["str_team_main"],
    [format ["ACE %1", localize LSTRING(Module_DisplayName)], localize "str_a3_rscdisplaygameoptions_buttongui"],
    [1.00, 1.00, 1.00, 1],
    false, // isGlobal
    {[QGVAR(nametagColorMain), _this] call EFUNC(common,cbaSettings_settingChanged)}
] call CBA_settings_fnc_init;

[
    QGVAR(nametagColorRed), "COLOR",
    ["str_team_red"],
    [format ["ACE %1", localize LSTRING(Module_DisplayName)], localize "str_a3_rscdisplaygameoptions_buttongui"],
    [1.00, 0.67, 0.67, 1],
    false, // isGlobal
    {[QGVAR(nametagColorRed), _this] call EFUNC(common,cbaSettings_settingChanged)}
] call CBA_settings_fnc_init;

[
    QGVAR(nametagColorGreen), "COLOR",
    ["str_team_green"],
    [format ["ACE %1", localize LSTRING(Module_DisplayName)], localize "str_a3_rscdisplaygameoptions_buttongui"],
    [0.67, 1.00, 0.67, 1],
    false, // isGlobal
    {[QGVAR(nametagColorGreen), _this] call EFUNC(common,cbaSettings_settingChanged)}
] call CBA_settings_fnc_init;

[
    QGVAR(nametagColorBlue), "COLOR",
    ["str_team_blue"],
    [format ["ACE %1", localize LSTRING(Module_DisplayName)], localize "str_a3_rscdisplaygameoptions_buttongui"],
    [0.67, 0.67, 1.00, 1],
    false, // isGlobal
    {[QGVAR(nametagColorBlue), _this] call EFUNC(common,cbaSettings_settingChanged)}
] call CBA_settings_fnc_init;

[
    QGVAR(nametagColorYellow),
    "COLOR",
    ["str_team_yellow"],
    [format ["ACE %1", localize LSTRING(Module_DisplayName)], localize "str_a3_rscdisplaygameoptions_buttongui"],
    [1.00, 1.00, 0.67, 1],
    false, // isGlobal
    {[QGVAR(nametagColorYellow), _this] call EFUNC(common,cbaSettings_settingChanged)}
] call CBA_settings_fnc_init;
