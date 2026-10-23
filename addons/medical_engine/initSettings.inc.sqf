[
    QEGVAR(medical,deadUnitDamage),
    "LIST",
    [LSTRING(DeadUnitDamage_DisplayName), LSTRING(DeadUnitDamage_Description)],
    ELSTRING(medical,Category),
    [
        [DEAD_UNIT_DAMAGE_IMMEDIATELY, DEAD_UNIT_DAMAGE_SPREAD, DEAD_UNIT_DAMAGE_IGNORE],
        [LSTRING(DeadUnitDamage_Immediately), LSTRING(DeadUnitDamage_Spread), LSTRING(DeadUnitDamage_Ignore)],
        1
    ],
    true
] call CBA_fnc_addSetting;

[
    QEGVAR(medical,enableVehicleCrashes),
    "CHECKBOX",
    [LSTRING(EnableVehicleCrashes_DisplayName), LSTRING(EnableVehicleCrashes_Description)],
    ELSTRING(medical,Category),
    true,
    true
] call CBA_fnc_addSetting;
