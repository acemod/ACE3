[
    QEGVAR(medical,enabled),
    "CHECKBOX",
    [LSTRING(Enabled_DisplayName), LSTRING(Enabled_Description)],
    ELSTRING(medical,Category),
    true,
    1,
    {[QEGVAR(medical,enabled), _this] call EFUNC(common,cbaSettings_settingChanged)},
    true // Needs mission restart
] call CBA_fnc_addSetting;

[
    QEGVAR(medical,enableVehicleCrashes),
    "CHECKBOX",
    [LSTRING(EnableVehicleCrashes_DisplayName), LSTRING(EnableVehicleCrashes_Description)],
    ELSTRING(medical,Category),
    true,
    1
] call CBA_fnc_addSetting;

[
    QGVAR(damagePassThroughEffect),
    "SLIDER",
    [LSTRING(damagePassThroughEffect_displayName), LSTRING(damagePassThroughEffect_description)],
    ELSTRING(medical,Category),
    [0, 1, 1, 2, true],
    1
] call CBA_fnc_addSetting;
