
[
    QGVAR(showNameTags),
    "LIST",
    [LSTRING(ShowNameTags), LSTRING(ShowNameTags_Desc)],
    LSTRING(SettingsCategory),
    [
        nil,
        [ELSTRING(common,Disabled), ELSTRING(common,Enabled), LSTRING(OnlyCursor), LSTRING(OnlyKeypress), LSTRING(OnlyCursorAndKeypress)],
        1
    ],
    false,
    FUNC(updateSettings)
] call CBA_Settings_fnc_init;

[
    QGVAR(defaultNametagColor),
    "COLOR",
    LSTRING(DefaultNametagColor),
    LSTRING(SettingsCategory),
    [0.77, 0.51, 0.08, 1]
] call CBA_Settings_fnc_init;

[
    QGVAR(showRanks),
    "CHECKBOX",
    LSTRING(ShowRanks),
    LSTRING(SettingsCategory),
    true
] call CBA_Settings_fnc_init;

[
    QGVAR(ShowCrewInfo),
    "CHECKBOX",
    LSTRING(ShowCrewInfo),
    LSTRING(SettingsCategory),
    true
] call CBA_Settings_fnc_init;

[
    QGVAR(showNamesForAI),
    "CHECKBOX",
    LSTRING(ShowNamesForAI),
    LSTRING(SettingsCategory),
    false
] call CBA_Settings_fnc_init;

[
    QGVAR(showSoundWaves),
    "LIST",
    [LSTRING(ShowSoundWaves), LSTRING(ShowSoundWaves_Desc)],
    LSTRING(SettingsCategory),
    [
        nil,
        [ELSTRING(common,Disabled), LSTRING(NameTagSettings), LSTRING(AlwaysShowAll)],
        1
    ]
] call CBA_Settings_fnc_init;

[
    QGVAR(tagSize),
    "LIST",
    [LSTRING(TagSize_Name), LSTRING(TagSize_Description)],
    LSTRING(SettingsCategory),
    [
        nil,
        ["str_very_small", "str_small", "str_medium", "str_large", "str_very_large"],
        2
    ]
] call CBA_Settings_fnc_init;

[
    QGVAR(showCursorTagForVehicles),
    "CHECKBOX",
    nil,
    LSTRING(SettingsCategory),
    false,
    true
] call CBA_Settings_fnc_init;

[
    QGVAR(viewDistance),
    "SLIDER",
    nil,
    LSTRING(SettingsCategory),
    [0, 50, 5, 0],
    true
] call CBA_Settings_fnc_init;

[
    QGVAR(namesMaxAlpha),
    "SLIDER",
    nil,
    LSTRING(SettingsCategory),
    [0.00, 1.00, 0.80, 2],
    true
] call CBA_Settings_fnc_init;
