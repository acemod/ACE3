
class GVAR(Actions) {
    class Basic {
        class Bandage {
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
            condition = "";
            patientStateCondition = 0;
            itemConsumed = 1;
            callbackSuccess = QUOTE(DFUNC(treatmentAdvanced_bandage));
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
                {"All", "_bloodLossOnSelection > 0", {{"ACE_MedicalLitterBase", "ACE_MedicalLitter_bandage1", "ACE_MedicalLitter_bandage2", "ACE_MedicalLitter_bandage3"}}},
                {"All", "_bloodLossOnSelection <= 0", {"ACE_MedicalLitter_clean"}}
            };
        };
        class Morphine: Bandage {
            displayName = ECSTRING(medical,Inject_Morphine);
            displayNameProgress = ECSTRING(medical,Injecting_Morphine);
            allowedSelections[] = {"hand_l", "hand_r", "leg_l", "leg_r"};
            allowSelfTreatment = 1;
            category = "medication";
            treatmentTime = 8;
            items[] = {"ACE_morphine"};
            callbackSuccess = QUOTE(DFUNC(treatmentBasic_morphine));
            animationCaller = "AinvPknlMstpSnonWnonDnon_medic1";
            litter[] = { {"All", "", {"ACE_MedicalLitter_morphine"}} };
            sounds[] = {{QPATHTO_R(sounds\Inject.ogg),1,1,50}};
        };
        class Epinephrine: Bandage {
            displayName = ECSTRING(medical,Inject_Epinephrine);
            displayNameProgress = ECSTRING(medical,Injecting_Epinephrine);
            allowedSelections[] = {"hand_l", "hand_r", "leg_l", "leg_r"};
            allowSelfTreatment = 1;
            category = "medication";
            requiredMedic = QEGVAR(medical,medicSetting_basicEpi);
            treatmentTime = 8;
            items[] = {"ACE_epinephrine"};
            callbackSuccess = QUOTE(DFUNC(treatmentBasic_epipen));
            animationCaller = "AinvPknlMstpSnonWnonDnon_medic1";
            litter[] = { {"All", "", {"ACE_MedicalLitter_epinephrine"}} };
            treatmentLocations[] = {QGVAR(useLocation_basicEpi)};
            sounds[] = {{QPATHTO_R(sounds\Inject.ogg),1,1,50}};
        };
        class BloodIV: Bandage {
            displayName = ECSTRING(medical,Transfuse_Blood);
            displayNameProgress = ECSTRING(medical,Transfusing_Blood);
            allowedSelections[] = {"hand_l", "hand_r", "leg_l", "leg_r"};
            allowSelfTreatment = 0;
            category = "advanced";
            requiredMedic = 1;
            treatmentTime = 12;
            items[] = {"ACE_bloodIV"};
            // callbackSuccess = QUOTE(DFUNC(treatmentBasic_bloodbag));
            callbackSuccess = QUOTE(DFUNC(treatmentIV));
            animationCaller = "AinvPknlMstpSnonWnonDnon_medic1";
            litter[] = {};
        };
        class BloodIV_500: BloodIV {
            category = "advanced";
            items[] = {"ACE_bloodIV_500"};
        };
        class BloodIV_250: BloodIV {
            category = "advanced";
            items[] = {"ACE_bloodIV_250"};
        };
        class BodyBag: Bandage {
            displayName = ECSTRING(medical,PlaceInBodyBag);
            displayNameProgress = ECSTRING(medical,PlacingInBodyBag);
            category = "advanced";
            treatmentLocations[] = {"All"};
            requiredMedic = 0;
            treatmentTime = 15;
            items[] = {"ACE_bodyBag"};
            condition = "!alive _target";
            callbackSuccess = QUOTE(DFUNC(actionPlaceInBodyBag));
            callbackFailure = "";
            callbackProgress = "";
            animationPatient = "";
            animationPatientUnconscious = "";
            itemConsumed = 1;
            litter[] = {};
        };
        class Diagnose: Bandage {
            displayName = ECSTRING(medical,Actions_Diagnose);
            displayNameProgress = ECSTRING(medical,Actions_Diagnosing);
            category = "examine";
            treatmentLocations[] = {"All"};
            allowedSelections[] = {"head", "body"};
            requiredMedic = 0;
            treatmentTime = 1;
            items[] = {};
            callbackSuccess = QUOTE(DFUNC(actionDiagnose));
            callbackFailure = "";
            callbackProgress = "";
            animationPatient = "";
            animationCaller = ""; // TODO
            itemConsumed = 0;
            litter[] = {};
        };
        class CPR: Bandage {
            displayName = ECSTRING(medical,Actions_CPR);
            displayNameProgress = ECSTRING(medical,Actions_PerformingCPR);
            category = "advanced";
            treatmentLocations[] = {"All"};
            allowedSelections[] = {"body"};
            allowSelfTreatment = 0;
            requiredMedic = 0;
            treatmentTime = 15;
            items[] = {};
            condition = QUOTE(!(_target call EFUNC(common,isAwake)) && EGVAR(medical,enableRevive) > 0);
            callbackSuccess = QUOTE(DFUNC(treatmentAdvanced_CPR));
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
    };

    class Advanced {
        class FieldDressing {
            displayName = ECSTRING(medical,Actions_FieldDressing);
            displayNameProgress = ECSTRING(medical,Bandaging);
            category = "bandage";
            // Which locations can this treatment action be used? Available: Field, MedicalFacility, MedicalVehicle, All.
            treatmentLocations[] = {"All"};
            allowedSelections[] = {"All"};
            allowSelfTreatment = 1;
            // What is the level of medical skill required for this treatment action? 0 = all soldiers, 1 = medic, 2 = doctor
            requiredMedic = 0;
            // The time it takes for a treatment action to complete. Time is in seconds.
            treatmentTime = 8;
            // Item required for the action. Leave empty for no item required.
            items[] = {"ACE_fieldDressing"};
            condition = "";
            patientStateCondition = 0;
            // Callbacks
            callbackSuccess = QUOTE(DFUNC(treatmentAdvanced_bandage));
            callbackFailure = "";
            callbackProgress = "";
            itemConsumed = 1;
            animationPatient = "";
            animationPatientUnconscious = "AinjPpneMstpSnonWrflDnon_rolltoback";
            animationPatientUnconsciousExcludeOn[] = {"ainjppnemstpsnonwrfldnon"};
            animationCaller = "AinvPknlMstpSlayWrflDnon_medicOther";
            animationCallerProne = "AinvPpneMstpSlayW[wpn]Dnon_medicOther";
            animationCallerSelf = "AinvPknlMstpSlayW[wpn]Dnon_medic";
            animationCallerSelfProne = "AinvPpneMstpSlayW[wpn]Dnon_medic";
            litter[] = {
                {"All", "_bloodLossOnSelection > 0", {{"ACE_MedicalLitter_bandage2", "ACE_MedicalLitter_bandage3"}}},
                {"All", "_bloodLossOnSelection <= 0", {"ACE_MedicalLitter_clean"}}
            };
        };
        class PackingBandage: fieldDressing {
            displayName = ECSTRING(medical,Actions_PackingBandage);
            items[] = {"ACE_packingBandage"};
            litter[] = {
                {"All", "", {"ACE_MedicalLitter_packingBandage"}},
                {"All", "_bloodLossOnSelection > 0", {{"ACE_MedicalLitter_bandage2", "ACE_MedicalLitter_bandage3"}}},
                {"All", "_bloodLossOnSelection <= 0", {"ACE_MedicalLitter_clean"}}
            };
        };
        class ElasticBandage: fieldDressing {
            displayName = ECSTRING(medical,Actions_ElasticBandage);
            items[] = {"ACE_elasticBandage"};
        };
        class QuikClot: fieldDressing {
            displayName = ECSTRING(medical,Actions_QuikClot);
            items[] = {"ACE_quikclot"};
            litter[] = {
                {"All", "", {"ACE_MedicalLitter_QuickClot"}},
                {"All", "_bloodLossOnSelection > 0", {{"ACE_MedicalLitter_bandage2", "ACE_MedicalLitter_bandage3"}}},
                {"All", "_bloodLossOnSelection <= 0", {"ACE_MedicalLitter_clean"}}
            };
        };
        class Tourniquet: fieldDressing {
            displayName = ECSTRING(medical,Apply_Tourniquet);
            displayNameProgress = ECSTRING(medical,Applying_Tourniquet);
            allowedSelections[] = {"hand_l", "hand_r", "leg_l", "leg_r"};
            items[] = {"ACE_tourniquet"};
            treatmentTime = 4;
            callbackSuccess = QUOTE(DFUNC(treatmentTourniquet));
            condition = QUOTE(!([ARR_2(_target,_selectionName)] call EFUNC(medical,hasTourniquetAppliedTo)));
            litter[] = {};
        };
        class Morphine: fieldDressing {
            displayName = ECSTRING(medical,Inject_Morphine);
            displayNameProgress = ECSTRING(medical,Injecting_Morphine);
            allowedSelections[] = {"hand_l", "hand_r", "leg_l", "leg_r"};
            category = "medication";
            items[] = {"ACE_morphine"};
            treatmentTime = 3;
            callbackSuccess = QUOTE(DFUNC(treatmentAdvanced_medication));
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
        class BloodIV: fieldDressing {
            displayName = ECSTRING(medical,Actions_Blood4_1000);
            displayNameProgress = ECSTRING(medical,Transfusing_Blood);
            allowedSelections[] = {"hand_l", "hand_r", "leg_l", "leg_r"};
            allowSelfTreatment = 0;
            category = "advanced";
            items[] = {"ACE_bloodIV"};
            requiredMedic = 1;
            treatmentTime = 12;
            callbackSuccess = QUOTE(DFUNC(treatmentIV));
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
            callbackProgress = QUOTE(DFUNC(treatmentAdvanced_surgicalKit_onProgress));
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
            treatmentTime = QUOTE(_target call FUNC(treatmentAdvanced_fullHealTreatmentTime));
            callbackSuccess = QUOTE(DFUNC(treatmentAdvanced_fullHeal));
            itemConsumed = QEGVAR(medical,consumeItem_PAK);
            animationPatient = "";
            animationPatientUnconscious = "AinjPpneMstpSnonWrflDnon_rolltoback";
            animationCaller = "AinvPknlMstpSlayW[wpn]Dnon_medicOther";
            animationCallerProne = "AinvPpneMstpSlayW[wpn]Dnon_medicOther";
            animationCallerSelf = "";
            animationCallerSelfProne = "";
            litter[] = { {"All", "", {"ACE_MedicalLitter_gloves"}},
                {"All", "_bloodLossOnSelection > 0", {{"ACE_MedicalLitterBase", "ACE_MedicalLitter_bandage1", "ACE_MedicalLitter_bandage2", "ACE_MedicalLitter_bandage3"}}},
                {"All", "_bloodLossOnSelection > 0", {{"ACE_MedicalLitterBase", "ACE_MedicalLitter_bandage1", "ACE_MedicalLitter_bandage2", "ACE_MedicalLitter_bandage3"}}},
                {"All", "_bloodLossOnSelection <= 0", {"ACE_MedicalLitter_clean"}}
            };
        };
        class CheckPulse: fieldDressing {
            displayName = ECSTRING(medical,Actions_CheckPulse);
            displayNameProgress = ECSTRING(medical,Check_Pulse_Content);
            category = "examine";
            treatmentLocations[] = {"All"};
            requiredMedic = 0;
            treatmentTime = 2;
            items[] = {};
            callbackSuccess = QUOTE(DFUNC(actionCheckPulse));
            callbackFailure = "";
            callbackProgress = "";
            animationPatient = "";
            animationCaller = ""; // TODO
            animationCallerProne = "";
            animationCallerSelfProne = "";
            itemConsumed = 0;
            litter[] = {};
        };
        class CheckBloodPressure: CheckPulse {
            displayName = ECSTRING(medical,Actions_CheckBloodPressure);
            callbackSuccess = QUOTE(DFUNC(actionCheckBloodPressure));
            displayNameProgress = ECSTRING(medical,Check_Bloodpressure_Content);
        };
        class CheckResponse: CheckPulse {
            displayName = ECSTRING(medical,Check_Response);
            callbackSuccess = QUOTE(DFUNC(actionCheckResponse));
            displayNameProgress = ECSTRING(medical,Check_Response_Content);
            allowSelfTreatment = 0;
        };
        class RemoveTourniquet: Tourniquet {
            displayName = ECSTRING(medical,Actions_RemoveTourniquet);
            items[] = {};
            treatmentTime = 2.5;
            callbackSuccess = QUOTE(DFUNC(actionRemoveTourniquet));
            condition = QUOTE([ARR_2(_target,_selectionName)] call EFUNC(medical,hasTourniquetAppliedTo));
            displayNameProgress = ECSTRING(medical,RemovingTourniquet);
            litter[] = {};
        };
        class CPR: fieldDressing {
            displayName = ECSTRING(medical,Actions_CPR);
            displayNameProgress = ECSTRING(medical,Actions_PerformingCPR);
            category = "advanced";
            treatmentLocations[] = {"All"};
            allowedSelections[] = {"body"};
            allowSelfTreatment = 0;
            requiredMedic = 0;
            treatmentTime = 15;
            items[] = {};
            condition = QUOTE(!(_target call EFUNC(common,isAwake)));
            callbackSuccess = QUOTE(DFUNC(treatmentAdvanced_CPR));
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
        class BodyBag: fieldDressing {
            displayName = ECSTRING(medical,PlaceInBodyBag);
            displayNameProgress = ECSTRING(medical,PlacingInBodyBag);
            category = "advanced";
            treatmentLocations[] = {"All"};
            allowSelfTreatment = 0;
            requiredMedic = 0;
            treatmentTime = 15;
            items[] = {"ACE_bodyBag"};
            condition = "!alive _target";
            callbackSuccess = QUOTE(DFUNC(actionPlaceInBodyBag));
            callbackFailure = "";
            callbackProgress = "";
            animationPatient = "";
            animationPatientUnconscious = "";
            itemConsumed = 1;
            litter[] = {};
        };
    };
};
