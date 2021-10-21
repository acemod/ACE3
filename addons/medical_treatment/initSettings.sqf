[
    QGVAR(advancedDiagnose),
    "LIST",
    [LSTRING(AdvancedDiagnose_DisplayName), LSTRING(AdvancedDiagnose_Description)],
    [ELSTRING(medical,Category), LSTRING(SubCategory_Treatment)],
    [[0, 1, 2], [ELSTRING(common,Disabled), ELSTRING(common,Enabled), LSTRING(AdvancedDiagnose_DiagnoseCardiacArrest)], 1],
    true
] call CBA_fnc_addSetting;

[
    QGVAR(advancedMedication),
    "CHECKBOX",
    [LSTRING(AdvancedMedication_DisplayName), LSTRING(AdvancedMedication_Description)],
    [ELSTRING(medical,Category), LSTRING(SubCategory_Treatment)],
    true,
    true
] call CBA_fnc_addSetting;

[
    QGVAR(advancedBandages),
    "LIST",
    [LSTRING(AdvancedBandages_DisplayName), LSTRING(AdvancedBandages_Description)],
    [ELSTRING(medical,Category), LSTRING(SubCategory_Treatment)],
    [[0, 1, 2], [ELSTRING(common,Disabled), ELSTRING(common,Enabled), LSTRING(AdvancedBandages_EnabledCanReopen)], 1],
    true
] call CBA_fnc_addSetting;

[
    QGVAR(woundReopenChance),
    "SLIDER",
    [LSTRING(WoundReopenChance_DisplayName), LSTRING(WoundReopenChance_Description)],
    [ELSTRING(medical,Category), LSTRING(SubCategory_Treatment)],
    [0, 5, 1, 2],
    true
] call CBA_fnc_addSetting;

[
    QGVAR(clearTrauma),
    "LIST",
    [LSTRING(ClearTrauma_DisplayName), LSTRING(ClearTrauma_Description)],
    [ELSTRING(medical,Category), LSTRING(SubCategory_Treatment)],
    [[0, 1, 2], [ELSTRING(common,Never),  LSTRING(ClearTrauma_AfterStitch), LSTRING(ClearTrauma_AfterBandage)], 1],
    true
] call CBA_fnc_addSetting;

// todo: should this setting differentiate between medical vehicles and facilities?
[
    QGVAR(locationsBoostTraining),
    "CHECKBOX",
    [ELSTRING(common,LocationsBoostTraining_DisplayName), LSTRING(LocationsBoostTraining_Description)],
    [ELSTRING(medical,Category), LSTRING(SubCategory_Treatment)],
    false,
    true
] call CBA_fnc_addSetting;

[
    QGVAR(allowSharedEquipment),
    "LIST",
    [LSTRING(AllowSharedEquipment_DisplayName), LSTRING(AllowSharedEquipment_Description)],
    [ELSTRING(medical,Category), LSTRING(SubCategory_Treatment)],
    [[0, 1, 2], [LSTRING(AllowSharedEquipment_PriorityPatient), LSTRING(AllowSharedEquipment_PriorityMedic), ELSTRING(common,No)], 0],
    true
] call CBA_fnc_addSetting;

[
    QGVAR(convertItems),
    "LIST",
    [LSTRING(ConvertItems_DisplayName), LSTRING(ConvertItems_Description)],
    [ELSTRING(medical,Category), LSTRING(SubCategory_Treatment)],
    [[0, 1, 2], [ELSTRING(common,Enabled), LSTRING(ConvertItems_RemoveOnly), ELSTRING(common,Disabled)], 0],
    true
] call CBA_fnc_addSetting;

[
    QGVAR(treatmentTimeAutoinjector),
    "SLIDER",
    [LSTRING(TreatmentTimeAutoinjector_DisplayName), LSTRING(TreatmentTimeAutoinjector_Description)],
    [ELSTRING(medical,Category), LSTRING(SubCategory_Treatment)],
    [0.1, 60, 5, 1],
    true
] call CBA_fnc_addSetting;

[
    QGVAR(treatmentTimeTourniquet),
    "SLIDER",
    [LSTRING(TreatmentTimeTourniquet_DisplayName), LSTRING(TreatmentTimeTourniquet_Description)],
    [ELSTRING(medical,Category), LSTRING(SubCategory_Treatment)],
    [0.1, 60, 7, 1],
    true
] call CBA_fnc_addSetting;

[
    QGVAR(treatmentTimeSplint),
    "SLIDER",
    [LSTRING(TreatmentTimeSplint_DisplayName), LSTRING(TreatmentTimeSplint_Description)],
    [ELSTRING(medical,Category), LSTRING(SubCategory_Treatment)],
    [0.1, 60, 7, 1],
    true
] call CBA_fnc_addSetting;

[
    QGVAR(treatmentTimeBodyBag),
    "SLIDER",
    [LSTRING(TreatmentTimeBodyBag_DisplayName), LSTRING(TreatmentTimeBodyBag_Description)],
    [ELSTRING(medical,Category), LSTRING(SubCategory_Treatment)],
    [0.1, 60, 15, 1],
    true
] call CBA_fnc_addSetting;

[
    QGVAR(medicEpinephrine),
    "LIST",
    [LSTRING(MedicEpinephrine_DisplayName), LSTRING(MedicEpinephrine_Description)],
    [ELSTRING(medical,Category), LSTRING(SubCategory_Treatment)],
    [[0, 1, 2], [LSTRING(Anyone), LSTRING(Medics), LSTRING(Doctors)], 0],
    true
] call CBA_fnc_addSetting;

[
    QGVAR(locationEpinephrine),
    "LIST",
    [LSTRING(LocationEpinephrine_DisplayName), LSTRING(LocationEpinephrine_Description)],
    [ELSTRING(medical,Category), LSTRING(SubCategory_Treatment)],
    [[0, 1, 2, 3, 4], [ELSTRING(common,Anywhere), ELSTRING(common,Vehicle), LSTRING(MedicalFacilities), LSTRING(VehiclesAndFacilities), ELSTRING(common,Disabled)], 0],
    true
] call CBA_fnc_addSetting;

[
    QGVAR(medicPAK),
    "LIST",
    [LSTRING(MedicPAK_DisplayName), LSTRING(MedicPAK_Description)],
    [ELSTRING(medical,Category), LSTRING(SubCategory_Treatment)],
    [[0, 1, 2], [LSTRING(Anyone), LSTRING(Medics), LSTRING(Doctors)], 1],
    true
] call CBA_fnc_addSetting;

[
    QGVAR(locationPAK),
    "LIST",
    [LSTRING(LocationPAK_DisplayName), LSTRING(LocationPAK_Description)],
    [ELSTRING(medical,Category), LSTRING(SubCategory_Treatment)],
    [[0, 1, 2, 3, 4], [ELSTRING(common,Anywhere), ELSTRING(common,Vehicle), LSTRING(MedicalFacilities), LSTRING(VehiclesAndFacilities), ELSTRING(common,Disabled)], 3],
    true
] call CBA_fnc_addSetting;

[
    QGVAR(consumePAK),
    "LIST",
    [LSTRING(ConsumePAK_DisplayName), LSTRING(ConsumePAK_Description)],
    [ELSTRING(medical,Category), LSTRING(SubCategory_Treatment)],
    [[0, 1], [ELSTRING(common,No), ELSTRING(common,Yes)], 0],
    true
] call CBA_fnc_addSetting;

[
    QGVAR(allowSelfPAK),
    "LIST",
    [LSTRING(AllowSelfPAK_DisplayName), LSTRING(AllowSelfPAK_Description)],
    [ELSTRING(medical,Category), LSTRING(SubCategory_Treatment)],
    [[0, 1], [ELSTRING(common,No), ELSTRING(common,Yes)], 0],
    true
] call CBA_fnc_addSetting;

[
    QGVAR(timeCoefficientPAK),
    "SLIDER",
    [LSTRING(TimeCoefficientPAK_DisplayName), LSTRING(TimeCoefficientPAK_Description)],
    [ELSTRING(medical,Category), LSTRING(SubCategory_Treatment)],
    [0, 5, 1, 1],
    true
] call CBA_fnc_addSetting;

[
    QGVAR(medicSurgicalKit),
    "LIST",
    [LSTRING(MedicSurgicalKit_DisplayName), LSTRING(MedicSurgicalKit_Description)],
    [ELSTRING(medical,Category), LSTRING(SubCategory_Treatment)],
    [[0, 1, 2], [LSTRING(Anyone), LSTRING(Medics), LSTRING(Doctors)], 1],
    true
] call CBA_fnc_addSetting;

[
    QGVAR(locationSurgicalKit),
    "LIST",
    [LSTRING(LocationSurgicalKit_DisplayName), LSTRING(LocationSurgicalKit_Description)],
    [ELSTRING(medical,Category), LSTRING(SubCategory_Treatment)],
    [[0, 1, 2, 3, 4], [ELSTRING(common,Anywhere), ELSTRING(common,Vehicle), LSTRING(MedicalFacilities), LSTRING(VehiclesAndFacilities), ELSTRING(common,Disabled)], 2],
    true
] call CBA_fnc_addSetting;

[
    QGVAR(consumeSurgicalKit),
    "LIST",
    [LSTRING(ConsumeSurgicalKit_DisplayName), LSTRING(ConsumeSurgicalKit_Description)],
    [ELSTRING(medical,Category), LSTRING(SubCategory_Treatment)],
    [[0, 1], [ELSTRING(common,No), ELSTRING(common,Yes)], 0],
    true
] call CBA_fnc_addSetting;

[
    QGVAR(allowSelfStitch),
    "LIST",
    [LSTRING(AllowSelfStitch_DisplayName), LSTRING(AllowSelfStitch_Description)],
    [ELSTRING(medical,Category), LSTRING(SubCategory_Treatment)],
    [[0, 1], [ELSTRING(common,No), ELSTRING(common,Yes)], 0],
    true
] call CBA_fnc_addSetting;

[
    QGVAR(woundStitchTime),
    "SLIDER",
    [LSTRING(WoundStitchTime_DisplayName), LSTRING(WoundStitchTime_Description)],
    [ELSTRING(medical,Category), LSTRING(SubCategory_Treatment)],
    [0.1, 60, 5, 1],
    true
] call CBA_fnc_addSetting;

[
    QGVAR(medicIV),
    "LIST",
    [LSTRING(MedicIV_DisplayName), LSTRING(MedicIV_Description)],
    [ELSTRING(medical,Category), LSTRING(SubCategory_Treatment)],
    [[0, 1, 2], [LSTRING(Anyone), LSTRING(Medics), LSTRING(Doctors)], 1],
    true
] call CBA_fnc_addSetting;

[
    QGVAR(locationIV),
    "LIST",
    [LSTRING(LocationIV_DisplayName), LSTRING(LocationIV_Description)],
    [ELSTRING(medical,Category), LSTRING(SubCategory_Treatment)],
    [[0, 1, 2, 3, 4], [ELSTRING(common,Anywhere), ELSTRING(common,Vehicle), LSTRING(MedicalFacilities), LSTRING(VehiclesAndFacilities), ELSTRING(common,Disabled)], 0],
    1
] call CBA_fnc_addSetting;

[
    QGVAR(allowSelfIV),
    "LIST",
    [LSTRING(AllowSelfIV_DisplayName), LSTRING(AllowSelfIV_Description)],
    [ELSTRING(medical,Category), LSTRING(SubCategory_Treatment)],
    [[0, 1], [ELSTRING(common,No), ELSTRING(common,Yes)], 1],
    true
] call CBA_fnc_addSetting;

[
    QGVAR(treatmentTimeIV),
    "SLIDER",
    [LSTRING(TreatmentTimeIV_DisplayName), LSTRING(TreatmentTimeIV_Description)],
    [ELSTRING(medical,Category), LSTRING(SubCategory_Treatment)],
    [0.1, 60, 12, 1],
    true
] call CBA_fnc_addSetting;

[
    QGVAR(cprSuccessChanceMin),
    "SLIDER",
    [LSTRING(CPRSuccessChanceMin_DisplayName), LSTRING(CPRSuccessChanceMin_Description)],
    [ELSTRING(medical,Category), LSTRING(SubCategory_Treatment)],
    [0, 1, 0.4, 2, true],
    true
] call CBA_fnc_addSetting;

[
    QGVAR(cprSuccessChanceMax),
    "SLIDER",
    [LSTRING(CPRSuccessChanceMax_DisplayName), LSTRING(CPRSuccessChanceMax_Description)],
    [ELSTRING(medical,Category), LSTRING(SubCategory_Treatment)],
    [0, 1, 0.4, 2, true],
    true
] call CBA_fnc_addSetting;

[
    QGVAR(treatmentTimeCPR),
    "SLIDER",
    [LSTRING(TreatmentTimeCPR_DisplayName), LSTRING(TreatmentTimeCPR_Description)],
    [ELSTRING(medical,Category), LSTRING(SubCategory_Treatment)],
    [0.1, 60, 15, 1],
    true
] call CBA_fnc_addSetting;

[
    QGVAR(allowBodyBagUnconscious),
    "CHECKBOX",
    [LSTRING(AllowBodyBagUnconscious_DisplayName), LSTRING(AllowBodyBagUnconscious_Description)],
    [ELSTRING(medical,Category), LSTRING(SubCategory_Treatment)],
    false,
    true
] call CBA_fnc_addSetting;

[
    QGVAR(holsterRequired),
    "LIST",
    [LSTRING(HolsterRequired_DisplayName), LSTRING(HolsterRequired_Description)],
    [ELSTRING(medical,Category), LSTRING(SubCategory_Treatment)],
    [[0, 1, 2, 3, 4], [ELSTRING(common,Disabled), LSTRING(HolsterRequired_Lowered), LSTRING(HolsterRequired_LoweredExam), LSTRING(HolsterRequired_Holstered), LSTRING(HolsterRequired_HolsteredExam)], 0],
    true
] call CBA_fnc_addSetting;

[
    QGVAR(allowLitterCreation),
    "CHECKBOX",
    [LSTRING(AllowLitterCreation_DisplayName), LSTRING(AllowLitterCreation_Description)],
    [ELSTRING(medical,Category), LSTRING(SubCategory_Litter)],
    true,
    true
] call CBA_fnc_addSetting;

[
    QGVAR(maxLitterObjects),
    "LIST",
    [LSTRING(MaxLitterObjects_DisplayName), LSTRING(MaxLitterObjects_Description)],
    [ELSTRING(medical,Category), LSTRING(SubCategory_Litter)],
    [[50, 100, 200, 300, 400, 500, 1000, 2000, 3000, 4000, 5000], [/* settings function will auto create names */], 5],
    true
] call CBA_fnc_addSetting;

[
    QGVAR(litterCleanupDelay),
    "SLIDER",
    [LSTRING(LitterCleanupDelay_DisplayName), LSTRING(LitterCleanupDelay_Description)],
    [ELSTRING(medical,Category), LSTRING(SubCategory_Litter)],
    [-1, 3600, 600, 0],
    true
] call CBA_fnc_addSetting;
