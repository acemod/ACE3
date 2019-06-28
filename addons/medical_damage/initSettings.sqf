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
