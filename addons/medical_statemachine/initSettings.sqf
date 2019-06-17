[
    QGVAR(fatalInjuryCondition),
    "LIST",
    [LSTRING(FatalInjuryCondition_DisplayName), LSTRING(FatalInjuryCondition_Description)],
    [ELSTRING(medical,Category), LSTRING(SubCategory)],
    [[0, 1, 2], [ELSTRING(common,Always), LSTRING(InCardiacArrest), ELSTRING(common,Never)], 0],
    true
] call CBA_settings_fnc_init;

[
    QGVAR(fatalInjuryConditionAI),
    "CHECKBOX",
    [LSTRING(FatalInjuryConditionAI_DisplayName), LSTRING(FatalInjuryConditionAI_Description)],
    [ELSTRING(medical,Category), LSTRING(SubCategory)],
    true,
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
