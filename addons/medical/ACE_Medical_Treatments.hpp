
class ACE_Medical_Actions {
    class Basic {
        class Bandage {
            displayName = "$STR_ACE_Medical_Bandage";
            displayNameProgress = "$STR_ACE_Medical_Bandaging";

            treatmentLocations[] = {"All"};
            requiredMedic = 0;
            treatmentTime = 5;
            treatmentTimeSelfCoef = 1;
            items[] = {{"ACE_fieldDressing", "ACE_packingBandage", "ACE_elasticBandage", "ACE_quikclot"}};
            condition = "";
            itemConsumed = 1;

            callbackSuccess = QUOTE(DFUNC(treatmentBasic_bandage));
            callbackFailure = "";
            callbackProgress = "";

            animationPatient = "";
            animationPatientUnconscious = "AinjPpneMstpSnonWrflDnon_rolltoback";
            animationPatientUnconsciousExcludeOn[] = {"ainjppnemstpsnonwrfldnon"};
            animationCaller = "AinvPknlMstpSlayWrflDnon_medicOther";
            animationCallerProne = "AinvPpneMstpSlayW[wpn]Dnon_medicOther";
            animationCallerSelf = "AinvPknlMstpSlayW[wpn]Dnon_medic";
            animationCallerSelfProne = "AinvPpneMstpSlayW[wpn]Dnon_medic";
            litter[] = { {"All", "", {{"ACE_MedicalLitterBase", "ACE_MedicalLitter_bandage1", "ACE_MedicalLitter_bandage2", "ACE_MedicalLitter_bandage3"}}} };
        };
        class Morphine: Bandage {
            displayName = "$STR_ACE_Medical_Inject_Morphine";
            displayNameProgress = "$STR_ACE_Medical_Injecting_Morphine";
            treatmentTime = 2;
            items[] = {"ACE_morphine"};
            callbackSuccess = QUOTE(DFUNC(treatmentBasic_morphine));
            animationCaller = "AinvPknlMstpSnonWnonDnon_medic1";
            litter[] = { {"All", "", {"ACE_MedicalLitter_morphine"}} };
        };
        class Epinephrine: Bandage {
            displayName = "$STR_ACE_Medical_Inject_Epinephrine";
            displayNameProgress = "$STR_ACE_Medical_Injecting_Epinephrine";
            requiredMedic = 1;
            treatmentTime = 3;
            items[] = {"ACE_epinephrine"};
            callbackSuccess = QUOTE(DFUNC(treatmentBasic_epipen));
            animationCaller = "AinvPknlMstpSnonWnonDnon_medic1";
            litter[] = { {"All", "", {"ACE_MedicalLitter_epinephrine"}} };
        };
        class BloodIV: Bandage {
            displayName = "$STR_ACE_Medical_Transfuse_Blood";
            displayNameProgress = "$STR_ACE_Medical_Transfusing_Blood";
            requiredMedic = 1;
            treatmentTime = 20;
            items[] = {"ACE_bloodIV"};
            callbackSuccess = QUOTE(DFUNC(treatmentBasic_bloodbag));
            animationCaller = "AinvPknlMstpSnonWnonDnon_medic1";
            litter[] = {};
        };
        class BloodIV_500: BloodIV {
            items[] = {"ACE_bloodIV_500"};
        };
        class BloodIV_250: BloodIV {
            items[] = {"ACE_bloodIV_250"};
        };
        class BodyBag: Bandage {
            displayName = "$STR_ACE_Medical_PlaceInBodyBag";
            displayNameProgress = "$STR_ACE_Medical_PlacingInBodyBag";
            treatmentLocations[] = {"All"};
            requiredMedic = 0;
            treatmentTime = 2;
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
            displayName = "$STR_ACE_Medical_Actions_Diagnose";
            displayNameProgress = "$STR_ACE_Medical_Actions_Diagnosing";
            treatmentLocations[] = {"All"};
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
    };

    class Advanced {
        class FieldDressing {
            displayName = "$STR_ACE_Medical_Bandage";
            displayNameProgress = "$STR_ACE_Medical_Bandaging";
            // Which locations can this treatment action be used? Available: Field, MedicalFacility, MedicalVehicle, All.
            treatmentLocations[] = {"All"};
            // What is the level of medical skill required for this treatment action? 0 = all soldiers, 1 = medic, 2 = doctor
            requiredMedic = 0;
            // The time it takes for a treatment action to complete. Time is in seconds.
            treatmentTime = 5;
            // Item required for the action. Leave empty for no item required.
            items[] = {"ACE_fieldDressing"};
            condition = "";
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
            litter[] = { {"All", "", {{"ACE_MedicalLitter_bandage2", "ACE_MedicalLitter_bandage3"}}} };
        };
        class PackingBandage: fieldDressing {
            items[] = {"ACE_packingBandage"};
        };
        class ElasticBandage: fieldDressing {
            items[] = {"ACE_elasticBandage"};
        };
        class QuikClot: fieldDressing {
            items[] = {"ACE_quikclot"};
        };
        class Tourniquet: fieldDressing {
            displayName = "$STR_ACE_Medical_Apply_Tourniquet";
            displayNameProgress = "$STR_ACE_Medical_Applying_Tourniquet";
            items[] = {"ACE_tourniquet"};
            treatmentTime = 6;
            callbackSuccess = QUOTE(DFUNC(treatmentTourniquet));
            condition = QUOTE(!([ARR_2(_this select 1, _this select 2)] call FUNC(hasTourniquetAppliedTo)));
            litter[] = {};
        };
        class Morphine: fieldDressing {
            displayName = "$STR_ACE_Medical_Inject_Morphine";
            displayNameProgress = "$STR_ACE_Medical_Injecting_Morphine";
            items[] = {"ACE_morphine"};
            treatmentTime = 3;
            callbackSuccess = QUOTE(DFUNC(treatmentAdvanced_medication));
            animationCaller = "AinvPknlMstpSnonWnonDnon_medic1";
            litter[] = { {"All", "", {"ACE_MedicalLitter_morphine"}} };
        };
        class Atropine: Morphine {
            displayName = "$STR_ACE_Medical_Inject_Atropine";
            displayNameProgress = "$STR_ACE_Medical_Injecting_Atropine";
            items[] = {"ACE_atropine"};
            litter[] = { {"All", "", {"ACE_MedicalLitter_atropine"}} };
        };
        class Epinephrine: Morphine {
            displayName = "$STR_ACE_Medical_Inject_Epinephrine";
            displayNameProgress = "$STR_ACE_Medical_Injecting_Epinephrine";
            items[] = {"ACE_epinephrine"};
            litter[] = { {"All", "", {"ACE_MedicalLitter_epinephrine"}} };
        };
        class BloodIV: fieldDressing {
            displayName = "$STR_ACE_Medical_Transfuse_Blood";
            displayNameProgress = "$STR_ACE_Medical_Transfusing_Blood";
            items[] = {"ACE_bloodIV"};
            requiredMedic = 1;
            treatmentTime = 7;
            callbackSuccess = QUOTE(DFUNC(treatmentIV));
            animationCaller = "AinvPknlMstpSnonWnonDnon_medic1";
            litter[] = {};
        };
        class BloodIV_500: BloodIV {
            items[] = {"ACE_bloodIV_500"};
        };
        class BloodIV_250: BloodIV {
            items[] = {"ACE_bloodIV_250"};
        };
        class PlasmaIV: BloodIV {
            displayName = "$STR_ACE_Medical_Transfuse_Plasma";
            displayNameProgress = "$STR_ACE_Medical_Transfusing_Plasma";
            items[] = {"ACE_plasmaIV"};
            animationCaller = "AinvPknlMstpSnonWnonDnon_medic1";
        };
        class PlasmaIV_500: PlasmaIV {
            items[] = {"ACE_plasmaIV_500"};
        };
        class PlasmaIV_250: PlasmaIV {
            items[] = {"ACE_plasmaIV_250"};
        };
        class SalineIV: BloodIV {
            displayName = "$STR_ACE_Medical_Transfuse_Saline";
            displayNameProgress = "$STR_ACE_Medical_Transfusing_Saline";
            items[] = {"ACE_salineIV"};
            animationCaller = "AinvPknlMstpSnonWnonDnon_medic1";
        };
        class SalineIV_500: SalineIV {
            items[] = {"ACE_salineIV_500"};
        };
        class SalineIV_250: SalineIV {
            items[] = {"ACE_salineIV_250"};
        };
        class SurgicalKit: fieldDressing {
            displayName = "";
            displayNameProgress = "$STR_ACE_Medical_TreatmentAction";
            items[] = {"ACE_surgicalKit"};
            treatmentLocations[] = {QGVAR(useLocation_SurgicalKit)};
            requiredMedic = QGVAR(medicSetting_SurgicalKit);
            treatmentTime = "(count ((_this select 1) getVariable ['ACE_Medical_bandagedWounds', []]) * 5)";
            callbackSuccess = "";
            callbackProgress = QUOTE(DFUNC(treatmentAdvanced_surgicalKit_onProgress));
            itemConsumed = QGVAR(consumeItem_SurgicalKit);
            animationCaller = "AinvPknlMstpSnonWnonDnon_medic1";
            litter[] = { {"All", "", {"ACE_MedicalLitter_gloves"} }};
        };
        class PersonalAidKit: fieldDressing {
            displayName = "";
            displayNameProgress = "$STR_ACE_Medical_TreatmentAction";
            items[] = {"ACE_personalAidKit"};
            treatmentLocations[] = {QGVAR(useLocation_PAK)};
            requiredMedic = QGVAR(medicSetting_PAK);
            treatmentTime = 10;
            callbackSuccess = QUOTE(DFUNC(treatmentAdvanced_fullHeal));
            itemConsumed = QGVAR(consumeItem_PAK);
            animationPatient = "";
            animationPatientUnconscious = "AinjPpneMstpSnonWrflDnon_rolltoback";
            animationCaller = "AinvPknlMstpSlayWnonDnon_medicOther";
            animationCallerProne = "AinvPpneMstpSlayW[wpn]Dnon_medicOther";
            animationCallerSelf = "";
            animationCallerSelfProne = "";
            litter[] = { {"All", "", {"ACE_MedicalLitter_gloves"}},  {"All", "", {{"ACE_MedicalLitterBase", "ACE_MedicalLitter_bandage1", "ACE_MedicalLitter_bandage2", "ACE_MedicalLitter_bandage3"}} }, {"All", "", {{"ACE_MedicalLitterBase", "ACE_MedicalLitter_bandage1", "ACE_MedicalLitter_bandage2", "ACE_MedicalLitter_bandage3"}}} };
        };
        class CheckPulse: fieldDressing {
            displayName = "";
            displayNameProgress = "$STR_ACE_Medical_Check_Pulse_Content";
            treatmentLocations[] = {"All"};
            requiredMedic = 0;
            treatmentTime = 2;
            items[] = {};
            callbackSuccess = QUOTE(DFUNC(actionCheckPulse));
            callbackFailure = "";
            callbackProgress = "";
            animationPatient = "";
            animationCaller = ""; // TODO
            itemConsumed = 0;
            litter[] = {};
        };
        class CheckBloodPressure: CheckPulse {
            callbackSuccess = QUOTE(DFUNC(actionCheckBloodPressure));
            displayNameProgress = "$STR_ACE_Medical_Check_Bloodpressure_Content";
        };
        class CheckResponse: CheckPulse {
            callbackSuccess = QUOTE(DFUNC(actionCheckResponse));
            displayNameProgress = "$STR_ACE_Medical_Check_Response_Content";
        };
        class RemoveTourniquet: CheckPulse {
            treatmentTime = 2.5;
            callbackSuccess = QUOTE(DFUNC(actionRemoveTourniquet));
            condition = QUOTE([ARR_2(_this select 1, _this select 2)] call FUNC(hasTourniquetAppliedTo));
            displayNameProgress = "$STR_ACE_Medical_RemovingTourniquet";
        };
        class CPR: fieldDressing {
            displayName = "$STR_ACE_Medical_Actions_CPR";
            displayNameProgress = "$STR_ACE_Medical_Actions_PerformingCPR";
            treatmentLocations[] = {"All"};
            requiredMedic = 0;
            treatmentTime = 15;
            items[] = {};
            condition = "((_this select 1) getvariable ['ACE_medical_inCardiacArrest', false])";
            callbackSuccess = QUOTE(DFUNC(treatmentAdvanced_CPR));
            callbackFailure = "";
            callbackProgress = "(((_this select 0) select 1) getvariable ['ACE_medical_inCardiacArrest', false])";
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
            displayName = "$STR_ACE_Medical_PlaceInBodyBag";
            displayNameProgress = "$STR_ACE_Medical_PlacingInBodyBag";
            treatmentLocations[] = {"All"};
            requiredMedic = 0;
            treatmentTime = 2;
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

class ACE_Medical_Advanced {
    // Defines all the possible injury types for advanced medical
    class Injuries {
        // All the possible wounds
        class wounds {

            // Source: Scarle
            //  Also called scrapes, they occur when the skin is rubbed away by friction against another rough surface (e.g. rope burns and skinned knees).
            class Abrasion {
                name = "$STR_ACE_Medical_Wounds_Abrasion";
                selections[] = {"All"};
                bleedingRate = 0.0001;
                pain = 0.01;
                causes[] = {"falling", "ropeburn", "vehiclecrash", "unknown"};
                minDamage = 0.01;
                class Minor {
                    name = "$STR_ACE_Medical_Wounds_Abrasion_Minor";
                    minDamage = 0.01;
                    maxDamage = 0.2;
                    bleedingRate = 0.0001;
                };
                class Medium {
                    name = "$STR_ACE_Medical_Wounds_Abrasion_Medium";
                    minDamage = 0.2;
                    maxDamage = 0.3;
                    bleedingRate = 0.00015;
                };
                class Large {
                    name = "$STR_ACE_Medical_Wounds_Abrasion_Large";
                    minDamage = 0.3;
                    bleedingRate = 0.0002;
                };
            };

            // Occur when an entire structure or part of it is forcibly pulled away, such as the loss of a permanent tooth or an ear lobe. Explosions, gunshots, and animal bites may cause avulsions.
            class Avulsions {
                name = "$STR_ACE_Medical_Wounds_Avulsion";
                selections[] = {"All"};
                bleedingRate = 0.01;
                pain = 0.3;
                causes[] = {"explosive", "vehiclecrash", "grenade", "shell", "bullet", "backblast", "bite"};
                minDamage = 0.2;
                class Minor {
                    name = "$STR_ACE_Medical_Wounds_Avulsion_Minor";
                    minDamage = 0.2;
                    maxDamage = 0.3;
                    bleedingRate = 0.01;
                };
                class Medium {
                    name = "$STR_ACE_Medical_Wounds_Avulsion_Medium";
                    minDamage = 0.3;
                    maxDamage = 0.6;
                    bleedingRate = 0.02;
                };
                class Large {
                    name = "$STR_ACE_Medical_Wounds_Avulsion_Large";
                    minDamage = 0.5;
                    bleedingRate = 0.05;
                };
            };

            // Also called bruises, these are the result of a forceful trauma that injures an internal structure without breaking the skin. Blows to the chest, abdomen, or head with a blunt instrument (e.g. a football or a fist) can cause contusions.
            class Contusion {
                name = "$STR_ACE_Medical_Wounds_Contusion";
                selections[] = {"All"};
                bleedingRate = 0.0;
                pain = 0.05;
                causes[] = {"bullet", "backblast", "punch", "vehiclecrash", "falling"};
                minDamage = 0.01;
                maxDamage = 0.1;
                class Minor {
                    name = "$STR_ACE_Medical_Wounds_Contusion_Minor";
                    minDamage = 0.01;
                    maxDamage = 0.1;
                };
                class Medium {
                    name = "$STR_ACE_Medical_Wounds_Contusion_Medium";
                    minDamage = 0.1;
                    maxDamage = 0.15;
                };
                class Large {
                    name = "$STR_ACE_Medical_Wounds_Contusion_Large";
                    minDamage = 0.15;
                    maxDamage = 0.2;
                };
            };

            // Occur when a heavy object falls onto a person, splitting the skin and shattering or tearing underlying structures.
            class CrushWound {
                name = "$STR_ACE_Medical_Wounds_Crush";
                selections[] = {"All"};
                bleedingRate = 0.01;
                pain = 0.1;
                causes[] = {"falling", "vehiclecrash", "punch", "unknown"};
                minDamage = 0.1;
                class Minor {
                    name = "$STR_ACE_Medical_Wounds_Crush_Minor";
                    minDamage = 0.1;
                    maxDamage = 0.45;
                    bleedingRate = 0.005;
                };
                class Medium {
                    name = "$STR_ACE_Medical_Wounds_Crush_Medium";
                    minDamage = 0.4;
                    maxDamage = 0.7;
                    bleedingRate = 0.007;
                };
                class Large {
                    name = "$STR_ACE_Medical_Wounds_Crush_Large";
                    minDamage = 0.6;
                    bleedingRate = 0.0095;
                };
            };

            // Slicing wounds made with a sharp instrument, leaving even edges. They may be as minimal as a paper cut or as significant as a surgical incision.
            class Cut {
                name = "$STR_ACE_Medical_Wounds_Cut";
                selections[] = {"All"};
                bleedingRate = 0.01;
                pain = 0.075;
                causes[] = {"vehiclecrash", "grenade", "explosive", "shell", "backblast", "stab", "unknown"};
                minDamage = 0.1;
                class Minor {
                    name = "$STR_ACE_Medical_Wounds_Cut_Minor";
                    minDamage = 0.1;
                    maxDamage = 0.3;
                    bleedingRate = 0.005;
                };
                class Medium {
                    name = "$STR_ACE_Medical_Wounds_Cut_Medium";
                    minDamage = 0.3;
                    maxDamage = 0.65;
                    bleedingRate = 0.02;
                };
                class Large {
                    name = "$STR_ACE_Medical_Wounds_Cut_Large";
                    minDamage = 0.65;
                    bleedingRate = 0.05;
                };
            };

            // Also called tears, these are separating wounds that produce ragged edges. They are produced by a tremendous force against the body, either from an internal source as in childbirth, or from an external source like a punch.
            class Laceration {
                name = "$STR_ACE_Medical_Wounds_Laceration";
                selections[] = {"All"};
                bleedingRate = 0.01;
                pain = 0.075;
                causes[] = {"vehiclecrash", "punch"};
                minDamage = 0.01;
                class Minor {
                    name = "$STR_ACE_Medical_Wounds_Laceration_Minor";
                    minDamage = 0.1;
                    maxDamage = 0.5;
                    bleedingRate = 0.005;
                };
                class Medium {
                    name = "$STR_ACE_Medical_Wounds_Laceration_Medium";
                    minDamage = 0.5;
                    maxDamage = 0.7;
                    bleedingRate = 0.01;
                };
                class Large {
                    name = "$STR_ACE_Medical_Wounds_Laceration_Large";
                    minDamage = 0.7;
                    bleedingRate = 0.03;
                };
            };

            // Also called velocity wounds, they are caused by an object entering the body at a high speed, typically a bullet or small peices of shrapnel.
            class velocityWound {
                name = "$STR_ACE_Medical_Wounds_VelocityWound";
                selections[] = {"All"};
                bleedingRate = 0.01;
                pain = 0.2;
                causes[] = {"bullet", "grenade","explosive", "shell", "unknown"};
                minDamage = 0.15;
                class Minor {
                    name = "$STR_ACE_Medical_Wounds_VelocityWound_Minor";
                    minDamage = 0.15;
                    maxDamage = 0.3;
                    bleedingRate = 0.025;
                };
                class Medium {
                    name = "$STR_ACE_Medical_Wounds_VelocityWound_Medium";
                    minDamage = 0.3;
                    bleedingRate = 0.05;
                };
                class Large {
                    name = "$STR_ACE_Medical_Wounds_VelocityWound_Large";
                    minDamage = 0.75;
                    bleedingRate = 0.1;
                };
            };

            // Deep, narrow wounds produced by sharp objects such as nails, knives, and broken glass.
            class punctureWound {
                name = "$STR_ACE_Medical_Wounds_PunctureWound";
                selections[] = {"All"};
                bleedingRate = 0.01;
                pain = 0.075;
                causes[] = {"stab", "grenade"};
                minDamage = 0.01;
                class Minor {
                    name = "$STR_ACE_Medical_Wounds_PunctureWound_Minor";
                    minDamage = 0.01;
                    maxDamage = 0.5;
                    bleedingRate = 0.01;
                };
                class Medium {
                    name = "$STR_ACE_Medical_Wounds_PunctureWound_Medium";
                    minDamage = 0.5;
                    maxDamage = 0.75;
                    bleedingRate = 0.03;
                };
                class Large {
                    name = "$STR_ACE_Medical_Wounds_PunctureWound_Large";
                    minDamage = 0.65;
                    bleedingRate = 0.08;
                };
            };
        };
        class fractures {
            class Femur {
                name = "$STR_ACE_Medical_Wounds_Femur";
                selections[] = {"Head", "Torso"};
                pain = 0.2;
                causes[] = {"Bullet", "VehicleCrash", "Backblast", "Explosive", "Shell", "Grenade"};
                minDamage = 0.5;
            };
        };
        class damageTypes {
            thresholds[] = {{0.1, 1}};
            selectionSpecific = 1;
            lethalDamage = 0.01;

            class bullet {
                // above damage, amount. Put the highest threshold to the left and lower the threshold with the elements to the right of it.
                thresholds[] = {{0.1, 1}};
                selectionSpecific = 1;
            };
            class grenade {
                thresholds[] = {{0.1, 3}, {0, 1}};
                selectionSpecific = 0;
            };
            class explosive {
                thresholds[] = {{1, 6}, {0.1, 4}, {0, 1}};
                selectionSpecific = 0;
            };
            class shell {
                thresholds[] = {{1, 7}, {0.1, 5}, {0, 1}};
                selectionSpecific = 0;
            };
            class vehiclecrash {
                thresholds[] = {{0.25, 5}};
                selectionSpecific = 0;
            };
            class backblast {
                thresholds[] = {{0, 2},{0.55, 5}, {1, 6}};
                selectionSpecific = 0;
                lethalDamage = 1;
            };
            class stab {
                thresholds[] = {{0.1, 1}};
                selectionSpecific = 1;
            };
            class punch {
                thresholds[] = {{0.1, 1}};
                selectionSpecific = 1;
            };
            class falling {
                thresholds[] = {{0.1, 1}};
                selectionSpecific = 1;
            };
            class ropeburn {
                thresholds[] = {{0.1, 1}};
                selectionSpecific = 1;
            };
            class unknown {
                thresholds[] = {{0.1, 1}};
            };
        };
    };
    class Treatment {
        class Bandaging {
           class FieldDressing {
                // How effect is the bandage for treating one wounds type injury
                effectiveness = 1;
                // What is the chance and delays (in seconds) of the treated default injury reopening
                reopeningChance = 0.1;
                reopeningMinDelay = 120;
                reopeningMaxDelay = 200;
                class Abrasion {
                    effectiveness = 1;
                    reopeningChance = 0;
                    reopeningMinDelay = 0;
                    reopeningMaxDelay = 0;
                };
                class Avulsions: Abrasion {
                    effectiveness = 0.3;
                    reopeningChance = 0.5;
                    reopeningMinDelay = 120;
                    reopeningMaxDelay = 200;
                };
                class Contusion: Abrasion {
                    effectiveness = 1;
                    reopeningChance = 0;
                    reopeningMinDelay = 0;
                    reopeningMaxDelay = 0;
                };
                class CrushWound: Abrasion {
                    effectiveness = 0.6;
                    reopeningChance = 0.2;
                    reopeningMinDelay = 120;
                    reopeningMaxDelay = 200;
                };
                class Cut: Abrasion {
                    effectiveness = 0.4;
                    reopeningChance = 0.5;
                    reopeningMinDelay = 220;
                    reopeningMaxDelay = 260;
                };
                class Laceration: Abrasion {
                    effectiveness = 0.7;
                    reopeningChance = 0.3;
                    reopeningMinDelay = 120;
                    reopeningMaxDelay = 260;
                };
                class velocityWound: Abrasion {
                    effectiveness = 0.3;
                    reopeningChance = 0.8;
                    reopeningMinDelay = 20;
                    reopeningMaxDelay = 300;
                };
                class punctureWound: Abrasion {
                    effectiveness = 0.5;
                    reopeningChance = 0.8;
                    reopeningMinDelay = 20;
                    reopeningMaxDelay = 300;
                };
            };
            class PackingBandage: fieldDressing {
                 class Abrasion {
                    effectiveness = 1;
                    reopeningChance = 0;
                    reopeningMinDelay = 0;
                    reopeningMaxDelay = 0;
                };
                class Avulsions: Abrasion {
                    effectiveness = 1;
                    reopeningChance = 0.3;
                    reopeningMinDelay = 120;
                    reopeningMaxDelay = 200;
                };
                class Contusion: Abrasion {
                    effectiveness = 1;
                    reopeningChance = 0;
                    reopeningMinDelay = 0;
                    reopeningMaxDelay = 0;
                };
                class CrushWound: Abrasion {
                    effectiveness = 0.6;
                    reopeningChance = 0.2;
                    reopeningMinDelay = 120;
                    reopeningMaxDelay = 200;
                };
                class Cut: Abrasion {
                    effectiveness = 0.2;
                    reopeningChance = 0.6;
                    reopeningMinDelay = 30;
                    reopeningMaxDelay = 260;
                };
                class Laceration: Abrasion {
                    effectiveness = 0.3;
                    reopeningChance = 0.3;
                    reopeningMinDelay = 120;
                    reopeningMaxDelay = 260;
                };
                class velocityWound: Abrasion {
                    effectiveness = 1;
                    reopeningChance = 0.5;
                    reopeningMinDelay = 20;
                    reopeningMaxDelay = 300;
                };
                class punctureWound: Abrasion {
                    effectiveness = 0.3;
                    reopeningChance = 0.5;
                    reopeningMinDelay = 20;
                    reopeningMaxDelay = 300;
                };
            };
            class ElasticBandage: fieldDressing {
                 class Abrasion {
                    effectiveness = 1;
                    reopeningChance = 0;
                    reopeningMinDelay = 0;
                    reopeningMaxDelay = 0;
                };
                class Avulsions: Abrasion {
                    effectiveness = 0.3;
                    reopeningChance = 0.4;
                    reopeningMinDelay = 120;
                    reopeningMaxDelay = 200;
                };
                class Contusion: Abrasion {
                    effectiveness = 1;
                    reopeningChance = 0;
                    reopeningMinDelay = 0;
                    reopeningMaxDelay = 0;
                };
                class CrushWound: Abrasion {
                    effectiveness = 1;
                    reopeningChance = 0;
                    reopeningMinDelay = 0;
                    reopeningMaxDelay = 0;
                };
                class Cut: Abrasion {
                    effectiveness = 1;
                    reopeningChance = 0.2;
                    reopeningMinDelay = 10;
                    reopeningMaxDelay = 400;
                };
                class Laceration: Abrasion {
                    effectiveness = 1;
                    reopeningChance = 0.3;
                    reopeningMinDelay = 120;
                    reopeningMaxDelay = 260;
                };
                class velocityWound: Abrasion {
                    effectiveness = 0.5;
                    reopeningChance = 0.5;
                    reopeningMinDelay = 20;
                    reopeningMaxDelay = 300;
                };
                class punctureWound: Abrasion {
                    effectiveness = 0.85;
                    reopeningChance = 0.5;
                    reopeningMinDelay = 20;
                    reopeningMaxDelay = 300;
                };
            };
            class QuikClot: fieldDressing {
                 class Abrasion {
                    effectiveness = 0.7;
                    reopeningChance = 0;
                    reopeningMinDelay = 0;
                    reopeningMaxDelay = 0;
                };
                class Avulsions: Abrasion {
                    effectiveness = 0.2;
                    reopeningChance = 0.1;
                    reopeningMinDelay = 300;
                    reopeningMaxDelay = 350;
                };
                class Contusion: Abrasion {
                    effectiveness = 0.7;
                    reopeningChance = 0;
                    reopeningMinDelay = 0;
                    reopeningMaxDelay = 0;
                };
                class CrushWound: Abrasion {
                    effectiveness = 0.7;
                    reopeningChance = 0;
                    reopeningMinDelay = 0;
                    reopeningMaxDelay = 0;
                };
                class Cut: Abrasion {
                    effectiveness = 0.7;
                    reopeningChance = 0.2;
                    reopeningMinDelay = 100;
                    reopeningMaxDelay = 400;
                };
                class Laceration: Abrasion {
                    effectiveness = 0.7;
                    reopeningChance = 0;
                    reopeningMinDelay = 0;
                    reopeningMaxDelay = 0;
                };
                class velocityWound: Abrasion {
                    effectiveness = 0.7;
                    reopeningChance = 0.1;
                    reopeningMinDelay = 200;
                    reopeningMaxDelay = 300;
                };
                class punctureWound: Abrasion {
                    effectiveness = 0.5;
                    reopeningChance = 0.1;
                    reopeningMinDelay = 200;
                    reopeningMaxDelay = 300;
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
                hrIncreaseLow[] = {-10, -30, 35};
                hrIncreaseNormal[] = {-10, -50, 40};
                hrIncreaseHigh[] = {-10, -40, 50};
                timeInSystem = 900;
                maxDose = 4;
                inCompatableMedication[] = {};
                viscosityChange = 10;
            };
            class Epinephrine {
                painReduce = 0;
                hrIncreaseLow[] = {10, 20, 30};
                hrIncreaseNormal[] = {10, 50, 20};
                hrIncreaseHigh[] = {10, 40, 10};
                timeInSystem = 120;
                maxDose = 10;
                inCompatableMedication[] = {};
            };
            class Atropine {
                painReduce = 0;
                hrIncreaseLow[] = {-5, -7, 15};
                hrIncreaseNormal[] = {-10, -30, 20};
                hrIncreaseHigh[] = {-10, -20, 10};
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
};
