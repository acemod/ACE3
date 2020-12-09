[
    QEGVAR(medical,fatalDamageSource),
    "LIST",
    [LSTRING(fatalDamageSource_DisplayName), LSTRING(fatalDamageSource_Description)],
    [ELSTRING(medical,Category)],
    [[0, 1, 2], [LSTRING(fatalDamageSource_vitalShotsOnly), LSTRING(fatalDamageSource_trauma), LSTRING(fatalDamageSource_both)], 0],
    true
] call CBA_settings_fnc_init;

[
    QEGVAR(medical,playerDamageThreshold),
    "SLIDER",
    [LSTRING(PlayerDamageThreshold_DisplayName), LSTRING(PlayerDamageThreshold_Description)],
    ELSTRING(medical,Category),
    [0, 25, 1, 2],
    true
] call CBA_settings_fnc_init;

[
    QEGVAR(medical,AIDamageThreshold),
    "SLIDER",
    [LSTRING(AIDamageThreshold_DisplayName), LSTRING(AIDamageThreshold_Description)],
    ELSTRING(medical,Category),
    [0, 25, 1, 2],
    true
] call CBA_settings_fnc_init;
