
class GVAR(Actions) {
    // --- bandages
    class BasicBandage {
        displayName = CSTRING(Bandage);
        displayNameProgress = CSTRING(Bandaging);
        category = "bandage";
        treatmentLocations[] = {"All"};
        allowedSelections[] = {"All"};
        allowSelfTreatment = 1;
        requiredMedic = 0;
        treatmentTime = QFUNC(getBandageTime);
        treatmentTimeSelfCoef = 1;
        items[] = {{"ACE_fieldDressing", "ACE_packingBandage", "ACE_elasticBandage", "ACE_quikclot"}};
        condition = QUOTE(!EGVAR(medical,advancedBandages));
        itemConsumed = 1;
        callbackSuccess = QFUNC(treatmentBandage);
        callbackFailure = "";
        callbackProgress = "";

        animationPatient = "";
        animationPatientUnconscious = "AinjPpneMstpSnonWrflDnon_rolltoback";
        animationPatientUnconsciousExcludeOn[] = {"ainjppnemstpsnonwrfldnon"};
        animationCaller = "AinvPknlMstpSlayW[wpn]Dnon_medicOther";
        animationCallerProne = "AinvPpneMstpSlayW[wpn]Dnon_medicOther";
        animationCallerSelf = "AinvPknlMstpSlayW[wpn]Dnon_medic";
        animationCallerSelfProne = "AinvPpneMstpSlayW[wpn]Dnon_medic";
        litter[] = {
            {"All", "_bloodLossOnBodyPart > 0", {{"ACE_MedicalLitterBase", "ACE_MedicalLitter_bandage1", "ACE_MedicalLitter_bandage2", "ACE_MedicalLitter_bandage3"}}},
            {"All", "_bloodLossOnBodyPart <= 0", {"ACE_MedicalLitter_clean"}}
        };
    };
    class FieldDressing: BasicBandage {
        displayName = CSTRING(Actions_FieldDressing);
        items[] = {"ACE_fieldDressing"};
        condition = QEGVAR(medical,advancedBandages);
        litter[] = {
            {"All", "_bloodLossOnBodyPart > 0", {{"ACE_MedicalLitter_bandage2", "ACE_MedicalLitter_bandage3"}}},
            {"All", "_bloodLossOnBodyPart <= 0", {"ACE_MedicalLitter_clean"}}
        };
    };
    class PackingBandage: BasicBandage {
        displayName = CSTRING(Actions_PackingBandage);
        items[] = {"ACE_packingBandage"};
        condition = QEGVAR(medical,advancedBandages);
        litter[] = {
            {"All", "", {"ACE_MedicalLitter_packingBandage"}},
            {"All", "_bloodLossOnBodyPart > 0", {{"ACE_MedicalLitter_bandage2", "ACE_MedicalLitter_bandage3"}}},
            {"All", "_bloodLossOnBodyPart <= 0", {"ACE_MedicalLitter_clean"}}
        };
    };
    class ElasticBandage: BasicBandage {
        displayName = CSTRING(Actions_ElasticBandage);
        items[] = {"ACE_elasticBandage"};
        condition = QEGVAR(medical,advancedBandages);
        litter[] = {
            {"All", "_bloodLossOnBodyPart > 0", {{"ACE_MedicalLitter_bandage2", "ACE_MedicalLitter_bandage3"}}},
            {"All", "_bloodLossOnBodyPart <= 0", {"ACE_MedicalLitter_clean"}}
        };
    };
    class QuikClot: BasicBandage {
        displayName = CSTRING(Actions_QuikClot);
        items[] = {"ACE_quikclot"};
        condition = QEGVAR(medical,advancedBandages);
        litter[] = {
            {"All", "", {"ACE_MedicalLitter_QuickClot"}},
            {"All", "_bloodLossOnBodyPart > 0", {{"ACE_MedicalLitter_bandage2", "ACE_MedicalLitter_bandage3"}}},
            {"All", "_bloodLossOnBodyPart <= 0", {"ACE_MedicalLitter_clean"}}
        };
    };

    // --- tourniquet
    class Tourniquet: BasicBandage {
        displayName = CSTRING(Apply_Tourniquet);
        displayNameProgress = CSTRING(Applying_Tourniquet);
        allowedSelections[] = {"LeftArm", "RightArm", "LeftLeg", "RightLeg"};
        items[] = {"ACE_tourniquet"};
        treatmentTime = 7;
        callbackSuccess = QFUNC(treatmentTourniquet);
        condition = QUOTE(!([ARR_2(_target,_bodyPart)] call FUNC(hasTourniquetAppliedTo)));
        litter[] = {};
    };
    class RemoveTourniquet: Tourniquet {
        displayName = CSTRING(Actions_RemoveTourniquet);
        displayNameProgress = CSTRING(RemovingTourniquet);
        items[] = {};
        callbackSuccess = QFUNC(treatmentTourniquetRemove);
        condition = QUOTE([ARR_2(_target,_bodyPart)] call FUNC(hasTourniquetAppliedTo));
    };

    // --- syringes
    class Morphine: FieldDressing {
        displayName = CSTRING(Inject_Morphine);
        displayNameProgress = CSTRING(Injecting_Morphine);
        allowedSelections[] = {"LeftArm", "RightArm", "LeftLeg", "RightLeg"};
        category = "medication";
        items[] = {"ACE_morphine"};
        condition = "";
        treatmentTime = 5;
        callbackSuccess = QFUNC(treatmentMedication);
        animationCaller = "AinvPknlMstpSnonWnonDnon_medic1";
        litter[] = { {"All", "", {"ACE_MedicalLitter_morphine"}} };
        sounds[] = {{QPATHTO_R(sounds\Inject.ogg),1,1,50}};
    };
    class Adenosine: Morphine {
        displayName = CSTRING(Inject_Adenosine);
        displayNameProgress = CSTRING(Injecting_Adenosine);
        condition = QEGVAR(medical,advancedMedication);
        items[] = {"ACE_adenosine"};
        litter[] = { {"All", "", {"ACE_MedicalLitter_adenosine"}} };
    };
    class Atropine: Morphine {
        displayName = CSTRING(Inject_Atropine);
        displayNameProgress = CSTRING(Injecting_Atropine);
        condition = QEGVAR(medical,advancedMedication);
        items[] = {"ACE_atropine"};
        litter[] = { {"All", "", {"ACE_MedicalLitter_atropine"}} };
    };
    class Epinephrine: Morphine {
        displayName = CSTRING(Inject_Epinephrine);
        displayNameProgress = CSTRING(Injecting_Epinephrine);
        requiredMedic = QEGVAR(medical,medicSetting_Epi);
        items[] = {"ACE_epinephrine"};
        litter[] = { {"All", "", {"ACE_MedicalLitter_epinephrine"}} };
        treatmentLocations[] = {QEGVAR(medical,useLocation_Epi)};
    };

    // --- iv bags
    class BloodIV: BasicBandage {
        displayName = CSTRING(Actions_Blood4_1000);
        displayNameProgress = CSTRING(Transfusing_Blood);
        allowedSelections[] = {"LeftArm", "RightArm", "LeftLeg", "RightLeg"};
        allowSelfTreatment = QEGVAR(medical,allowSelfIV);
        category = "advanced";
        requiredMedic = 1;
        treatmentTime = 12;
        items[] = {"ACE_bloodIV"};
        condition = "";
        callbackSuccess = QFUNC(treatmentIV);
        animationCaller = "AinvPknlMstpSnonWnonDnon_medic1";
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
        animationCaller = "AinvPknlMstpSnonWnonDnon_medic1";
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
        animationCaller = "AinvPknlMstpSnonWnonDnon_medic1";
    };
    class SalineIV_500: SalineIV {
        displayName = CSTRING(Actions_Saline4_500);
        items[] = {"ACE_salineIV_500"};
    };
    class SalineIV_250: SalineIV {
        displayName = CSTRING(Actions_Saline4_250);
        items[] = {"ACE_salineIV_250"};
    };

    // --- diagnose
    class Diagnose: BasicBandage {
        displayName = CSTRING(Actions_Diagnose);
        displayNameProgress = CSTRING(Actions_Diagnosing);
        category = "examine";
        treatmentLocations[] = {"All"};
        allowedSelections[] = {"Head", "Body"};
        requiredMedic = 0;
        treatmentTime = 2.5;
        items[] = {};
        condition = QUOTE(!EGVAR(medical,advancedDiagnose));
        callbackSuccess = QFUNC(actionDiagnose);
        callbackFailure = "";
        callbackProgress = "";
        animationPatient = "";
        animationCaller = ""; // TODO
        itemConsumed = 0;
        litter[] = {};
    };
    class CheckPulse: Diagnose {
        displayName = CSTRING(Actions_CheckPulse);
        displayNameProgress = CSTRING(Check_Pulse_Content);
        allowedSelections[] = {"All"};
        condition = QEGVAR(medical,advancedDiagnose);
        callbackSuccess = QFUNC(actionCheckPulse);
        animationCallerProne = "";
        animationCallerSelfProne = "";
    };
    class CheckBloodPressure: CheckPulse {
        displayName = CSTRING(Actions_CheckBloodPressure);
        displayNameProgress = CSTRING(Check_Bloodpressure_Content);
        allowedSelections[] = {"LeftArm", "RightArm", "LeftLeg", "RightLeg"};
        callbackSuccess = QFUNC(actionCheckBloodPressure);
    };
    class CheckResponse: CheckPulse {
        displayName = CSTRING(Check_Response);
        displayNameProgress = CSTRING(Check_Response_Content);
        allowedSelections[] = {"Head"};
        allowSelfTreatment = 0;
        callbackSuccess = QFUNC(actionCheckResponse);
    };

    // --- misc
    class BodyBag: BasicBandage {
        displayName = CSTRING(PlaceInBodyBag);
        displayNameProgress = CSTRING(PlacingInBodyBag);
        category = "advanced";
        treatmentLocations[] = {"All"};
        allowSelfTreatment = 0;
        requiredMedic = 0;
        treatmentTime = 15;
        items[] = {"ACE_bodyBag"};
        condition = "!alive _target";
        callbackSuccess = QFUNC(actionPlaceInBodyBag);
        callbackFailure = "";
        callbackProgress = "";
        animationPatient = "";
        animationPatientUnconscious = "";
        itemConsumed = 1;
        litter[] = {};
    };
    class CPR: BasicBandage {
        displayName = CSTRING(Actions_CPR);
        displayNameProgress = CSTRING(Actions_PerformingCPR);
        category = "advanced";
        treatmentLocations[] = {"All"};
        allowedSelections[] = {"Body"};
        allowSelfTreatment = 0;
        requiredMedic = 0;
        treatmentTime = 15;
        items[] = {};
        condition = QUOTE(!(_target call EFUNC(common,isAwake)) && {!(_target getVariable [ARR_2('GVAR(receiveCPR)', false)])});
        callbackSuccess = QFUNC(treatmentCPR);
        callbackFailure = QFUNC(treatmentCPR_failure);
        callbackProgress = QFUNC(treatmentCPR_progress);
        callbackStart = QFUNC(treatmentCPR_start);
        animationPatient = "";
        animationPatientUnconscious = "AinjPpneMstpSnonWrflDnon_rolltoback";
        animationCaller = "AinvPknlMstpSlayW[wpn]Dnon_medic";
        animationCallerProne = "AinvPpneMstpSlayW[wpn]Dnon_medic";
        animationCallerSelf = "";
        animationCallerSelfProne = "";
        itemConsumed = 0;
        litter[] = {};
    };

    class SurgicalKit: FieldDressing {
        displayName = CSTRING(Use_SurgicalKit);
        displayNameProgress = CSTRING(Stitching);
        category = "advanced";
        items[] = {"ACE_surgicalKit"};
        treatmentLocations[] = {QEGVAR(medical,useLocation_SurgicalKit)};
        allowSelfTreatment = 0;
        requiredMedic = QEGVAR(medical,medicSetting_SurgicalKit);
        treatmentTime = QUOTE(count (_target getVariable [ARR_2('EGVAR(medical,bandagedWounds)',[])]) * 5);
        callbackSuccess = "";
        callbackProgress = QFUNC(treatmentSurgicalKit_onProgress);
        itemConsumed = QEGVAR(medical,consumeItem_SurgicalKit);
        animationCaller = "AinvPknlMstpSnonWnonDnon_medic1";
        litter[] = { {"All", "", {"ACE_MedicalLitter_gloves"} }};
    };
    class PersonalAidKit: BasicBandage {
        displayName = CSTRING(Use_Aid_Kit);
        displayNameProgress = CSTRING(TreatmentAction);
        category = "advanced";
        condition = QUOTE(_target call EFUNC(medical_status,isInStableCondition));
        items[] = {"ACE_personalAidKit"};
        treatmentLocations[] = {QEGVAR(medical,useLocation_PAK)};
        requiredMedic = QEGVAR(medical,medicSetting_PAK);
        treatmentTime = QUOTE(_target call FUNC(healTime));
        callbackSuccess = QFUNC(treatmentFullHeal);
        itemConsumed = QEGVAR(medical,consumeItem_PAK);
        animationPatient = "";
        animationPatientUnconscious = "AinjPpneMstpSnonWrflDnon_rolltoback";
        animationCaller = "AinvPknlMstpSlayW[wpn]Dnon_medicOther";
        animationCallerProne = "AinvPpneMstpSlayW[wpn]Dnon_medicOther";
        animationCallerSelf = "";
        animationCallerSelfProne = "";
        litter[] = { {"All", "", {"ACE_MedicalLitter_gloves"}},
            {"All", "_bloodLossOnBodyPart > 0", {{"ACE_MedicalLitterBase", "ACE_MedicalLitter_bandage1", "ACE_MedicalLitter_bandage2", "ACE_MedicalLitter_bandage3"}}},
            {"All", "_bloodLossOnBodyPart > 0", {{"ACE_MedicalLitterBase", "ACE_MedicalLitter_bandage1", "ACE_MedicalLitter_bandage2", "ACE_MedicalLitter_bandage3"}}},
            {"All", "_bloodLossOnBodyPart <= 0", {"ACE_MedicalLitter_clean"}}
        };
    };
    class MedKit: PersonalAidKit {
        displayName = CSTRING(Use_Med_Kit);
        items[] = {"ACE_medKit"};
        treatmentLocations[] = {QEGVAR(medical,useLocation_MedKit)};
        requiredMedic = QEGVAR(medical,medicSetting_MedKit);
        treatmentTime = QUOTE(_target call FUNC(HealTimeMedkit));
        callbackSuccess = QFUNC(treatmentPartialHeal);
        itemConsumed = QEGVAR(medical,consumeItem_MedKit);
    };
};
