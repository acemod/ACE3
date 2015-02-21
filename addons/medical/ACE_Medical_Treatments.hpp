
class ACE_Medical_Treatments {
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

class ACE_Medical_Advanced {
    // Defines all the possible injury types for advanced medical
    class Injuries {
        // All the possible wounds
        class wounds {
            class Scratch {
                // Name displayed in a diagnose or injury overview list
                name = "It's just a Scratch";
                // Possible selections that this injury can occur for
                selections[] = {"All"};
                // How much does this injury bleed per second?
                bleedingRate = 0.01;
                // How much pain is present while this injury is present
                pain = 15;
                // Possible damage causes for this injury
                causes[] = {"Bullet", "VehicleCrash", "Backblast", "Explosive", "Shell", "Grenade"};
                // Minimal amount of damage for this injury to occure
                minDamage = 0.01;
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
        };
    };
    class Treatment {
        class Bandaging {
            Class ACE_bandage {
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
