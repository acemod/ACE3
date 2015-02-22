
class ACE_Medical_Actions {
    class Basic {
        class ACE_Bandaging {
            // Which locations can this treatment action be used? Available: Field, MedicalFacility, MedicalVehicle, All.
            treatmentLocations[] = {"Field", "MedicalFacility", "MedicalVehicle"};
            // What is the level of medical skill required for this treatment action? 0 = all soldiers, 1 = medic, 2 = doctor
            requiredMedic = 0;
            // Available under which medical level settings? 0 = basic, 1 = advanced.
            availableLevels[] = {0, 1};
            // The time it takes for a treatment action to complete. Time is in seconds.
            treatmentTime = 5;
            // Item required for the action. Leave empty for no item required.
            items[] = {"ace_sampleItem"};
            // Callbacks
            callbackSuccess = "hint ""Success"";";
            callbackFailure = "hint ""Failure "";";
            onProgress = "";
            animationPatient = "";
            animationCaller = "";
        };
    };

    class Advanced {
        class ACE_Bandaging {
            // Which locations can this treatment action be used? Available: Field, MedicalFacility, MedicalVehicle, All.
            treatmentLocations[] = {"Field", "MedicalFacility", "MedicalVehicle"};
            // What is the level of medical skill required for this treatment action? 0 = all soldiers, 1 = medic, 2 = doctor
            requiredMedic = 0;
            // Available under which medical level settings? 0 = basic, 1 = advanced.
            availableLevels[] = {0, 1};
            // The time it takes for a treatment action to complete. Time is in seconds.
            treatmentTime = 5;
            // Item required for the action. Leave empty for no item required.
            items[] = {"ace_sampleItem"};
            // Callbacks
            callbackSuccess = "hint ""Success"";";
            callbackFailure = "hint ""Failure "";";
            onProgress = "";
            animationPatient = "";
            animationCaller = "";
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
                causes[] = {"bullet", "backblast", "punch"};
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
                name = "Impacted Tissue";
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
            class ACE_bandage {
                // How effect is the bandage for treating one wounds type injury
                effectiveness = 1;
                // What is the chance and delays (in seconds) of the treated default injury reopening
                reopeningChance = 0.1;
                reopeningMinDelay = 120;
                reopeningMaxDelay = 200;
                // Specific details for the Scratch type Wound
                class Scratch {
                    effectiveness = 1;
                    reopeningChance = 0;
                    reopeningMinDelay = 0;
                    reopeningMaxDelay = 0;
                };
            };
        };
        class Medication {
            // How much does the pain get reduced?
            painReduce = 0;
            // How much will the heart rate be increased when the HR is low (below 55)? {minIncrease, maxIncrease, seconds}
            hrIncreaseLow[] = {10, 20, 35};
            hrIncreaseNormal[] = {10, 50, 40};
            hrIncreaseHigh[] = {10, 40, 50};
            // How long until this medication has disappeared
            timeInSystem = 120;
            // How many of this type of medication can be in the system before the patient overdoses?
            maxDose = 4;
            // specific details for the ACE_Morphine treatment action.
            class ACE_Morphine {
                painReduce = 1;
                hrIncreaseLow[] = {10, 20, 35};
                hrIncreaseNormal[] = {10, 50, 40};
                hrIncreaseHigh[] = {10, 40, 50};
                timeInSystem = 120;
                maxDose = 4;
                // {Other medication classname, total amount combined}
                inCompatableMedication[] = {{"MySampleMedication", 2}};
            };
        };
        class IV {
            // volume is in millileters
            volume = 1000;
            ratio[] = {};
            type = "Blood";
            class ACE_blood_iv {
                volume = 1000;
                ratio[] = {"Plasma", 1};
            };
            class ACE_blood_iv_500: ACE_blood_iv {
                volume = 500;
            };
            class ACE_blood_iv_250: ACE_blood_iv {
                volume = 250;
            };
            class ACE_plasma_iv {
                volume = 1000;
                ratio[] = {"Blood", 1};
                type = "Plasma";
            };
            class ACE_plasma_iv_500: ACE_plasma_iv {
                volume = 500;
            };
            class ACE_plasma_iv_250: ACE_plasma_iv {
                volume = 250;
            };

            class ACE_saline_iv {
                volume = 1000;
                type = "Saline";
            };
            class ACE_saline_iv_500: ACE_saline_iv {
                volume = 500;
            };
            class ACE_saline_iv_250: ACE_saline_iv {
                volume = 250;
            };
        };
    };
};
