[
    QGVAR(fatalInjuriesPlayer),
    "LIST",
    [LSTRING(FatalInjuriesPlayer_DisplayName), LSTRING(FatalInjuriesPlayer_Description)],
    [ELSTRING(medical,Category), LSTRING(SubCategory)],
    [
        [FATAL_INJURIES_ALWAYS, FATAL_INJURIES_CRDC_ARRST, FATAL_INJURIES_NEVER],
        [ELSTRING(common,Always), LSTRING(InCardiacArrest), ELSTRING(common,Never)],
        0
    ],
    true
] call CBA_settings_fnc_init;

[
    QGVAR(fatalInjuriesAI),
    "LIST",
    [LSTRING(FatalInjuriesAI_DisplayName), LSTRING(FatalInjuriesAI_Description)],
    [ELSTRING(medical,Category), LSTRING(SubCategory)],
    [
        [FATAL_INJURIES_ALWAYS, FATAL_INJURIES_CRDC_ARRST, FATAL_INJURIES_NEVER],
        [ELSTRING(common,Always), LSTRING(InCardiacArrest), ELSTRING(common,Never)],
        0
    ],
    true
] call CBA_settings_fnc_init;

[
    QGVAR(AIUnconsciousness),
    "CHECKBOX",
    [LSTRING(AIUnconsciousness_DisplayName), LSTRING(AIUnconsciousness_Description)],
    [ELSTRING(medical,Category), LSTRING(SubCategory)],
    true,
    true
] call CBA_settings_fnc_init;

[
    QGVAR(cardiacArrestTime),
    "TIME",
    [LSTRING(CardiacArrestTime_DisplayName), LSTRING(CardiacArrestTime_Description)],
    [ELSTRING(medical,Category), LSTRING(SubCategory)],
    [1, 3600, 30],
    true
] call CBA_settings_fnc_init;
