// CBA Settings [ADDON: ace_nametags]:

[
    QGVAR(showPlayerNames), "LIST",
    [LSTRING(ShowPlayerNames), LSTRING(ShowPlayerNames_Desc)],
    format ["ACE %1", localize LSTRING(Module_DisplayName)],
    [[0, 1, 2, 3, 4, 5], [ELSTRING(common,Disabled), ELSTRING(common,Enabled), LSTRING(OnlyCursor), LSTRING(OnlyKeypress), LSTRING(OnlyCursorAndKeypress), LSTRING(FadeOnBorder)], 1],
    0
] call CBA_fnc_addSetting;

[
    QGVAR(showPlayerRanks), "CHECKBOX",
    LSTRING(ShowPlayerRanks),
    format ["ACE %1", localize LSTRING(Module_DisplayName)],
    true,
    0
] call CBA_fnc_addSetting;

[
    QGVAR(showVehicleCrewInfo), "CHECKBOX",
    [LSTRING(ShowVehicleCrewInfo), LSTRING(ShowVehicleCrewInfo_Desc)],
    format ["ACE %1", localize LSTRING(Module_DisplayName)],
    true,
    0
] call CBA_fnc_addSetting;

[
    QGVAR(showNamesForAI), "CHECKBOX",
    [LSTRING(ShowNamesForAI), LSTRING(ShowNamesForAI_Desc)],
    format ["ACE %1", localize LSTRING(Module_DisplayName)],
    false,
    0
] call CBA_fnc_addSetting;

[
    QGVAR(showCursorTagForVehicles), "CHECKBOX",
    [LSTRING(showCursorTagForVehicles_DisplayName), LSTRING(showCursorTagForVehicles_Description)],
    format ["ACE %1", localize LSTRING(Module_DisplayName)],
    false,
    1
] call CBA_fnc_addSetting;

[
    QGVAR(showSoundWaves), "LIST",
    [LSTRING(ShowSoundWaves), LSTRING(ShowSoundWaves_Desc)],
    format ["ACE %1", localize LSTRING(Module_DisplayName)],
    [[0, 1, 2], [ELSTRING(common,Disabled), LSTRING(NameTagSettings), LSTRING(AlwaysShowAll)], 1],
    0
] call CBA_fnc_addSetting;

[
    QGVAR(playerNamesViewDistance), "SLIDER",
    [LSTRING(PlayerNamesViewDistance_DisplayName), LSTRING(PlayerNamesViewDistance_Description)],
    format ["ACE %1", localize LSTRING(Module_DisplayName)],
    [0, 50, 5, 1],
    1
] call CBA_fnc_addSetting;

[
    QGVAR(playerNamesMaxAlpha), "SLIDER",
    LSTRING(playerNamesMaxAlpha),
    format ["ACE %1", localize LSTRING(Module_DisplayName)],
    [0, 1, 0.8, 2],
    1
] call CBA_fnc_addSetting;

[
    QGVAR(tagSize), "LIST",
    [LSTRING(TagSize_Name), LSTRING(TagSize_Description)],
    format ["ACE %1", localize LSTRING(Module_DisplayName)],
    [[0, 1, 2, 3, 4], ["str_very_small", "str_small", "str_medium", "str_large", "str_very_large"], 1],
    0
] call CBA_fnc_addSetting;

[
    QGVAR(defaultNametagColor), "COLOR",
    [LSTRING(DefaultNametagColor)],
    [format ["ACE %1", localize LSTRING(Module_DisplayName)], localize "str_a3_rscdisplaygameoptions_buttongui"],
    [0.77, 0.51, 0.08, 1],
    false // isGlobal
] call CBA_fnc_addSetting;

[
    QGVAR(nametagColorMain), "COLOR",
    ["str_team_main"],
    [format ["ACE %1", localize LSTRING(Module_DisplayName)], localize "str_a3_rscdisplaygameoptions_buttongui"],
    [1.00, 1.00, 1.00, 1],
    false // isGlobal
] call CBA_fnc_addSetting;

[
    QGVAR(nametagColorRed), "COLOR",
    ["str_team_red"],
    [format ["ACE %1", localize LSTRING(Module_DisplayName)], localize "str_a3_rscdisplaygameoptions_buttongui"],
    [1.00, 0.67, 0.67, 1],
    false // isGlobal
] call CBA_fnc_addSetting;

[
    QGVAR(nametagColorGreen), "COLOR",
    ["str_team_green"],
    [format ["ACE %1", localize LSTRING(Module_DisplayName)], localize "str_a3_rscdisplaygameoptions_buttongui"],
    [0.67, 1.00, 0.67, 1],
    false // isGlobal
] call CBA_fnc_addSetting;

[
    QGVAR(nametagColorBlue), "COLOR",
    ["str_team_blue"],
    [format ["ACE %1", localize LSTRING(Module_DisplayName)], localize "str_a3_rscdisplaygameoptions_buttongui"],
    [0.67, 0.67, 1.00, 1],
    false // isGlobal
] call CBA_fnc_addSetting;

[
    QGVAR(nametagColorYellow),
    "COLOR",
    ["str_team_yellow"],
    [format ["ACE %1", localize LSTRING(Module_DisplayName)], localize "str_a3_rscdisplaygameoptions_buttongui"],
    [1.00, 1.00, 0.67, 1],
    false // isGlobal
] call CBA_fnc_addSetting;

[
    QGVAR(ambientBrightnessAffectViewDist),
    "SLIDER",
    [LSTRING(AmbientBrightnessAffectsViewDist_DisplayName), LSTRING(AmbientBrightnessAffectsViewDist_Description)],
    format ["ACE %1", localize LSTRING(Module_DisplayName)],
    [0, 1, 1, 0, true],
    true
] call CBA_fnc_addSetting;
