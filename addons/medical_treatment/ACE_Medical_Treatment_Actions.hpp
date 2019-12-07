class GVAR(actions) {
    // - Bandages -------------------------------------------------------------
    class BasicBandage {
        displayName = CSTRING(Bandage);
        displayNameProgress = CSTRING(Bandaging);
        icon = QPATHTOEF(medical_gui,ui\bandage.paa);
        category = "bandage";

        consumeItem = 1;
        items[] = {"ACE_fieldDressing", "ACE_packingBandage", "ACE_elasticBandage", "ACE_quikclot"};

        medicRequired = 0;
        allowSelfTreatment = 1;
        allowedSelections[] = {"All"};
        condition = QFUNC(canBandage);
        treatmentLocations = TREATMENT_LOCATIONS_ALL;

        treatmentTime = QFUNC(getBandageTime);
        treatmentTimeSelfCoef = 1; // todo: this isn't used anywhere, remove?

        callbackStart = "";
        callbackProgress = "";
        callbackSuccess = QFUNC(bandage);
        callbackFailure = "";

        animationMedic = "AinvPknlMstpSlayW[wpn]Dnon_medicOther";
        animationMedicProne = "AinvPpneMstpSlayW[wpn]Dnon_medicOther";
        animationMedicSelf = "AinvPknlMstpSlayW[wpn]Dnon_medic";
        animationMedicSelfProne = "AinvPpneMstpSlayW[wpn]Dnon_medic";

        litter[] = {
            {},
            {"ACE_MedicalLitter_clean"},
            {{"ACE_MedicalLitterBase", "ACE_MedicalLitter_bandage1", "ACE_MedicalLitter_bandage2", "ACE_MedicalLitter_bandage3"}}
        };
    };
    class FieldDressing: BasicBandage {
        displayName = CSTRING(Actions_FieldDressing);
        items[] = {"ACE_fieldDressing"};
        litter[] = {
            {},
            {"ACE_MedicalLitter_clean"},
            {{"ACE_MedicalLitter_bandage2", "ACE_MedicalLitter_bandage3"}}
        };
    };
    class PackingBandage: BasicBandage {
        displayName = CSTRING(Actions_PackingBandage);
        icon = QPATHTOEF(medical_gui,ui\packing_bandage.paa);
        items[] = {"ACE_packingBandage"};
        litter[] = {
            {"ACE_MedicalLitter_packingBandage"},
            {"ACE_MedicalLitter_clean"},
            {{"ACE_MedicalLitter_bandage2", "ACE_MedicalLitter_bandage3"}}
        };
    };
    class ElasticBandage: BasicBandage {
        displayName = CSTRING(Actions_ElasticBandage);
        items[] = {"ACE_elasticBandage"};
        litter[] = {
            {},
            {"ACE_MedicalLitter_clean"},
            {{"ACE_MedicalLitter_bandage2", "ACE_MedicalLitter_bandage3"}}
        };
    };
    class QuikClot: BasicBandage {
        displayName = CSTRING(Actions_QuikClot);
        items[] = {"ACE_quikclot"};
        litter[] = {
            {"ACE_MedicalLitter_QuickClot"},
            {"ACE_MedicalLitter_clean"},
            {{"ACE_MedicalLitter_bandage2", "ACE_MedicalLitter_bandage3"}}
        };
    };

    // - Tourniquets ----------------------------------------------------------
    class ApplyTourniquet: BasicBandage {
        displayName = CSTRING(Apply_Tourniquet);
        displayNameProgress = CSTRING(Applying_Tourniquet);
        icon = QPATHTOEF(medical_gui,ui\tourniquet.paa);
        allowedSelections[] = {"LeftArm", "RightArm", "LeftLeg", "RightLeg"};
        items[] = {"ACE_tourniquet"};
        treatmentTime = 7;
        condition = QUOTE(!([ARR_2(_patient,_bodyPart)] call FUNC(hasTourniquetAppliedTo)));
        callbackSuccess = QFUNC(tourniquet);
        litter[] = {};
    };
    class RemoveTourniquet: ApplyTourniquet {
        displayName = CSTRING(Actions_RemoveTourniquet);
        displayNameProgress = CSTRING(RemovingTourniquet);
        items[] = {};
        condition = QUOTE([ARR_2(_patient,_bodyPart)] call FUNC(hasTourniquetAppliedTo));
        callbackSuccess = QFUNC(tourniquetRemove);
    };

    // - Splint ---------------------------------------------------------------
    class Splint: BasicBandage {
        displayName = CSTRING(Apply_Splint);
        displayNameProgress = CSTRING(Applying_Splint);
        category = "bandage";
        icon = QPATHTOEF(medical_gui,ui\splint.paa);
        allowedSelections[] = {"LeftArm", "RightArm", "LeftLeg", "RightLeg"};
        items[] = {"ACE_splint"};
        treatmentTime = 7;
        callbackSuccess = QFUNC(splint);
        condition = QFUNC(canSplint);
        litter[] = {
            {"ACE_MedicalLitter_splint"}, {}, {}
        };
    };

    // - Syringes -------------------------------------------------------------
    class Morphine: FieldDressing {
        displayName = CSTRING(Inject_Morphine);
        displayNameProgress = CSTRING(Injecting_Morphine);
        icon = QPATHTOEF(medical_gui,ui\auto_injector.paa);
        allowedSelections[] = {"LeftArm", "RightArm", "LeftLeg", "RightLeg"};
        category = "medication";
        items[] = {"ACE_morphine"};
        condition = "";
        treatmentTime = 5;
        callbackSuccess = QFUNC(medication);
        animationMedic = "AinvPknlMstpSnonWnonDnon_medic1";
        sounds[] = {{QPATHTO_R(sounds\Inject.ogg),1,1,50}};
        litter[] = {{"ACE_MedicalLitter_morphine"}};
    };
    class Adenosine: Morphine {
        displayName = CSTRING(Inject_Adenosine);
        displayNameProgress = CSTRING(Injecting_Adenosine);
        condition = QGVAR(advancedMedication);
        items[] = {"ACE_adenosine"};
        litter[] = {{"ACE_MedicalLitter_adenosine"}};
    };
    class Epinephrine: Morphine {
        displayName = CSTRING(Inject_Epinephrine);
        displayNameProgress = CSTRING(Injecting_Epinephrine);
        medicRequired = QGVAR(medicEpinephrine);
        items[] = {"ACE_epinephrine"};
        treatmentLocations = QGVAR(locationEpinephrine);
        litter[] = {{"ACE_MedicalLitter_epinephrine"}};
    };

    // - IV Bags --------------------------------------------------------------
    class BloodIV: BasicBandage {
        displayName = CSTRING(Actions_Blood4_1000);
        displayNameProgress = CSTRING(Transfusing_Blood);
        icon = QPATHTOEF(medical_gui,ui\iv.paa);
        allowedSelections[] = {"LeftArm", "RightArm", "LeftLeg", "RightLeg"};
        allowSelfTreatment = QGVAR(allowSelfIV);
        category = "advanced";
        medicRequired = 1;
        treatmentTime = 12;
        items[] = {"ACE_bloodIV"};
        condition = "";
        callbackSuccess = QFUNC(ivBag);
        animationMedic = "AinvPknlMstpSnonWnonDnon_medic1";
        litter[] = {};
    };
    class BloodIV_500: BloodIV {
        displayName = CSTRING(Actions_Blood4_500);
        items[] = {"ACE_bloodIV_500"};
    };
    class BloodIV_250: BloodIV {
        displayName = CSTRING(Actions_Blood4_250);
        items[] = {"ACE_bloodIV_250"};
    };
    class PlasmaIV: BloodIV {
        displayName = CSTRING(Actions_Plasma4_1000);
        displayNameProgress = CSTRING(Transfusing_Plasma);
        items[] = {"ACE_plasmaIV"};
        animationMedic = "AinvPknlMstpSnonWnonDnon_medic1";
    };
    class PlasmaIV_500: PlasmaIV {
        displayName = CSTRING(Actions_Plasma4_500);
        items[] = {"ACE_plasmaIV_500"};
    };
    class PlasmaIV_250: PlasmaIV {
        displayName = CSTRING(Actions_Plasma4_250);
        items[] = {"ACE_plasmaIV_250"};
    };
    class SalineIV: BloodIV {
        displayName = CSTRING(Actions_Saline4_1000);
        displayNameProgress = CSTRING(Transfusing_Saline);
        items[] = {"ACE_salineIV"};
        animationMedic = "AinvPknlMstpSnonWnonDnon_medic1";
    };
    class SalineIV_500: SalineIV {
        displayName = CSTRING(Actions_Saline4_500);
        items[] = {"ACE_salineIV_500"};
    };
    class SalineIV_250: SalineIV {
        displayName = CSTRING(Actions_Saline4_250);
        items[] = {"ACE_salineIV_250"};
    };

    // - Diagnose -------------------------------------------------------------
    class Diagnose: BasicBandage {
        displayName = CSTRING(Actions_Diagnose);
        displayNameProgress = CSTRING(Actions_Diagnosing);
        icon = "";
        category = "examine";
        treatmentLocations = TREATMENT_LOCATIONS_ALL;
        allowedSelections[] = {"Head", "Body"};
        medicRequired = 0;
        treatmentTime = 2.5;
        items[] = {};
        condition = QUOTE(!GVAR(advancedDiagnose));
        callbackSuccess = QFUNC(diagnose);
        callbackFailure = "";
        callbackProgress = "";
        animationMedic = ""; // TODO
        consumeItem = 0;
        litter[] = {};
    };
    class CheckPulse: Diagnose {
        displayName = CSTRING(Actions_CheckPulse);
        displayNameProgress = CSTRING(Check_Pulse_Content);
        allowedSelections[] = {"All"};
        condition = QGVAR(advancedDiagnose);
        callbackSuccess = QFUNC(checkPulse);
        animationMedicProne = "";
        animationMedicSelfProne = "";
    };
    class CheckBloodPressure: CheckPulse {
        displayName = CSTRING(Actions_CheckBloodPressure);
        displayNameProgress = CSTRING(Check_Bloodpressure_Content);
        allowedSelections[] = {"LeftArm", "RightArm", "LeftLeg", "RightLeg"};
        callbackSuccess = QFUNC(checkBloodPressure);
    };
    class CheckResponse: CheckPulse {
        displayName = CSTRING(Check_Response);
        displayNameProgress = CSTRING(Check_Response_Content);
        allowedSelections[] = {"Head"};
        allowSelfTreatment = 0;
        callbackSuccess = QFUNC(checkResponse);
    };

    // - Misc -----------------------------------------------------------------
    class BodyBag: BasicBandage {
        displayName = CSTRING(PlaceInBodyBag);
        displayNameProgress = CSTRING(PlacingInBodyBag);
        icon = QPATHTOEF(medical_gui,ui\bodybag.paa);
        category = "advanced";
        treatmentLocations = TREATMENT_LOCATIONS_ALL;
        allowSelfTreatment = 0;
        medicRequired = 0;
        treatmentTime = 15;
        items[] = {"ACE_bodyBag"};
        condition = QUOTE(!alive _patient);
        callbackSuccess = QFUNC(placeInBodyBag);
        consumeItem = 1;
        litter[] = {};
    };
    class CPR: BasicBandage {
        displayName = CSTRING(Actions_CPR);
        displayNameProgress = CSTRING(Actions_PerformingCPR);
        icon = "";
        category = "advanced";
        treatmentLocations = TREATMENT_LOCATIONS_ALL;
        allowedSelections[] = {"Body"};
        allowSelfTreatment = 0;
        medicRequired = 0;
        treatmentTime = 15;
        items[] = {};
        condition = QFUNC(canCPR);
        callbackSuccess = QFUNC(cprSuccess);
        callbackFailure = QFUNC(cprFailure);
        callbackProgress = QFUNC(cprProgress);
        callbackStart = QFUNC(cprStart);
        animationMedic = "AinvPknlMstpSnonWnonDr_medic0";
        animationMedicProne = "AinvPknlMstpSnonWnonDr_medic0";
        animationMedicSelf = "";
        animationMedicSelfProne = "";
        consumeItem = 0;
        litter[] = {};
    };
    class SurgicalKit: FieldDressing {
        displayName = CSTRING(Use_SurgicalKit);
        displayNameProgress = CSTRING(Stitching);
        icon = QPATHTOEF(medical_gui,ui\surgical_kit.paa);
        category = "advanced";
        items[] = {"ACE_surgicalKit"};
        treatmentLocations = QGVAR(locationSurgicalKit);
        allowSelfTreatment = QGVAR(allowSelfStitch);
        medicRequired = QGVAR(medicSurgicalKit);
        treatmentTime = QFUNC(getStitchTime);
        condition = QFUNC(canStitch);
        callbackSuccess = "";
        callbackProgress = QFUNC(surgicalKitProgress);
        consumeItem = QGVAR(consumeSurgicalKit);
        animationMedic = "AinvPknlMstpSnonWnonDnon_medic1";
        litter[] = {{"ACE_MedicalLitter_gloves"}};
    };
    class PersonalAidKit: BasicBandage {
        displayName = CSTRING(Use_Aid_Kit);
        displayNameProgress = CSTRING(TreatmentAction);
        icon = "";
        category = "advanced";
        condition = QUOTE(_patient call EFUNC(medical_status,isInStableCondition));
        items[] = {"ACE_personalAidKit"};
        treatmentLocations = QGVAR(locationPAK);
        medicRequired = QGVAR(medicPAK);
        treatmentTime = QFUNC(getHealTime);
        callbackSuccess = QFUNC(fullHeal);
        consumeItem = QGVAR(consumePAK);
        animationMedic = "AinvPknlMstpSlayW[wpn]Dnon_medicOther";
        animationMedicProne = "AinvPpneMstpSlayW[wpn]Dnon_medicOther";
        animationMedicSelf = "";
        animationMedicSelfProne = "";
        litter[] = {
            {"ACE_MedicalLitter_gloves"},
            {"ACE_MedicalLitter_clean"},
            {
                {"ACE_MedicalLitterBase", "ACE_MedicalLitter_bandage1", "ACE_MedicalLitter_bandage2", "ACE_MedicalLitter_bandage3"},
                {"ACE_MedicalLitterBase", "ACE_MedicalLitter_bandage1", "ACE_MedicalLitter_bandage2", "ACE_MedicalLitter_bandage3"}
            }
        };
    };
};
