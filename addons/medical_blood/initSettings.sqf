[
    QGVAR(enabledFor),
    "LIST",
    [LSTRING(EnabledFor_DisplayName), LSTRING(EnabledFor_Description)],
    [ELSTRING(medical,Category), LSTRING(SubCategory)],
    [[BLOOD_DISABLED, BLOOD_ONLY_PLAYERS, BLOOD_ENABLED], [ELSTRING(Common,Disabled), LSTRING(OnlyPlayers), ELSTRING(Common,Enabled)], 2],
    true,
    LINKFUNC(init)
] call CBA_settings_fnc_init;

[
    QGVAR(maxBloodObjects),
    "LIST",
    [LSTRING(MaxBloodObjects_DisplayName), LSTRING(MaxBloodObjects_Description)],
    [ELSTRING(medical,Category), LSTRING(SubCategory)],
    [[50, 100, 200, 300, 400, 500, 1000, 2000, 3000, 4000, 5000], [/* settings function will auto create names */], 5],
    true
] call CBA_settings_fnc_init;

[
    QGVAR(bloodLifetime),
    "TIME",
    [LSTRING(BloodLifetime_DisplayName), LSTRING(BloodLifetime_Description)],
    [ELSTRING(medical,Category), LSTRING(SubCategory)],
    [1, 3600, 900],
    true
] call CBA_settings_fnc_init;
