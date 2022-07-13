[
    QEGVAR(medical,enableVehicleCrashes),
    "CHECKBOX",
    [LSTRING(EnableVehicleCrashes_DisplayName), LSTRING(EnableVehicleCrashes_Description)],
    ELSTRING(medical,Category),
    true,
    true
] call CBA_fnc_addSetting;

[
    QEGVAR(medical,considerSelectAIPlayersForMedical),
    "LIST",
    [LSTRING(ConsiderSelectAIPlayersForMedical_DisplayName), LSTRING(ConsiderSelectAIPlayersForMedical_Description)],
    ELSTRING(medical,Category),
    [
        [0,1,2],
        [ELSTRING(common,Disabled), LSTRING(AllPlayables), LSTRING(AllPlayerSquadmates)],
        0
    ],
    true
] call CBA_fnc_addSetting;
