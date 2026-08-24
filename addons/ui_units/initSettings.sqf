[
    QGVAR(landSpeed),
    "LIST",
    [localize LSTRING(Speed_DisplayName), localize LSTRING(Speed_Description)],
    [format["ACE %1", localize LSTRING(Module_DisplayName)], localize LSTRING(Land_DisplayName)],
    [[SPEED_KMH, SPEED_MPH, SPEED_KNOT, SPEED_MS], [LSTRING(Speed_KMH), LSTRING(Speed_MPH), LSTRING(Speed_KNOT), LSTRING(Speed_MS)], 0]
] call CBA_settings_fnc_init;

[
    QGVAR(seaSpeed),
    "LIST",
    [localize LSTRING(Speed_DisplayName), localize LSTRING(Speed_Description)],
    [format["ACE %1", localize LSTRING(Module_DisplayName)], localize "str_a3_rscdisplaygarage_tab_naval"],
    [[SPEED_KMH, SPEED_MPH, SPEED_KNOT, SPEED_MS], [LSTRING(Speed_KMH), LSTRING(Speed_MPH), LSTRING(Speed_KNOT), LSTRING(Speed_MS)], 0]
] call CBA_settings_fnc_init;

[
    QGVAR(heliSpeed),
    "LIST",
    [localize LSTRING(Speed_DisplayName), localize LSTRING(Speed_Description)],
    [format["ACE %1", localize LSTRING(Module_DisplayName)], localize "STR_A3_TIME_TRIALS_HELI_NAME"],
    [[SPEED_KMH, SPEED_MPH, SPEED_KNOT, SPEED_MS], [LSTRING(Speed_KMH), LSTRING(Speed_MPH), LSTRING(Speed_KNOT), LSTRING(Speed_MS)], 0]
] call CBA_settings_fnc_init;

[
    QGVAR(heliAlt),
    "LIST",
    [localize LSTRING(Alt_DisplayName), localize LSTRING(Alt_Description)],
    [format["ACE %1", localize LSTRING(Module_DisplayName)], localize "STR_A3_TIME_TRIALS_HELI_NAME"],
    [[ALT_M, ALT_F], [LSTRING(Alt_M), LSTRING(Alt_F)], 0]
] call CBA_settings_fnc_init;

[
    QGVAR(planeSpeed),
    "LIST",
    [localize LSTRING(Speed_DisplayName), localize LSTRING(Speed_Description)],
    [format["ACE %1", localize LSTRING(Module_DisplayName)], localize "STR_A3_Showcase_FixedWings_Mission_Name"],
    [[SPEED_KMH, SPEED_MPH, SPEED_KNOT, SPEED_MS], [LSTRING(Speed_KMH), LSTRING(Speed_MPH), LSTRING(Speed_KNOT), LSTRING(Speed_MS)], 0]
] call CBA_settings_fnc_init;

[
    QGVAR(planeAlt),
    "LIST",
    [localize LSTRING(Alt_DisplayName), localize LSTRING(Alt_Description)],
    [format["ACE %1", localize LSTRING(Module_DisplayName)], localize "STR_A3_Showcase_FixedWings_Mission_Name"],
    [[ALT_M, ALT_F], [LSTRING(Alt_M), LSTRING(Alt_F)], 0]
] call CBA_settings_fnc_init;
