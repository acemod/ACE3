
class CfgVehicles {

    class Logic;
    class Module_F: Logic {
        class ArgumentsBaseUnits {
        };
    };
    // TODO localization for all the modules
    class ACE_moduleMedicalSettings: Module_F {
        scope = 2;
        displayName = "Medical Settings [ACE]";
        icon = QUOTE(PATHTOF(ui\moduleIcon.paa));
        category = "ACE_medical";
        function = QUOTE(DFUNC(moduleMedicalSettings));
        functionPriority = 1;
        isGlobal = 1;
        isTriggerActivated = 0;
        author = "Glowbal";
        class Arguments {
            class level {
                displayName = "Medical Level";
                description = "What is the medical simulation level?";
                typeName = "NUMBER";
                class values {
                    class disable {
                        name = "Disabled";
                        value = 0;
                    };
                    class normal {
                        name = "Basic";
                        value = 1;
                        default = 1;
                    };
                    class full  {
                        name = "Advanced";
                        value = 2;
                    };
                };
            };
            class enableFor {
                displayName = "Enabled for";
                description = "Select what units the medical system will be enabled for";
                typeName = "NUMBER";
                class values {
                    class playableUnits {
                        name = "Players only";
                        value = 0;
                        default = 1;
                    };
                    class playableUnitsAndAI {
                        name = "Players and AI";
                        value = 1;
                    };
                };
            };
            class enableAirway {
                displayName = "Enable Airway";
                description = "Enable Advanced medical Airway";
                typeName = "BOOL";
                defaultValue = 0;
            };
            class enableFractures {
                displayName = "Enable Fractures";
                description = "Enable Advanced medical Fractures";
                typeName = "BOOL";
                defaultValue = 0;
            };
            class enableAdvancedWounds {
                displayName = "Enable Advanced wounds";
                description = "Allow reopening of bandaged wounds?";
                typeName = "BOOL";
                defaultValue = 0;
            };
            class enableVehicleCrashes {
                displayName = "Vehicle Crashes";
                description = "Do units take damage from a vehicle crash?";
                typeName = "BOOL";
                defaultValue = 1;
            };
            class enableScreams {
                displayName = "Enable Screams";
                description = "Enable screaming by injuried units";
                typeName = "BOOL";
                defaultValue = 1;
            };
            class playerDamageThreshold {
                displayName = "Player Damage";
                description = "What is the damage a player can take before being killed?";
                typeName = "NUMBER";
                defaultValue = 1;
            };
            class AIDamageThreshold {
                displayName = "AI Damage";
                description = "What is the damage an AI can take before being killed?";
                typeName = "NUMBER";
                defaultValue = 1;
            };
            class enableUnsconsiousnessAI {
                displayName = "AI Unconsciousness";
                description = "Allow AI to go unconscious";
                typeName = "NUMBER";
                class values {
                    class disable {
                        name = "Disabled";
                        value = 0;
                    };
                    class normal {
                        name = "Enabled";
                        value = 1;
                        default = 1;
                    };
                    class full  {
                        name = "50/50";
                        value = 2;
                    };
                };
            };
            class preventInstaDeath {
                displayName = "Prevent instant death";
                description = "Have a unit move to unconscious instead of death";
                typeName = "BOOL";
                defaultValue = 0;
            };
        };
        class ModuleDescription {
            description = "Provides a medical system for both players and AI.";
            sync[] = {};
        };
    };

    class ACE_moduleTreatmentConfiguration: Module_F {
        scope = 2;
        displayName = "Treatment Configuration [ACE]";
        icon = QUOTE(PATHTOF(ui\moduleIcon.paa));
        category = "ACE_medical";
        function = QUOTE(FUNC(moduleTreatmentConfiguration));
        functionPriority = 10;
        isGlobal = 2;
        isTriggerActivated = 0;
        isDisposable = 0;
        author = "Glowbal";
        class Arguments {
            class medicSetting {
                displayName = "Medics setting";
                description = "What is the level of detail prefered for medics?";
                typeName = "NUMBER";
                class values {
                    class disable {
                        name = "Disable medics";
                        value = 0;
                    };
                    class normal {
                        name = "Normal";
                        value = 1;
                        default = 1;
                    };
                    class full  {
                        name = "Advanced";
                        value = 2;
                    };
                };
            };
            class maxRevives {
                displayName = "Max revives";
                description = "Max amount of revives available (when preventing death)";
                typeName = "NUMBER";
                defaultValue = 1;
            };
            class enableOverdosing {
                displayName = "Enable Overdosing";
                description = "Enable overdosing of medications";
                typeName = "BOOL";
                defaultValue = 1;
            };
            class bleedingCoefficient {
                displayName = "Bleeding coefficient";
                description = "Coefficient to modify the bleeding speed";
                typeName = "NUMBER";
                defaultValue = 1;
            };
        };
        class ModuleDescription {
            description = "Configure the treatment settings from ACE Medical";
            sync[] = {};
        };
    };

    class ACE_moduleAssignMedicRoles: Module_F {
        scope = 2;
        displayName = "Set Medic Class [ACE]";
        icon = QUOTE(PATHTOF(ui\moduleIcon.paa));
        category = "ACE_medical";
        function = QUOTE(FUNC(moduleAssignMedicRoles));
        functionPriority = 10;
        isGlobal = 2;
        isTriggerActivated = 0;
        isDisposable = 0;
        author = "Glowbal";
        class Arguments {
            class EnableList {
                displayName = "List";
                description = "List of unit names that will be classified as medic, separated by commas.";
                defaultValue = "";
                typeName = "STRING";
            };
            class role {
                displayName = "Is Medic";
                description = "Medics allow for more advanced treatment in case of Advanced Medic roles enabled";
                typeName = "NUMBER";
                class values {
                    class none {
                        name = "None";
                        value = 0;
                    };
                    class medic {
                        name = "Regular medic";
                        value = 1;
                        default = 1;
                    };
                    class doctor {
                        name = "Doctor (Only Advanced Medics)";
                        value = 1;
                        default = 1;
                    };
                };
            };
        };
        class ModuleDescription {
            description = "Assigns the ACE medic class to a unit";
            sync[] = {};
        };
    };

    class ACE_moduleAssignMedicVehicle: Module_F {
        scope = 2;
        displayName = "Set Medical Vehicle [ACE]";
        icon = QUOTE(PATHTOF(ui\moduleIcon.paa));
        category = "ACE_medical";
        function = QUOTE(FUNC(moduleAssignMedicalVehicle));
        functionPriority = 10;
        isGlobal = 2;
        isTriggerActivated = 0;
        isDisposable = 0;
        author = "Glowbal";
        class Arguments {
            class EnableList {
                displayName = "List";
                description = "List of vehicles that will be classified as medical vehicle, separated by commas.";
                defaultValue = "";
                typeName = "STRING";
            };
            class enabled {
                displayName = "Is Medical Vehicle";
                description = "Whatever or not the objects in the list will be a medical vehicle.";
                typeName = "BOOL";
                defaultValue = 1;
            };
        };
        class ModuleDescription {
            description = "Assigns the ACE medic class to a unit";
            sync[] = {};
        };
    };
    class ACE_moduleAssignMedicalFacility: Module_F {
        scope = 2;
        displayName = "Set Medical Facility [ACE]";
        icon = QUOTE(PATHTOF(ui\moduleIcon.paa));
        category = "ACE_medical";
        function = QUOTE(FUNC(moduleAssignMedicalFacility));
        functionPriority = 10;
        isGlobal = 2;
        isTriggerActivated = 0;
        isDisposable = 0;
        author = "Glowbal";
        class Arguments {
            class enabled {
                displayName = "Is Medical Facility";
                description = "Registers an object as a medical facility for CMS";
                typeName = "BOOL";
            };
        };
        class ModuleDescription {
            description = "Defines an object as a medical facility for CMS. This allows for more advanced treatments. Can be used on buildings and vehicles. ";
            sync[] = {};
        };
    };

    #define ARM_LEG_ARMOR_DEFAULT 2
    #define ARM_LEG_ARMOR_BETTER  3
    #define ARM_LEG_ARMOR_CSAT    4

    class Man;
    class CAManBase: Man {
        class HitPoints {
            class HitHead;
            class HitBody;
            // "DEACTIVE" DEFAULT HITPOINTS
            class HitHands {
                armor = 999; //armor = 2;
                explosionShielding = 0; //explosionShielding = 1;
                material = -1;
                minimalHit = 0;
                name = "";
                passThrough = 1;
                radius = 0; //radius = 0.06;
                visual = "injury_hands";
            };
            class HitLegs {
                armor = 999; //armor = 2;
                explosionShielding = 0; //explosionShielding = 1;
                material = -1;
                minimalHit = 0;
                name = "";
                passThrough = 1;
                radius = 0; //radius = 0.08;
                visual = "injury_legs";
            };

            class HitLeftArm {
                armor = ARM_LEG_ARMOR_DEFAULT; //2;
                explosionShielding = 1;
                material = -1;
                minimalHit = 0;
                name = "hand_l";
                passThrough = 1;
                radius = 0.06;
                visual = "injury_hands";
            };
            class HitRightArm: HitLeftArm {
                name = "hand_r";
            };
            class HitLeftLeg {
                armor = ARM_LEG_ARMOR_DEFAULT; //2;
                explosionShielding = 1;
                material = -1;
                minimalHit = 0;
                name = "leg_l";
                passThrough = 1;
                radius = 0.08;
                visual = "injury_legs";
            };
            class HitRightLeg: HitLeftLeg {
                name = "leg_r";
            };
        };

        class ACE_Actions {
            // @todo morphine, epi, bloodbag actions for basic
            class ACE_Head {
                runOnHover = 1;
                statement = QUOTE([ARR_3(_target, true, 0)] call DFUNC(displayPatientInformation));

                class Bandage_Head {
                    displayName = "Bandage Head";
                    distance = 2.0;
                    condition = QUOTE([ARR_4(_player, _target, 'head', 'Bandage')] call DFUNC(canTreat));
                    statement = QUOTE([ARR_4(_player, _target, 'head', 'Bandage')] call DFUNC(treatment));
                    showDisabled = 1;
                    priority = 2;
                    hotkey = "B";
                    enableInside = 1;
                };
                // Advanced medical
                class FieldDressing {
                    displayName = "Field Dressing";
                    distance = 5.0;
                    condition = QUOTE([ARR_4(_player, _target, 'head', 'FieldDressing')] call DFUNC(canTreat));
                    statement = QUOTE([ARR_4(_player, _target, 'head', 'FieldDressing')] call DFUNC(treatment));
                    showDisabled = 0;
                    priority = 2;
                    hotkey = "";
                    enableInside = 1;
                };
                class PackingBandage: fieldDressing {
                    displayName = "Packing Bandage";
                    condition = QUOTE([ARR_4(_player, _target, 'head', 'PackingBandage')] call DFUNC(canTreat));
                    statement = QUOTE([ARR_4(_player, _target, 'head', 'PackingBandage')] call DFUNC(treatment));
                };
                class ElasticBandage: fieldDressing {
                    displayName = "Elastic Bandage";
                    condition = QUOTE([ARR_4(_player, _target, 'head', 'ElasticBandage')] call DFUNC(canTreat));
                    statement = QUOTE([ARR_4(_player, _target, 'head', 'ElasticBandage')] call DFUNC(treatment));
                };
                class QuikClot: fieldDressing {
                    displayName = "QuikClot";
                    condition = QUOTE([ARR_4(_player, _target, 'head', 'QuikClot')] call DFUNC(canTreat));
                    statement = QUOTE([ARR_4(_player, _target, 'head', 'QuikClot')] call DFUNC(treatment));
                };
                class CheckPulse: fieldDressing {
                    displayName = "Check Pulse";
                    condition = QUOTE([ARR_4(_player, _target, 'head', 'CheckPulse')] call DFUNC(canTreat));
                    statement = QUOTE([ARR_4(_player, _target, 'head', 'CheckPulse')] call DFUNC(treatment));
                };
                class CheckBloodPressure: CheckPulse {
                    displayName = "Check Blood Pressure";
                    condition = QUOTE([ARR_4(_player, _target, 'head', 'CheckBloodPressure')] call DFUNC(canTreat));
                    statement = QUOTE([ARR_4(_player, _target, 'head', 'CheckBloodPressure')] call DFUNC(treatment));
                };
                class CheckResponse: CheckPulse {
                    displayName = "Check Response";
                    condition = QUOTE([ARR_4(_player, _target, 'head', 'CheckResponse')] call DFUNC(canTreat));
                    statement = QUOTE([ARR_4(_player, _target, 'head', 'CheckResponse')] call DFUNC(treatment));
                };
            };
            class ACE_MainActions {
                class Medical {
                    displayName = "Medical";
                    distance = 5.0;
                    condition = "true";
                    runOnHover = 1;
                    statement = QUOTE([ARR_3(_target, true, 1)] call DFUNC(displayPatientInformation));
                    showDisabled = 1;
                    priority = 2;
                    hotkey = "M";
                    enableInside = 1;
                    class Bandage_Torso {
                        displayName = "Bandage Torso";
                        distance = 2.0;
                        condition = QUOTE([ARR_4(_player, _target, 'body', 'Bandage')] call DFUNC(canTreat));
                        statement = QUOTE([ARR_4(_player, _target, 'body', 'Bandage')] call DFUNC(treatment));
                        showDisabled = 1;
                        priority = 2;
                        hotkey = "B";
                        enableInside = 1;
                    };

                    // Advanced medical
                    class FieldDressing {
                        displayName = "Field Dressing";
                        distance = 5.0;
                        condition = QUOTE([ARR_4(_player, _target, 'body', 'FieldDressing')] call DFUNC(canTreat));
                        statement = QUOTE([ARR_4(_player, _target, 'body', 'FieldDressing')] call DFUNC(treatment));
                        showDisabled = 0;
                        priority = 2;
                        hotkey = "";
                        enableInside = 1;
                    };
                    class PackingBandage: fieldDressing {
                        displayName = "Packing Bandage";
                        condition = QUOTE([ARR_4(_player, _target, 'body', 'PackingBandage')] call DFUNC(canTreat));
                        statement = QUOTE([ARR_4(_player, _target, 'body', 'PackingBandage')] call DFUNC(treatment));
                    };
                    class ElasticBandage: fieldDressing {
                        displayName = "Elastic Bandage";
                        condition = QUOTE([ARR_4(_player, _target, 'body', 'ElasticBandage')] call DFUNC(canTreat));
                        statement = QUOTE([ARR_4(_player, _target, 'body', 'ElasticBandage')] call DFUNC(treatment));
                    };
                    class QuikClot: fieldDressing {
                        displayName = "QuikClot";
                        condition = QUOTE([ARR_4(_player, _target, 'body', 'QuikClot')] call DFUNC(canTreat));
                        statement = QUOTE([ARR_4(_player, _target, 'body', 'QuikClot')] call DFUNC(treatment));
                    };
                    class Morphine: fieldDressing {
                        displayName = "Morphine";
                        condition = QUOTE([ARR_4(_player, _target, 'body', 'Morphine')] call DFUNC(canTreat));
                        statement = QUOTE([ARR_4(_player, _target, 'body', 'Morphine')] call DFUNC(treatment));
                    };
                    class Atropine: Morphine {
                        displayName = "Atropine";
                        condition = QUOTE([ARR_4(_player, _target, 'body', 'Atropine')] call DFUNC(canTreat));
                        statement = QUOTE([ARR_4(_player, _target, 'body', 'Atropine')] call DFUNC(treatment));
                    };
                    class Epinephrine: Morphine {
                        displayName = "Epinephrine";
                        condition = QUOTE([ARR_4(_player, _target, 'body', 'Epinephrine')] call DFUNC(canTreat));
                        statement = QUOTE([ARR_4(_player, _target, 'body', 'Epinephrine')] call DFUNC(treatment));
                    };
                    class SurgicalKit: fieldDressing {
                        displayName = "Use Surgical Kit";
                        condition = QUOTE([ARR_4(_player, _target, 'body', 'SurgicalKit')] call DFUNC(canTreat));
                        statement = QUOTE([ARR_4(_player, _target, 'body', 'SurgicalKit')] call DFUNC(treatment));
                    };
                    class PersonalAidKit: fieldDressing {
                        displayName = "Use Personal Aid Kit";
                        condition = QUOTE([ARR_4(_player, _target, 'body', 'PackingBandage')] call DFUNC(canTreat));
                        statement = QUOTE([ARR_4(_player, _target, 'body', 'PackingBandage')] call DFUNC(treatment));
                    };
                    class CPR: fieldDressing {
                        displayName = "CPR";
                        condition = QUOTE([ARR_4(_player, _target, 'body', 'CPR')] call DFUNC(canTreat));
                        statement = QUOTE([ARR_4(_player, _target, 'body', 'CPR')] call DFUNC(treatment));
                    };
                };
            };
            class ACE_ArmLeft {
                runOnHover = 1;
                statement = QUOTE([ARR_3(_target, true, 2)] call DFUNC(displayPatientInformation));

                class Bandage_LeftArm {
                    displayName = "Bandage Left Arm";
                    distance = 2.0;
                    condition = QUOTE([ARR_4(_player, _target, 'hand_l', 'Bandage')] call DFUNC(canTreat));
                    statement = QUOTE([ARR_4(_player, _target, 'hand_l', 'Bandage')] call DFUNC(treatment));
                    showDisabled = 1;
                    priority = 2;
                    hotkey = "B";
                    enableInside = 1;
                };

                // Advanced medical
                class FieldDressing {
                    displayName = "Field Dressing";
                    distance = 5.0;
                    condition = QUOTE([ARR_4(_player, _target, 'hand_l', 'FieldDressing')] call DFUNC(canTreat));
                    statement = QUOTE([ARR_4(_player, _target, 'hand_l', 'FieldDressing')] call DFUNC(treatment));
                    showDisabled = 0;
                    priority = 2;
                    hotkey = "";
                    enableInside = 1;
                };
                class PackingBandage: fieldDressing {
                    displayName = "Packing Bandage";
                    condition = QUOTE([ARR_4(_player, _target, 'hand_l', 'PackingBandage')] call DFUNC(canTreat));
                    statement = QUOTE([ARR_4(_player, _target, 'hand_l', 'PackingBandage')] call DFUNC(treatment));
                };
                class ElasticBandage: fieldDressing {
                    displayName = "Elastic Bandage";
                    condition = QUOTE([ARR_4(_player, _target, 'hand_l', 'ElasticBandage')] call DFUNC(canTreat));
                    statement = QUOTE([ARR_4(_player, _target, 'hand_l', 'ElasticBandage')] call DFUNC(treatment));
                };
                class QuikClot: fieldDressing {
                    displayName = "QuikClot";
                    condition = QUOTE([ARR_4(_player, _target, 'hand_l', 'QuikClot')] call DFUNC(canTreat));
                    statement = QUOTE([ARR_4(_player, _target, 'hand_l', 'QuikClot')] call DFUNC(treatment));
                };
                class Tourniquet: fieldDressing {
                    displayName = "Tourniquet";
                    condition = QUOTE([ARR_4(_player, _target, 'hand_l', 'Tourniquet')] call DFUNC(canTreat));
                    statement = QUOTE([ARR_4(_player, _target, 'hand_l', 'Tourniquet')] call DFUNC(treatment));
                };
                class Morphine: fieldDressing {
                    displayName = "Morphine";
                    condition = QUOTE([ARR_4(_player, _target, 'hand_l', 'Morphine')] call DFUNC(canTreat));
                    statement = QUOTE([ARR_4(_player, _target, 'hand_l', 'Morphine')] call DFUNC(treatment));
                };
                class Atropine: Morphine {
                    displayName = "Atropine";
                    condition = QUOTE([ARR_4(_player, _target, 'hand_l', 'Atropine')] call DFUNC(canTreat));
                    statement = QUOTE([ARR_4(_player, _target, 'hand_l', 'Atropine')] call DFUNC(treatment));
                };
                class Epinephrine: Morphine {
                    displayName = "Epinephrine";
                    condition = QUOTE([ARR_4(_player, _target, 'hand_l', 'Epinephrine')] call DFUNC(canTreat));
                    statement = QUOTE([ARR_4(_player, _target, 'hand_l', 'Epinephrine')] call DFUNC(treatment));
                };
                class BloodIV: fieldDressing {
                    displayName = "Give Blood IV (1000ml)";
                    condition = QUOTE([ARR_4(_player, _target, 'hand_l', 'BloodIV')] call DFUNC(canTreat));
                    statement = QUOTE([ARR_4(_player, _target, 'hand_l', 'BloodIV')] call DFUNC(treatment));
                };
                class BloodIV_500: BloodIV {
                    displayName = "Give Blood IV (500ml)";
                    condition = QUOTE([ARR_4(_player, _target, 'hand_l', 'BloodIV_500')] call DFUNC(canTreat));
                    statement = QUOTE([ARR_4(_player, _target, 'hand_l', 'BloodIV_500')] call DFUNC(treatment));
                };
                class BloodIV_250: BloodIV {
                    displayName = "Give Blood IV (250ml)";
                    condition = QUOTE([ARR_4(_player, _target, 'hand_l', 'BloodIV_250')] call DFUNC(canTreat));
                    statement = QUOTE([ARR_4(_player, _target, 'hand_l', 'BloodIV_250')] call DFUNC(treatment));
                };
                class PlasmaIV: BloodIV {
                    displayName = "Give Blood IV (1000ml)";
                    condition = QUOTE([ARR_4(_player, _target, 'hand_l', 'BloodIV')] call DFUNC(canTreat));
                    statement = QUOTE([ARR_4(_player, _target, 'hand_l', 'BloodIV')] call DFUNC(treatment));
                };
                class PlasmaIV_500: PlasmaIV {
                    displayName = "Give Blood IV (500ml)";
                    condition = QUOTE([ARR_4(_player, _target, 'hand_l', 'PlasmaIV_500')] call DFUNC(canTreat));
                    statement = QUOTE([ARR_4(_player, _target, 'hand_l', 'PlasmaIV_500')] call DFUNC(treatment));
                };
                class PlasmaIV_250: PlasmaIV {
                    displayName = "Give Blood IV (250ml)";
                    condition = QUOTE([ARR_4(_player, _target, 'hand_l', 'PlasmaIV_250')] call DFUNC(canTreat));
                    statement = QUOTE([ARR_4(_player, _target, 'hand_l', 'PlasmaIV_250')] call DFUNC(treatment));
                };
                class SalineIV: BloodIV {
                    displayName = "Give Blood IV (1000ml)";
                    condition = QUOTE([ARR_4(_player, _target, 'hand_l', 'SalineIV')] call DFUNC(canTreat));
                    statement = QUOTE([ARR_4(_player, _target, 'hand_l', 'SalineIV')] call DFUNC(treatment));
                };
                class SalineIV_500: SalineIV {
                    displayName = "Give Blood IV (500ml)";
                    condition = QUOTE([ARR_4(_player, _target, 'hand_l', 'SalineIV_500')] call DFUNC(canTreat));
                    statement = QUOTE([ARR_4(_player, _target, 'hand_l', 'SalineIV_500')] call DFUNC(treatment));
                };
                class SalineIV_250: SalineIV {
                    displayName = "Give Blood IV (250ml)";
                    condition = QUOTE([ARR_4(_player, _target, 'hand_l', 'SalineIV_250')] call DFUNC(canTreat));
                    statement = QUOTE([ARR_4(_player, _target, 'hand_l', 'SalineIV_250')] call DFUNC(treatment));
                };
                class CheckPulse: fieldDressing {
                    displayName = "Check Pulse";
                    condition = QUOTE([ARR_4(_player, _target, 'hand_l', 'CheckPulse')] call DFUNC(canTreat));
                    statement = QUOTE([ARR_4(_player, _target, 'hand_l', 'CheckPulse')] call DFUNC(treatment));
                };
                class CheckBloodPressure: CheckPulse {
                    displayName = "Check Blood Pressure";
                    condition = QUOTE([ARR_4(_player, _target, 'hand_l', 'CheckBloodPressure')] call DFUNC(canTreat));
                    statement = QUOTE([ARR_4(_player, _target, 'hand_l', 'CheckBloodPressure')] call DFUNC(treatment));
                };
                class RemoveTourniquet: Tourniquet {
                    displayName = "Remove Tourniquet";
                    condition = QUOTE([ARR_4(_player, _target, 'hand_l', 'RemoveTourniquet')] call DFUNC(canTreat));
                    statement = QUOTE([ARR_4(_player, _target, 'hand_l', 'RemoveTourniquet')] call DFUNC(treatment));
                };
            };
            class ACE_ArmRight {
                runOnHover = 1;
                statement = QUOTE([ARR_3(_target, true, 3)] call DFUNC(displayPatientInformation));
                class Bandage_RightArm {
                    displayName = "Bandage Right Arm";
                    distance = 2.0;
                    condition = QUOTE([ARR_4(_player, _target, 'hand_r', 'Bandage')] call DFUNC(canTreat));
                    statement = QUOTE([ARR_4(_player, _target, 'hand_r', 'Bandage')] call DFUNC(treatment));
                    showDisabled = 1;
                    priority = 2;
                    hotkey = "B";
                    enableInside = 1;
                };

                // Advanced medical
                class FieldDressing {
                    displayName = "Field Dressing";
                    distance = 5.0;
                    condition = QUOTE([ARR_4(_player, _target, 'hand_r', 'FieldDressing')] call DFUNC(canTreat));
                    statement = QUOTE([ARR_4(_player, _target, 'hand_r', 'FieldDressing')] call DFUNC(treatment));
                    showDisabled = 0;
                    priority = 2;
                    hotkey = "";
                    enableInside = 1;
                };
                class PackingBandage: fieldDressing {
                    displayName = "Packing Bandage";
                    condition = QUOTE([ARR_4(_player, _target, 'hand_r', 'PackingBandage')] call DFUNC(canTreat));
                    statement = QUOTE([ARR_4(_player, _target, 'hand_r', 'PackingBandage')] call DFUNC(treatment));
                };
                class ElasticBandage: fieldDressing {
                    displayName = "Elastic Bandage";
                    condition = QUOTE([ARR_4(_player, _target, 'hand_r', 'ElasticBandage')] call DFUNC(canTreat));
                    statement = QUOTE([ARR_4(_player, _target, 'hand_r', 'ElasticBandage')] call DFUNC(treatment));
                };
                class QuikClot: fieldDressing {
                    displayName = "QuikClot";
                    condition = QUOTE([ARR_4(_player, _target, 'hand_r', 'QuikClot')] call DFUNC(canTreat));
                    statement = QUOTE([ARR_4(_player, _target, 'hand_r', 'QuikClot')] call DFUNC(treatment));
                };
                class Tourniquet: fieldDressing {
                    displayName = "Tourniquet";
                    condition = QUOTE([ARR_4(_player, _target, 'hand_r', 'Tourniquet')] call DFUNC(canTreat));
                    statement = QUOTE([ARR_4(_player, _target, 'hand_r', 'Tourniquet')] call DFUNC(treatment));
                };
                class Morphine: fieldDressing {
                    displayName = "Morphine";
                    condition = QUOTE([ARR_4(_player, _target, 'hand_r', 'Morphine')] call DFUNC(canTreat));
                    statement = QUOTE([ARR_4(_player, _target, 'hand_r', 'Morphine')] call DFUNC(treatment));
                };
                class Atropine: Morphine {
                    displayName = "Atropine";
                    condition = QUOTE([ARR_4(_player, _target, 'hand_r', 'Atropine')] call DFUNC(canTreat));
                    statement = QUOTE([ARR_4(_player, _target, 'hand_r', 'Atropine')] call DFUNC(treatment));
                };
                class Epinephrine: Morphine {
                    displayName = "Epinephrine";
                    condition = QUOTE([ARR_4(_player, _target, 'hand_r', 'Epinephrine')] call DFUNC(canTreat));
                    statement = QUOTE([ARR_4(_player, _target, 'hand_r', 'Epinephrine')] call DFUNC(treatment));
                };
                class BloodIV: fieldDressing {
                    displayName = "Give Blood IV (1000ml)";
                    condition = QUOTE([ARR_4(_player, _target, 'hand_r', 'BloodIV')] call DFUNC(canTreat));
                    statement = QUOTE([ARR_4(_player, _target, 'hand_r', 'BloodIV')] call DFUNC(treatment));
                };
                class BloodIV_500: BloodIV {
                    displayName = "Give Blood IV (500ml)";
                    condition = QUOTE([ARR_4(_player, _target, 'hand_r', 'BloodIV_500')] call DFUNC(canTreat));
                    statement = QUOTE([ARR_4(_player, _target, 'hand_r', 'BloodIV_500')] call DFUNC(treatment));
                };
                class BloodIV_250: BloodIV {
                    displayName = "Give Blood IV (250ml)";
                    condition = QUOTE([ARR_4(_player, _target, 'hand_r', 'BloodIV_250')] call DFUNC(canTreat));
                    statement = QUOTE([ARR_4(_player, _target, 'hand_r', 'BloodIV_250')] call DFUNC(treatment));
                };
                class PlasmaIV: BloodIV {
                    displayName = "Give Blood IV (1000ml)";
                    condition = QUOTE([ARR_4(_player, _target, 'hand_r', 'BloodIV')] call DFUNC(canTreat));
                    statement = QUOTE([ARR_4(_player, _target, 'hand_r', 'BloodIV')] call DFUNC(treatment));
                };
                class PlasmaIV_500: PlasmaIV {
                    displayName = "Give Blood IV (500ml)";
                    condition = QUOTE([ARR_4(_player, _target, 'hand_r', 'PlasmaIV_500')] call DFUNC(canTreat));
                    statement = QUOTE([ARR_4(_player, _target, 'hand_r', 'PlasmaIV_500')] call DFUNC(treatment));
                };
                class PlasmaIV_250: PlasmaIV {
                    displayName = "Give Blood IV (250ml)";
                    condition = QUOTE([ARR_4(_player, _target, 'hand_r', 'PlasmaIV_250')] call DFUNC(canTreat));
                    statement = QUOTE([ARR_4(_player, _target, 'hand_r', 'PlasmaIV_250')] call DFUNC(treatment));
                };
                class SalineIV: BloodIV {
                    displayName = "Give Blood IV (1000ml)";
                    condition = QUOTE([ARR_4(_player, _target, 'hand_r', 'SalineIV')] call DFUNC(canTreat));
                    statement = QUOTE([ARR_4(_player, _target, 'hand_r', 'SalineIV')] call DFUNC(treatment));
                };
                class SalineIV_500: SalineIV {
                    displayName = "Give Blood IV (500ml)";
                    condition = QUOTE([ARR_4(_player, _target, 'hand_r', 'SalineIV_500')] call DFUNC(canTreat));
                    statement = QUOTE([ARR_4(_player, _target, 'hand_r', 'SalineIV_500')] call DFUNC(treatment));
                };
                class SalineIV_250: SalineIV {
                    displayName = "Give Blood IV (250ml)";
                    condition = QUOTE([ARR_4(_player, _target, 'hand_r', 'SalineIV_250')] call DFUNC(canTreat));
                    statement = QUOTE([ARR_4(_player, _target, 'hand_r', 'SalineIV_250')] call DFUNC(treatment));
                };
                class CheckPulse: fieldDressing {
                    displayName = "Check Pulse";
                    condition = QUOTE([ARR_4(_player, _target, 'hand_r', 'CheckPulse')] call DFUNC(canTreat));
                    statement = QUOTE([ARR_4(_player, _target, 'hand_r', 'CheckPulse')] call DFUNC(treatment));
                };
                class CheckBloodPressure: CheckPulse {
                    displayName = "Check Blood Pressure";
                    condition = QUOTE([ARR_4(_player, _target, 'hand_r', 'CheckBloodPressure')] call DFUNC(canTreat));
                    statement = QUOTE([ARR_4(_player, _target, 'hand_r', 'CheckBloodPressure')] call DFUNC(treatment));
                };
                class RemoveTourniquet: Tourniquet {
                    displayName = "Remove Tourniquet";
                    condition = QUOTE([ARR_4(_player, _target, 'hand_r', 'RemoveTourniquet')] call DFUNC(canTreat));
                    statement = QUOTE([ARR_4(_player, _target, 'hand_r', 'RemoveTourniquet')] call DFUNC(treatment));
                };

            };
            class ACE_LegLeft {
                runOnHover = 1;
                statement = QUOTE([ARR_3(_target, true, 4)] call DFUNC(displayPatientInformation));
                class Bandage_LeftLeg {
                    displayName = "Bandage Left Leg";
                    distance = 2.0;
                    condition = QUOTE([ARR_4(_player, _target, 'leg_l', 'Bandage')] call DFUNC(canTreat));
                    statement = QUOTE([ARR_4(_player, _target, 'leg_l', 'Bandage')] call DFUNC(treatment));
                    showDisabled = 1;
                    priority = 2;
                    hotkey = "B";
                    enableInside = 1;
                };


                // Advanced medical
                class FieldDressing {
                    displayName = "Field Dressing";
                    distance = 5.0;
                    condition = QUOTE([ARR_4(_player, _target, 'leg_l', 'FieldDressing')] call DFUNC(canTreat));
                    statement = QUOTE([ARR_4(_player, _target, 'leg_l', 'FieldDressing')] call DFUNC(treatment));
                    showDisabled = 0;
                    priority = 2;
                    hotkey = "";
                    enableInside = 1;
                };
                class PackingBandage: fieldDressing {
                    displayName = "Packing Bandage";
                    condition = QUOTE([ARR_4(_player, _target, 'leg_l', 'PackingBandage')] call DFUNC(canTreat));
                    statement = QUOTE([ARR_4(_player, _target, 'leg_l', 'PackingBandage')] call DFUNC(treatment));
                };
                class ElasticBandage: fieldDressing {
                    displayName = "Elastic Bandage";
                    condition = QUOTE([ARR_4(_player, _target, 'leg_l', 'ElasticBandage')] call DFUNC(canTreat));
                    statement = QUOTE([ARR_4(_player, _target, 'leg_l', 'ElasticBandage')] call DFUNC(treatment));
                };
                class QuikClot: fieldDressing {
                    displayName = "QuikClot";
                    condition = QUOTE([ARR_4(_player, _target, 'leg_l', 'QuikClot')] call DFUNC(canTreat));
                    statement = QUOTE([ARR_4(_player, _target, 'leg_l', 'QuikClot')] call DFUNC(treatment));
                };
                class Tourniquet: fieldDressing {
                    displayName = "Tourniquet";
                    condition = QUOTE([ARR_4(_player, _target, 'leg_l', 'Tourniquet')] call DFUNC(canTreat));
                    statement = QUOTE([ARR_4(_player, _target, 'leg_l', 'Tourniquet')] call DFUNC(treatment));
                };
                class Morphine: fieldDressing {
                    displayName = "Morphine";
                    condition = QUOTE([ARR_4(_player, _target, 'leg_l', 'Morphine')] call DFUNC(canTreat));
                    statement = QUOTE([ARR_4(_player, _target, 'leg_l', 'Morphine')] call DFUNC(treatment));
                };
                class Atropine: Morphine {
                    displayName = "Atropine";
                    condition = QUOTE([ARR_4(_player, _target, 'leg_l', 'Atropine')] call DFUNC(canTreat));
                    statement = QUOTE([ARR_4(_player, _target, 'leg_l', 'Atropine')] call DFUNC(treatment));
                };
                class Epinephrine: Morphine {
                    displayName = "Epinephrine";
                    condition = QUOTE([ARR_4(_player, _target, 'leg_l', 'Epinephrine')] call DFUNC(canTreat));
                    statement = QUOTE([ARR_4(_player, _target, 'leg_l', 'Epinephrine')] call DFUNC(treatment));
                };
                class BloodIV: fieldDressing {
                    displayName = "Give Blood IV (1000ml)";
                    condition = QUOTE([ARR_4(_player, _target, 'leg_l', 'BloodIV')] call DFUNC(canTreat));
                    statement = QUOTE([ARR_4(_player, _target, 'leg_l', 'BloodIV')] call DFUNC(treatment));
                };
                class BloodIV_500: BloodIV {
                    displayName = "Give Blood IV (500ml)";
                    condition = QUOTE([ARR_4(_player, _target, 'leg_l', 'BloodIV_500')] call DFUNC(canTreat));
                    statement = QUOTE([ARR_4(_player, _target, 'leg_l', 'BloodIV_500')] call DFUNC(treatment));
                };
                class BloodIV_250: BloodIV {
                    displayName = "Give Blood IV (250ml)";
                    condition = QUOTE([ARR_4(_player, _target, 'leg_l', 'BloodIV_250')] call DFUNC(canTreat));
                    statement = QUOTE([ARR_4(_player, _target, 'leg_l', 'BloodIV_250')] call DFUNC(treatment));
                };
                class PlasmaIV: BloodIV {
                    displayName = "Give Blood IV (1000ml)";
                    condition = QUOTE([ARR_4(_player, _target, 'leg_l', 'BloodIV')] call DFUNC(canTreat));
                    statement = QUOTE([ARR_4(_player, _target, 'leg_l', 'BloodIV')] call DFUNC(treatment));
                };
                class PlasmaIV_500: PlasmaIV {
                    displayName = "Give Blood IV (500ml)";
                    condition = QUOTE([ARR_4(_player, _target, 'leg_l', 'PlasmaIV_500')] call DFUNC(canTreat));
                    statement = QUOTE([ARR_4(_player, _target, 'leg_l', 'PlasmaIV_500')] call DFUNC(treatment));
                };
                class PlasmaIV_250: PlasmaIV {
                    displayName = "Give Blood IV (250ml)";
                    condition = QUOTE([ARR_4(_player, _target, 'leg_l', 'PlasmaIV_250')] call DFUNC(canTreat));
                    statement = QUOTE([ARR_4(_player, _target, 'leg_l', 'PlasmaIV_250')] call DFUNC(treatment));
                };
                class SalineIV: BloodIV {
                    displayName = "Give Blood IV (1000ml)";
                    condition = QUOTE([ARR_4(_player, _target, 'leg_l', 'SalineIV')] call DFUNC(canTreat));
                    statement = QUOTE([ARR_4(_player, _target, 'leg_l', 'SalineIV')] call DFUNC(treatment));
                };
                class SalineIV_500: SalineIV {
                    displayName = "Give Blood IV (500ml)";
                    condition = QUOTE([ARR_4(_player, _target, 'leg_l', 'SalineIV_500')] call DFUNC(canTreat));
                    statement = QUOTE([ARR_4(_player, _target, 'leg_l', 'SalineIV_500')] call DFUNC(treatment));
                };
                class SalineIV_250: SalineIV {
                    displayName = "Give Blood IV (250ml)";
                    condition = QUOTE([ARR_4(_player, _target, 'leg_l', 'SalineIV_250')] call DFUNC(canTreat));
                    statement = QUOTE([ARR_4(_player, _target, 'leg_l', 'SalineIV_250')] call DFUNC(treatment));
                };
                class RemoveTourniquet: Tourniquet {
                    displayName = "Remove Tourniquet";
                    condition = QUOTE([ARR_4(_player, _target, 'leg_l', 'RemoveTourniquet')] call DFUNC(canTreat));
                    statement = QUOTE([ARR_4(_player, _target, 'leg_l', 'RemoveTourniquet')] call DFUNC(treatment));
                };
            };
            class ACE_LegRight {
                runOnHover = 1;
                statement = QUOTE([ARR_3(_target, true, 5)] call DFUNC(displayPatientInformation));
                class Bandage_RightLeg {
                    displayName = "Bandage Right Leg";
                    distance = 2.0;
                    condition = QUOTE([ARR_4(_player, _target, 'leg_r', 'Bandage')] call DFUNC(canTreat));
                    statement = QUOTE([ARR_4(_player, _target, 'leg_r', 'Bandage')] call DFUNC(treatment));
                    showDisabled = 1;
                    priority = 2;
                    hotkey = "B";
                    enableInside = 1;
                };


                // Advanced medical
                class FieldDressing {
                    displayName = "Field Dressing";
                    distance = 5.0;
                    condition = QUOTE([ARR_4(_player, _target, 'leg_r', 'FieldDressing')] call DFUNC(canTreat));
                    statement = QUOTE([ARR_4(_player, _target, 'leg_r', 'FieldDressing')] call DFUNC(treatment));
                    showDisabled = 0;
                    priority = 2;
                    hotkey = "";
                    enableInside = 1;
                };
                class PackingBandage: fieldDressing {
                    displayName = "Packing Bandage";
                    condition = QUOTE([ARR_4(_player, _target, 'leg_r', 'PackingBandage')] call DFUNC(canTreat));
                    statement = QUOTE([ARR_4(_player, _target, 'leg_r', 'PackingBandage')] call DFUNC(treatment));
                };
                class ElasticBandage: fieldDressing {
                    displayName = "Elastic Bandage";
                    condition = QUOTE([ARR_4(_player, _target, 'leg_r', 'ElasticBandage')] call DFUNC(canTreat));
                    statement = QUOTE([ARR_4(_player, _target, 'leg_r', 'ElasticBandage')] call DFUNC(treatment));
                };
                class QuikClot: fieldDressing {
                    displayName = "QuikClot";
                    condition = QUOTE([ARR_4(_player, _target, 'leg_r', 'QuikClot')] call DFUNC(canTreat));
                    statement = QUOTE([ARR_4(_player, _target, 'leg_r', 'QuikClot')] call DFUNC(treatment));
                };
                class Tourniquet: fieldDressing {
                    displayName = "Tourniquet";
                    condition = QUOTE([ARR_4(_player, _target, 'leg_r', 'Tourniquet')] call DFUNC(canTreat));
                    statement = QUOTE([ARR_4(_player, _target, 'leg_r', 'Tourniquet')] call DFUNC(treatment));
                };
                class Morphine: fieldDressing {
                    displayName = "Morphine";
                    condition = QUOTE([ARR_4(_player, _target, 'leg_r', 'Morphine')] call DFUNC(canTreat));
                    statement = QUOTE([ARR_4(_player, _target, 'leg_r', 'Morphine')] call DFUNC(treatment));
                };
                class Atropine: Morphine {
                    displayName = "Atropine";
                    condition = QUOTE([ARR_4(_player, _target, 'leg_r', 'Atropine')] call DFUNC(canTreat));
                    statement = QUOTE([ARR_4(_player, _target, 'leg_r', 'Atropine')] call DFUNC(treatment));
                };
                class Epinephrine: Morphine {
                    displayName = "Epinephrine";
                    condition = QUOTE([ARR_4(_player, _target, 'leg_r', 'Epinephrine')] call DFUNC(canTreat));
                    statement = QUOTE([ARR_4(_player, _target, 'leg_r', 'Epinephrine')] call DFUNC(treatment));
                };
                class BloodIV: fieldDressing {
                    displayName = "Give Blood IV (1000ml)";
                    condition = QUOTE([ARR_4(_player, _target, 'leg_r', 'BloodIV')] call DFUNC(canTreat));
                    statement = QUOTE([ARR_4(_player, _target, 'leg_r', 'BloodIV')] call DFUNC(treatment));
                };
                class BloodIV_500: BloodIV {
                    displayName = "Give Blood IV (500ml)";
                    condition = QUOTE([ARR_4(_player, _target, 'leg_r', 'BloodIV_500')] call DFUNC(canTreat));
                    statement = QUOTE([ARR_4(_player, _target, 'leg_r', 'BloodIV_500')] call DFUNC(treatment));
                };
                class BloodIV_250: BloodIV {
                    displayName = "Give Blood IV (250ml)";
                    condition = QUOTE([ARR_4(_player, _target, 'leg_r', 'BloodIV_250')] call DFUNC(canTreat));
                    statement = QUOTE([ARR_4(_player, _target, 'leg_r', 'BloodIV_250')] call DFUNC(treatment));
                };
                class PlasmaIV: BloodIV {
                    displayName = "Give Blood IV (1000ml)";
                    condition = QUOTE([ARR_4(_player, _target, 'leg_r', 'BloodIV')] call DFUNC(canTreat));
                    statement = QUOTE([ARR_4(_player, _target, 'leg_r', 'BloodIV')] call DFUNC(treatment));
                };
                class PlasmaIV_500: PlasmaIV {
                    displayName = "Give Blood IV (500ml)";
                    condition = QUOTE([ARR_4(_player, _target, 'leg_r', 'PlasmaIV_500')] call DFUNC(canTreat));
                    statement = QUOTE([ARR_4(_player, _target, 'leg_r', 'PlasmaIV_500')] call DFUNC(treatment));
                };
                class PlasmaIV_250: PlasmaIV {
                    displayName = "Give Blood IV (250ml)";
                    condition = QUOTE([ARR_4(_player, _target, 'leg_r', 'PlasmaIV_250')] call DFUNC(canTreat));
                    statement = QUOTE([ARR_4(_player, _target, 'leg_r', 'PlasmaIV_250')] call DFUNC(treatment));
                };
                class SalineIV: BloodIV {
                    displayName = "Give Blood IV (1000ml)";
                    condition = QUOTE([ARR_4(_player, _target, 'leg_r', 'SalineIV')] call DFUNC(canTreat));
                    statement = QUOTE([ARR_4(_player, _target, 'leg_r', 'SalineIV')] call DFUNC(treatment));
                };
                class SalineIV_500: SalineIV {
                    displayName = "Give Blood IV (500ml)";
                    condition = QUOTE([ARR_4(_player, _target, 'leg_r', 'SalineIV_500')] call DFUNC(canTreat));
                    statement = QUOTE([ARR_4(_player, _target, 'leg_r', 'SalineIV_500')] call DFUNC(treatment));
                };
                class SalineIV_250: SalineIV {
                    displayName = "Give Blood IV (250ml)";
                    condition = QUOTE([ARR_4(_player, _target, 'leg_r', 'SalineIV_250')] call DFUNC(canTreat));
                    statement = QUOTE([ARR_4(_player, _target, 'leg_r', 'SalineIV_250')] call DFUNC(treatment));
                };
                class RemoveTourniquet: Tourniquet {
                    displayName = "Remove Tourniquet";
                    condition = QUOTE([ARR_4(_player, _target, 'leg_r', 'RemoveTourniquet')] call DFUNC(canTreat));
                    statement = QUOTE([ARR_4(_player, _target, 'leg_r', 'RemoveTourniquet')] call DFUNC(treatment));
                };
            };
        };
    };

    class SoldierWB: CAManBase {};
    class SoldierEB: CAManBase {};
    class SoldierGB: CAManBase {};

    class B_Soldier_base_F: SoldierWB {};

    class B_Soldier_04_f: B_Soldier_base_F {
        class HitPoints: HitPoints {
            class HitHead: HitHead {};
            class HitBody: HitBody {};
            class HitHands: HitHands {};
            class HitLegs: HitLegs {};

            class HitLeftArm: HitLeftArm {
                armor = ARM_LEG_ARMOR_BETTER;
            };

            class HitRightArm: HitRightArm {
                armor = ARM_LEG_ARMOR_BETTER;
            };

            class HitLeftLeg: HitLeftLeg {
                armor = ARM_LEG_ARMOR_BETTER;
            };

            class HitRightLeg: HitRightLeg {
                armor = ARM_LEG_ARMOR_BETTER;
            };
        };
    };

    class B_Soldier_05_f: B_Soldier_base_F {
        class HitPoints: HitPoints {
            class HitHead: HitHead {};
            class HitBody: HitBody {};
            class HitHands: HitHands {};
            class HitLegs: HitLegs {};

            class HitLeftArm: HitLeftArm {
                armor = ARM_LEG_ARMOR_BETTER;
            };

            class HitRightArm: HitRightArm {
                armor = ARM_LEG_ARMOR_BETTER;
            };

            class HitLeftLeg: HitLeftLeg {
                armor = ARM_LEG_ARMOR_BETTER;
            };

            class HitRightLeg: HitRightLeg {
                armor = ARM_LEG_ARMOR_BETTER;
            };
        };
    };

    class I_Soldier_base_F: SoldierGB {};

    class I_Soldier_03_F: I_Soldier_base_F {
        class HitPoints: HitPoints {
            class HitHead: HitHead {};
            class HitBody: HitBody {};
            class HitHands: HitHands {};
            class HitLegs: HitLegs {};

            class HitLeftArm: HitLeftArm {
                armor = ARM_LEG_ARMOR_BETTER;
            };

            class HitRightArm: HitRightArm {
                armor = ARM_LEG_ARMOR_BETTER;
            };

            class HitLeftLeg: HitLeftLeg {
                armor = ARM_LEG_ARMOR_BETTER;
            };

            class HitRightLeg: HitRightLeg {
                armor = ARM_LEG_ARMOR_BETTER;
            };
        };
    };

    class I_Soldier_04_F: I_Soldier_base_F {
        class HitPoints: HitPoints {
            class HitHead: HitHead {};
            class HitBody: HitBody {};
            class HitHands: HitHands {};
            class HitLegs: HitLegs {};

            class HitLeftArm: HitLeftArm {
                armor = ARM_LEG_ARMOR_BETTER;
            };

            class HitRightArm: HitRightArm {
                armor = ARM_LEG_ARMOR_BETTER;
            };

            class HitLeftLeg: HitLeftLeg {
                armor = ARM_LEG_ARMOR_BETTER;
            };

            class HitRightLeg: HitRightLeg {
                armor = ARM_LEG_ARMOR_BETTER;
            };
        };
    };

    class O_Soldier_base_F: SoldierEB {
        class HitPoints: HitPoints {
            class HitHead: HitHead {};
            class HitBody: HitBody {};
            class HitHands: HitHands {};
            class HitLegs: HitLegs {};

            class HitLeftArm: HitLeftArm {
                armor = ARM_LEG_ARMOR_CSAT;
                passThrough = 0.85;
            };

            class HitRightArm: HitRightArm {
                armor = ARM_LEG_ARMOR_CSAT;
                passThrough = 0.85;
            };

            class HitLeftLeg: HitLeftLeg {
                armor = ARM_LEG_ARMOR_CSAT;
                passThrough = 0.85;
            };

            class HitRightLeg: HitRightLeg {
                armor = ARM_LEG_ARMOR_CSAT;
                passThrough = 0.85;
            };
        };
    };

    class O_Soldier_02_F: O_Soldier_base_F {
        class HitPoints: HitPoints {
            class HitHead: HitHead {};
            class HitBody: HitBody {};
            class HitHands: HitHands {};
            class HitLegs: HitLegs {};

            class HitLeftArm: HitLeftArm {
                armor = ARM_LEG_ARMOR_CSAT;
                passThrough = 0.85;
            };

            class HitRightArm: HitRightArm {
                armor = ARM_LEG_ARMOR_CSAT;
                passThrough = 0.85;
            };

            class HitLeftLeg: HitLeftLeg {
                armor = ARM_LEG_ARMOR_CSAT;
                passThrough = 0.85;
            };

            class HitRightLeg: HitRightLeg {
                armor = ARM_LEG_ARMOR_CSAT;
                passThrough = 0.85;
            };
        };
    };
    class MapBoard_altis_F;
    class ACE_bodyBag: MapBoard_altis_F {
        scope = 1;
        side = -1;
        model = QUOTE(PATHTOF(data\bodybag.p3d));
        icon = "";
        displayName = $STR_ACE_MEDICAL_BODYBAG_DISPLAY;
    };
    class Item_Base_F;
    class GVAR(fieldDressingItem): Item_Base_F {
        scope = 2;
        scopeCurator = 2;
        displayName = $STR_ACE_MEDICAL_BANDAGE_BASIC_DISPLAY;
        author = "Glowbal";
        vehicleClass = "Items";
        class TransportItems
        {
            class GVAR(fieldDressing)
            {
                name = QGVAR(fieldDressing);
                count = 1;
            };
        };
    };
    class GVAR(packingBandageItem): Item_Base_F {
        scope = 2;
        scopeCurator = 2;
        displayName = $STR_ACE_MEDICAL_PACKING_BANDAGE_DISPLAY;
        author = "Glowbal";
        vehicleClass = "Items";
        class TransportItems
        {
            class GVAR(packingBandage)
            {
                name = QGVAR(packingBandage);
                count = 1;
            };
        };
    };
    class GVAR(elasticBandageItem): Item_Base_F {
        scope = 2;
        scopeCurator = 2;
        displayName = $STR_ACE_MEDICAL_BANDAGE_ELASTIC_DISPLAY;
        author = "Glowbal";
        vehicleClass = "Items";
        class TransportItems
        {
            class GVAR(elasticBandage)
            {
                name = QGVAR(elasticBandage);
                count = 1;
            };
        };
    };
    class GVAR(tourniquetItem): Item_Base_F {
        scope = 2;
        scopeCurator = 2;
        displayName = $STR_ACE_MEDICAL_TOURNIQUET_DISPLAY;
        author = "Glowbal";
        vehicleClass = "Items";
        class TransportItems
        {
            class GVAR(tourniquet)
            {
                name = QGVAR(tourniquet);
                count = 1;
            };
        };
    };
    class GVAR(morphineItem): Item_Base_F {
        scope = 2;
        scopeCurator = 2;
        displayName = $STR_ACE_MEDICAL_MORPHINE_DISPLAY;
        author = "Glowbal";
        vehicleClass = "Items";
        class TransportItems
        {
            class GVAR(morphine)
            {
                name = QGVAR(morphine);
                count = 1;
            };
        };
    };
    class GVAR(atropineItem): Item_Base_F {
        scope = 2;
        scopeCurator = 2;
        displayName = $STR_ACE_MEDICAL_ATROPINE_DISPLAY;
        author = "Glowbal";
        vehicleClass = "Items";
        class TransportItems
        {
            class GVAR(atropine)
            {
                name = QGVAR(atropine);
                count = 1;
            };
        };
    };
    class GVAR(epinephrineItem): Item_Base_F {
        scope = 2;
        scopeCurator = 2;
        displayName = $STR_ACE_MEDICAL_EPINEPHRINE_DISPLAY;
        author = "Glowbal";
        vehicleClass = "Items";
        class TransportItems
        {
            class GVAR(epinephrine)
            {
                name = QGVAR(epinephrine);
                count = 1;
            };
        };
    };
    class GVAR(plasmaIVItem): Item_Base_F {
        scope = 2;
        scopeCurator = 2;
        displayName = $STR_ACE_MEDICAL_PLASMA_IV;
        author = "Glowbal";
        vehicleClass = "Items";
        class TransportItems
        {
            class GVAR(plasmaIV)
            {
                name = QGVAR(plasmaIV);
                count = 1;
            };
        };
    };

    class GVAR(bloodIVItem): Item_Base_F {
        scope = 2;
        scopeCurator = 2;
        displayName = $STR_ACE_MEDICAL_BLOOD_IV;
        author = "Glowbal";
        vehicleClass = "Items";
        class TransportItems
        {
            class GVAR(bloodIV)
            {
                name = QGVAR(bloodIV);
                count = 1;
            };
        };
    };
    class GVAR(salineIVItem): Item_Base_F {
        scope = 2;
        scopeCurator = 2;
        displayName = $STR_ACE_MEDICAL_SALINE_IV;
        author = "Glowbal";
        vehicleClass = "Items";
        class TransportItems
        {
            class GVAR(salineIV)
            {
                name = QGVAR(salineIV);
                count = 1;
            };
        };
    };
    class GVAR(quikClotItem): Item_Base_F {
        scope = 2;
        scopeCurator = 2;
        displayName = $STR_ACE_MEDICAL_QUIKCLOT_DISPLAY;
        author = "Glowbal";
        vehicleClass = "Items";
        class TransportItems
        {
            class GVAR(quikClot)
            {
                name = QGVAR(quikClot);
                count = 1;
            };
        };
    };
    class GVAR(personalAidKitItem): Item_Base_F {
        scope = 2;
        scopeCurator = 2;
        displayName = $STR_ACE_MEDICAL_AID_KIT_DISPLAY;
        author = "Glowbal";
        vehicleClass = "Items";
        class TransportItems
        {
            class GVAR(personalAidKit)
            {
                name = QGVAR(personalAidKit);
                count = 1;
            };
        };
    };
    class GVAR(surgicalKitItem): Item_Base_F {
        scope = 2;
        scopeCurator = 2;
        displayName = $STR_ACE_MEDICAL_SURGICALKIT_DISPLAY;
        author = "Glowbal";
        vehicleClass = "Items";
        class TransportItems
        {
            class GVAR(surgicalKit)
            {
                name = QGVAR(surgicalKit);
                count = 1;
            };
        };
    };
    class GVAR(bodyBagItem): Item_Base_F {
        scope = 2;
        scopeCurator = 2;
        displayName = $STR_ACE_MEDICAL_BODYBAG_DISPLAY;
        author = "Glowbal";
        vehicleClass = "Items";
        class TransportItems
        {
            class GVAR(bodyBag)
            {
                name = QGVAR(bodyBag);
                count = 1;
            };
        };
    };

    class NATO_Box_Base;
    class GVAR(supplyCrate): NATO_Box_Base {
        scope = 2;
        accuracy = 1000;
        displayName = "Medical Supply Crate [ACE]";
        model = "\A3\weapons_F\AmmoBoxes\AmmoBox_F";
        author = "Glowbal";
        class TransportItems {
            class GVAR(fieldDressing) {
                name = QGVAR(fieldDressing);
                count = 25;
            };
            class GVAR(packingBandage) {
                name = QGVAR(packingBandage);
                count = 25;
            };
            class GVAR(elasticBandage) {
                name = QGVAR(elasticBandage);
                count = 25;
            };
            class GVAR(tourniquet) {
                name = QGVAR(tourniquet);
                count = 15;
            };
            class GVAR(morphine) {
                name = QGVAR(morphine);
                count = 15;
            };
            class GVAR(atropine) {
                name = QGVAR(atropine);
                count = 15;
            };
            class GVAR(epinephrine) {
                name = QGVAR(epinephrine);
                count = 15;
            };
            class GVAR(plasmaIV) {
                name = QGVAR(plasmaIV);
                count = 7;
            };
            class GVAR(plasmaIV_500) {
                name = QGVAR(plasmaIV_500);
                count = 7;
            };
            class GVAR(plasmaIV_250) {
                name = QGVAR(plasmaIV_250);
                count = 7;
            };
            class GVAR(salineIV) {
                name = QGVAR(salineIV);
                count = 7;
            };
            class GVAR(salineIV_500) {
                name = QGVAR(salineIV_500);
                count = 7;
            };
            class GVAR(salineIV_250) {
                name = QGVAR(salineIV_250);
                count = 7;
            };
            class GVAR(bloodIV) {
                name = QGVAR(bloodIV);
                count = 7;
            };
            class GVAR(bloodIV_500) {
                name = QGVAR(bloodIV_500);
                count = 7;
            };
            class GVAR(bloodIV_250) {
                name = QGVAR(bloodIV_250);
                count = 7;
            };
            class GVAR(quikClot) {
                name = QGVAR(quikClot);
                count = 20;
            };
            class GVAR(personalAidKit) {
                name = QGVAR(personalAidKit);
                count = 3;
            };
            class GVAR(surgicalKit) {
                name = QGVAR(surgicalKit);
                count = 2;
            };
            class GVAR(bodyBag) {
                name = QGVAR(bodyBag);
                count = 5;
            };
        };
    };
};
