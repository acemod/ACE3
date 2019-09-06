[
    QGVAR(enableActions),
    "LIST",
    [LSTRING(EnableActions_DisplayName), LSTRING(EnableActions_Description)],
    [ELSTRING(medical,Category), LSTRING(SubCategory)],
    [[0, 1, 2], [LSTRING(Selections3D), LSTRING(Radial), ELSTRING(common,Disabled)], 0],
    false
] call CBA_settings_fnc_init;

[
    QGVAR(enableSelfActions),
    "CHECKBOX",
    [LSTRING(EnableSelfActions_DisplayName), LSTRING(EnableSelfActions_Description)],
    [ELSTRING(medical,Category), LSTRING(SubCategory)],
    true,
    false
] call CBA_settings_fnc_init;

[
    QGVAR(enableMedicalMenu),
    "LIST",
    [LSTRING(EnableMedicalMenu_DisplayName), LSTRING(EnableMedicalMenu_Description)],
    [ELSTRING(medical,Category), LSTRING(SubCategory)],
    [[0, 1, 2], [ELSTRING(common,Disabled), ELSTRING(common,Enabled), ELSTRING(common,VehiclesOnly)], 1],
    false
] call CBA_settings_fnc_init;

[
    QGVAR(openAfterTreatment),
    "CHECKBOX",
    [LSTRING(OpenAfterTreatment_DisplayName), LSTRING(OpenAfterTreatment_Description)],
    [ELSTRING(medical,Category), LSTRING(SubCategory)],
    true,
    false
] call CBA_settings_fnc_init;

[
    QGVAR(maxDistance),
    "SLIDER",
    [LSTRING(MaxDistance_DisplayName), LSTRING(MaxDistance_Description)],
    [ELSTRING(medical,Category), LSTRING(SubCategory)],
    [0, 10, 3, 1],
    true
] call CBA_settings_fnc_init;
