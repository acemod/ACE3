
[
    QGVAR(enabled),
    "CHECKBOX",
    [LSTRING(EnableFrag), LSTRING(EnableFrag_Desc)],
    LSTRING(SettingsCategory),
    true,
    FUNC(toggleSetting),
    true
] call CBA_Settings_fnc_init;

[
    QGVAR(spallEnabled),
    "CHECKBOX",
    [LSTRING(EnableSpall), LSTRING(EnableSpall_Desc)],
    LSTRING(SettingsCategory),
    false,
    nil,
    true
] call CBA_Settings_fnc_init;

[
    QGVAR(reflectionsEnabled),
    "CHECKBOX",
    [LSTRING(EnableReflections), LSTRING(EnableReflections_Desc)],
    LSTRING(SettingsCategory),
    false,
    nil,
    true
] call CBA_Settings_fnc_init;

[
    QGVAR(maxTrack),
    "SLIDER",
    [LSTRING(MaxTrack), LSTRING(MaxTrack_Desc)],
    LSTRING(SettingsCategory),
    [0, 1000, 500, 0],
    nil,
    true
] call CBA_Settings_fnc_init;

[
    QGVAR(maxTrackPerFrame),
    "SLIDER",
    [LSTRING(MaxTrackPerFrame), LSTRING(MaxTrackPerFrame_Desc)],
    LSTRING(SettingsCategory),
    [0, 100, 50, 0],
    nil,
    true
] call CBA_Settings_fnc_init;

[
    QGVAR(enableDebugTrace),
    "CHECKBOX",
    [LSTRING(EnableDebugTrace), LSTRING(EnableDebugTrace_Desc)],
    LSTRING(SettingsCategory),
    false,
    nil,
    true
] call CBA_Settings_fnc_init;
