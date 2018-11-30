[
    QGVAR(enableMedicalMenu), "LIST",
    [LSTRING(EnableMedicalMenu_DisplayName), LSTRING(EnableMedicalMenu_Description)],
    LSTRING(Category),
    [[0, 1, 2], [ELSTRING(common,Disabled), ELSTRING(common,Enabled), ELSTRING(common,VehiclesOnly)], 1],
    false
] call CBA_settings_fnc_init;

[
    QGVAR(openAfterTreatment), "CHECKBOX",
    [LSTRING(OpenAfterTreatment_DisplayName), LSTRING(OpenAfterTreatment_Description)],
    LSTRING(Category),
    true,
    false
] call CBA_settings_fnc_init;

[
    QGVAR(maxDistance), "SLIDER",
    [LSTRING(MaxDistance_DisplayName), LSTRING(MaxDistance_Description)],
    LSTRING(Category),
    [0, 10, 3, 1],
    false
] call CBA_settings_fnc_init;
