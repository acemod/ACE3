
class ACE_Medical_Actions {
    class Basic {
        // @todo: localization
        class Bandage {
            displayName = "Bandage";
            displayNameProgress = "Bandaging ...";

            treatmentLocations[] = {"All"};
            requiredMedic = 0;
            treatmentTime = 5;
            treatmentTimeSelfCoef = 1;
            items[] = {{QGVAR(fieldDressing), QGVAR(packingBandage), QGVAR(elasticBandage), QGVAR(quikClot)}};

            itemConsumed = 1;

            callbackSuccess = QUOTE(DFUNC(treatmentBasic_bandage));
            callbackFailure = "";
            callbackProgress = "";

            animationPatient = "";
            animationCaller = "AinvPknlMstpSnonWnonDnon_medic4";
            animationCallerProne = "AinvPpneMstpSlayW[wpn]Dnon_medic";
            animationCallerSelf = "AinvPknlMstpSlayW[wpn]Dnon_medic";
            animationCallerSelfProne = "AinvPpneMstpSlayW[wpn]Dnon_medic";
        };
        class Morphine: Bandage {
            displayName = "Morphine";
            displayNameProgress = "Injecting Morphine ...";
            treatmentTime = 2;
            items[] = {QGVAR(morphine)};
            callbackSuccess = QUOTE(DFUNC(treatmentBasic_morphine));
            animationCaller = "AinvPknlMstpSnonWnonDnon_medic1";
        };
        class Epipen: Bandage {
            displayName = "Epinephrine";
            displayNameProgress = "Injecting Epinephrine ...";
            requiredMedic = 1;
            treatmentTime = 3;
            items[] = {QGVAR(epipen)};
            callbackSuccess = QUOTE(DFUNC(treatmentBasic_epipen));
            animationCaller = "AinvPknlMstpSnonWnonDnon_medic1";
        };
        class Bloodbag: Bandage {
            displayName = "Blood Bag";
            displayNameProgress = "Transfusing Blood ...";
            requiredMedic = 1;
            treatmentTime = 20;
            items[] = {{QGVAR(bloodIV), QGVAR(bloodIV_500), QGVAR(bloodIV_250)}};
            callbackSuccess = QUOTE(DFUNC(treatmentBasic_bloodbag));
            animationCaller = "AinvPknlMstpSnonWnonDnon_medic1";
        };
    };

    class Advanced {
        // cse_surgical_kit cse_bandage_basic cse_packing_bandage cse_bandageElastic cse_tourniquet cse_splint cse_morphine cse_atropine cse_epinephrine cse_plasma_iv cse_plasma_iv_500 cse_plasma_iv250 cse_blood_iv cse_blood_iv_500 cse_blood_iv_250 cse_saline_iv cse_saline_iv_500 cse_saline_iv_250 cse_quikclot cse_nasopharyngeal_tube cse_opa cse_liquidSkin cse_chestseal cse_personal_aid_kit

        class FieldDressing {
            // Which locations can this treatment action be used? Available: Field, MedicalFacility, MedicalVehicle, All.
            treatmentLocations[] = {"All"};
            // What is the level of medical skill required for this treatment action? 0 = all soldiers, 1 = medic, 2 = doctor
            requiredMedic = 0;
            // The time it takes for a treatment action to complete. Time is in seconds.
            treatmentTime = 5;
            // Item required for the action. Leave empty for no item required.
            items[] = {QGVAR(fieldDressing)};
            // Callbacks
            callbackSuccess = QUOTE(DFUNC(treatmentAdvanced_bandage));
            callbackFailure = "";
            callbackProgress = "";
            animationPatient = "";
            animationCaller = ""; // TODO
            itemConsumed = 1;
        };
        class PackingBandage: fieldDressing {
            items[] = {QGVAR(packingBandage)};
        };
        class ElasticBandage: fieldDressing {
            items[] = {QGVAR(elasticBandage)};
        };
        class QuikClot: fieldDressing {
            items[] = {QGVAR(quikClot)};
        };
        class Tourniquet: fieldDressing {
            items[] = {QGVAR(tourniquet)};
            treatmentTime = 6;
            callbackSuccess = QUOTE(DFUNC(treatmentTourniquet));
        };
        class Morphine: fieldDressing {
            items[] = {QGVAR(morphine)};
            treatmentTime = 3;
            callbackSuccess = QUOTE(DFUNC(treatmentAdvanced_medication));
        };
        class Atropine: fieldDressing {
            items[] = {QGVAR(atropine)};
        };
        class Epinephrine: fieldDressing {
            items[] = {QGVAR(epinephrine)};
        };
        class BloodIV: fieldDressing {
            items[] = {QGVAR(bloodIV)};
            requiredMedic = 1;
            treatmentTime = 7;
            callbackSuccess = QUOTE(DFUNC(treatmentIV));
        };
        class BloodIV_500: BloodIV {
            items[] = {QGVAR(bloodIV_500)};
        };
        class BloodIV_250: BloodIV {
            items[] = {QGVAR(bloodIV_250)};
        };
        class PlasmaIV: BloodIV {
            items[] = {QGVAR(plasmaIV)};
        };
        class PlasmaIV_500: PlasmaIV {
            items[] = {QGVAR(plasmaIV_500)};
        };
        class PlasmaIV_250: PlasmaIV {
            items[] = {QGVAR(plasmaIV_250)};
        };
        class SalineIV: BloodIV {
            items[] = {QGVAR(salineIV)};
        };
        class SalineIV_500: SalineIV {
            items[] = {QGVAR(salineIV_500)};
        };
        class SalineIV_250: SalineIV {
            items[] = {QGVAR(salineIV_250)};
        };
        class SurgicalKit: fieldDressing {
            items[] = {QGVAR(surgicalKit)};
            treatmentLocations[] = {"MedicalFacility", "MedicalVehicle"};
            requiredMedic = 2;
            treatmentTime = 15;
            callbackSuccess = QUOTE(DFUNC(treatmentAdvanced_surgicalKit));
            itemConsumed = 0;
        };
        class PersonalAidKit: fieldDressing {
            items[] = {QGVAR(personalAidKit)};
            treatmentLocations[] = {"All"};
            requiredMedic = 1;
            treatmentTime = 15;
            callbackSuccess = QUOTE(DFUNC(treatmentAdvanced_fullHeal));
            itemConsumed = 0;
        };
        class CheckPulse: fieldDressing {
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
        };
        class CheckBloodPressure: CheckPulse {
            callbackSuccess = QUOTE(DFUNC(actionCheckBloodPressure));
        };
        class CheckResponse: CheckPulse {
            callbackSuccess = QUOTE(DFUNC(actionCheckResponse));
        };
        class RemoveTourniquet: CheckPulse {
            treatmentTime = 2.5;
            callbackSuccess = QUOTE(DFUNC(actionRemoveTourniquet));
        };
        class CPR: fieldDressing {
            treatmentLocations[] = {"All"};
            requiredMedic = 0;
            treatmentTime = 25;
            items[] = {};
            callbackSuccess = QUOTE(DFUNC(treatmentAdvanced_CPR));
            callbackFailure = "";
            callbackProgress = "";
            animationPatient = "";
            animationCaller = ""; // TODO
            itemConsumed = 0;
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
                name = "Scrape";
                selections[] = {"All"};
                bleedingRate = 0.0001;
                pain = 0.1;
                causes[] = {"falling", "ropeburn", "vehiclecrash"};
                minDamage = 0.01;
                class Minor {
                    minDamage = 0.01;
                    bleedingRate = 0.0001;
                };
                class Medium {
                    minDamage = 0.2;
                    bleedingRate = 0.00015;
                };
                class Large {
                    minDamage = 0.3;
                    bleedingRate = 0.0002;
                };
            };

            // Occur when an entire structure or part of it is forcibly pulled away, such as the loss of a permanent tooth or an ear lobe. Explosions, gunshots, and animal bites may cause avulsions.
            class Avulsions {
                name = "Avulsion";
                selections[] = {"All"};
                bleedingRate = 0.01;
                pain = 1;
                causes[] = {"explosive", "vehiclecrash", "grenade", "shell", "bullet", "backblast", "bite"};
                minDamage = 0.2;
                class Minor {
                    minDamage = 0.2;
                    bleedingRate = 0.01;
                };
                class Medium {
                    minDamage = 0.3;
                    bleedingRate = 0.02;
                };
                class Large {
                    minDamage = 0.5;
                    bleedingRate = 0.05;
                };
            };

            // Also called bruises, these are the result of a forceful trauma that injures an internal structure without breaking the skin. Blows to the chest, abdomen, or head with a blunt instrument (e.g. a football or a fist) can cause contusions.
            class Contusion {
                name = "Bruise";
                selections[] = {"All"};
                bleedingRate = 0.0;
                pain = 1;
                causes[] = {"bullet", "backblast", "punch","vehiclecrash","falling"};
                minDamage = 0.01;
                class Minor {
                    minDamage = 0.01;
                };
                class Medium {
                    minDamage = 0.1;
                };
                class Large {
                    minDamage = 0.3;
                };
            };

            // Occur when a heavy object falls onto a person, splitting the skin and shattering or tearing underlying structures.
            class CrushWound {
                name = "Crushed tissue";
                selections[] = {"All"};
                bleedingRate = 0.01;
                pain = 1;
                causes[] = {"falling", "vehiclecrash", "punch"};
                minDamage = 0.1;
                class Minor {
                    minDamage = 0.1;
                    bleedingRate = 0.005;
                };
                class Medium {
                    minDamage = 0.4;
                    bleedingRate = 0.007;
                };
                class Large {
                    minDamage = 0.6;
                    bleedingRate = 0.0095;
                };
            };

            // Slicing wounds made with a sharp instrument, leaving even edges. They may be as minimal as a paper cut or as significant as a surgical incision.
            class Cut {
                name = "Cut";
                selections[] = {"All"};
                bleedingRate = 0.01;
                pain = 1;
                causes[] = {"vehiclecrash", "grenade", "explosive", "shell", "backblast", "stab"};
                minDamage = 0.1;
                class Minor {
                    minDamage = 0.1;
                    bleedingRate = 0.005;
                };
                class Medium {
                    minDamage = 0.3;
                    bleedingRate = 0.02;
                };
                class Large {
                    minDamage = 0.65;
                    bleedingRate = 0.05;
                };
            };

            // Also called tears, these are separating wounds that produce ragged edges. They are produced by a tremendous force against the body, either from an internal source as in childbirth, or from an external source like a punch.
            class Laceration {
                name = "Tear";
                selections[] = {"All"};
                bleedingRate = 0.01;
                pain = 1;
                causes[] = {"vehiclecrash", "punch"};
                minDamage = 0.01;
                class Minor {
                    minDamage = 0.1;
                    bleedingRate = 0.005;
                };
                class Medium {
                    minDamage = 0.5;
                    bleedingRate = 0.01;
                };
                class Large {
                    minDamage = 0.7;
                    bleedingRate = 0.03;
                };
            };

            // Also called velocity wounds, they are caused by an object entering the body at a high speed, typically a bullet or small peices of shrapnel.
            class velocityWound {
                name = "Velocity Wound";
                selections[] = {"All"};
                bleedingRate = 0.01;
                pain = 1;
                causes[] = {"bullet", "grenade","explosive", "shell"};
                minDamage = 0.15;
                class Minor {
                    minDamage = 0.15;
                    bleedingRate = 0.025;
                };
                class Medium {
                    minDamage = 0.3;
                    bleedingRate = 0.05;
                };
                class Large {
                    minDamage = 0.75;
                    bleedingRate = 0.1;
                };
            };

            // Deep, narrow wounds produced by sharp objects such as nails, knives, and broken glass.
            class punctureWound {
                name = "Puncture Wound";
                selections[] = {"All"};
                bleedingRate = 0.01;
                pain = 1;
                causes[] = {"stab", "grenade"};
                minDamage = 0.01;
                class Minor {
                    minDamage = 0.01;
                    bleedingRate = 0.01;
                };
                class Medium {
                    minDamage = 0.5;
                    bleedingRate = 0.03;
                };
                class Large {
                    minDamage = 0.65;
                    bleedingRate = 0.08;
                };
            };
        };
        class fractures {
            class Femur {
                name = "Broken Femur";
                selections[] = {"Head", "Torso"};
                pain = 20;
                causes[] = {"Bullet", "VehicleCrash", "Backblast", "Explosive", "Shell", "Grenade"};
                minDamage = 0.5;
            };
        };
        class damageTypes {
            thresholds[] = {{0.1, 1}};
            selectionSpecific = 1;
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
                thresholds[] = {{0.25, 5}};
                selectionSpecific = 0;
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

            // The viscosity of a fluid is a measure of its resistance to gradual deformation by shear stress or tensile stress. For liquids, it corresponds to the informal concept of "thickness". This value will increase/decrease the viscoty of the blood with the percentage given. Where 100 = max. Using the minus will decrease viscosity
            viscosityChange = 0;

            // specific details for the ACE_Morphine treatment action
            class Morphine {
                painReduce = 0.7;
                hrIncreaseLow[] = {-10, -30, 35};
                hrIncreaseNormal[] = {-10, -50, 40};
                hrIncreaseHigh[] = {-10, -40, 50};
                timeInSystem = 500;
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
                hrIncreaseLow[] = {20, 30, 15};
                hrIncreaseNormal[] = {-10, -50, 20};
                hrIncreaseHigh[] = {-10, -40, 10};
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
