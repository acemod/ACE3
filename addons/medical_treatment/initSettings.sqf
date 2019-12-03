
// todo: this setting just disables some treatment options, remove?
[
    QGVAR(advancedDiagnose),
    "CHECKBOX",
    [LSTRING(AdvancedDiagnose_DisplayName), LSTRING(AdvancedDiagnose_Description)],
    [ELSTRING(medical,Category), LSTRING(SubCategory_Treatment)],
    true,
    true
] call CBA_settings_fnc_init;

[
    QGVAR(advancedBandages),
    "CHECKBOX",
    [LSTRING(AdvancedBandages_DisplayName), LSTRING(AdvancedBandages_Description)],
    [ELSTRING(medical,Category), LSTRING(SubCategory_Treatment)],
    true,
    true
] call CBA_settings_fnc_init;

// todo: verify that this setting does not require a restart
// todo: this setting requires advanced bandages to be enabled, they should be independent
[
    QGVAR(woundReopening),
    "CHECKBOX",
    [LSTRING(WoundReopening_DisplayName), LSTRING(WoundReopening_Description)],
    [ELSTRING(medical,Category), LSTRING(SubCategory_Treatment)],
    false,
    true
] call CBA_settings_fnc_init;

[
    QGVAR(clearTraumaAfterBandage),
    "CHECKBOX",
    [LSTRING(clearTraumaAfterBandage_DisplayName), LSTRING(clearTraumaAfterBandage_Description)],
    [ELSTRING(medical,Category), LSTRING(SubCategory_Treatment)],
    false,
    true
] call CBA_settings_fnc_init;

[
    QGVAR(advancedMedication),
    "CHECKBOX",
    [LSTRING(AdvancedMedication_DisplayName), LSTRING(AdvancedMedication_Description)],
    [ELSTRING(medical,Category), LSTRING(SubCategory_Treatment)],
    true,
    true
] call CBA_settings_fnc_init;

// todo: should this setting differentiate between medical vehicles and facilities?
[
    QGVAR(locationsBoostTraining),
    "CHECKBOX",
    [LSTRING(LocationsBoostTraining_DisplayName), LSTRING(LocationsBoostTraining_Description)],
    [ELSTRING(medical,Category), LSTRING(SubCategory_Treatment)],
    false,
    true
] call CBA_settings_fnc_init;

[
    QGVAR(allowSelfIV),
    "LIST",
    [LSTRING(AllowSelfIV_DisplayName), LSTRING(AllowSelfIV_Description)],
    [ELSTRING(medical,Category), LSTRING(SubCategory_Treatment)],
    [[0, 1], [ELSTRING(common,No), ELSTRING(common,Yes)], 1],
    true
] call CBA_settings_fnc_init;

[
    QGVAR(allowSharedEquipment),
    "LIST",
    [LSTRING(AllowSharedEquipment_DisplayName), LSTRING(AllowSharedEquipment_Description)],
    [ELSTRING(medical,Category), LSTRING(SubCategory_Treatment)],
    [[0, 1, 2], [LSTRING(AllowSharedEquipment_PriorityPatient), LSTRING(AllowSharedEquipment_PriorityMedic), ELSTRING(common,No)], 0],
    true
] call CBA_settings_fnc_init;

[
    QGVAR(convertItems),
    "LIST",
    [LSTRING(ConvertItems_DisplayName), LSTRING(ConvertItems_Description)],
    [ELSTRING(medical,Category), LSTRING(SubCategory_Treatment)],
    [[0, 1, 2], [ELSTRING(common,Enabled), LSTRING(ConvertItems_RemoveOnly), ELSTRING(common,Disabled)], 0],
    true
] call CBA_settings_fnc_init;

[
    QGVAR(medicEpinephrine),
    "LIST",
    [LSTRING(MedicEpinephrine_DisplayName), LSTRING(MedicEpinephrine_Description)],
    [ELSTRING(medical,Category), LSTRING(SubCategory_Treatment)],
    [[0, 1, 2], [LSTRING(Anyone), LSTRING(Medics), LSTRING(Doctors)], 0],
    true
] call CBA_settings_fnc_init;

[
    QGVAR(locationEpinephrine),
    "LIST",
    [LSTRING(LocationEpinephrine_DisplayName), LSTRING(LocationEpinephrine_Description)],
    [ELSTRING(medical,Category), LSTRING(SubCategory_Treatment)],
    [[0, 1, 2, 3, 4], [ELSTRING(common,Anywhere), ELSTRING(common,Vehicle), LSTRING(MedicalFacilities), LSTRING(VehiclesAndFacilities), ELSTRING(common,Disabled)], 0],
    true
] call CBA_settings_fnc_init;

[
    QGVAR(medicPAK),
    "LIST",
    [LSTRING(MedicPAK_DisplayName), LSTRING(MedicPAK_Description)],
    [ELSTRING(medical,Category), LSTRING(SubCategory_Treatment)],
    [[0, 1, 2], [LSTRING(Anyone), LSTRING(Medics), LSTRING(Doctors)], 1],
    true
] call CBA_settings_fnc_init;

[
    QGVAR(locationPAK),
    "LIST",
    [LSTRING(LocationPAK_DisplayName), LSTRING(LocationPAK_Description)],
    [ELSTRING(medical,Category), LSTRING(SubCategory_Treatment)],
    [[0, 1, 2, 3, 4], [ELSTRING(common,Anywhere), ELSTRING(common,Vehicle), LSTRING(MedicalFacilities), LSTRING(VehiclesAndFacilities), ELSTRING(common,Disabled)], 3],
    true
] call CBA_settings_fnc_init;

[
    QGVAR(consumePAK),
    "LIST",
    [LSTRING(ConsumePAK_DisplayName), LSTRING(ConsumePAK_Description)],
    [ELSTRING(medical,Category), LSTRING(SubCategory_Treatment)],
    [[0, 1], [ELSTRING(common,No), ELSTRING(common,Yes)], 0],
    true
] call CBA_settings_fnc_init;

[
    QGVAR(timeCoefficientPAK),
    "SLIDER",
    [LSTRING(TimeCoefficientPAK_DisplayName), LSTRING(TimeCoefficientPAK_Description)],
    [ELSTRING(medical,Category), LSTRING(SubCategory_Treatment)],
    [0, 5, 1, 1],
    true
] call CBA_settings_fnc_init;

[
    QGVAR(medicSurgicalKit),
    "LIST",
    [LSTRING(MedicSurgicalKit_DisplayName), LSTRING(MedicSurgicalKit_Description)],
    [ELSTRING(medical,Category), LSTRING(SubCategory_Treatment)],
    [[0, 1, 2], [LSTRING(Anyone), LSTRING(Medics), LSTRING(Doctors)], 1],
    true
] call CBA_settings_fnc_init;

[
    QGVAR(locationSurgicalKit),
    "LIST",
    [LSTRING(LocationSurgicalKit_DisplayName), LSTRING(LocationSurgicalKit_Description)],
    [ELSTRING(medical,Category), LSTRING(SubCategory_Treatment)],
    [[0, 1, 2, 3, 4], [ELSTRING(common,Anywhere), ELSTRING(common,Vehicle), LSTRING(MedicalFacilities), LSTRING(VehiclesAndFacilities), ELSTRING(common,Disabled)], 2],
    true
] call CBA_settings_fnc_init;

[
    QGVAR(consumeSurgicalKit),
    "LIST",
    [LSTRING(ConsumeSurgicalKit_DisplayName), LSTRING(ConsumeSurgicalKit_Description)],
    [ELSTRING(medical,Category), LSTRING(SubCategory_Treatment)],
    [[0, 1], [ELSTRING(common,No), ELSTRING(common,Yes)], 0],
    true
] call CBA_settings_fnc_init;

[
    QGVAR(allowSelfStitch),
    "LIST",
    [LSTRING(AllowSelfStitch_DisplayName), LSTRING(AllowSelfStitch_Description)],
    [ELSTRING(medical,Category), LSTRING(SubCategory_Treatment)],
    [[0, 1], [ELSTRING(common,No), ELSTRING(common,Yes)], 0],
    true
] call CBA_settings_fnc_init;

[
    QGVAR(cprSuccessChance),
    "SLIDER",
    [LSTRING(cprSuccessChance_DisplayName), LSTRING(cprSuccessChance_Description)],
    [ELSTRING(medical,Category), LSTRING(SubCategory_Treatment)],
    [0, 1, 0.4, 2],
    true
] call CBA_settings_fnc_init;

[
    QGVAR(allowLitterCreation),
    "CHECKBOX",
    [LSTRING(AllowLitterCreation_DisplayName), LSTRING(AllowLitterCreation_Description)],
    [ELSTRING(medical,Category), LSTRING(SubCategory_Litter)],
    true,
    true
] call CBA_settings_fnc_init;

[
    QGVAR(maxLitterObjects),
    "LIST",
    [LSTRING(MaxLitterObjects_DisplayName), LSTRING(MaxLitterObjects_Description)],
    [ELSTRING(medical,Category), LSTRING(SubCategory_Litter)],
    [[50, 100, 200, 300, 400, 500, 1000, 2000, 3000, 4000, 5000], [/* settings function will auto create names */], 5],
    true
] call CBA_settings_fnc_init;

[
    QGVAR(litterCleanupDelay),
    "SLIDER",
    [LSTRING(LitterCleanupDelay_DisplayName), LSTRING(LitterCleanupDelay_Description)],
    [ELSTRING(medical,Category), LSTRING(SubCategory_Litter)],
    [-1, 3600, 600, 0],
    true
] call CBA_settings_fnc_init;

[
    QGVAR(holsterRequired),
    "LIST",
    [LSTRING(HolsterRequired_DisplayName), LSTRING(HolsterRequired_Description)],
    [ELSTRING(medical,Category), LSTRING(SubCategory_Treatment)],
    [[0, 1, 2, 3, 4], [ELSTRING(common,Disabled), LSTRING(HolsterRequired_Lowered), LSTRING(HolsterRequired_LoweredExam), LSTRING(HolsterRequired_Holstered), LSTRING(HolsterRequired_HolsteredExam)], 0],
    true
] call CBA_settings_fnc_init;


