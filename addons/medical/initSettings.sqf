[
    QGVAR(limping),
    "LIST",
    [LSTRING(Limping_DisplayName), LSTRING(Limping_Description)],
    LSTRING(Category),
    [[0, 1, 2], [ELSTRING(common,Disabled), LSTRING(Limping_LimpOnOpenWounds), LSTRING(Limping_LimpRequiresStitching)], 1],
    true,
    {},
    true
] call CBA_settings_fnc_init;

[
    QGVAR(fractures),
    "LIST",
    [LSTRING(Fractures_DisplayName), LSTRING(Fractures_Description)],
    LSTRING(Category),
    [[0, 1, 2], [ELSTRING(common,Disabled), LSTRING(Fractures_SplintHealsFully), LSTRING(Fractures_SplintHasEffects)], 1],
    true,
    {},
    true
] call CBA_settings_fnc_init;

[
    QGVAR(fractureChance),
    "SLIDER",
    [LSTRING(FractureChance_DisplayName), LSTRING(FractureChance_Description)],
    LSTRING(Category),
    [0, 1, 0.8, 2, true],
    true
] call CBA_settings_fnc_init;

[
    QGVAR(spontaneousWakeUpChance),
    "SLIDER",
    [LSTRING(SpontaneousWakeUpChance_DisplayName), LSTRING(SpontaneousWakeUpChance_Description)],
    LSTRING(Category),
    [0, 1, 0.05, 2, true],
    true
] call CBA_settings_fnc_init;

[
    QGVAR(spontaneousWakeUpEpinephrineBoost),
    "SLIDER",
    [LSTRING(spontaneousWakeUpEpinephrineBoost_DisplayName), LSTRING(spontaneousWakeUpEpinephrineBoost_Description)],
    LSTRING(Category),
    [1, 30, 1, 1],
    true
] call CBA_settings_fnc_init;
