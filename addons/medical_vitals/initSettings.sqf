
[
    QEGVAR(medical,airway),
    "LIST",
    [LSTRING(Airways_DisplayName), LSTRING(Airways_Description)],
    [ELSTRING(medical,Category), LSTRING(SubCategory_Airways)],
    [[0, 1, 2], [ELSTRING(common,Disabled), LSTRING(Airways_Basic), LSTRING(Airways_Advanced)], 1],
    true,
    {},
    true
] call CBA_fnc_addSetting;
[
    QEGVAR(medical,airwayDegradationMultiplier),
    "SLIDER",
    [LSTRING(AirwayDegradation_DisplayName), LSTRING(AirwayDegradation_Description)],
    [ELSTRING(medical,Category), LSTRING(SubCategory_Airways)],
    [0.1, 5, 1, 2],
    true
] call CBA_fnc_addSetting;
[
    QEGVAR(medical,airwayRecoveryMultiplier),
    "SLIDER",
    [LSTRING(AirwayRecovery_DisplayName), LSTRING(AirwayRecovery_Description)],
    [ELSTRING(medical,Category), LSTRING(SubCategory_Airways)],
    [0.1, 5, 1, 2],
    true
] call CBA_fnc_addSetting;
[
    QEGVAR(medical,pneumoDamageThreshold),
    "SLIDER",
    [LSTRING(PneumoDamageThreshold_DisplayName), LSTRING(PneumoDamageThreshold_Description)],
    [ELSTRING(medical,Category), LSTRING(SubCategory_Airways)],
    [0, 1, 0.3, 2],
    true
] call CBA_fnc_addSetting;
[
    QEGVAR(medical,collapsedChance),
    "SLIDER",
    [LSTRING(CollapsedChance_DisplayName), LSTRING(CollapsedChance_Description)],
    [ELSTRING(medical,Category), LSTRING(SubCategory_Airways)],
    [0, 1, 0.5, 2, true],
    true
] call CBA_fnc_addSetting;
[
    QEGVAR(medical,blockageChance),
    "SLIDER",
    [LSTRING(BlockageChance_DisplayName), LSTRING(BlockageChance_Description)],
    [ELSTRING(medical,Category), LSTRING(SubCategory_Airways)],
    [0, 1, 0.5, 2, true],
    true
] call CBA_fnc_addSetting;
[
    QEGVAR(medical,pneumoChance),
    "SLIDER",
    [LSTRING(PneumoChance_DisplayName), LSTRING(PneumoChance_Description)],
    [ELSTRING(medical,Category), LSTRING(SubCategory_Airways)],
    [0, 1, 0.5, 2, true],
    true
] call CBA_fnc_addSetting;
[
    QEGVAR(medical,collapsedMultiplier),
    "SLIDER",
    [LSTRING(CollapsedMultiplier_DisplayName), LSTRING(CollapsedMultiplier_Description)],
    [ELSTRING(medical,Category), LSTRING(SubCategory_Airways)],
    [0.1, 5, 1, 1],
    true
] call CBA_fnc_addSetting;
[
    QEGVAR(medical,blockageMultiplier),
    "SLIDER",
    [LSTRING(BlockageMultiplier_DisplayName), LSTRING(BlockageMultiplier_Description)],
    [ELSTRING(medical,Category), LSTRING(SubCategory_Airways)],
    [0.1, 5, 1, 1],
    true
] call CBA_fnc_addSetting;
[
    QEGVAR(medical,pneumoMultiplier),
    "SLIDER",
    [LSTRING(PneumoMultiplier_DisplayName), LSTRING(PneumoMultiplier_Description)],
    [ELSTRING(medical,Category), LSTRING(SubCategory_Airways)],
    [0.1, 5, 1, 1],
    true
] call CBA_fnc_addSetting;

