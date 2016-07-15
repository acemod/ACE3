
class ACE_Medical_Treatments {
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
            animationCaller = "AinvPknlMstpSlayWrflDnon_medicOther";
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
            treatmentTime = 2;
            items[] = {"ACE_morphine"};
            callbackSuccess = QUOTE(DFUNC(treatmentBasic_morphine));
            animationCaller = "AinvPknlMstpSnonWnonDnon_medic1";
            litter[] = { {"All", "", {"ACE_MedicalLitter_morphine"}} };
        };
        class Epinephrine: Bandage {
            displayName = ECSTRING(medical,Inject_Epinephrine);
            displayNameProgress = ECSTRING(medical,Injecting_Epinephrine);
            allowedSelections[] = {"hand_l", "hand_r", "leg_l", "leg_r"};
            allowSelfTreatment = 1;
            category = "medication";
            requiredMedic = QEGVAR(medical,medicSetting_basicEpi);
            treatmentTime = 3;
            items[] = {"ACE_epinephrine"};
            callbackSuccess = QUOTE(DFUNC(treatmentBasic_epipen));
            animationCaller = "AinvPknlMstpSnonWnonDnon_medic1";
            litter[] = { {"All", "", {"ACE_MedicalLitter_epinephrine"}} };
            treatmentLocations[] = {QGVAR(useLocation_basicEpi)};
        };
        class BloodIV: Bandage {
            displayName = ECSTRING(medical,Transfuse_Blood);
            displayNameProgress = ECSTRING(medical,Transfusing_Blood);
            allowedSelections[] = {"hand_l", "hand_r", "leg_l", "leg_r"};
            allowSelfTreatment = 0;
            category = "advanced";
            requiredMedic = 1;
            treatmentTime = 20;
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
            treatmentTime = 4;
            items[] = {"ACE_bodyBag"};
            condition = "!alive (_this select 1);";
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
            condition = QUOTE(!([(_this select 1)] call ace_common_fnc_isAwake) && EGVAR(medical,enableRevive)>0);
            callbackSuccess = QUOTE(DFUNC(treatmentAdvanced_CPR));
            callbackFailure = "";
            callbackProgress = "!([((_this select 0) select 1)] call ace_common_fnc_isAwake)";
            animationPatient = "";
            animationPatientUnconscious = "AinjPpneMstpSnonWrflDnon_rolltoback";
            animationCaller = "AinvPknlMstpSlayWnonDnon_medic";
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
            condition = QUOTE(!([ARR_2(_this select 1, _this select 2)] call EFUNC(medical,hasTourniquetAppliedTo)));
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
            treatmentTime = 7;
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
            treatmentTime = "(count ((_this select 1) getVariable ['ACE_Medical_bandagedWounds', []]) * 5)";
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
            treatmentTime = QUOTE((_this select 1) call FUNC(treatmentAdvanced_fullHealTreatmentTime));
            callbackSuccess = QUOTE(DFUNC(treatmentAdvanced_fullHeal));
            itemConsumed = QEGVAR(medical,consumeItem_PAK);
            animationPatient = "";
            animationPatientUnconscious = "AinjPpneMstpSnonWrflDnon_rolltoback";
            animationCaller = "AinvPknlMstpSlayWnonDnon_medicOther";
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
            condition = QUOTE([ARR_2(_this select 1, _this select 2)] call EFUNC(medical,hasTourniquetAppliedTo));
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
            condition = "!([(_this select 1)] call ace_common_fnc_isAwake)";
            callbackSuccess = QUOTE(DFUNC(treatmentAdvanced_CPR));
            callbackFailure = "";
            callbackProgress = "!([((_this select 0) select 1)] call ace_common_fnc_isAwake)";
            animationPatient = "";
            animationPatientUnconscious = "AinjPpneMstpSnonWrflDnon_rolltoback";
            animationCaller = "AinvPknlMstpSlayWnonDnon_medic";
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
            condition = "!alive (_this select 1);";
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

class ACE_Medical_Treatment {
    class Bandaging {
        // Field dressing is normal average treatment
        // packing bandage is average treatment, higher reopen change, longer reopening delay
        // elastic bandage is higher treatment, higher reopen change, shorter reopen delay
        // quickclot is lower treatment, lower reopen change, longer reopening delay
        class Bandage { // basic bandage
            effectiveness = 5;
            reopeningChance = 0;
            reopeningMinDelay = 0;
            reopeningMaxDelay = 0;
        };

        class FieldDressing {
            // How effect is the bandage for treating one wounds type injury
            effectiveness = 1;
            // What is the chance and delays (in seconds) of the treated default injury reopening
            reopeningChance = 0.1;
            reopeningMinDelay = 120;
            reopeningMaxDelay = 200;

            class Abrasion {
                effectiveness = 3;
                reopeningChance = 0.3;
                reopeningMinDelay = 200;
                reopeningMaxDelay = 1000;
            };
            class AbrasionMinor: Abrasion {
                effectiveness = 3;
            };
            class AbrasionMedium: Abrasion {
                effectiveness = 2.5;
                reopeningChance = 0.7;
            };
            class AbrasionLarge: Abrasion {
                effectiveness = 2;
                reopeningChance = 0.9;
            };

            class Avulsions: Abrasion {
                effectiveness = 1;
                reopeningChance = 0.5;
                reopeningMinDelay = 120;
                reopeningMaxDelay = 200;
            };
            class AvulsionsMinor: Avulsions {
                effectiveness = 1;
            };
            class AvulsionsMedium: Avulsions {
                effectiveness = 0.9;
            };
            class AvulsionsLarge: Avulsions {
                effectiveness = 0.75;
            };

            class Contusion: Abrasion {
                effectiveness = 1;
                reopeningChance = 0;
                reopeningMinDelay = 0;
                reopeningMaxDelay = 0;
            };
            class ContusionMinor: Contusion {};
            class ContusionMedium: Contusion {};
            class ContusionLarge: Contusion {};

            class CrushWound: Abrasion {
                effectiveness = 1;
                reopeningChance = 0.2;
                reopeningMinDelay = 20;
                reopeningMaxDelay = 1000;
            };
            class CrushWoundMinor: CrushWound {
                effectiveness = 1;
                reopeningChance = 0.2;
            };
            class CrushWoundMedium: CrushWound {
                effectiveness = 0.7;
                reopeningChance = 0.3;
            };
            class CrushWoundLarge: CrushWound {
                effectiveness = 0.6;
                reopeningChance = 0.4;
            };

            class Cut: Abrasion {
                effectiveness = 4;
                reopeningChance = 0.1;
                reopeningMinDelay = 300;
                reopeningMaxDelay = 1000;
            };
            class CutMinor: Cut {
                effectiveness = 4;
                reopeningChance = 0.1;
            };
            class CutMedium: Cut {
                effectiveness = 3;
                reopeningChance = 0.3;
            };
            class CutLarge: Cut {
                effectiveness = 1;
                reopeningChance = 0.5;
            };

            class Laceration: Abrasion {
                effectiveness = 0.95;
                reopeningChance = 0.3;
                reopeningMinDelay = 100;
                reopeningMaxDelay = 800;
            };
            class LacerationMinor: Laceration {
                effectiveness = 0.95;
                reopeningChance = 0.3;
            };
            class LacerationMedium: Laceration {
                effectiveness = 0.7;
                reopeningChance = 0.5;
            };
            class LacerationLarge: Laceration {
                effectiveness = 0.5;
                reopeningChance = 0.6;
            };

            class velocityWound: Abrasion {
                effectiveness = 2;
                reopeningChance = 0.7;
                reopeningMinDelay = 100;
                reopeningMaxDelay = 500;
            };
            class velocityWoundMinor: velocityWound {
                effectiveness = 2;
            };
            class velocityWoundMedium: velocityWound {
                effectiveness = 1.5;
            };
            class velocityWoundLarge: velocityWound {
                effectiveness = 1;
            };

            class punctureWound: Abrasion {
                effectiveness = 2;
                reopeningChance = 0.5;
                reopeningMinDelay = 200;
                reopeningMaxDelay = 850;
            };
            class punctureWoundMinor: punctureWound {
                effectiveness = 2;
            };
            class punctureWoundMedium: punctureWound {
                effectiveness = 1.3;
            };
            class punctureWoundLarge: punctureWound {
                effectiveness = 0.9;
            };
        };

        class PackingBandage: fieldDressing {
            class Abrasion {
                effectiveness = 3;
                reopeningChance = 0.6;
                reopeningMinDelay = 800;
                reopeningMaxDelay = 1500;
            };
            class AbrasionMinor: Abrasion {
                effectiveness = 3;
            };
            class AbrasionMedium: Abrasion {
                effectiveness = 2.5;
                reopeningChance = 0.9;
            };
            class AbrasionLarge: Abrasion {
                effectiveness = 2;
                reopeningChance = 1;
            };

            class Avulsions: Abrasion {
                effectiveness = 1;
                reopeningChance = 0.7;
                reopeningMinDelay = 1000;
                reopeningMaxDelay = 1600;
            };
            class AvulsionsMinor: Avulsions {
                effectiveness = 1;
            };
            class AvulsionsMedium: Avulsions {
                effectiveness = 0.9;
            };
            class AvulsionsLarge: Avulsions {
                effectiveness = 0.75;
            };

            class Contusion: Abrasion {
                effectiveness = 1;
                reopeningChance = 0;
                reopeningMinDelay = 0;
                reopeningMaxDelay = 0;
            };
            class ContusionMinor: Contusion {};
            class ContusionMedium: Contusion {};
            class ContusionLarge: Contusion {};

            class CrushWound: Abrasion {
                effectiveness = 1;
                reopeningChance = 0.5;
                reopeningMinDelay = 600;
                reopeningMaxDelay = 1000;
            };
            class CrushWoundMinor: CrushWound {
                effectiveness = 1;
                reopeningChance = 0.6;
            };
            class CrushWoundMedium: CrushWound {
                effectiveness = 0.7;
                reopeningChance = 0.7;
            };
            class CrushWoundLarge: CrushWound {
                effectiveness = 0.6;
                reopeningChance = 0.8;
            };

            class Cut: Abrasion {
                effectiveness = 4;
                reopeningChance = 0.4;
                reopeningMinDelay = 700;
                reopeningMaxDelay = 1000;
            };
            class CutMinor: Cut {
                effectiveness = 4;
                reopeningChance = 0.6;
            };
            class CutMedium: Cut {
                effectiveness = 3;
                reopeningChance = 0.7;
            };
            class CutLarge: Cut {
                effectiveness = 1;
                reopeningChance = 0.8;
            };

            class Laceration: Abrasion {
                effectiveness = 0.95;
                reopeningChance = 0.65;
                reopeningMinDelay = 500;
                reopeningMaxDelay = 2000;
            };
            class LacerationMinor: Laceration {
                effectiveness = 0.95;
                reopeningChance = 0.65;
            };
            class LacerationMedium: Laceration {
                effectiveness = 0.7;
                reopeningChance = 0.8;
            };
            class LacerationLarge: Laceration {
                effectiveness = 0.5;
                reopeningChance = 0.9;
            };

            class velocityWound: Abrasion {
                effectiveness = 2;
                reopeningChance = 1;
                reopeningMinDelay = 800;
                reopeningMaxDelay = 2000;
            };
            class velocityWoundMinor: velocityWound {
                effectiveness = 2;
            };
            class velocityWoundMedium: velocityWound {
                effectiveness = 1.5;
            };
            class velocityWoundLarge: velocityWound {
                effectiveness = 1;
            };

            class punctureWound: Abrasion {
                effectiveness = 2;
                reopeningChance = 1;
                reopeningMinDelay = 1000;
                reopeningMaxDelay = 3000;
            };
            class punctureWoundMinor: punctureWound {
                effectiveness = 2;
            };
            class punctureWoundMedium: punctureWound {
                effectiveness = 1.3;
            };
            class punctureWoundLarge: punctureWound {
                effectiveness = 0.9;
            };
        };

        class ElasticBandage: fieldDressing {
            class Abrasion {
                effectiveness = 4;
                reopeningChance = 0.6;
                reopeningMinDelay = 80;
                reopeningMaxDelay = 150;
            };
            class AbrasionMinor: Abrasion {
                effectiveness = 43;
            };
            class AbrasionMedium: Abrasion {
                effectiveness = 3;
                reopeningChance = 0.9;
            };
            class AbrasionLarge: Abrasion {
                effectiveness = 2.5;
                reopeningChance = 1;
            };

            class Avulsions: Abrasion {
                effectiveness = 2;
                reopeningChance = 0.7;
                reopeningMinDelay = 100;
                reopeningMaxDelay = 160;
            };
            class AvulsionsMinor: Avulsions {
                effectiveness = 2;
            };
            class AvulsionsMedium: Avulsions {
                effectiveness = 1.4;
            };
            class AvulsionsLarge: Avulsions {
                effectiveness = 1;
            };

            class Contusion: Abrasion {
                effectiveness = 2;
                reopeningChance = 0;
                reopeningMinDelay = 0;
                reopeningMaxDelay = 0;
            };
            class ContusionMinor: Contusion {};
            class ContusionMedium: Contusion {};
            class ContusionLarge: Contusion {};

            class CrushWound: Abrasion {
                effectiveness = 2;
                reopeningChance = 0.5;
                reopeningMinDelay = 60;
                reopeningMaxDelay = 100;
            };
            class CrushWoundMinor: CrushWound {
                effectiveness = 2;
                reopeningChance = 0.6;
            };
            class CrushWoundMedium: CrushWound {
                effectiveness = 1.7;
                reopeningChance = 0.7;
            };
            class CrushWoundLarge: CrushWound {
                effectiveness = 1.6;
                reopeningChance = 0.8;
            };

            class Cut: Abrasion {
                effectiveness = 5;
                reopeningChance = 0.4;
                reopeningMinDelay = 70;
                reopeningMaxDelay = 100;
            };
            class CutMinor: Cut {
                effectiveness = 5;
                reopeningChance = 0.6;
            };
            class CutMedium: Cut {
                effectiveness = 3.5;
                reopeningChance = 0.7;
            };
            class CutLarge: Cut {
                effectiveness = 2;
                reopeningChance = 0.8;
            };

            class Laceration: Abrasion {
                effectiveness = 2;
                reopeningChance = 0.65;
                reopeningMinDelay = 50;
                reopeningMaxDelay = 200;
            };
            class LacerationMinor: Laceration {
                effectiveness = 2;
                reopeningChance = 0.65;
            };
            class LacerationMedium: Laceration {
                effectiveness = 1.5;
                reopeningChance = 0.8;
            };
            class LacerationLarge: Laceration {
                effectiveness = 1;
                reopeningChance = 0.9;
            };

            class velocityWound: Abrasion {
                effectiveness = 2.2;
                reopeningChance = 1;
                reopeningMinDelay = 80;
                reopeningMaxDelay = 200;
            };
            class velocityWoundMinor: velocityWound {
                effectiveness = 2.2;
            };
            class velocityWoundMedium: velocityWound {
                effectiveness = 1.75;
            };
            class velocityWoundLarge: velocityWound {
                effectiveness = 1.5;
            };

            class punctureWound: Abrasion {
                effectiveness = 2.5;
                reopeningChance = 1;
                reopeningMinDelay = 100;
                reopeningMaxDelay = 300;
            };
            class punctureWoundMinor: punctureWound {
                effectiveness = 2.5;
            };
            class punctureWoundMedium: punctureWound {
                effectiveness = 2;
            };
            class punctureWoundLarge: punctureWound {
                effectiveness = 1.5;
            };
        };

        class QuikClot: fieldDressing {
            class Abrasion {
                effectiveness = 2;
                reopeningChance = 0.3;
                reopeningMinDelay = 800;
                reopeningMaxDelay = 1500;
            };
            class AbrasionMinor: Abrasion {
                effectiveness = 2;
            };
            class AbrasionMedium: Abrasion {
                effectiveness = 1;
                reopeningChance = 0.4;
            };
            class AbrasionLarge: Abrasion {
                effectiveness = 0.7;
                reopeningChance = 5;
            };

            class Avulsions: Abrasion {
                effectiveness = 0.7;
                reopeningChance = 0.2;
                reopeningMinDelay = 1000;
                reopeningMaxDelay = 1600;
            };
            class AvulsionsMinor: Avulsions {
                effectiveness = 0.7;
            };
            class AvulsionsMedium: Avulsions {
                effectiveness = 0.65;
            };
            class AvulsionsLarge: Avulsions {
                effectiveness = 0.5;
            };

            class Contusion: Abrasion {
                effectiveness = 1;
                reopeningChance = 0;
                reopeningMinDelay = 0;
                reopeningMaxDelay = 0;
            };
            class ContusionMinor: Contusion {};
            class ContusionMedium: Contusion {};
            class ContusionLarge: Contusion {};

            class CrushWound: Abrasion {
                effectiveness = 0.6;
                reopeningChance = 0.5;
                reopeningMinDelay = 600;
                reopeningMaxDelay = 1000;
            };
            class CrushWoundMinor: CrushWound {
                effectiveness = 0.6;
                reopeningChance = 0.3;
            };
            class CrushWoundMedium: CrushWound {
                effectiveness = 0.5;
            };
            class CrushWoundLarge: CrushWound {
                effectiveness = 0.4;
            };

            class Cut: Abrasion {
                effectiveness = 2;
                reopeningChance = 0.2;
                reopeningMinDelay = 700;
                reopeningMaxDelay = 1000;
            };
            class CutMinor: Cut {
                effectiveness = 2;
                reopeningChance = 0.3;
            };
            class CutMedium: Cut {
                effectiveness = 1;
            };
            class CutLarge: Cut {
                effectiveness = 0.6;
            };

            class Laceration: Abrasion {
                effectiveness = 0.7;
                reopeningChance = 0.4;
                reopeningMinDelay = 500;
                reopeningMaxDelay = 2000;
            };
            class LacerationMinor: Laceration {
                effectiveness = 0.7;
                reopeningChance = 0.4;
            };
            class LacerationMedium: Laceration {
                effectiveness = 0.7;
            };
            class LacerationLarge: Laceration {
                effectiveness = 0.5;
            };

            class velocityWound: Abrasion {
                effectiveness = 1;
                reopeningChance = 0.5;
                reopeningMinDelay = 800;
                reopeningMaxDelay = 2000;
            };
            class velocityWoundMinor: velocityWound {
                effectiveness = 1;
            };
            class velocityWoundMedium: velocityWound {
                effectiveness = 0.75;
            };
            class velocityWoundLarge: velocityWound {
                effectiveness = 0.5;
            };

            class punctureWound: Abrasion {
                effectiveness = 1;
                reopeningChance = 0.5;
                reopeningMinDelay = 1000;
                reopeningMaxDelay = 3000;
            };
            class punctureWoundMinor: punctureWound {
                effectiveness = 1;
            };
            class punctureWoundMedium: punctureWound {
                effectiveness = 0.7;
            };
            class punctureWoundLarge: punctureWound {
                effectiveness = 0.4;
            };
        };
    };

    class Medication {
        // How much does the pain get reduced?
        painReduce = 0;
        // How much will the heart rate be increased when the HR is low (below 55)? {minIncrease, maxIncrease, seconds}
        hrIncreaseLow[] = {0, 0, 0};
        hrIncreaseNormal[] = {0, 0, 0};
        hrIncreaseHigh[] = {0, 0, 0};
        // Callback once the heart rate values have been added.
        hrCallback = "";

        // How long until this medication has disappeared
        timeInSystem = 120;
        // How many of this type of medication can be in the system before the patient overdoses?
        maxDose = 4;
        // Function to execute upon overdose. Arguments passed to call back are 0: unit <OBJECT>, 1: medicationClassName <STRING>
        onOverDose = "";
        // The viscosity of a fluid is a measure of its resistance to gradual deformation by shear stress or tensile stress. For liquids, it corresponds to the informal concept of "thickness". This value will increase/decrease the viscoty of the blood with the percentage given. Where 100 = max. Using the minus will decrease viscosity
        viscosityChange = 0;

        // specific details for the ACE_Morphine treatment action
        class Morphine {
            painReduce = 15;
            hrIncreaseLow[] = {-10, -20, 35};
            hrIncreaseNormal[] = {-10, -30, 35};
            hrIncreaseHigh[] = {-10, -35, 50};
            timeInSystem = 900;
            maxDose = 4;
            inCompatableMedication[] = {};
            viscosityChange = -10;
        };
        class Epinephrine {
            painReduce = 0;
            hrIncreaseLow[] = {10, 20, 15};
            hrIncreaseNormal[] = {10, 50, 10};
            hrIncreaseHigh[] = {10, 40, 5};
            timeInSystem = 120;
            maxDose = 10;
            inCompatableMedication[] = {};
        };
        class Adenosine {
            painReduce = 0;
            hrIncreaseLow[] = {-7, -10, 15};
            hrIncreaseNormal[] = {-15, -30, 20};
            hrIncreaseHigh[] = {-15, -35, 10};
            timeInSystem = 120;
            maxDose = 6;
            inCompatableMedication[] = {};
        };
        class Atropine {
            painReduce = 0;
            hrIncreaseLow[] = {-2, -5, 15};
            hrIncreaseNormal[] = {-10, -15, 20};
            hrIncreaseHigh[] = {-5, -20, 10};
            timeInSystem = 120;
            maxDose = 6;
            inCompatableMedication[] = {};
        };
        class PainKillers {
            painReduce = 0.7;
            timeInSystem = 120;
            maxDose = 10;
            inCompatableMedication[] = {};
            viscosityChange = 5;
        };
    };
    class IV {
        // volume is in millileters
        volume = 1000;
        ratio[] = {};
        type = "Blood";
        class BloodIV {
            volume = 1000;
            ratio[] = {"Plasma", 1};
        };
        class BloodIV_500: BloodIV {
            volume = 500;
        };
        class BloodIV_250: BloodIV {
            volume = 250;
        };
        class PlasmaIV: BloodIV {
            volume = 1000;
            ratio[] = {"Blood", 1};
            type = "Plasma";
        };
        class PlasmaIV_500: PlasmaIV {
            volume = 500;
        };
        class PlasmaIV_250: PlasmaIV {
            volume = 250;
        };
        class SalineIV: BloodIV {
            volume = 1000;
            type = "Saline";
            ratio[] = {};
        };
        class SalineIV_500: SalineIV {
            volume = 500;
        };
        class SalineIV_250: SalineIV {
            volume = 250;
        };
    };
};
