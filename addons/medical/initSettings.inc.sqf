[
    QGVAR(limping),
    "LIST",
    [LSTRING(Limping_DisplayName), LSTRING(Limping_Description)],
    LSTRING(Category),
    [[0, 1, 2], [ELSTRING(common,Disabled), LSTRING(Limping_LimpOnOpenWounds), LSTRING(Limping_LimpRequiresStitching)], 1],
    true,
    {},
    true
] call CBA_fnc_addSetting;

[
    QGVAR(fractures),
    "LIST",
    [LSTRING(Fractures_DisplayName), LSTRING(Fractures_Description)],
    LSTRING(Category),
    [[0, 1, 2, 3], [ELSTRING(common,Disabled), LSTRING(Fractures_SplintHealsFully), LSTRING(Fractures_SplintHealsNoSprint), LSTRING(Fractures_SplintHealsNoJog)], 1],
    true,
    {},
    true
] call CBA_fnc_addSetting;

[
    QGVAR(fractureChance),
    "SLIDER",
    [LSTRING(FractureChance_DisplayName), LSTRING(FractureChance_Description)],
    LSTRING(Category),
    [0, 1, 0.8, 2, true],
    true
] call CBA_fnc_addSetting;

[
    QGVAR(spontaneousWakeUpChance),
    "SLIDER",
    [LSTRING(SpontaneousWakeUpChance_DisplayName), LSTRING(SpontaneousWakeUpChance_Description)],
    LSTRING(Category),
    [0, 1, 0.1, 2, true],
    true
] call CBA_fnc_addSetting;

[
    QGVAR(spontaneousWakeUpEpinephrineBoost),
    "SLIDER",
    [LSTRING(spontaneousWakeUpEpinephrineBoost_DisplayName), LSTRING(spontaneousWakeUpEpinephrineBoost_Description)],
    LSTRING(Category),
    [1, 30, 1.5, 1],
    true
] call CBA_fnc_addSetting;

[
    QGVAR(blockInputOnUiEvent),
    "SLIDER",
    [LSTRING(blockInputOnUiEvent_DisplayName), LSTRING(blockInputOnUiEvent_Description)],
    [ELSTRING(medical,Interface_Category), "str_a3_mdl_category_misc"],
    [0, 3, 1, 1],
    0
] call CBA_fnc_addSetting;
