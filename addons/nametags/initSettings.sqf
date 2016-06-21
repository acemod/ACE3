
[
    QGVAR(ShowNameTags),
    "LIST",
    [LSTRING(ShowNameTags), LSTRING(ShowNameTags_Desc)],
    LSTRING(Module_DisplayName),
    [
        nil,
        [ELSTRING(common,Disabled), ELSTRING(common,Enabled), LSTRING(OnlyCursor), LSTRING(OnlyKeypress), LSTRING(OnlyCursorAndKeypress)],
        1
    ],
    FUNC(updateSettings)
] call CBA_Settings_fnc_init;

[
    QGVAR(defaultNametagColor),
    "COLOR",
    LSTRING(DefaultNametagColor),
    LSTRING(Module_DisplayName),
    [0.77, 0.51, 0.08, 1]
] call CBA_Settings_fnc_init;

[
    QGVAR(ShowRanks),
    "CHECKBOX",
    LSTRING(ShowRanks),
    LSTRING(Module_DisplayName),
    true
] call CBA_Settings_fnc_init;

[
    QGVAR(showVehicleCrewInfo),
    "CHECKBOX",
    LSTRING(ShowVehicleCrewInfo),
    LSTRING(Module_DisplayName),
    true
] call CBA_Settings_fnc_init;

[
    QGVAR(showNamesForAI),
    "CHECKBOX",
    LSTRING(ShowNamesForAI),
    LSTRING(Module_DisplayName),
    false
] call CBA_Settings_fnc_init;

[
    QGVAR(showSoundWaves),
    "LIST",
    [LSTRING(ShowSoundWaves), LSTRING(ShowSoundWaves_Desc)],
    LSTRING(Module_DisplayName),
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
    LSTRING(Module_DisplayName),
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
    LSTRING(Module_DisplayName),
    false,
    nil,
    true
] call CBA_Settings_fnc_init;

[
    QGVAR(ViewDistance),
    "SLIDER",
    nil,
    LSTRING(Module_DisplayName),
    [0, 50, 5, 0],
    nil,
    true
] call CBA_Settings_fnc_init;

[
    QGVAR(playerNamesMaxAlpha),
    "SLIDER",
    nil,
    LSTRING(Module_DisplayName),
    [0.00, 1.00, 0.80, 2],
    nil,
    true
] call CBA_Settings_fnc_init;
