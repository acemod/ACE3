[
    QEGVAR(medical,enableVehicleCrashes),
    "CHECKBOX",
    [LSTRING(EnableVehicleCrashes_DisplayName), LSTRING(EnableVehicleCrashes_Description)],
    ELSTRING(medical,Category),
    true,
    true
] call CBA_fnc_addSetting;

[
    QEGVAR(medical,alternateArmorPenetration),
    "CHECKBOX",
    [LSTRING(AlternateArmorPenetration_DisplayName), LSTRING(AlternateArmorPenetration_Description)],
    ELSTRING(medical,Category),
    true,
    true
] call CBA_fnc_addSetting;
