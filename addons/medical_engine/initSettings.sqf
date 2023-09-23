[
    QEGVAR(medical,enableVehicleCrashes),
    "CHECKBOX",
    [LSTRING(EnableVehicleCrashes_DisplayName), LSTRING(EnableVehicleCrashes_Description)],
    ELSTRING(medical,Category),
    true,
    true
] call CBA_fnc_addSetting;

[
    QGVAR(damagePassThroughEffect),
    "SLIDER",
    [LSTRING(damagePassThroughEffect_displayName), LSTRING(damagePassThroughEffect_description)],
    ELSTRING(medical,Category),
    [0, 1, 1, 2, true],
    true
] call CBA_fnc_addSetting;
