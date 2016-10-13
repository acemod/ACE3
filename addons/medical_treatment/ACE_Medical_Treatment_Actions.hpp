
class GVAR(Actions) {
    // --- bandages
    class BasicBandage {
        displayName = ECSTRING(medical,Bandage);
        displayNameProgress = ECSTRING(medical,Bandaging);
        category = "bandage";
        treatmentLocations[] = {"All"};
        allowedSelections[] = {"All"};
        allowSelfTreatment = 1;
        requiredMedic = 0;
        treatmentTime = 5;
        treatmentTimeSelfCoef = 1;
        items[] = {{"ACE_fieldDressing", "ACE_packingBandage", "ACE_elasticBandage", "ACE_quikclot"}};
        condition = QUOTE(!EGVAR(medical,advancedBandages));
        patientStateCondition = 0;
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
        displayName = ECSTRING(medical,Actions_FieldDressing);
        items[] = {"ACE_fieldDressing"};
        condition = QEGVAR(medical,advancedBandages);
        litter[] = {
            {"All", "_bloodLossOnBodyPart > 0", {{"ACE_MedicalLitter_bandage2", "ACE_MedicalLitter_bandage3"}}},
            {"All", "_bloodLossOnBodyPart <= 0", {"ACE_MedicalLitter_clean"}}
        };
    };
    class PackingBandage: BasicBandage {
        displayName = ECSTRING(medical,Actions_PackingBandage);
        items[] = {"ACE_packingBandage"};
        condition = QEGVAR(medical,advancedBandages);
        litter[] = {
            {"All", "", {"ACE_MedicalLitter_packingBandage"}},
            {"All", "_bloodLossOnBodyPart > 0", {{"ACE_MedicalLitter_bandage2", "ACE_MedicalLitter_bandage3"}}},
            {"All", "_bloodLossOnBodyPart <= 0", {"ACE_MedicalLitter_clean"}}
        };
    };
    class ElasticBandage: BasicBandage {
        displayName = ECSTRING(medical,Actions_ElasticBandage);
        items[] = {"ACE_elasticBandage"};
        condition = QEGVAR(medical,advancedBandages);
        litter[] = {
            {"All", "_bloodLossOnBodyPart > 0", {{"ACE_MedicalLitter_bandage2", "ACE_MedicalLitter_bandage3"}}},
            {"All", "_bloodLossOnBodyPart <= 0", {"ACE_MedicalLitter_clean"}}
        };
    };
    class QuikClot: BasicBandage {
        displayName = ECSTRING(medical,Actions_QuikClot);
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
        displayName = ECSTRING(medical,Apply_Tourniquet);
        displayNameProgress = ECSTRING(medical,Applying_Tourniquet);
        allowedSelections[] = {"LeftArm", "RightArm", "LeftLeg", "RightLeg"};
        items[] = {"ACE_tourniquet"};
        treatmentTime = 4;
        callbackSuccess = QFUNC(treatmentTourniquet);
        condition = QUOTE(EGVAR(medical,advancedBandages) && {!([ARR_2(_target,_bodyPart)] call EFUNC(medical,hasTourniquetAppliedTo))});
        litter[] = {};
    };
    class RemoveTourniquet: Tourniquet {
        displayName = ECSTRING(medical,Actions_RemoveTourniquet);
        displayNameProgress = ECSTRING(medical,RemovingTourniquet);
        items[] = {};
        treatmentTime = 2.5;
        callbackSuccess = QFUNC(treatmentTourniquetRemove);
        condition = QUOTE(EGVAR(medical,advancedBandages) && {[ARR_2(_target,_bodyPart)] call EFUNC(medical,hasTourniquetAppliedTo)});
    };

    // --- syringes
    class Morphine: BasicBandage {
        displayName = ECSTRING(medical,Inject_Morphine);
        displayNameProgress = ECSTRING(medical,Injecting_Morphine);
        allowedSelections[] = {"LeftArm", "RightArm", "LeftLeg", "RightLeg"};
        allowSelfTreatment = 1;
        category = "medication";
        treatmentTime = 8;
        items[] = {"ACE_morphine"};
        condition = "";
        callbackSuccess = QFUNC(treatmentMorphine);
        animationCaller = "AinvPknlMstpSnonWnonDnon_medic1";
        litter[] = { {"All", "", {"ACE_MedicalLitter_morphine"}} };
        sounds[] = {{QPATHTO_R(sounds\Inject.ogg),1,1,50}};
    };
    class Epinephrine: Morphine {
        displayName = ECSTRING(medical,Inject_Epinephrine);
        displayNameProgress = ECSTRING(medical,Injecting_Epinephrine);
        requiredMedic = QEGVAR(medical,medicSetting_basicEpi);
        items[] = {"ACE_epinephrine"};
        callbackSuccess = QFUNC(treatmentEpipen);
        litter[] = { {"All", "", {"ACE_MedicalLitter_epinephrine"}} };
        treatmentLocations[] = {QGVAR(useLocation_basicEpi)};
    };

    // --- iv bags
    class BloodIV: BasicBandage {
        displayName = ECSTRING(medical,Actions_Blood4_1000);
        displayNameProgress = ECSTRING(medical,Transfusing_Blood);
        allowedSelections[] = {"LeftArm", "RightArm", "LeftLeg", "RightLeg"};
        allowSelfTreatment = 0;
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
        displayName = ECSTRING(medical,Actions_Blood4_500);
        items[] = {"ACE_bloodIV_500"};
    };
    class BloodIV_250: BloodIV {
        displayName = ECSTRING(medical,Actions_Blood4_250);
        items[] = {"ACE_bloodIV_250"};
    };
    class PlasmaIV: BloodIV {
        displayName = ECSTRING(medical,Actions_Plasma4_1000);
        displayNameProgress = ECSTRING(medical,Transfusing_Plasma);
        items[] = {"ACE_plasmaIV"};
        animationCaller = "AinvPknlMstpSnonWnonDnon_medic1";
    };
    class PlasmaIV_500: PlasmaIV {
        displayName = ECSTRING(medical,Actions_Plasma4_500);
        items[] = {"ACE_plasmaIV_500"};
    };
    class PlasmaIV_250: PlasmaIV {
        displayName = ECSTRING(medical,Actions_Plasma4_250);
        items[] = {"ACE_plasmaIV_250"};
    };
    class SalineIV: BloodIV {
        displayName = ECSTRING(medical,Actions_Saline4_1000);
        displayNameProgress = ECSTRING(medical,Transfusing_Saline);
        items[] = {"ACE_salineIV"};
        animationCaller = "AinvPknlMstpSnonWnonDnon_medic1";
    };
    class SalineIV_500: SalineIV {
        displayName = ECSTRING(medical,Actions_Saline4_500);
        items[] = {"ACE_salineIV_500"};
    };
    class SalineIV_250: SalineIV {
        displayName = ECSTRING(medical,Actions_Saline4_250);
        items[] = {"ACE_salineIV_250"};
    };

    // --- diagnose
    class Diagnose: BasicBandage {
        displayName = ECSTRING(medical,Actions_Diagnose);
        displayNameProgress = ECSTRING(medical,Actions_Diagnosing);
        category = "examine";
        treatmentLocations[] = {"All"};
        allowedSelections[] = {"Head", "Body"};
        requiredMedic = 0;
        treatmentTime = 1;
        items[] = {};
        condition = "";
        callbackSuccess = QFUNC(actionDiagnose);
        callbackFailure = "";
        callbackProgress = "";
        animationPatient = "";
        animationCaller = ""; // TODO
        itemConsumed = 0;
        litter[] = {};
    };
    class CheckPulse: Diagnose {
        displayName = ECSTRING(medical,Actions_CheckPulse);
        displayNameProgress = ECSTRING(medical,Check_Pulse_Content);
        allowedSelections[] = {"All"};
        treatmentTime = 2;
        callbackSuccess = QFUNC(actionCheckPulse);
        animationCallerProne = "";
        animationCallerSelfProne = "";
    };
    class CheckBloodPressure: CheckPulse {
        displayName = ECSTRING(medical,Actions_CheckBloodPressure);
        displayNameProgress = ECSTRING(medical,Check_Bloodpressure_Content);
        callbackSuccess = QFUNC(actionCheckBloodPressure);
    };
    class CheckResponse: CheckPulse {
        displayName = ECSTRING(medical,Check_Response);
        displayNameProgress = ECSTRING(medical,Check_Response_Content);
        allowSelfTreatment = 0;
        callbackSuccess = QFUNC(actionCheckResponse);
    };

    // --- misc
    class BodyBag: BasicBandage {
        displayName = ECSTRING(medical,PlaceInBodyBag);
        displayNameProgress = ECSTRING(medical,PlacingInBodyBag);
        category = "advanced";
        treatmentLocations[] = {"All"};
        allowSelfTreatment = 0;
        requiredMedic = 0;
        treatmentTime = 15;
        items[] = {"ACE_BodyBag"};
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
        displayName = ECSTRING(medical,Actions_CPR);
        displayNameProgress = ECSTRING(medical,Actions_PerformingCPR);
        category = "advanced";
        treatmentLocations[] = {"All"};
        allowedSelections[] = {"Body"};
        allowSelfTreatment = 0;
        requiredMedic = 0;
        treatmentTime = 15;
        items[] = {};
        condition = QUOTE(!(_target call EFUNC(common,isAwake)) && EGVAR(medical,enableRevive) > 0);
        callbackSuccess = QFUNC(treatmentCPR);
        callbackFailure = "";
        callbackProgress = QUOTE((_this select 0 select 1) call EFUNC(common,isAwake));
        animationPatient = "";
        animationPatientUnconscious = "AinjPpneMstpSnonWrflDnon_rolltoback";
        animationCaller = "AinvPknlMstpSlayW[wpn]Dnon_medic";
        animationCallerProne = "AinvPpneMstpSlayW[wpn]Dnon_medic";
        animationCallerSelf = "";
        animationCallerSelfProne = "";
        itemConsumed = 0;
        litter[] = {};
    };

/*
    class Advanced {
        class Morphine: fieldDressing {
            displayName = ECSTRING(medical,Inject_Morphine);
            displayNameProgress = ECSTRING(medical,Injecting_Morphine);
            allowedSelections[] = {"LeftArm", "RightArm", "LeftLeg", "RightLeg"};
            category = "medication";
            items[] = {"ACE_morphine"};
            treatmentTime = 3;
            callbackSuccess = QFUNC(treatmentMedication);
            animationCaller = "AinvPknlMstpSnonWnonDnon_medic1";
            litter[] = { {"All", "", {"ACE_MedicalLitter_morphine"}} };
            sounds[] = {{QPATHTO_R(sounds\Inject.ogg),1,1,50}};
        };
        class Adenosine: Morphine {
            displayName = ECSTRING(medical,Inject_Adenosine);
            displayNameProgress = ECSTRING(medical,Injecting_Adenosine);
            items[] = {"ACE_adenosine"};
            litter[] = { {"All", "", {"ACE_MedicalLitter_adenosine"}} };
        };
        class Atropine: Morphine {
            displayName = ECSTRING(medical,Inject_Atropine);
            displayNameProgress = ECSTRING(medical,Injecting_Atropine);
            items[] = {"ACE_atropine"};
            litter[] = { {"All", "", {"ACE_MedicalLitter_atropine"}} };
        };
        class Epinephrine: Morphine {
            displayName = ECSTRING(medical,Inject_Epinephrine);
            displayNameProgress = ECSTRING(medical,Injecting_Epinephrine);
            items[] = {"ACE_epinephrine"};
            litter[] = { {"All", "", {"ACE_MedicalLitter_epinephrine"}} };
        };

        class SurgicalKit: fieldDressing {
            displayName = ECSTRING(medical,Use_SurgicalKit);
            displayNameProgress = ECSTRING(medical,Stitching);
            category = "advanced";
            items[] = {"ACE_surgicalKit"};
            treatmentLocations[] = {QEGVAR(medical,useLocation_SurgicalKit)};
            allowSelfTreatment = 0;
            requiredMedic = QEGVAR(medical,medicSetting_SurgicalKit);
            patientStateCondition = QEGVAR(medical,useCondition_SurgicalKit);
            treatmentTime = QUOTE(count (_target getVariable [ARR_2('EGVAR(medical,bandagedWounds)',[])]) * 5);
            callbackSuccess = "";
            callbackProgress = QFUNC(treatmentSurgicalKit_onProgress);
            itemConsumed = QEGVAR(medical,consumeItem_SurgicalKit);
            animationCaller = "AinvPknlMstpSnonWnonDnon_medic1";
            litter[] = { {"All", "", {"ACE_MedicalLitter_gloves"} }};
        };
        class PersonalAidKit: fieldDressing {
            displayName = ECSTRING(medical,Use_Aid_Kit);
            displayNameProgress = ECSTRING(medical,TreatmentAction);
            category = "advanced";
            items[] = {"ACE_personalAidKit"};
            treatmentLocations[] = {QEGVAR(medical,useLocation_PAK)};
            allowSelfTreatment = 0;
            requiredMedic = QEGVAR(medical,medicSetting_PAK);
            patientStateCondition = QEGVAR(medical,useCondition_PAK);
            treatmentTime = QUOTE(_target call FUNC(treatmentFullHealTreatmentTime));
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
    };
*/
};
