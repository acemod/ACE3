[
    QGVAR(enableActions),
    "LIST",
    [LSTRING(EnableActions_DisplayName), LSTRING(EnableActions_Description)],
    [ELSTRING(medical,Category), LSTRING(SubCategory)],
    [[0, 1, 2], [LSTRING(Selections3D), LSTRING(Radial), ELSTRING(common,Disabled)], 0],
    false
] call CBA_fnc_addSetting;

[
    QGVAR(enableSelfActions),
    "CHECKBOX",
    [LSTRING(EnableSelfActions_DisplayName), LSTRING(EnableSelfActions_Description)],
    [ELSTRING(medical,Category), LSTRING(SubCategory)],
    true,
    false
] call CBA_fnc_addSetting;

[
    QGVAR(enableMedicalMenu),
    "LIST",
    [LSTRING(EnableMedicalMenu_DisplayName), LSTRING(EnableMedicalMenu_Description)],
    [ELSTRING(medical,Category), LSTRING(SubCategory)],
    [[0, 1, 2], [ELSTRING(common,Disabled), ELSTRING(common,Enabled), ELSTRING(common,VehiclesOnly)], 1],
    false
] call CBA_fnc_addSetting;

[
    QGVAR(openAfterTreatment),
    "CHECKBOX",
    [LSTRING(OpenAfterTreatment_DisplayName), LSTRING(OpenAfterTreatment_Description)],
    [ELSTRING(medical,Category), LSTRING(SubCategory)],
    true,
    false
] call CBA_fnc_addSetting;

[
    QGVAR(maxDistance),
    "SLIDER",
    [LSTRING(MaxDistance_DisplayName), LSTRING(MaxDistance_Description)],
    [ELSTRING(medical,Category), LSTRING(SubCategory)],
    [0, 10, 3, 1],
    true
] call CBA_fnc_addSetting;

[
    QGVAR(interactionMenuShowTriage),
    "LIST",
    [LSTRING(InteractionMenuShowTriage_DisplayName), LSTRING(InteractionMenuShowTriage_Description)],
    [ELSTRING(medical,Category), LSTRING(SubCategory)],
    [[0, 1, 2], [ELSTRING(common,Disabled), ELSTRING(Medical_Treatment,Anyone), ELSTRING(Medical_Treatment,Medics)], 1],
    false
] call CBA_fnc_addSetting;

[
    QGVAR(bloodLossColor_0), 
    "COLOR",
    [LSTRING(BloodLossColor_0_DisplayName), LSTRING(BloodLossColor_Description)],
    [ELSTRING(medical,Category), LSTRING(BloodLossColors)],
    [1.00, 1.00, 1.00, 1],
    false // isGlobal
] call CBA_fnc_addSetting;

[
    QGVAR(bloodLossColor_1), 
    "COLOR",
    [LSTRING(BloodLossColor_1_DisplayName), LSTRING(BloodLossColor_Description)],
    [ELSTRING(medical,Category), LSTRING(BloodLossColors)],
    [1.00, 0.95, 0.64, 1],
    false // isGlobal
] call CBA_fnc_addSetting;

[
    QGVAR(bloodLossColor_2), 
    "COLOR",
    [LSTRING(BloodLossColor_2_DisplayName), LSTRING(BloodLossColor_Description)],
    [ELSTRING(medical,Category), LSTRING(BloodLossColors)],
    [1.00, 0.87, 0.46, 1],
    false // isGlobal
] call CBA_fnc_addSetting;

[
    QGVAR(bloodLossColor_3), 
    "COLOR",
    [LSTRING(BloodLossColor_3_DisplayName), LSTRING(BloodLossColor_Description)],
    [ELSTRING(medical,Category), LSTRING(BloodLossColors)],
    [1.00, 0.80, 0.33, 1],
    false // isGlobal
] call CBA_fnc_addSetting;

[
    QGVAR(bloodLossColor_4), 
    "COLOR",
    [LSTRING(BloodLossColor_4_DisplayName), LSTRING(BloodLossColor_Description)],
    [ELSTRING(medical,Category), LSTRING(BloodLossColors)],
    [1.00, 0.72, 0.24, 1],
    false // isGlobal
] call CBA_fnc_addSetting;

[
    QGVAR(bloodLossColor_5), 
    "COLOR",
    [LSTRING(BloodLossColor_5_DisplayName), LSTRING(BloodLossColor_Description)],
    [ELSTRING(medical,Category), LSTRING(BloodLossColors)],
    [1.00, 0.63, 0.15, 1],
    false // isGlobal
] call CBA_fnc_addSetting;

[
    QGVAR(bloodLossColor_6), 
    "COLOR",
    [LSTRING(BloodLossColor_6_DisplayName), LSTRING(BloodLossColor_Description)],
    [ELSTRING(medical,Category), LSTRING(BloodLossColors)],
    [1.00, 0.54, 0.08, 1],
    false // isGlobal
] call CBA_fnc_addSetting;

[
    QGVAR(bloodLossColor_7), 
    "COLOR",
    [LSTRING(BloodLossColor_7_DisplayName), LSTRING(BloodLossColor_Description)],
    [ELSTRING(medical,Category), LSTRING(BloodLossColors)],
    [1.00, 0.43, 0.02, 1],
    false // isGlobal
] call CBA_fnc_addSetting;

[
    QGVAR(bloodLossColor_8), 
    "COLOR",
    [LSTRING(BloodLossColor_8_DisplayName), LSTRING(BloodLossColor_Description)],
    [ELSTRING(medical,Category), LSTRING(BloodLossColors)],
    [1.00, 0.30, 0.00, 1],
    false // isGlobal
] call CBA_fnc_addSetting;

[
    QGVAR(bloodLossColor_9), 
    "COLOR",
    [LSTRING(BloodLossColor_9_DisplayName), LSTRING(BloodLossColor_Description)],
    [ELSTRING(medical,Category), LSTRING(BloodLossColors)],
    [1.00, 0.00, 0.00, 1],
    false // isGlobal
] call CBA_fnc_addSetting;

[
    QGVAR(damageColor_0), 
    "COLOR",
    [LSTRING(DamageColor_0_DisplayName), LSTRING(DamageColor_Description)],
    [ELSTRING(medical,Category), LSTRING(DamageColors)],
    [1.00, 1.00, 1.00, 1],
    false // isGlobal
] call CBA_fnc_addSetting;

[
    QGVAR(damageColor_1), 
    "COLOR",
    [LSTRING(DamageColor_1_DisplayName), LSTRING(DamageColor_Description)],
    [ELSTRING(medical,Category), LSTRING(DamageColors)],
    [0.75, 0.95, 1.00, 1],
    false // isGlobal
] call CBA_fnc_addSetting;

[
    QGVAR(damageColor_2), 
    "COLOR",
    [LSTRING(DamageColor_2_DisplayName), LSTRING(DamageColor_Description)],
    [ELSTRING(medical,Category), LSTRING(DamageColors)],
    [0.62, 0.86, 1.00, 1],
    false // isGlobal
] call CBA_fnc_addSetting;

[
    QGVAR(damageColor_3), 
    "COLOR",
    [LSTRING(DamageColor_3_DisplayName), LSTRING(DamageColor_Description)],
    [ELSTRING(medical,Category), LSTRING(DamageColors)],
    [0.54, 0.77, 1.00, 1],
    false // isGlobal
] call CBA_fnc_addSetting;

[
    QGVAR(damageColor_4), 
    "COLOR",
    [LSTRING(DamageColor_4_DisplayName), LSTRING(DamageColor_Description)],
    [ELSTRING(medical,Category), LSTRING(DamageColors)],
    [0.48, 0.67, 1.00, 1],
    false // isGlobal
] call CBA_fnc_addSetting;

[
    QGVAR(damageColor_5), 
    "COLOR",
    [LSTRING(DamageColor_5_DisplayName), LSTRING(DamageColor_Description)],
    [ELSTRING(medical,Category), LSTRING(DamageColors)],
    [0.42, 0.57, 1.00, 1],
    false // isGlobal
] call CBA_fnc_addSetting;

[
    QGVAR(damageColor_6), 
    "COLOR",
    [LSTRING(DamageColor_6_DisplayName), LSTRING(DamageColor_Description)],
    [ELSTRING(medical,Category), LSTRING(DamageColors)],
    [0.37, 0.47, 1.00, 1],
    false // isGlobal
] call CBA_fnc_addSetting;

[
    QGVAR(damageColor_7), 
    "COLOR",
    [LSTRING(DamageColor_7_DisplayName), LSTRING(DamageColor_Description)],
    [ELSTRING(medical,Category), LSTRING(DamageColors)],
    [0.31, 0.36, 1.00, 1],
    false // isGlobal
] call CBA_fnc_addSetting;

[
    QGVAR(damageColor_8), 
    "COLOR",
    [LSTRING(DamageColor_8_DisplayName), LSTRING(DamageColor_Description)],
    [ELSTRING(medical,Category), LSTRING(DamageColors)],
    [0.22, 0.23, 1.00, 1],
    false // isGlobal
] call CBA_fnc_addSetting;

[
    QGVAR(damageColor_9), 
    "COLOR",
    [LSTRING(DamageColor_9_DisplayName), LSTRING(DamageColor_Description)],
    [ELSTRING(medical,Category), LSTRING(DamageColors)],
    [0.00, 0.00, 1.00, 1],
    false // isGlobal
] call CBA_fnc_addSetting;