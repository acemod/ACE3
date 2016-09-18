
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
