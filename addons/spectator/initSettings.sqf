[
    QGVAR(enableAI),
    "CHECKBOX",
    [LSTRING(ai_DisplayName), LSTRING(ai_Description)],
    LSTRING(Settings_DisplayName),
    false,
    true
] call CBA_settings_fnc_init;

[
    QGVAR(restrictModes),
    "LIST",
    [LSTRING(modes_DisplayName), LSTRING(modes_Description)],
    LSTRING(Settings_DisplayName),
    [[0, 1, 2, 3, 4], [LSTRING(modes_all), LSTRING(modes_unit), "STR_A3_Spectator_free_camera_tooltip", "STR_A3_Spectator_1pp_camera_tooltip", "STR_A3_Spectator_3pp_camera_tooltip"], 0],
    true,
    {},
    true
] call CBA_settings_fnc_init;

[
    QGVAR(restrictVisions),
    "LIST",
    [LSTRING(visions_DisplayName), LSTRING(visions_Description)],
    LSTRING(Settings_DisplayName),
    [[0, 1, 2, 3], [LSTRING(modes_all), LSTRING(visions_nv), LSTRING(visions_ti), "STR_Special_None"], 0],
    true,
    {},
    true
] call CBA_settings_fnc_init;

[
    QGVAR(maxFollowDistance),
    "SLIDER",
    [LSTRING(MaxFollowDistance_DisplayName), LSTRING(MaxFollowDistance_Description)],
    LSTRING(Settings_DisplayName),
    [5, 25, 5, 1],
    false
] call CBA_settings_fnc_init;
