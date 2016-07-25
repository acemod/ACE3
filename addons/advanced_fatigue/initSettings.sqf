[
    QGVAR(enabled),
    "CHECKBOX",
    [LSTRING(Enabled), LSTRING(Enabled_Description)],
    "ACE3 Advanced Fatigue",
    true,
    true
] call CBA_Settings_fnc_init;

[
    QGVAR(performanceFactor),
    "SLIDER",
    [LSTRING(PerformanceFactor), LSTRING(PerformanceFactor_Description)],
    "ACE3 Advanced Fatigue",
    [0, 2, 1, 1],
    true
] call CBA_Settings_fnc_init;

[
    QGVAR(recoveryFactor),
    "SLIDER",
    [LSTRING(RecoveryFactor), LSTRING(RecoveryFactor_Description)],
    "ACE3 Advanced Fatigue",
    [0, 2, 1, 1],
    true
] call CBA_Settings_fnc_init;

[
    QGVAR(loadFactor),
    "SLIDER",
    [LSTRING(LoadFactor), LSTRING(LoadFactor_Description)],
    "ACE3 Advanced Fatigue",
    [0, 2, 1, 1],
    true
] call CBA_Settings_fnc_init;

[
    QGVAR(terrainGradientFactor),
    "SLIDER",
    [LSTRING(TerrainGradientFactor), LSTRING(TerrainGradientFactor_Description)],
    "ACE3 Advanced Fatigue",
    [0, 2, 1, 1],
    true
] call CBA_Settings_fnc_init;
