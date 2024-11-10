[
    QGVAR(advancedDiagnose),
    "LIST",
    [LSTRING(AdvancedDiagnose_DisplayName), LSTRING(AdvancedDiagnose_Description)],
    LSTRING(Category),
    [[0, 1, 2, 3], [ELSTRING(common,Disabled), ELSTRING(common,Enabled), LSTRING(AdvancedDiagnose_DiagnoseCardiacArrest), LSTRING(AdvancedDiagnose_DiagnoseCardiacArrestDirect)], 1],
    true
] call CBA_fnc_addSetting;

[
    QGVAR(numericalPulse),
    "LIST",
    [LSTRING(numericalPulse_DisplayName), LSTRING(NumericalPulse_Description)],
    LSTRING(Category),
    [[0, 1, 2], [LSTRING(Anyone), LSTRING(Medics), LSTRING(Doctors)], 1],
    true
] call CBA_fnc_addSetting;

[
    QGVAR(advancedMedication),
    "CHECKBOX",
    [LSTRING(AdvancedMedication_DisplayName), LSTRING(AdvancedMedication_Description)],
    LSTRING(Category),
    true,
    true
] call CBA_fnc_addSetting;

[
    QGVAR(advancedBandages),
    "LIST",
    [LSTRING(AdvancedBandages_DisplayName), LSTRING(AdvancedBandages_Description)],
    LSTRING(Category),
    [[0, 1, 2], [ELSTRING(common,Disabled), ELSTRING(common,Enabled), LSTRING(AdvancedBandages_EnabledCanReopen)], 1],
    true
] call CBA_fnc_addSetting;

[
    QGVAR(bandageRollover),
    "CHECKBOX",
    [LSTRING(bandageRollover_DisplayName), LSTRING(bandageRollover_Description)],
    LSTRING(Category),
    true,
    false // server can force if necessary, otherwise client decides
] call CBA_fnc_addSetting;

[
    QGVAR(bandageEffectiveness),
    "SLIDER",
    [LSTRING(bandageEffectiveness_DisplayName), LSTRING(bandageEffectiveness_Description)],
    LSTRING(Category),
    [0, 5, 1, 2],
    true
] call CBA_fnc_addSetting;

[
    QGVAR(woundReopenChance),
    "SLIDER",
    [LSTRING(WoundReopenChance_DisplayName), LSTRING(WoundReopenChance_Description)],
    LSTRING(Category),
    [0, 5, 1, 2],
    true
] call CBA_fnc_addSetting;

[
    QGVAR(clearTrauma),
    "LIST",
    [LSTRING(ClearTrauma_DisplayName), LSTRING(ClearTrauma_Description)],
    LSTRING(Category),
    [[0, 1, 2], [ELSTRING(common,Never),  LSTRING(ClearTrauma_AfterStitch), LSTRING(ClearTrauma_AfterBandage)], 1],
    true
] call CBA_fnc_addSetting;

// todo: should this setting differentiate between medical vehicles and facilities?
[
    QGVAR(locationsBoostTraining),
    "CHECKBOX",
    [ELSTRING(common,LocationsBoostTraining_DisplayName), LSTRING(LocationsBoostTraining_Description)],
    LSTRING(Category),
    false,
    true
] call CBA_fnc_addSetting;

[
    QGVAR(allowSharedEquipment),
    "LIST",
    [LSTRING(AllowSharedEquipment_DisplayName), LSTRING(AllowSharedEquipment_Description)],
    LSTRING(Category),
    [[0, 1, 2], [LSTRING(AllowSharedEquipment_PriorityPatient), LSTRING(AllowSharedEquipment_PriorityMedic), ELSTRING(common,No)], 0],
    true
] call CBA_fnc_addSetting;

[
    QGVAR(convertItems),
    "LIST",
    [LSTRING(ConvertItems_DisplayName), LSTRING(ConvertItems_Description)],
    LSTRING(Category),
    [[0, 1, 2], [ELSTRING(common,Enabled), LSTRING(ConvertItems_RemoveOnly), ELSTRING(common,Disabled)], 0],
    1,
    {[QGVAR(convertItems), _this] call EFUNC(common,cbaSettings_settingChanged)},
    true // Needs mission restart
] call CBA_fnc_addSetting;

[
    QGVAR(treatmentTimeAutoinjector),
    "SLIDER",
    [LSTRING(TreatmentTimeAutoinjector_DisplayName), LSTRING(TreatmentTimeAutoinjector_Description)],
    LSTRING(Category),
    [0.1, 60, 5, 1],
    true
] call CBA_fnc_addSetting;

[
    QGVAR(treatmentTimeTourniquet),
    "SLIDER",
    [LSTRING(TreatmentTimeTourniquet_DisplayName), LSTRING(TreatmentTimeTourniquet_Description)],
    LSTRING(Category),
    [0.1, 60, 7, 1],
    true
] call CBA_fnc_addSetting;

[
    QGVAR(treatmentTimeSplint),
    "SLIDER",
    [LSTRING(TreatmentTimeSplint_DisplayName), LSTRING(TreatmentTimeSplint_Description)],
    LSTRING(Category),
    [0.1, 60, 7, 1],
    true
] call CBA_fnc_addSetting;

[
    QGVAR(treatmentTimeBodyBag),
    "SLIDER",
    [LSTRING(TreatmentTimeBodyBag_DisplayName), LSTRING(TreatmentTimeBodyBag_Description)],
    LSTRING(Category),
    [0.1, 60, 15, 1],
    true
] call CBA_fnc_addSetting;

[
    QGVAR(treatmentTimeGrave),
    "SLIDER",
    [LSTRING(TreatmentTimeGrave_DisplayName), LSTRING(TreatmentTimeGrave_Description)],
    LSTRING(Category),
    [0.1, 120, 30, 1],
    true
] call CBA_fnc_addSetting;

[
    QGVAR(medicEpinephrine),
    "LIST",
    [LSTRING(MedicEpinephrine_DisplayName), LSTRING(MedicEpinephrine_Description)],
    LSTRING(Category),
    [[0, 1, 2], [LSTRING(Anyone), LSTRING(Medics), LSTRING(Doctors)], 0],
    true
] call CBA_fnc_addSetting;

[
    QGVAR(locationEpinephrine),
    "LIST",
    [LSTRING(LocationEpinephrine_DisplayName), LSTRING(LocationEpinephrine_Description)],
    LSTRING(Category),
    [[0, 1, 2, 3, 4], [ELSTRING(common,Anywhere), ELSTRING(common,Vehicle), LSTRING(MedicalFacilities), LSTRING(VehiclesAndFacilities), ELSTRING(common,Disabled)], 0],
    true
] call CBA_fnc_addSetting;

[
    QGVAR(medicMorphine),
    "LIST",
    [LSTRING(MedicMorphine_DisplayName), LSTRING(MedicMorphine_Description)],
    LSTRING(Category),
    [[0, 1, 2], [LSTRING(Anyone), LSTRING(Medics), LSTRING(Doctors)], 0],
    true
] call CBA_fnc_addSetting;

[
    QGVAR(locationMorphine),
    "LIST",
    [LSTRING(LocationMorphine_DisplayName), LSTRING(LocationMorphine_Description)],
    LSTRING(Category),
    [[0, 1, 2, 3, 4], [ELSTRING(common,Anywhere), ELSTRING(common,Vehicle), LSTRING(MedicalFacilities), LSTRING(VehiclesAndFacilities), ELSTRING(common,Disabled)], 0],
    true
] call CBA_fnc_addSetting;

[
    QGVAR(medicSplint),
    "LIST",
    [LSTRING(MedicSplint_DisplayName), LSTRING(MedicSplint_Description)],
    LSTRING(Category),
    [[0, 1, 2], [LSTRING(Anyone), LSTRING(Medics), LSTRING(Doctors)], 0],
    true
] call CBA_fnc_addSetting;


[
    QGVAR(locationSplint),
    "LIST",
    [LSTRING(LocationSplint_DisplayName), LSTRING(LocationSplint_Description)],
    LSTRING(Category),
    [[0, 1, 2, 3, 4], [ELSTRING(common,Anywhere), ELSTRING(common,Vehicle), LSTRING(MedicalFacilities), LSTRING(VehiclesAndFacilities), ELSTRING(common,Disabled)], 0],
    true
] call CBA_fnc_addSetting;

[
    QGVAR(medicAdenosine),
    "LIST",
    [LSTRING(MedicAdenosine_DisplayName), LSTRING(MedicAdenosine_Description)],
    LSTRING(Category),
    [[0, 1, 2], [LSTRING(Anyone), LSTRING(Medics), LSTRING(Doctors)], 0],
    true
] call CBA_fnc_addSetting;

[
    QGVAR(locationAdenosine),
    "LIST",
    [LSTRING(LocationAdenosine_DisplayName), LSTRING(LocationAdenosine_Description)],
    LSTRING(Category),
    [[0, 1, 2, 3, 4], [ELSTRING(common,Anywhere), ELSTRING(common,Vehicle), LSTRING(MedicalFacilities), LSTRING(VehiclesAndFacilities), ELSTRING(common,Disabled)], 0],
    true
] call CBA_fnc_addSetting;

[
    QGVAR(medicPAK),
    "LIST",
    [LSTRING(MedicPAK_DisplayName), LSTRING(MedicPAK_Description)],
    LSTRING(Category),
    [[0, 1, 2], [LSTRING(Anyone), LSTRING(Medics), LSTRING(Doctors)], 1],
    true
] call CBA_fnc_addSetting;

[
    QGVAR(locationPAK),
    "LIST",
    [LSTRING(LocationPAK_DisplayName), LSTRING(LocationPAK_Description)],
    LSTRING(Category),
    [[0, 1, 2, 3, 4], [ELSTRING(common,Anywhere), ELSTRING(common,Vehicle), LSTRING(MedicalFacilities), LSTRING(VehiclesAndFacilities), ELSTRING(common,Disabled)], 3],
    true
] call CBA_fnc_addSetting;

[
    QGVAR(consumePAK),
    "LIST",
    [LSTRING(ConsumePAK_DisplayName), LSTRING(ConsumePAK_Description)],
    LSTRING(Category),
    [[0, 1], [ELSTRING(common,No), ELSTRING(common,Yes)], 0],
    true
] call CBA_fnc_addSetting;

[
    QGVAR(allowSelfPAK),
    "LIST",
    [LSTRING(AllowSelfPAK_DisplayName), LSTRING(AllowSelfPAK_Description)],
    LSTRING(Category),
    [[0, 1], [ELSTRING(common,No), ELSTRING(common,Yes)], 0],
    true
] call CBA_fnc_addSetting;

[
    QGVAR(timeCoefficientPAK),
    "SLIDER",
    [LSTRING(TimeCoefficientPAK_DisplayName), LSTRING(TimeCoefficientPAK_Description)],
    LSTRING(Category),
    [0, 5, 1, 1],
    true
] call CBA_fnc_addSetting;

[
    QGVAR(medicSurgicalKit),
    "LIST",
    [LSTRING(MedicSurgicalKit_DisplayName), LSTRING(MedicSurgicalKit_Description)],
    LSTRING(Category),
    [[0, 1, 2], [LSTRING(Anyone), LSTRING(Medics), LSTRING(Doctors)], 1],
    true
] call CBA_fnc_addSetting;

[
    QGVAR(locationSurgicalKit),
    "LIST",
    [LSTRING(LocationSurgicalKit_DisplayName), LSTRING(LocationSurgicalKit_Description)],
    LSTRING(Category),
    [[0, 1, 2, 3, 4], [ELSTRING(common,Anywhere), ELSTRING(common,Vehicle), LSTRING(MedicalFacilities), LSTRING(VehiclesAndFacilities), ELSTRING(common,Disabled)], 2],
    true
] call CBA_fnc_addSetting;

[
    QGVAR(consumeSurgicalKit),
    "LIST",
    [LSTRING(ConsumeSurgicalKit_DisplayName), LSTRING(ConsumeSurgicalKit_Description)],
    LSTRING(Category),
    [[0, 1, 2], ["str_eval_typenothing", LSTRING(SurgicalKit_Display), LSTRING(Suture_Display)], 0],
    true
] call CBA_fnc_addSetting;

[
    QGVAR(allowSelfStitch),
    "LIST",
    [LSTRING(AllowSelfStitch_DisplayName), LSTRING(AllowSelfStitch_Description)],
    LSTRING(Category),
    [[0, 1], [ELSTRING(common,No), ELSTRING(common,Yes)], 0],
    true
] call CBA_fnc_addSetting;

[
    QGVAR(woundStitchTime),
    "SLIDER",
    [LSTRING(WoundStitchTime_DisplayName), LSTRING(WoundStitchTime_Description)],
    LSTRING(Category),
    [0.1, 60, 5, 1],
    true
] call CBA_fnc_addSetting;

[
    QGVAR(medicIV),
    "LIST",
    [LSTRING(MedicIV_DisplayName), LSTRING(MedicIV_Description)],
    LSTRING(Category),
    [[0, 1, 2], [LSTRING(Anyone), LSTRING(Medics), LSTRING(Doctors)], 1],
    true
] call CBA_fnc_addSetting;

[
    QGVAR(locationIV),
    "LIST",
    [LSTRING(LocationIV_DisplayName), LSTRING(LocationIV_Description)],
    LSTRING(Category),
    [[0, 1, 2, 3, 4], [ELSTRING(common,Anywhere), ELSTRING(common,Vehicle), LSTRING(MedicalFacilities), LSTRING(VehiclesAndFacilities), ELSTRING(common,Disabled)], 0],
    1
] call CBA_fnc_addSetting;

[
    QGVAR(allowSelfIV),
    "LIST",
    [LSTRING(AllowSelfIV_DisplayName), LSTRING(AllowSelfIV_Description)],
    LSTRING(Category),
    [[0, 1], [ELSTRING(common,No), ELSTRING(common,Yes)], 1],
    true
] call CBA_fnc_addSetting;

[
    QGVAR(treatmentTimeIV),
    "SLIDER",
    [LSTRING(TreatmentTimeIV_DisplayName), LSTRING(TreatmentTimeIV_Description)],
    LSTRING(Category),
    [0.1, 60, 12, 1],
    true
] call CBA_fnc_addSetting;

[
    QGVAR(cprSuccessChanceMin),
    "SLIDER",
    [LSTRING(CPRSuccessChanceMin_DisplayName), LSTRING(CPRSuccessChanceMin_Description)],
    LSTRING(Category),
    [0, 1, 0.4, 2, true],
    true
] call CBA_fnc_addSetting;

[
    QGVAR(cprSuccessChanceMax),
    "SLIDER",
    [LSTRING(CPRSuccessChanceMax_DisplayName), LSTRING(CPRSuccessChanceMax_Description)],
    LSTRING(Category),
    [0, 1, 0.4, 2, true],
    true
] call CBA_fnc_addSetting;

[
    QGVAR(treatmentTimeCPR),
    "SLIDER",
    [LSTRING(TreatmentTimeCPR_DisplayName), LSTRING(TreatmentTimeCPR_Description)],
    LSTRING(Category),
    [0.1, 60, 15, 1],
    true
] call CBA_fnc_addSetting;

[
    QGVAR(treatmentTimeCoeffZeus),
    "SLIDER",
    [LSTRING(TreatmentTimeCoeffZeus_DisplayName), LSTRING(TreatmentTimeCoeffZeus_Description)],
    LSTRING(Category),
    [0, 10, 1, 2]
] call CBA_fnc_addSetting;

[
    QGVAR(allowBodyBagUnconscious),
    "CHECKBOX",
    [LSTRING(AllowBodyBagUnconscious_DisplayName), LSTRING(AllowBodyBagUnconscious_Description)],
    LSTRING(Category),
    false,
    true
] call CBA_fnc_addSetting;

[
    QGVAR(allowGraveDigging),
    "LIST",
    [LSTRING(AllowGraveDigging_DisplayName), LSTRING(AllowGraveDigging_Description)],
    LSTRING(Category),
    [[0, 1, 2], [ELSTRING(common,Disabled), LSTRING(AllowGraveDigging_graveOnlyDead), ELSTRING(common,Yes)], 1],
    true
] call CBA_fnc_addSetting;

[
    QGVAR(graveDiggingMarker),
    "CHECKBOX",
    [LSTRING(GraveDiggingMarker_DisplayName), LSTRING(GraveDiggingMarker_Description)],
    LSTRING(Category),
    true,
    true
] call CBA_fnc_addSetting;

[
    QGVAR(holsterRequired),
    "LIST",
    [LSTRING(HolsterRequired_DisplayName), LSTRING(HolsterRequired_Description)],
    LSTRING(Category),
    [[0, 1, 2, 3, 4], [ELSTRING(common,Disabled), LSTRING(HolsterRequired_Lowered), LSTRING(HolsterRequired_LoweredExam), LSTRING(HolsterRequired_Holstered), LSTRING(HolsterRequired_HolsteredExam)], 0],
    true
] call CBA_fnc_addSetting;

[
    QGVAR(allowLitterCreation),
    "CHECKBOX",
    [LSTRING(AllowLitterCreation_DisplayName), LSTRING(AllowLitterCreation_Description)],
    [LSTRING(Category), LSTRING(SubCategory_Litter)],
    true,
    true
] call CBA_fnc_addSetting;

[
    QGVAR(maxLitterObjects),
    "LIST",
    [LSTRING(MaxLitterObjects_DisplayName), LSTRING(MaxLitterObjects_Description)],
    [LSTRING(Category), LSTRING(SubCategory_Litter)],
    [[50, 100, 200, 300, 400, 500, 1000, 2000, 3000, 4000, 5000], [/* settings function will auto create names */], 5],
    true
] call CBA_fnc_addSetting;

[
    QGVAR(litterCleanupDelay),
    "SLIDER",
    [LSTRING(LitterCleanupDelay_DisplayName), LSTRING(LitterCleanupDelay_Description)],
    [LSTRING(Category), LSTRING(SubCategory_Litter)],
    [-1, 3600, 600, 0],
    true
] call CBA_fnc_addSetting;
