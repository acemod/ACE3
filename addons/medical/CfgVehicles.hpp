
class CfgVehicles {

    class Logic;
    class Module_F: Logic {
        class ArgumentsBaseUnits {
        };
    };
    class ACE_Module;
    // TODO localization for all the modules
    class ACE_moduleMedicalSettings: ACE_Module {
        scope = 2;
        displayName = "Medical Settings [ACE]";
        icon = QUOTE(PATHTOF(UI\moduleIcon.paa));
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

    class ACE_moduleTreatmentConfiguration: ACE_Module {
        scope = 2;
        displayName = "Treatment Configuration [ACE]";
        icon = QUOTE(PATHTOF(UI\moduleIcon.paa));
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
        icon = QUOTE(PATHTOF(UI\moduleIcon.paa));
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
        icon = QUOTE(PATHTOF(UI\moduleIcon.paa));
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
        icon = QUOTE(PATHTOF(UI\moduleIcon.paa));
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
        class ACE_SelfActions {
            class Medical {
                displayName = "Medical";
                runOnHover = 1;
                hotkey = "M";
                statement = QUOTE([ARR_3(_target, true, 0)] call DFUNC(displayPatientInformation));
                icon = PATHTOF(UI\icons\medical_cross.paa);

               class ACE_Head {
                    displayName = "$STR_ACE_Interaction_Head";
                    icon = PATHTOF(UI\icons\medical_cross.paa);
                    statement = QUOTE([ARR_3(_target, true, 0)] call DFUNC(displayPatientInformation));
                    runOnHover = 1;

                    class Bandage {
                        displayName = "$STR_ACE_Medical_Bandage_HitHead";
                        distance = 2.0;
                        condition = QUOTE([ARR_4(_player, _target, 'head', 'Bandage')] call DFUNC(canTreatCached));
                        statement = QUOTE([ARR_4(_player, _target, 'head', 'Bandage')] call DFUNC(treatment));
                        showDisabled = 1;
                        priority = 2;
                        hotkey = "B";
                        enableInside = 1;
                        icon = PATHTOF(UI\icons\bandage.paa);
                    };
                    // Advanced medical
                    class FieldDressing {
                        displayName = "Field Dressing";
                        distance = 5.0;
                        condition = QUOTE([ARR_4(_player, _target, 'head', 'FieldDressing')] call DFUNC(canTreatCached));
                        statement = QUOTE([ARR_4(_player, _target, 'head', 'FieldDressing')] call DFUNC(treatment));
                        showDisabled = 0;
                        priority = 2;
                        hotkey = "";
                        enableInside = 1;
                        icon = PATHTOF(UI\icons\bandage.paa);
                    };
                    class PackingBandage: fieldDressing {
                        displayName = "Packing Bandage";
                        condition = QUOTE([ARR_4(_player, _target, 'head', 'PackingBandage')] call DFUNC(canTreatCached));
                        statement = QUOTE([ARR_4(_player, _target, 'head', 'PackingBandage')] call DFUNC(treatment));
                        icon = PATHTOF(UI\icons\packingBandage.paa);
                    };
                    class ElasticBandage: fieldDressing {
                        displayName = "Elastic Bandage";
                        condition = QUOTE([ARR_4(_player, _target, 'head', 'ElasticBandage')] call DFUNC(canTreatCached));
                        statement = QUOTE([ARR_4(_player, _target, 'head', 'ElasticBandage')] call DFUNC(treatment));
                        icon = PATHTOF(UI\icons\bandage.paa);
                    };
                    class QuikClot: fieldDressing {
                        displayName = "QuikClot";
                        condition = QUOTE([ARR_4(_player, _target, 'head', 'QuikClot')] call DFUNC(canTreatCached));
                        statement = QUOTE([ARR_4(_player, _target, 'head', 'QuikClot')] call DFUNC(treatment));
                        icon = PATHTOF(UI\icons\bandage.paa);
                    };
                    class CheckPulse: fieldDressing {
                        displayName = "Check Pulse";
                        condition = QUOTE([ARR_4(_player, _target, 'head', 'CheckPulse')] call DFUNC(canTreatCached));
                        statement = QUOTE([ARR_4(_player, _target, 'head', 'CheckPulse')] call DFUNC(treatment));
                        icon = "";
                    };
                    class CheckBloodPressure: CheckPulse {
                        displayName = "Check Blood Pressure";
                        condition = QUOTE([ARR_4(_player, _target, 'head', 'CheckBloodPressure')] call DFUNC(canTreatCached));
                        statement = QUOTE([ARR_4(_player, _target, 'head', 'CheckBloodPressure')] call DFUNC(treatment));
                    };
                };
                class ACE_Torso {
                    displayName = "$STR_ACE_Interaction_Torso";
                    distance = 5.0;
                    condition = "true";
                    runOnHover = 1;
                    statement = QUOTE([ARR_3(_target, true, 1)] call DFUNC(displayPatientInformation));
                    showDisabled = 1;
                    priority = 2;
                    hotkey = "";
                    enableInside = 1;
                    icon = PATHTOF(UI\icons\medical_cross.paa);

                    class Bandage {
                        displayName = "$STR_ACE_Medical_Bandage_HitBody";
                        distance = 2.0;
                        condition = QUOTE([ARR_4(_player, _target, 'body', 'Bandage')] call DFUNC(canTreatCached));
                        statement = QUOTE([ARR_4(_player, _target, 'body', 'Bandage')] call DFUNC(treatment));
                        showDisabled = 1;
                        priority = 2;
                        hotkey = "B";
                        enableInside = 1;
                        icon = PATHTOF(UI\icons\bandage.paa);
                    };

                    class TriageCard {
                        displayName = "Triage Card";
                        distance = 2.0;
                        condition = "true";
                        statement = QUOTE([ARR_2(_target, true)] call DFUNC(displayTriageCard));
                        showDisabled = 1;
                        priority = 2;
                        hotkey = "";
                        enableInside = 1;
                        icon = PATHTOF(UI\icons\triageCard.paa);
                    };

                    // Advanced medical
                    class FieldDressing {
                        displayName = "Field Dressing";
                        distance = 5.0;
                        condition = QUOTE([ARR_4(_player, _target, 'body', 'FieldDressing')] call DFUNC(canTreatCached));
                        statement = QUOTE([ARR_4(_player, _target, 'body', 'FieldDressing')] call DFUNC(treatment));
                        showDisabled = 0;
                        priority = 2;
                        hotkey = "";
                        enableInside = 1;
                        icon = PATHTOF(UI\icons\bandage.paa);
                    };
                    class PackingBandage: fieldDressing {
                        displayName = "Packing Bandage";
                        condition = QUOTE([ARR_4(_player, _target, 'body', 'PackingBandage')] call DFUNC(canTreatCached));
                        statement = QUOTE([ARR_4(_player, _target, 'body', 'PackingBandage')] call DFUNC(treatment));
                        icon = PATHTOF(UI\icons\packingBandage.paa);
                    };
                    class ElasticBandage: fieldDressing {
                        displayName = "Elastic Bandage";
                        condition = QUOTE([ARR_4(_player, _target, 'body', 'ElasticBandage')] call DFUNC(canTreatCached));
                        statement = QUOTE([ARR_4(_player, _target, 'body', 'ElasticBandage')] call DFUNC(treatment));
                        icon = PATHTOF(UI\icons\bandage.paa);
                    };
                    class QuikClot: fieldDressing {
                        displayName = "QuikClot";
                        condition = QUOTE([ARR_4(_player, _target, 'body', 'QuikClot')] call DFUNC(canTreatCached));
                        statement = QUOTE([ARR_4(_player, _target, 'body', 'QuikClot')] call DFUNC(treatment));
                        icon = PATHTOF(UI\icons\bandage.paa);
                    };
                };
                class ACE_ArmLeft {
                    displayName = "$STR_ACE_Interaction_ArmLeft";
                    runOnHover = 1;
                    statement = QUOTE([ARR_3(_target, true, 2)] call DFUNC(displayPatientInformation));
                    icon = PATHTOF(UI\icons\medical_cross.paa);

                    class Bandage {
                        displayName = "$STR_ACE_Medical_Bandage_HitLeftArm";
                        distance = 2.0;
                        condition = QUOTE([ARR_4(_player, _target, 'hand_l', 'Bandage')] call DFUNC(canTreatCached));
                        statement = QUOTE([ARR_4(_player, _target, 'hand_l', 'Bandage')] call DFUNC(treatment));
                        showDisabled = 1;
                        priority = 2;
                        hotkey = "B";
                        enableInside = 1;
                        icon = PATHTOF(UI\icons\bandage.paa);
                    };

                    // Advanced medical
                    class FieldDressing {
                        displayName = "Field Dressing";
                        distance = 5.0;
                        condition = QUOTE([ARR_4(_player, _target, 'hand_l', 'FieldDressing')] call DFUNC(canTreatCached));
                        statement = QUOTE([ARR_4(_player, _target, 'hand_l', 'FieldDressing')] call DFUNC(treatment));
                        showDisabled = 0;
                        priority = 2;
                        hotkey = "";
                        enableInside = 1;
                        icon = PATHTOF(UI\icons\bandage.paa);
                    };
                    class PackingBandage: fieldDressing {
                        displayName = "Packing Bandage";
                        condition = QUOTE([ARR_4(_player, _target, 'hand_l', 'PackingBandage')] call DFUNC(canTreatCached));
                        statement = QUOTE([ARR_4(_player, _target, 'hand_l', 'PackingBandage')] call DFUNC(treatment));
                        icon = PATHTOF(UI\icons\packingBandage.paa);
                    };
                    class ElasticBandage: fieldDressing {
                        displayName = "Elastic Bandage";
                        condition = QUOTE([ARR_4(_player, _target, 'hand_l', 'ElasticBandage')] call DFUNC(canTreatCached));
                        statement = QUOTE([ARR_4(_player, _target, 'hand_l', 'ElasticBandage')] call DFUNC(treatment));
                        icon = PATHTOF(UI\icons\bandage.paa);
                    };
                    class QuikClot: fieldDressing {
                        displayName = "QuikClot";
                        condition = QUOTE([ARR_4(_player, _target, 'hand_l', 'QuikClot')] call DFUNC(canTreatCached));
                        statement = QUOTE([ARR_4(_player, _target, 'hand_l', 'QuikClot')] call DFUNC(treatment));
                        icon = PATHTOF(UI\icons\bandage.paa);
                    };
                    class Tourniquet: fieldDressing {
                        displayName = "Tourniquet";
                        condition = QUOTE([ARR_4(_player, _target, 'hand_l', 'Tourniquet')] call DFUNC(canTreatCached));
                        statement = QUOTE([ARR_4(_player, _target, 'hand_l', 'Tourniquet')] call DFUNC(treatment));
                        icon = PATHTOF(UI\icons\tourniquet.paa);
                    };
                    class Morphine: fieldDressing {
                        displayName = "$STR_ACE_Medical_Inject_Morphine";
                        condition = QUOTE([ARR_4(_player, _target, 'hand_l', 'Morphine')] call DFUNC(canTreatCached));
                        statement = QUOTE([ARR_4(_player, _target, 'hand_l', 'Morphine')] call DFUNC(treatment));
                        icon = PATHTOF(UI\icons\autoInjector.paa);
                    };
                    class Atropine: Morphine {
                        displayName = "Atropine";
                        condition = QUOTE([ARR_4(_player, _target, 'hand_l', 'Atropine')] call DFUNC(canTreatCached));
                        statement = QUOTE([ARR_4(_player, _target, 'hand_l', 'Atropine')] call DFUNC(treatment));
                        icon = PATHTOF(UI\icons\autoInjector.paa);
                    };
                    class Epinephrine: Morphine {
                        displayName = "$STR_ACE_Medical_Inject_Epinephrine";
                        condition = QUOTE([ARR_4(_player, _target, 'hand_l', 'Epinephrine')] call DFUNC(canTreatCached));
                        statement = QUOTE([ARR_4(_player, _target, 'hand_l', 'Epinephrine')] call DFUNC(treatment));
                        icon = PATHTOF(UI\icons\autoInjector.paa);
                    };
                    class CheckPulse: fieldDressing {
                        displayName = "Check Pulse";
                        condition = QUOTE([ARR_4(_player, _target, 'hand_l', 'CheckPulse')] call DFUNC(canTreatCached));
                        statement = QUOTE([ARR_4(_player, _target, 'hand_l', 'CheckPulse')] call DFUNC(treatment));
                        icon = "";
                    };
                    class CheckBloodPressure: CheckPulse {
                        displayName = "Check Blood Pressure";
                        condition = QUOTE([ARR_4(_player, _target, 'hand_l', 'CheckBloodPressure')] call DFUNC(canTreatCached));
                        statement = QUOTE([ARR_4(_player, _target, 'hand_l', 'CheckBloodPressure')] call DFUNC(treatment));
                    };
                    class RemoveTourniquet: Tourniquet {
                        displayName = "Remove Tourniquet";
                        condition = QUOTE([ARR_4(_player, _target, 'hand_l', 'RemoveTourniquet')] call DFUNC(canTreatCached));
                        statement = QUOTE([ARR_4(_player, _target, 'hand_l', 'RemoveTourniquet')] call DFUNC(treatment));
                    };
                };
                class ACE_ArmRight {
                    displayName = "$STR_ACE_Interaction_ArmRight";
                    runOnHover = 1;
                    statement = QUOTE([ARR_3(_target, true, 3)] call DFUNC(displayPatientInformation));
                    icon = PATHTOF(UI\icons\medical_cross.paa);

                    class Bandage {
                        displayName = "$STR_ACE_Medical_Bandage_HitRightArm";
                        distance = 2.0;
                        condition = QUOTE([ARR_4(_player, _target, 'hand_r', 'Bandage')] call DFUNC(canTreatCached));
                        statement = QUOTE([ARR_4(_player, _target, 'hand_r', 'Bandage')] call DFUNC(treatment));
                        showDisabled = 1;
                        priority = 2;
                        hotkey = "B";
                        enableInside = 1;
                        icon = PATHTOF(UI\icons\bandage.paa);
                    };

                    // Advanced medical
                    class FieldDressing {
                        displayName = "Field Dressing";
                        distance = 5.0;
                        condition = QUOTE([ARR_4(_player, _target, 'hand_r', 'FieldDressing')] call DFUNC(canTreatCached));
                        statement = QUOTE([ARR_4(_player, _target, 'hand_r', 'FieldDressing')] call DFUNC(treatment));
                        showDisabled = 0;
                        priority = 2;
                        hotkey = "";
                        enableInside = 1;
                        icon = PATHTOF(UI\icons\bandage.paa);
                    };
                    class PackingBandage: fieldDressing {
                        displayName = "Packing Bandage";
                        condition = QUOTE([ARR_4(_player, _target, 'hand_r', 'PackingBandage')] call DFUNC(canTreatCached));
                        statement = QUOTE([ARR_4(_player, _target, 'hand_r', 'PackingBandage')] call DFUNC(treatment));
                        icon = PATHTOF(UI\icons\packingBandage.paa);
                    };
                    class ElasticBandage: fieldDressing {
                        displayName = "Elastic Bandage";
                        condition = QUOTE([ARR_4(_player, _target, 'hand_r', 'ElasticBandage')] call DFUNC(canTreatCached));
                        statement = QUOTE([ARR_4(_player, _target, 'hand_r', 'ElasticBandage')] call DFUNC(treatment));
                    };
                    class QuikClot: fieldDressing {
                        displayName = "QuikClot";
                        condition = QUOTE([ARR_4(_player, _target, 'hand_r', 'QuikClot')] call DFUNC(canTreatCached));
                        statement = QUOTE([ARR_4(_player, _target, 'hand_r', 'QuikClot')] call DFUNC(treatment));
                    };
                    class Tourniquet: fieldDressing {
                        displayName = "Tourniquet";
                        condition = QUOTE([ARR_4(_player, _target, 'hand_r', 'Tourniquet')] call DFUNC(canTreatCached));
                        statement = QUOTE([ARR_4(_player, _target, 'hand_r', 'Tourniquet')] call DFUNC(treatment));
                        icon = PATHTOF(UI\icons\tourniquet.paa);
                    };
                    class Morphine: fieldDressing {
                        displayName = "$STR_ACE_Medical_Inject_Morphine";
                        condition = QUOTE([ARR_4(_player, _target, 'hand_r', 'Morphine')] call DFUNC(canTreatCached));
                        statement = QUOTE([ARR_4(_player, _target, 'hand_r', 'Morphine')] call DFUNC(treatment));
                        icon = PATHTOF(UI\icons\autoInjector.paa);
                    };
                    class Atropine: Morphine {
                        displayName = "Atropine";
                        condition = QUOTE([ARR_4(_player, _target, 'hand_r', 'Atropine')] call DFUNC(canTreatCached));
                        statement = QUOTE([ARR_4(_player, _target, 'hand_r', 'Atropine')] call DFUNC(treatment));
                    };
                    class Epinephrine: Morphine {
                        displayName = "$STR_ACE_Medical_Inject_Epinephrine";
                        condition = QUOTE([ARR_4(_player, _target, 'hand_r', 'Epinephrine')] call DFUNC(canTreatCached));
                        statement = QUOTE([ARR_4(_player, _target, 'hand_r', 'Epinephrine')] call DFUNC(treatment));
                    };
                    class CheckPulse: fieldDressing {
                        displayName = "Check Pulse";
                        condition = QUOTE([ARR_4(_player, _target, 'hand_r', 'CheckPulse')] call DFUNC(canTreatCached));
                        statement = QUOTE([ARR_4(_player, _target, 'hand_r', 'CheckPulse')] call DFUNC(treatment));
                        icon = "";
                    };
                    class CheckBloodPressure: CheckPulse {
                        displayName = "Check Blood Pressure";
                        condition = QUOTE([ARR_4(_player, _target, 'hand_r', 'CheckBloodPressure')] call DFUNC(canTreatCached));
                        statement = QUOTE([ARR_4(_player, _target, 'hand_r', 'CheckBloodPressure')] call DFUNC(treatment));
                    };
                    class RemoveTourniquet: Tourniquet {
                        displayName = "Remove Tourniquet";
                        condition = QUOTE([ARR_4(_player, _target, 'hand_r', 'RemoveTourniquet')] call DFUNC(canTreatCached));
                        statement = QUOTE([ARR_4(_player, _target, 'hand_r', 'RemoveTourniquet')] call DFUNC(treatment));
                    };
                };
                class ACE_LegLeft {
                    displayName = "$STR_ACE_Interaction_LegLeft";
                    runOnHover = 1;
                    statement = QUOTE([ARR_3(_target, true, 4)] call DFUNC(displayPatientInformation));
                    icon = PATHTOF(UI\icons\medical_cross.paa);

                    class Bandage {
                        displayName = "$STR_ACE_Medical_Bandage_HitLeftLeg";
                        distance = 2.0;
                        condition = QUOTE([ARR_4(_player, _target, 'leg_l', 'Bandage')] call DFUNC(canTreatCached));
                        statement = QUOTE([ARR_4(_player, _target, 'leg_l', 'Bandage')] call DFUNC(treatment));
                        showDisabled = 1;
                        priority = 2;
                        hotkey = "B";
                        enableInside = 1;
                        icon = PATHTOF(UI\icons\bandage.paa);
                    };


                    // Advanced medical
                    class FieldDressing {
                        displayName = "Field Dressing";
                        distance = 5.0;
                        condition = QUOTE([ARR_4(_player, _target, 'leg_l', 'FieldDressing')] call DFUNC(canTreatCached));
                        statement = QUOTE([ARR_4(_player, _target, 'leg_l', 'FieldDressing')] call DFUNC(treatment));
                        showDisabled = 0;
                        priority = 2;
                        hotkey = "";
                        enableInside = 1;
                        icon = PATHTOF(UI\icons\bandage.paa);
                    };
                    class PackingBandage: fieldDressing {
                        displayName = "Packing Bandage";
                        condition = QUOTE([ARR_4(_player, _target, 'leg_l', 'PackingBandage')] call DFUNC(canTreatCached));
                        statement = QUOTE([ARR_4(_player, _target, 'leg_l', 'PackingBandage')] call DFUNC(treatment));
                        icon = PATHTOF(UI\icons\packingBandage.paa);
                    };
                    class ElasticBandage: fieldDressing {
                        displayName = "Elastic Bandage";
                        condition = QUOTE([ARR_4(_player, _target, 'leg_l', 'ElasticBandage')] call DFUNC(canTreatCached));
                        statement = QUOTE([ARR_4(_player, _target, 'leg_l', 'ElasticBandage')] call DFUNC(treatment));
                    };
                    class QuikClot: fieldDressing {
                        displayName = "QuikClot";
                        condition = QUOTE([ARR_4(_player, _target, 'leg_l', 'QuikClot')] call DFUNC(canTreatCached));
                        statement = QUOTE([ARR_4(_player, _target, 'leg_l', 'QuikClot')] call DFUNC(treatment));
                    };
                    class Tourniquet: fieldDressing {
                        displayName = "Tourniquet";
                        condition = QUOTE([ARR_4(_player, _target, 'leg_l', 'Tourniquet')] call DFUNC(canTreatCached));
                        statement = QUOTE([ARR_4(_player, _target, 'leg_l', 'Tourniquet')] call DFUNC(treatment));
                        icon = PATHTOF(UI\icons\tourniquet.paa);
                    };
                    class Morphine: fieldDressing {
                        displayName = "$STR_ACE_Medical_Inject_Morphine";
                        condition = QUOTE([ARR_4(_player, _target, 'leg_l', 'Morphine')] call DFUNC(canTreatCached));
                        statement = QUOTE([ARR_4(_player, _target, 'leg_l', 'Morphine')] call DFUNC(treatment));
                    };
                    class Atropine: Morphine {
                        displayName = "Atropine";
                        condition = QUOTE([ARR_4(_player, _target, 'leg_l', 'Atropine')] call DFUNC(canTreatCached));
                        statement = QUOTE([ARR_4(_player, _target, 'leg_l', 'Atropine')] call DFUNC(treatment));
                        icon = PATHTOF(UI\icons\autoInjector.paa);
                    };
                    class Epinephrine: Morphine {
                        displayName = "$STR_ACE_Medical_Inject_Epinephrine";
                        condition = QUOTE([ARR_4(_player, _target, 'leg_l', 'Epinephrine')] call DFUNC(canTreatCached));
                        statement = QUOTE([ARR_4(_player, _target, 'leg_l', 'Epinephrine')] call DFUNC(treatment));
                    };
                    class RemoveTourniquet: Tourniquet {
                        displayName = "Remove Tourniquet";
                        condition = QUOTE([ARR_4(_player, _target, 'leg_l', 'RemoveTourniquet')] call DFUNC(canTreatCached));
                        statement = QUOTE([ARR_4(_player, _target, 'leg_l', 'RemoveTourniquet')] call DFUNC(treatment));
                    };
                };
                class ACE_LegRight {
                    displayName = "$STR_ACE_Interaction_LegRight";
                    runOnHover = 1;
                    statement = QUOTE([ARR_3(_target, true, 5)] call DFUNC(displayPatientInformation));
                    icon = PATHTOF(UI\icons\medical_cross.paa);

                    class Bandage {
                        displayName = "$STR_ACE_Medical_Bandage_HitRightLeg";
                        distance = 2.0;
                        condition = QUOTE([ARR_4(_player, _target, 'leg_r', 'Bandage')] call DFUNC(canTreatCached));
                        statement = QUOTE([ARR_4(_player, _target, 'leg_r', 'Bandage')] call DFUNC(treatment));
                        showDisabled = 1;
                        priority = 2;
                        hotkey = "B";
                        enableInside = 1;
                        icon = PATHTOF(UI\icons\bandage.paa);
                    };


                    // Advanced medical
                    class FieldDressing {
                        displayName = "Field Dressing";
                        distance = 5.0;
                        condition = QUOTE([ARR_4(_player, _target, 'leg_r', 'FieldDressing')] call DFUNC(canTreatCached));
                        statement = QUOTE([ARR_4(_player, _target, 'leg_r', 'FieldDressing')] call DFUNC(treatment));
                        showDisabled = 0;
                        priority = 2;
                        hotkey = "";
                        enableInside = 1;
                        icon = PATHTOF(UI\icons\bandage.paa);
                    };
                    class PackingBandage: fieldDressing {
                        displayName = "Packing Bandage";
                        condition = QUOTE([ARR_4(_player, _target, 'leg_r', 'PackingBandage')] call DFUNC(canTreatCached));
                        statement = QUOTE([ARR_4(_player, _target, 'leg_r', 'PackingBandage')] call DFUNC(treatment));
                        icon = PATHTOF(UI\icons\packingBandage.paa);
                    };
                    class ElasticBandage: fieldDressing {
                        displayName = "Elastic Bandage";
                        condition = QUOTE([ARR_4(_player, _target, 'leg_r', 'ElasticBandage')] call DFUNC(canTreatCached));
                        statement = QUOTE([ARR_4(_player, _target, 'leg_r', 'ElasticBandage')] call DFUNC(treatment));
                    };
                    class QuikClot: fieldDressing {
                        displayName = "QuikClot";
                        condition = QUOTE([ARR_4(_player, _target, 'leg_r', 'QuikClot')] call DFUNC(canTreatCached));
                        statement = QUOTE([ARR_4(_player, _target, 'leg_r', 'QuikClot')] call DFUNC(treatment));
                    };
                    class Tourniquet: fieldDressing {
                        displayName = "Tourniquet";
                        condition = QUOTE([ARR_4(_player, _target, 'leg_r', 'Tourniquet')] call DFUNC(canTreatCached));
                        statement = QUOTE([ARR_4(_player, _target, 'leg_r', 'Tourniquet')] call DFUNC(treatment));
                        icon = PATHTOF(UI\icons\tourniquet.paa);
                    };
                    class Morphine: fieldDressing {
                        displayName = "$STR_ACE_Medical_Inject_Morphine";
                        condition = QUOTE([ARR_4(_player, _target, 'leg_r', 'Morphine')] call DFUNC(canTreatCached));
                        statement = QUOTE([ARR_4(_player, _target, 'leg_r', 'Morphine')] call DFUNC(treatment));
                        icon = PATHTOF(UI\icons\autoInjector.paa);
                    };
                    class Atropine: Morphine {
                        displayName = "Atropine";
                        condition = QUOTE([ARR_4(_player, _target, 'leg_r', 'Atropine')] call DFUNC(canTreatCached));
                        statement = QUOTE([ARR_4(_player, _target, 'leg_r', 'Atropine')] call DFUNC(treatment));
                    };
                    class Epinephrine: Morphine {
                        displayName = "$STR_ACE_Medical_Inject_Epinephrine";
                        condition = QUOTE([ARR_4(_player, _target, 'leg_r', 'Epinephrine')] call DFUNC(canTreatCached));
                        statement = QUOTE([ARR_4(_player, _target, 'leg_r', 'Epinephrine')] call DFUNC(treatment));
                    };
                    class RemoveTourniquet: Tourniquet {
                        displayName = "Remove Tourniquet";
                        condition = QUOTE([ARR_4(_player, _target, 'leg_r', 'RemoveTourniquet')] call DFUNC(canTreatCached));
                        statement = QUOTE([ARR_4(_player, _target, 'leg_r', 'RemoveTourniquet')] call DFUNC(treatment));
                    };
                };
            };
        };

        class ACE_Actions {
            class ACE_Head {
                runOnHover = 1;
                statement = QUOTE([ARR_3(_target, true, 0)] call DFUNC(displayPatientInformation));
                icon = PATHTOF(UI\icons\medical_cross.paa);

                class Bandage {
                    displayName = "$STR_ACE_Medical_Bandage_HitHead";
                    distance = 2.0;
                    condition = QUOTE([ARR_4(_player, _target, 'head', 'Bandage')] call DFUNC(canTreatCached));
                    statement = QUOTE([ARR_4(_player, _target, 'head', 'Bandage')] call DFUNC(treatment));
                    showDisabled = 1;
                    priority = 2;
                    hotkey = "B";
                    enableInside = 1;
                    icon = PATHTOF(UI\icons\bandage.paa);
                };
                // Advanced medical
                class FieldDressing {
                    displayName = "Field Dressing";
                    distance = 5.0;
                    condition = QUOTE([ARR_4(_player, _target, 'head', 'FieldDressing')] call DFUNC(canTreatCached));
                    statement = QUOTE([ARR_4(_player, _target, 'head', 'FieldDressing')] call DFUNC(treatment));
                    showDisabled = 0;
                    priority = 2;
                    hotkey = "";
                    enableInside = 1;
                    icon = PATHTOF(UI\icons\bandage.paa);
                };
                class PackingBandage: fieldDressing {
                    displayName = "Packing Bandage";
                    condition = QUOTE([ARR_4(_player, _target, 'head', 'PackingBandage')] call DFUNC(canTreatCached));
                    statement = QUOTE([ARR_4(_player, _target, 'head', 'PackingBandage')] call DFUNC(treatment));
                    icon = PATHTOF(UI\icons\packingBandage.paa);
                };
                class ElasticBandage: fieldDressing {
                    displayName = "Elastic Bandage";
                    condition = QUOTE([ARR_4(_player, _target, 'head', 'ElasticBandage')] call DFUNC(canTreatCached));
                    statement = QUOTE([ARR_4(_player, _target, 'head', 'ElasticBandage')] call DFUNC(treatment));
                    icon = PATHTOF(UI\icons\bandage.paa);
                };
                class QuikClot: fieldDressing {
                    displayName = "QuikClot";
                    condition = QUOTE([ARR_4(_player, _target, 'head', 'QuikClot')] call DFUNC(canTreatCached));
                    statement = QUOTE([ARR_4(_player, _target, 'head', 'QuikClot')] call DFUNC(treatment));
                    icon = PATHTOF(UI\icons\bandage.paa);
                };
                class CheckPulse: fieldDressing {
                    displayName = "Check Pulse";
                    condition = QUOTE([ARR_4(_player, _target, 'head', 'CheckPulse')] call DFUNC(canTreatCached));
                    statement = QUOTE([ARR_4(_player, _target, 'head', 'CheckPulse')] call DFUNC(treatment));
                    icon = "";
                };
                class CheckBloodPressure: CheckPulse {
                    displayName = "Check Blood Pressure";
                    condition = QUOTE([ARR_4(_player, _target, 'head', 'CheckBloodPressure')] call DFUNC(canTreatCached));
                    statement = QUOTE([ARR_4(_player, _target, 'head', 'CheckBloodPressure')] call DFUNC(treatment));
                };
                class CheckResponse: CheckPulse {
                    displayName = "Check Response";
                    condition = QUOTE([ARR_4(_player, _target, 'head', 'CheckResponse')] call DFUNC(canTreatCached));
                    statement = QUOTE([ARR_4(_player, _target, 'head', 'CheckResponse')] call DFUNC(treatment));
                };
            };
            class ACE_Torso {
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
                    icon = PATHTOF(UI\icons\medical_cross.paa);

                    class Bandage {
                        displayName = "$STR_ACE_Medical_Bandage_HitBody";
                        distance = 2.0;
                        condition = QUOTE([ARR_4(_player, _target, 'body', 'Bandage')] call DFUNC(canTreatCached));
                        statement = QUOTE([ARR_4(_player, _target, 'body', 'Bandage')] call DFUNC(treatment));
                        showDisabled = 1;
                        priority = 2;
                        hotkey = "B";
                        enableInside = 1;
                        icon = PATHTOF(UI\icons\bandage.paa);
                    };
                    class Carry {
                        displayName = "$STR_ACE_MEDICAL_CARRY";
                        distance = 2.0;
                        condition = QUOTE([ARR_4(_player, _target, 'body', 'Carry')] call DFUNC(canTreatCached));
                        statement = QUOTE([ARR_4(_player, _target, 'body', 'Carry')] call DFUNC(treatment));
                        showDisabled = 1;
                        priority = 2;
                        hotkey = "";
                        enableInside = 1;
                        //icon = PATHTOF(UI\icons\bandage.paa);
                    };
                    class Drag {
                        displayName = "$STR_ACE_MEDICAL_DRAG";
                        distance = 2.0;
                        condition = QUOTE([ARR_4(_player, _target, 'body', 'Drag')] call DFUNC(canTreatCached));
                        statement = QUOTE([ARR_4(_player, _target, 'body', 'Drag')] call DFUNC(treatment));
                        showDisabled = 1;
                        priority = 2;
                        hotkey = "";
                        enableInside = 1;
                        //icon = PATHTOF(UI\icons\bandage.paa);
                    };

                    class TriageCard {
                        displayName = "Triage Card";
                        distance = 2.0;
                        condition = "true";
                        statement = QUOTE([ARR_2(_target, true)] call DFUNC(displayTriageCard));
                        showDisabled = 1;
                        priority = 2;
                        hotkey = "";
                        enableInside = 1;
                        icon = PATHTOF(UI\icons\triageCard.paa);
                    };

                    // Advanced medical
                    class FieldDressing {
                        displayName = "Field Dressing";
                        distance = 5.0;
                        condition = QUOTE([ARR_4(_player, _target, 'body', 'FieldDressing')] call DFUNC(canTreatCached));
                        statement = QUOTE([ARR_4(_player, _target, 'body', 'FieldDressing')] call DFUNC(treatment));
                        showDisabled = 0;
                        priority = 2;
                        hotkey = "";
                        enableInside = 1;
                        icon = PATHTOF(UI\icons\bandage.paa);
                    };
                    class PackingBandage: fieldDressing {
                        displayName = "Packing Bandage";
                        condition = QUOTE([ARR_4(_player, _target, 'body', 'PackingBandage')] call DFUNC(canTreatCached));
                        statement = QUOTE([ARR_4(_player, _target, 'body', 'PackingBandage')] call DFUNC(treatment));
                        icon = PATHTOF(UI\icons\packingBandage.paa);
                    };
                    class ElasticBandage: fieldDressing {
                        displayName = "Elastic Bandage";
                        condition = QUOTE([ARR_4(_player, _target, 'body', 'ElasticBandage')] call DFUNC(canTreatCached));
                        statement = QUOTE([ARR_4(_player, _target, 'body', 'ElasticBandage')] call DFUNC(treatment));
                        icon = PATHTOF(UI\icons\bandage.paa);
                    };
                    class QuikClot: fieldDressing {
                        displayName = "QuikClot";
                        condition = QUOTE([ARR_4(_player, _target, 'body', 'QuikClot')] call DFUNC(canTreatCached));
                        statement = QUOTE([ARR_4(_player, _target, 'body', 'QuikClot')] call DFUNC(treatment));
                        icon = PATHTOF(UI\icons\bandage.paa);
                    };
                    class SurgicalKit: fieldDressing {
                        displayName = "Use Surgical Kit";
                        condition = QUOTE([ARR_4(_player, _target, 'body', 'SurgicalKit')] call DFUNC(canTreatCached));
                        statement = QUOTE([ARR_4(_player, _target, 'body', 'SurgicalKit')] call DFUNC(treatment));
                        icon = PATHTOF(UI\icons\surgicalKit.paa);
                    };
                    class PersonalAidKit: fieldDressing {
                        displayName = "Use Personal Aid Kit";
                        condition = QUOTE([ARR_4(_player, _target, 'body', 'PackingBandage')] call DFUNC(canTreatCached));
                        statement = QUOTE([ARR_4(_player, _target, 'body', 'PackingBandage')] call DFUNC(treatment));
                        icon = "";
                    };
                    class CPR: fieldDressing {
                        displayName = "CPR";
                        condition = QUOTE([ARR_4(_player, _target, 'body', 'CPR')] call DFUNC(canTreatCached));
                        statement = QUOTE([ARR_4(_player, _target, 'body', 'CPR')] call DFUNC(treatment));
                        icon = "";
                    };
                };
            };
            class ACE_ArmLeft {
                runOnHover = 1;
                statement = QUOTE([ARR_3(_target, true, 2)] call DFUNC(displayPatientInformation));
                icon = PATHTOF(UI\icons\medical_cross.paa);

                class Bandage {
                    displayName = "$STR_ACE_Medical_Bandage_HitLeftArm";
                    distance = 2.0;
                    condition = QUOTE([ARR_4(_player, _target, 'hand_l', 'Bandage')] call DFUNC(canTreatCached));
                    statement = QUOTE([ARR_4(_player, _target, 'hand_l', 'Bandage')] call DFUNC(treatment));
                    showDisabled = 1;
                    priority = 2;
                    hotkey = "B";
                    enableInside = 1;
                    icon = PATHTOF(UI\icons\bandage.paa);
                };

                // Advanced medical
                class FieldDressing {
                    displayName = "Field Dressing";
                    distance = 5.0;
                    condition = QUOTE([ARR_4(_player, _target, 'hand_l', 'FieldDressing')] call DFUNC(canTreatCached));
                    statement = QUOTE([ARR_4(_player, _target, 'hand_l', 'FieldDressing')] call DFUNC(treatment));
                    showDisabled = 0;
                    priority = 2;
                    hotkey = "";
                    enableInside = 1;
                    icon = PATHTOF(UI\icons\bandage.paa);
                };
                class PackingBandage: fieldDressing {
                    displayName = "Packing Bandage";
                    condition = QUOTE([ARR_4(_player, _target, 'hand_l', 'PackingBandage')] call DFUNC(canTreatCached));
                    statement = QUOTE([ARR_4(_player, _target, 'hand_l', 'PackingBandage')] call DFUNC(treatment));
                    icon = PATHTOF(UI\icons\packingBandage.paa);
                };
                class ElasticBandage: fieldDressing {
                    displayName = "Elastic Bandage";
                    condition = QUOTE([ARR_4(_player, _target, 'hand_l', 'ElasticBandage')] call DFUNC(canTreatCached));
                    statement = QUOTE([ARR_4(_player, _target, 'hand_l', 'ElasticBandage')] call DFUNC(treatment));
                    icon = PATHTOF(UI\icons\bandage.paa);
                };
                class QuikClot: fieldDressing {
                    displayName = "QuikClot";
                    condition = QUOTE([ARR_4(_player, _target, 'hand_l', 'QuikClot')] call DFUNC(canTreatCached));
                    statement = QUOTE([ARR_4(_player, _target, 'hand_l', 'QuikClot')] call DFUNC(treatment));
                    icon = PATHTOF(UI\icons\bandage.paa);
                };
                class Tourniquet: fieldDressing {
                    displayName = "Tourniquet";
                    condition = QUOTE([ARR_4(_player, _target, 'hand_l', 'Tourniquet')] call DFUNC(canTreatCached));
                    statement = QUOTE([ARR_4(_player, _target, 'hand_l', 'Tourniquet')] call DFUNC(treatment));
                    icon = PATHTOF(UI\icons\tourniquet.paa);
                };
                class Morphine: fieldDressing {
                    displayName = "$STR_ACE_Medical_Inject_Morphine";
                    condition = QUOTE([ARR_4(_player, _target, 'hand_l', 'Morphine')] call DFUNC(canTreatCached));
                    statement = QUOTE([ARR_4(_player, _target, 'hand_l', 'Morphine')] call DFUNC(treatment));
                    icon = PATHTOF(UI\icons\autoInjector.paa);
                };
                class Atropine: Morphine {
                    displayName = "Atropine";
                    condition = QUOTE([ARR_4(_player, _target, 'hand_l', 'Atropine')] call DFUNC(canTreatCached));
                    statement = QUOTE([ARR_4(_player, _target, 'hand_l', 'Atropine')] call DFUNC(treatment));
                    icon = PATHTOF(UI\icons\autoInjector.paa);
                };
                class Epinephrine: Morphine {
                    displayName = "$STR_ACE_Medical_Inject_Epinephrine";
                    condition = QUOTE([ARR_4(_player, _target, 'hand_l', 'Epinephrine')] call DFUNC(canTreatCached));
                    statement = QUOTE([ARR_4(_player, _target, 'hand_l', 'Epinephrine')] call DFUNC(treatment));
                    icon = PATHTOF(UI\icons\autoInjector.paa);
                };
                class BloodIV: fieldDressing {
                    displayName = "Give Blood IV (1000ml)";
                    condition = QUOTE([ARR_4(_player, _target, 'hand_l', 'BloodIV')] call DFUNC(canTreatCached));
                    statement = QUOTE([ARR_4(_player, _target, 'hand_l', 'BloodIV')] call DFUNC(treatment));
                    icon = PATHTOF(UI\icons\iv.paa);
                };
                class BloodIV_500: BloodIV {
                    displayName = "Give Blood IV (500ml)";
                    condition = QUOTE([ARR_4(_player, _target, 'hand_l', 'BloodIV_500')] call DFUNC(canTreatCached));
                    statement = QUOTE([ARR_4(_player, _target, 'hand_l', 'BloodIV_500')] call DFUNC(treatment));
                };
                class BloodIV_250: BloodIV {
                    displayName = "Give Blood IV (250ml)";
                    condition = QUOTE([ARR_4(_player, _target, 'hand_l', 'BloodIV_250')] call DFUNC(canTreatCached));
                    statement = QUOTE([ARR_4(_player, _target, 'hand_l', 'BloodIV_250')] call DFUNC(treatment));
                };
                class PlasmaIV: BloodIV {
                    displayName = "Give Blood IV (1000ml)";
                    condition = QUOTE([ARR_4(_player, _target, 'hand_l', 'BloodIV')] call DFUNC(canTreatCached));
                    statement = QUOTE([ARR_4(_player, _target, 'hand_l', 'BloodIV')] call DFUNC(treatment));
                };
                class PlasmaIV_500: PlasmaIV {
                    displayName = "Give Plasma IV (500ml)";
                    condition = QUOTE([ARR_4(_player, _target, 'hand_l', 'PlasmaIV_500')] call DFUNC(canTreatCached));
                    statement = QUOTE([ARR_4(_player, _target, 'hand_l', 'PlasmaIV_500')] call DFUNC(treatment));
                };
                class PlasmaIV_250: PlasmaIV {
                    displayName = "Give Plasma IV (250ml)";
                    condition = QUOTE([ARR_4(_player, _target, 'hand_l', 'PlasmaIV_250')] call DFUNC(canTreatCached));
                    statement = QUOTE([ARR_4(_player, _target, 'hand_l', 'PlasmaIV_250')] call DFUNC(treatment));
                };
                class SalineIV: BloodIV {
                    displayName = "Give Saline IV (1000ml)";
                    condition = QUOTE([ARR_4(_player, _target, 'hand_l', 'SalineIV')] call DFUNC(canTreatCached));
                    statement = QUOTE([ARR_4(_player, _target, 'hand_l', 'SalineIV')] call DFUNC(treatment));
                };
                class SalineIV_500: SalineIV {
                    displayName = "Give Saline IV (500ml)";
                    condition = QUOTE([ARR_4(_player, _target, 'hand_l', 'SalineIV_500')] call DFUNC(canTreatCached));
                    statement = QUOTE([ARR_4(_player, _target, 'hand_l', 'SalineIV_500')] call DFUNC(treatment));
                };
                class SalineIV_250: SalineIV {
                    displayName = "Give Saline IV (250ml)";
                    condition = QUOTE([ARR_4(_player, _target, 'hand_l', 'SalineIV_250')] call DFUNC(canTreatCached));
                    statement = QUOTE([ARR_4(_player, _target, 'hand_l', 'SalineIV_250')] call DFUNC(treatment));
                };
                class CheckPulse: fieldDressing {
                    displayName = "Check Pulse";
                    condition = QUOTE([ARR_4(_player, _target, 'hand_l', 'CheckPulse')] call DFUNC(canTreatCached));
                    statement = QUOTE([ARR_4(_player, _target, 'hand_l', 'CheckPulse')] call DFUNC(treatment));
                    icon = "";
                };
                class CheckBloodPressure: CheckPulse {
                    displayName = "Check Blood Pressure";
                    condition = QUOTE([ARR_4(_player, _target, 'hand_l', 'CheckBloodPressure')] call DFUNC(canTreatCached));
                    statement = QUOTE([ARR_4(_player, _target, 'hand_l', 'CheckBloodPressure')] call DFUNC(treatment));
                };
                class RemoveTourniquet: Tourniquet {
                    displayName = "Remove Tourniquet";
                    condition = QUOTE([ARR_4(_player, _target, 'hand_l', 'RemoveTourniquet')] call DFUNC(canTreatCached));
                    statement = QUOTE([ARR_4(_player, _target, 'hand_l', 'RemoveTourniquet')] call DFUNC(treatment));
                };
            };
            class ACE_ArmRight {
                runOnHover = 1;
                statement = QUOTE([ARR_3(_target, true, 3)] call DFUNC(displayPatientInformation));
                icon = PATHTOF(UI\icons\medical_cross.paa);

                class Bandage {
                    displayName = "$STR_ACE_Medical_Bandage_HitRightArm";
                    distance = 2.0;
                    condition = QUOTE([ARR_4(_player, _target, 'hand_r', 'Bandage')] call DFUNC(canTreatCached));
                    statement = QUOTE([ARR_4(_player, _target, 'hand_r', 'Bandage')] call DFUNC(treatment));
                    showDisabled = 1;
                    priority = 2;
                    hotkey = "B";
                    enableInside = 1;
                    icon = PATHTOF(UI\icons\bandage.paa);
                };

                // Advanced medical
                class FieldDressing {
                    displayName = "Field Dressing";
                    distance = 5.0;
                    condition = QUOTE([ARR_4(_player, _target, 'hand_r', 'FieldDressing')] call DFUNC(canTreatCached));
                    statement = QUOTE([ARR_4(_player, _target, 'hand_r', 'FieldDressing')] call DFUNC(treatment));
                    showDisabled = 0;
                    priority = 2;
                    hotkey = "";
                    enableInside = 1;
                    icon = PATHTOF(UI\icons\bandage.paa);
                };
                class PackingBandage: fieldDressing {
                    displayName = "Packing Bandage";
                    condition = QUOTE([ARR_4(_player, _target, 'hand_r', 'PackingBandage')] call DFUNC(canTreatCached));
                    statement = QUOTE([ARR_4(_player, _target, 'hand_r', 'PackingBandage')] call DFUNC(treatment));
                    icon = PATHTOF(UI\icons\packingBandage.paa);
                };
                class ElasticBandage: fieldDressing {
                    displayName = "Elastic Bandage";
                    condition = QUOTE([ARR_4(_player, _target, 'hand_r', 'ElasticBandage')] call DFUNC(canTreatCached));
                    statement = QUOTE([ARR_4(_player, _target, 'hand_r', 'ElasticBandage')] call DFUNC(treatment));
                };
                class QuikClot: fieldDressing {
                    displayName = "QuikClot";
                    condition = QUOTE([ARR_4(_player, _target, 'hand_r', 'QuikClot')] call DFUNC(canTreatCached));
                    statement = QUOTE([ARR_4(_player, _target, 'hand_r', 'QuikClot')] call DFUNC(treatment));
                };
                class Tourniquet: fieldDressing {
                    displayName = "Tourniquet";
                    condition = QUOTE([ARR_4(_player, _target, 'hand_r', 'Tourniquet')] call DFUNC(canTreatCached));
                    statement = QUOTE([ARR_4(_player, _target, 'hand_r', 'Tourniquet')] call DFUNC(treatment));
                    icon = PATHTOF(UI\icons\tourniquet.paa);
                };
                class Morphine: fieldDressing {
                    displayName = "$STR_ACE_Medical_Inject_Morphine";
                    condition = QUOTE([ARR_4(_player, _target, 'hand_r', 'Morphine')] call DFUNC(canTreatCached));
                    statement = QUOTE([ARR_4(_player, _target, 'hand_r', 'Morphine')] call DFUNC(treatment));
                    icon = PATHTOF(UI\icons\autoInjector.paa);
                };
                class Atropine: Morphine {
                    displayName = "Atropine";
                    condition = QUOTE([ARR_4(_player, _target, 'hand_r', 'Atropine')] call DFUNC(canTreatCached));
                    statement = QUOTE([ARR_4(_player, _target, 'hand_r', 'Atropine')] call DFUNC(treatment));
                };
                class Epinephrine: Morphine {
                    displayName = "$STR_ACE_Medical_Inject_Epinephrine";
                    condition = QUOTE([ARR_4(_player, _target, 'hand_r', 'Epinephrine')] call DFUNC(canTreatCached));
                    statement = QUOTE([ARR_4(_player, _target, 'hand_r', 'Epinephrine')] call DFUNC(treatment));
                };
                class BloodIV: fieldDressing {
                    displayName = "Give Blood IV (1000ml)";
                    condition = QUOTE([ARR_4(_player, _target, 'hand_r', 'BloodIV')] call DFUNC(canTreatCached));
                    statement = QUOTE([ARR_4(_player, _target, 'hand_r', 'BloodIV')] call DFUNC(treatment));
                    icon = PATHTOF(UI\icons\iv.paa);
                };
                class BloodIV_500: BloodIV {
                    displayName = "Give Blood IV (500ml)";
                    condition = QUOTE([ARR_4(_player, _target, 'hand_r', 'BloodIV_500')] call DFUNC(canTreatCached));
                    statement = QUOTE([ARR_4(_player, _target, 'hand_r', 'BloodIV_500')] call DFUNC(treatment));
                };
                class BloodIV_250: BloodIV {
                    displayName = "Give Blood IV (250ml)";
                    condition = QUOTE([ARR_4(_player, _target, 'hand_r', 'BloodIV_250')] call DFUNC(canTreatCached));
                    statement = QUOTE([ARR_4(_player, _target, 'hand_r', 'BloodIV_250')] call DFUNC(treatment));
                };
                class PlasmaIV: BloodIV {
                    displayName = "Give Plasma IV (1000ml)";
                    condition = QUOTE([ARR_4(_player, _target, 'hand_r', 'BloodIV')] call DFUNC(canTreatCached));
                    statement = QUOTE([ARR_4(_player, _target, 'hand_r', 'BloodIV')] call DFUNC(treatment));
                };
                class PlasmaIV_500: PlasmaIV {
                    displayName = "Give Plasma IV (500ml)";
                    condition = QUOTE([ARR_4(_player, _target, 'hand_r', 'PlasmaIV_500')] call DFUNC(canTreatCached));
                    statement = QUOTE([ARR_4(_player, _target, 'hand_r', 'PlasmaIV_500')] call DFUNC(treatment));
                };
                class PlasmaIV_250: PlasmaIV {
                    displayName = "Give Plasma IV (250ml)";
                    condition = QUOTE([ARR_4(_player, _target, 'hand_r', 'PlasmaIV_250')] call DFUNC(canTreatCached));
                    statement = QUOTE([ARR_4(_player, _target, 'hand_r', 'PlasmaIV_250')] call DFUNC(treatment));
                };
                class SalineIV: BloodIV {
                    displayName = "Give Saline IV (1000ml)";
                    condition = QUOTE([ARR_4(_player, _target, 'hand_r', 'SalineIV')] call DFUNC(canTreatCached));
                    statement = QUOTE([ARR_4(_player, _target, 'hand_r', 'SalineIV')] call DFUNC(treatment));
                };
                class SalineIV_500: SalineIV {
                    displayName = "Give Saline IV (500ml)";
                    condition = QUOTE([ARR_4(_player, _target, 'hand_r', 'SalineIV_500')] call DFUNC(canTreatCached));
                    statement = QUOTE([ARR_4(_player, _target, 'hand_r', 'SalineIV_500')] call DFUNC(treatment));
                };
                class SalineIV_250: SalineIV {
                    displayName = "Give Saline IV (250ml)";
                    condition = QUOTE([ARR_4(_player, _target, 'hand_r', 'SalineIV_250')] call DFUNC(canTreatCached));
                    statement = QUOTE([ARR_4(_player, _target, 'hand_r', 'SalineIV_250')] call DFUNC(treatment));
                };
                class CheckPulse: fieldDressing {
                    displayName = "Check Pulse";
                    condition = QUOTE([ARR_4(_player, _target, 'hand_r', 'CheckPulse')] call DFUNC(canTreatCached));
                    statement = QUOTE([ARR_4(_player, _target, 'hand_r', 'CheckPulse')] call DFUNC(treatment));
                    icon = "";
                };
                class CheckBloodPressure: CheckPulse {
                    displayName = "Check Blood Pressure";
                    condition = QUOTE([ARR_4(_player, _target, 'hand_r', 'CheckBloodPressure')] call DFUNC(canTreatCached));
                    statement = QUOTE([ARR_4(_player, _target, 'hand_r', 'CheckBloodPressure')] call DFUNC(treatment));
                };
                class RemoveTourniquet: Tourniquet {
                    displayName = "Remove Tourniquet";
                    condition = QUOTE([ARR_4(_player, _target, 'hand_r', 'RemoveTourniquet')] call DFUNC(canTreatCached));
                    statement = QUOTE([ARR_4(_player, _target, 'hand_r', 'RemoveTourniquet')] call DFUNC(treatment));
                };

            };
            class ACE_LegLeft {
                runOnHover = 1;
                statement = QUOTE([ARR_3(_target, true, 4)] call DFUNC(displayPatientInformation));
                icon = PATHTOF(UI\icons\medical_cross.paa);

                class Bandage {
                    displayName = "$STR_ACE_Medical_Bandage_HitLeftLeg";
                    distance = 2.0;
                    condition = QUOTE([ARR_4(_player, _target, 'leg_l', 'Bandage')] call DFUNC(canTreatCached));
                    statement = QUOTE([ARR_4(_player, _target, 'leg_l', 'Bandage')] call DFUNC(treatment));
                    showDisabled = 1;
                    priority = 2;
                    hotkey = "B";
                    enableInside = 1;
                    icon = PATHTOF(UI\icons\bandage.paa);
                };


                // Advanced medical
                class FieldDressing {
                    displayName = "Field Dressing";
                    distance = 5.0;
                    condition = QUOTE([ARR_4(_player, _target, 'leg_l', 'FieldDressing')] call DFUNC(canTreatCached));
                    statement = QUOTE([ARR_4(_player, _target, 'leg_l', 'FieldDressing')] call DFUNC(treatment));
                    showDisabled = 0;
                    priority = 2;
                    hotkey = "";
                    enableInside = 1;
                    icon = PATHTOF(UI\icons\bandage.paa);
                };
                class PackingBandage: fieldDressing {
                    displayName = "Packing Bandage";
                    condition = QUOTE([ARR_4(_player, _target, 'leg_l', 'PackingBandage')] call DFUNC(canTreatCached));
                    statement = QUOTE([ARR_4(_player, _target, 'leg_l', 'PackingBandage')] call DFUNC(treatment));
                    icon = PATHTOF(UI\icons\packingBandage.paa);
                };
                class ElasticBandage: fieldDressing {
                    displayName = "Elastic Bandage";
                    condition = QUOTE([ARR_4(_player, _target, 'leg_l', 'ElasticBandage')] call DFUNC(canTreatCached));
                    statement = QUOTE([ARR_4(_player, _target, 'leg_l', 'ElasticBandage')] call DFUNC(treatment));
                };
                class QuikClot: fieldDressing {
                    displayName = "QuikClot";
                    condition = QUOTE([ARR_4(_player, _target, 'leg_l', 'QuikClot')] call DFUNC(canTreatCached));
                    statement = QUOTE([ARR_4(_player, _target, 'leg_l', 'QuikClot')] call DFUNC(treatment));
                };
                class Tourniquet: fieldDressing {
                    displayName = "Tourniquet";
                    condition = QUOTE([ARR_4(_player, _target, 'leg_l', 'Tourniquet')] call DFUNC(canTreatCached));
                    statement = QUOTE([ARR_4(_player, _target, 'leg_l', 'Tourniquet')] call DFUNC(treatment));
                    icon = PATHTOF(UI\icons\tourniquet.paa);
                };
                class Morphine: fieldDressing {
                    displayName = "$STR_ACE_Medical_Inject_Morphine";
                    condition = QUOTE([ARR_4(_player, _target, 'leg_l', 'Morphine')] call DFUNC(canTreatCached));
                    statement = QUOTE([ARR_4(_player, _target, 'leg_l', 'Morphine')] call DFUNC(treatment));
                };
                class Atropine: Morphine {
                    displayName = "Atropine";
                    condition = QUOTE([ARR_4(_player, _target, 'leg_l', 'Atropine')] call DFUNC(canTreatCached));
                    statement = QUOTE([ARR_4(_player, _target, 'leg_l', 'Atropine')] call DFUNC(treatment));
                    icon = PATHTOF(UI\icons\autoInjector.paa);
                };
                class Epinephrine: Morphine {
                    displayName = "$STR_ACE_Medical_Inject_Epinephrine";
                    condition = QUOTE([ARR_4(_player, _target, 'leg_l', 'Epinephrine')] call DFUNC(canTreatCached));
                    statement = QUOTE([ARR_4(_player, _target, 'leg_l', 'Epinephrine')] call DFUNC(treatment));
                };
                class BloodIV: fieldDressing {
                    displayName = "Give Blood IV (1000ml)";
                    condition = QUOTE([ARR_4(_player, _target, 'leg_l', 'BloodIV')] call DFUNC(canTreatCached));
                    statement = QUOTE([ARR_4(_player, _target, 'leg_l', 'BloodIV')] call DFUNC(treatment));
                    icon = PATHTOF(UI\icons\iv.paa);
                };
                class BloodIV_500: BloodIV {
                    displayName = "Give Blood IV (500ml)";
                    condition = QUOTE([ARR_4(_player, _target, 'leg_l', 'BloodIV_500')] call DFUNC(canTreatCached));
                    statement = QUOTE([ARR_4(_player, _target, 'leg_l', 'BloodIV_500')] call DFUNC(treatment));
                };
                class BloodIV_250: BloodIV {
                    displayName = "Give Blood IV (250ml)";
                    condition = QUOTE([ARR_4(_player, _target, 'leg_l', 'BloodIV_250')] call DFUNC(canTreatCached));
                    statement = QUOTE([ARR_4(_player, _target, 'leg_l', 'BloodIV_250')] call DFUNC(treatment));
                };
                class PlasmaIV: BloodIV {
                    displayName = "Give Plasma IV (1000ml)";
                    condition = QUOTE([ARR_4(_player, _target, 'leg_l', 'BloodIV')] call DFUNC(canTreatCached));
                    statement = QUOTE([ARR_4(_player, _target, 'leg_l', 'BloodIV')] call DFUNC(treatment));
                };
                class PlasmaIV_500: PlasmaIV {
                    displayName = "Give Plasma IV (500ml)";
                    condition = QUOTE([ARR_4(_player, _target, 'leg_l', 'PlasmaIV_500')] call DFUNC(canTreatCached));
                    statement = QUOTE([ARR_4(_player, _target, 'leg_l', 'PlasmaIV_500')] call DFUNC(treatment));
                };
                class PlasmaIV_250: PlasmaIV {
                    displayName = "Give Plasma IV (250ml)";
                    condition = QUOTE([ARR_4(_player, _target, 'leg_l', 'PlasmaIV_250')] call DFUNC(canTreatCached));
                    statement = QUOTE([ARR_4(_player, _target, 'leg_l', 'PlasmaIV_250')] call DFUNC(treatment));
                };
                class SalineIV: BloodIV {
                    displayName = "Give saline IV (1000ml)";
                    condition = QUOTE([ARR_4(_player, _target, 'leg_l', 'SalineIV')] call DFUNC(canTreatCached));
                    statement = QUOTE([ARR_4(_player, _target, 'leg_l', 'SalineIV')] call DFUNC(treatment));
                };
                class SalineIV_500: SalineIV {
                    displayName = "Give saline IV (500ml)";
                    condition = QUOTE([ARR_4(_player, _target, 'leg_l', 'SalineIV_500')] call DFUNC(canTreatCached));
                    statement = QUOTE([ARR_4(_player, _target, 'leg_l', 'SalineIV_500')] call DFUNC(treatment));
                };
                class SalineIV_250: SalineIV {
                    displayName = "Give saline IV (250ml)";
                    condition = QUOTE([ARR_4(_player, _target, 'leg_l', 'SalineIV_250')] call DFUNC(canTreatCached));
                    statement = QUOTE([ARR_4(_player, _target, 'leg_l', 'SalineIV_250')] call DFUNC(treatment));
                };
                class RemoveTourniquet: Tourniquet {
                    displayName = "Remove Tourniquet";
                    condition = QUOTE([ARR_4(_player, _target, 'leg_l', 'RemoveTourniquet')] call DFUNC(canTreatCached));
                    statement = QUOTE([ARR_4(_player, _target, 'leg_l', 'RemoveTourniquet')] call DFUNC(treatment));
                };
            };
            class ACE_LegRight {
                runOnHover = 1;
                statement = QUOTE([ARR_3(_target, true, 5)] call DFUNC(displayPatientInformation));
                icon = PATHTOF(UI\icons\medical_cross.paa);

                class Bandage {
                    displayName = "$STR_ACE_Medical_Bandage_HitRightLeg";
                    distance = 2.0;
                    condition = QUOTE([ARR_4(_player, _target, 'leg_r', 'Bandage')] call DFUNC(canTreatCached));
                    statement = QUOTE([ARR_4(_player, _target, 'leg_r', 'Bandage')] call DFUNC(treatment));
                    showDisabled = 1;
                    priority = 2;
                    hotkey = "B";
                    enableInside = 1;
                    icon = PATHTOF(UI\icons\bandage.paa);
                };


                // Advanced medical
                class FieldDressing {
                    displayName = "Field Dressing";
                    distance = 5.0;
                    condition = QUOTE([ARR_4(_player, _target, 'leg_r', 'FieldDressing')] call DFUNC(canTreatCached));
                    statement = QUOTE([ARR_4(_player, _target, 'leg_r', 'FieldDressing')] call DFUNC(treatment));
                    showDisabled = 0;
                    priority = 2;
                    hotkey = "";
                    enableInside = 1;
                    icon = PATHTOF(UI\icons\bandage.paa);
                };
                class PackingBandage: fieldDressing {
                    displayName = "Packing Bandage";
                    condition = QUOTE([ARR_4(_player, _target, 'leg_r', 'PackingBandage')] call DFUNC(canTreatCached));
                    statement = QUOTE([ARR_4(_player, _target, 'leg_r', 'PackingBandage')] call DFUNC(treatment));
                    icon = PATHTOF(UI\icons\packingBandage.paa);
                };
                class ElasticBandage: fieldDressing {
                    displayName = "Elastic Bandage";
                    condition = QUOTE([ARR_4(_player, _target, 'leg_r', 'ElasticBandage')] call DFUNC(canTreatCached));
                    statement = QUOTE([ARR_4(_player, _target, 'leg_r', 'ElasticBandage')] call DFUNC(treatment));
                };
                class QuikClot: fieldDressing {
                    displayName = "QuikClot";
                    condition = QUOTE([ARR_4(_player, _target, 'leg_r', 'QuikClot')] call DFUNC(canTreatCached));
                    statement = QUOTE([ARR_4(_player, _target, 'leg_r', 'QuikClot')] call DFUNC(treatment));
                };
                class Tourniquet: fieldDressing {
                    displayName = "Tourniquet";
                    condition = QUOTE([ARR_4(_player, _target, 'leg_r', 'Tourniquet')] call DFUNC(canTreatCached));
                    statement = QUOTE([ARR_4(_player, _target, 'leg_r', 'Tourniquet')] call DFUNC(treatment));
                    icon = PATHTOF(UI\icons\tourniquet.paa);
                };
                class Morphine: fieldDressing {
                    displayName = "$STR_ACE_Medical_Inject_Morphine";
                    condition = QUOTE([ARR_4(_player, _target, 'leg_r', 'Morphine')] call DFUNC(canTreatCached));
                    statement = QUOTE([ARR_4(_player, _target, 'leg_r', 'Morphine')] call DFUNC(treatment));
                    icon = PATHTOF(UI\icons\autoInjector.paa);
                };
                class Atropine: Morphine {
                    displayName = "Atropine";
                    condition = QUOTE([ARR_4(_player, _target, 'leg_r', 'Atropine')] call DFUNC(canTreatCached));
                    statement = QUOTE([ARR_4(_player, _target, 'leg_r', 'Atropine')] call DFUNC(treatment));
                };
                class Epinephrine: Morphine {
                    displayName = "$STR_ACE_Medical_Inject_Epinephrine";
                    condition = QUOTE([ARR_4(_player, _target, 'leg_r', 'Epinephrine')] call DFUNC(canTreatCached));
                    statement = QUOTE([ARR_4(_player, _target, 'leg_r', 'Epinephrine')] call DFUNC(treatment));
                };
                class BloodIV: fieldDressing {
                    displayName = "Give Blood IV (1000ml)";
                    condition = QUOTE([ARR_4(_player, _target, 'leg_r', 'BloodIV')] call DFUNC(canTreatCached));
                    statement = QUOTE([ARR_4(_player, _target, 'leg_r', 'BloodIV')] call DFUNC(treatment));
                    icon = PATHTOF(UI\icons\iv.paa);
                };
                class BloodIV_500: BloodIV {
                    displayName = "Give Blood IV (500ml)";
                    condition = QUOTE([ARR_4(_player, _target, 'leg_r', 'BloodIV_500')] call DFUNC(canTreatCached));
                    statement = QUOTE([ARR_4(_player, _target, 'leg_r', 'BloodIV_500')] call DFUNC(treatment));
                };
                class BloodIV_250: BloodIV {
                    displayName = "Give Blood IV (250ml)";
                    condition = QUOTE([ARR_4(_player, _target, 'leg_r', 'BloodIV_250')] call DFUNC(canTreatCached));
                    statement = QUOTE([ARR_4(_player, _target, 'leg_r', 'BloodIV_250')] call DFUNC(treatment));
                };
                class PlasmaIV: BloodIV {
                    displayName = "Give Plasma IV (1000ml)";
                    condition = QUOTE([ARR_4(_player, _target, 'leg_r', 'BloodIV')] call DFUNC(canTreatCached));
                    statement = QUOTE([ARR_4(_player, _target, 'leg_r', 'BloodIV')] call DFUNC(treatment));
                };
                class PlasmaIV_500: PlasmaIV {
                    displayName = "Give Plasma IV (500ml)";
                    condition = QUOTE([ARR_4(_player, _target, 'leg_r', 'PlasmaIV_500')] call DFUNC(canTreatCached));
                    statement = QUOTE([ARR_4(_player, _target, 'leg_r', 'PlasmaIV_500')] call DFUNC(treatment));
                };
                class PlasmaIV_250: PlasmaIV {
                    displayName = "Give Plasma IV (250ml)";
                    condition = QUOTE([ARR_4(_player, _target, 'leg_r', 'PlasmaIV_250')] call DFUNC(canTreatCached));
                    statement = QUOTE([ARR_4(_player, _target, 'leg_r', 'PlasmaIV_250')] call DFUNC(treatment));
                };
                class SalineIV: BloodIV {
                    displayName = "Give Saline IV (1000ml)";
                    condition = QUOTE([ARR_4(_player, _target, 'leg_r', 'SalineIV')] call DFUNC(canTreatCached));
                    statement = QUOTE([ARR_4(_player, _target, 'leg_r', 'SalineIV')] call DFUNC(treatment));
                };
                class SalineIV_500: SalineIV {
                    displayName = "Give Saline IV (500ml)";
                    condition = QUOTE([ARR_4(_player, _target, 'leg_r', 'SalineIV_500')] call DFUNC(canTreatCached));
                    statement = QUOTE([ARR_4(_player, _target, 'leg_r', 'SalineIV_500')] call DFUNC(treatment));
                };
                class SalineIV_250: SalineIV {
                    displayName = "Give Saline IV (250ml)";
                    condition = QUOTE([ARR_4(_player, _target, 'leg_r', 'SalineIV_250')] call DFUNC(canTreatCached));
                    statement = QUOTE([ARR_4(_player, _target, 'leg_r', 'SalineIV_250')] call DFUNC(treatment));
                };
                class RemoveTourniquet: Tourniquet {
                    displayName = "Remove Tourniquet";
                    condition = QUOTE([ARR_4(_player, _target, 'leg_r', 'RemoveTourniquet')] call DFUNC(canTreatCached));
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
    class ACE_fieldDressingItem: Item_Base_F {
        scope = 2;
        scopeCurator = 2;
        displayName = $STR_ACE_MEDICAL_BANDAGE_BASIC_DISPLAY;
        author = "Glowbal";
        vehicleClass = "Items";
        class TransportItems
        {
            class ACE_fieldDressing
            {
                name = "ACE_fieldDressing";
                count = 1;
            };
        };
    };
    class ACE_packingBandageItem: Item_Base_F {
        scope = 2;
        scopeCurator = 2;
        displayName = $STR_ACE_MEDICAL_PACKING_BANDAGE_DISPLAY;
        author = "Glowbal";
        vehicleClass = "Items";
        class TransportItems
        {
            class ACE_packingBandage
            {
                name = "ACE_packingBandage";
                count = 1;
            };
        };
    };
    class ACE_elasticBandageItem: Item_Base_F {
        scope = 2;
        scopeCurator = 2;
        displayName = $STR_ACE_MEDICAL_BANDAGE_ELASTIC_DISPLAY;
        author = "Glowbal";
        vehicleClass = "Items";
        class TransportItems
        {
            class ACE_elasticBandage
            {
                name = "ACE_elasticBandage";
                count = 1;
            };
        };
    };
    class ACE_tourniquetItem: Item_Base_F {
        scope = 2;
        scopeCurator = 2;
        displayName = $STR_ACE_MEDICAL_TOURNIQUET_DISPLAY;
        author = "Glowbal";
        vehicleClass = "Items";
        class TransportItems
        {
            class ACE_tourniquet
            {
                name = "ACE_tourniquet";
                count = 1;
            };
        };
    };
    class ACE_morphineItem: Item_Base_F {
        scope = 2;
        scopeCurator = 2;
        displayName = $STR_ACE_MEDICAL_MORPHINE_DISPLAY;
        author = "Glowbal";
        vehicleClass = "Items";
        class TransportItems
        {
            class ACE_morphine
            {
                name = "ACE_morphine";
                count = 1;
            };
        };
    };
    class ACE_atropineItem: Item_Base_F {
        scope = 2;
        scopeCurator = 2;
        displayName = $STR_ACE_MEDICAL_ATROPINE_DISPLAY;
        author = "Glowbal";
        vehicleClass = "Items";
        class TransportItems
        {
            class ACE_atropine
            {
                name = "ACE_atropine";
                count = 1;
            };
        };
    };
    class ACE_epinephrineItem: Item_Base_F {
        scope = 2;
        scopeCurator = 2;
        displayName = $STR_ACE_MEDICAL_EPINEPHRINE_DISPLAY;
        author = "Glowbal";
        vehicleClass = "Items";
        class TransportItems
        {
            class ACE_epinephrine
            {
                name = "ACE_epinephrine";
                count = 1;
            };
        };
    };
    class ACE_plasmaIVItem: Item_Base_F {
        scope = 2;
        scopeCurator = 2;
        displayName = $STR_ACE_MEDICAL_PLASMA_IV;
        author = "Glowbal";
        vehicleClass = "Items";
        class TransportItems
        {
            class ACE_plasmaIV
            {
                name = "ACE_plasmaIV";
                count = 1;
            };
        };
    };

    class ACE_bloodIVItem: Item_Base_F {
        scope = 2;
        scopeCurator = 2;
        displayName = $STR_ACE_MEDICAL_BLOOD_IV;
        author = "Glowbal";
        vehicleClass = "Items";
        class TransportItems
        {
            class ACE_bloodIV
            {
                name = "ACE_bloodIV";
                count = 1;
            };
        };
    };
    class ACE_salineIVItem: Item_Base_F {
        scope = 2;
        scopeCurator = 2;
        displayName = $STR_ACE_MEDICAL_SALINE_IV;
        author = "Glowbal";
        vehicleClass = "Items";
        class TransportItems
        {
            class ACE_salineIV
            {
                name = "ACE_salineIV";
                count = 1;
            };
        };
    };
    class ACE_quikClotItem: Item_Base_F {
        scope = 2;
        scopeCurator = 2;
        displayName = $STR_ACE_MEDICAL_QUIKCLOT_DISPLAY;
        author = "Glowbal";
        vehicleClass = "Items";
        class TransportItems
        {
            class ACE_quikClot
            {
                name = "ACE_quikclot";
                count = 1;
            };
        };
    };
    class ACE_personalAidKitItem: Item_Base_F {
        scope = 2;
        scopeCurator = 2;
        displayName = $STR_ACE_MEDICAL_AID_KIT_DISPLAY;
        author = "Glowbal";
        vehicleClass = "Items";
        class TransportItems
        {
            class ACE_personalAidKit
            {
                name = "ACE_personalAidKit";
                count = 1;
            };
        };
    };
    class ACE_surgicalKitItem: Item_Base_F {
        scope = 2;
        scopeCurator = 2;
        displayName = $STR_ACE_MEDICAL_SURGICALKIT_DISPLAY;
        author = "Glowbal";
        vehicleClass = "Items";
        class TransportItems
        {
            class ACE_surgicalKit
            {
                name = "ACE_surgicalKit";
                count = 1;
            };
        };
    };
    class ACE_bodyBagItem: Item_Base_F {
        scope = 2;
        scopeCurator = 2;
        displayName = $STR_ACE_MEDICAL_BODYBAG_DISPLAY;
        author = "Glowbal";
        vehicleClass = "Items";
        class TransportItems
        {
            class ACE_bodyBag
            {
                name = "ACE_bodyBag";
                count = 1;
            };
        };
    };

    class NATO_Box_Base;
    class ACE_medicalSupplyCrate: NATO_Box_Base {
        scope = 2;
        accuracy = 1000;
        displayName = "[ACE] Medical Supply Crate";
        model = "\A3\weapons_F\AmmoBoxes\AmmoBox_F";
        author = "Glowbal";
        class TransportItems {
            class ACE_fieldDressing {
                name = "ACE_fieldDressing";
                count = 25;
            };
            class ACE_packingBandage {
                name = "ACE_packingBandage";
                count = 25;
            };
            class ACE_elasticBandage {
                name = "ACE_elasticBandage";
                count = 25;
            };
            class ACE_tourniquet {
                name = "ACE_tourniquet";
                count = 15;
            };
            class ACE_morphine {
                name = "ACE_morphine";
                count = 15;
            };
            class ACE_atropine {
                name = "ACE_atropine";
                count = 15;
            };
            class ACE_epinephrine {
                name = "ACE_epinephrine";
                count = 15;
            };
            class ACE_plasmaIV {
                name = "ACE_plasmaIV";
                count = 7;
            };
            class ACE_plasmaIV_500 {
                name = "ACE_plasmaIV_500";
                count = 7;
            };
            class ACE_plasmaIV_250 {
                name = "ACE_plasmaIV_250";
                count = 7;
            };
            class ACE_salineIV {
                name = "ACE_salineIV";
                count = 7;
            };
            class ACE_salineIV_500 {
                name = "ACE_salineIV_500";
                count = 7;
            };
            class ACE_salineIV_250 {
                name = "ACE_salineIV_250";
                count = 7;
            };
            class ACE_bloodIV {
                name = "ACE_bloodIV";
                count = 7;
            };
            class ACE_bloodIV_500 {
                name = "ACE_bloodIV_500";
                count = 7;
            };
            class ACE_bloodIV_250 {
                name = "ACE_bloodIV_250";
                count = 7;
            };
            class ACE_quikClot {
                name = "ACE_quikclot";
                count = 20;
            };
            class ACE_personalAidKit {
                name = "ACE_personalAidKit";
                count = 3;
            };
            class ACE_surgicalKit {
                name = "ACE_surgicalKit";
                count = 2;
            };
            class ACE_bodyBag {
                name = "ACE_bodyBag";
                count = 5;
            };
        };
    };

    // Patient unload from vehicle actions
    class LandVehicle;
    class Car: LandVehicle {
        class ACE_Actions {
            class ACE_MainActions {
                class ACE_UnloadPatients {
                    displayName = "$STR_ACE_Medical_UnloadPatient";
                    condition = "true";
                    statement = "";
                    insertChildren = QUOTE(_this call FUNC(addUnloadPatientActions));
                };
            };
        };
    };
    class Tank: LandVehicle {
        class ACE_Actions {
            class ACE_MainActions {
                class ACE_UnloadPatients {
                    displayName = "$STR_ACE_Medical_UnloadPatient";
                    condition = "true";
                    statement = "";
                    insertChildren = QUOTE(_this call FUNC(addUnloadPatientActions));
                };
            };
        };
    };

    class Air;
    class Helicopter: Air {
        class ACE_Actions {
            class ACE_MainActions {
                class ACE_UnloadPatients {
                    displayName = "$STR_ACE_Medical_UnloadPatient";
                    condition = "true";
                    statement = "";
                    insertChildren = QUOTE(_this call FUNC(addUnloadPatientActions));
                };
            };
        };
    };
    class Plane: Air {
        class ACE_Actions {
            class ACE_MainActions {
                class ACE_UnloadPatients {
                    displayName = "$STR_ACE_Medical_UnloadPatient";
                    condition = "true";
                    statement = "";
                    insertChildren = QUOTE(_this call FUNC(addUnloadPatientActions));
                };
            };
        };
    };

    class Ship;
    class Ship_F: Ship {
        class ACE_Actions {
            class ACE_MainActions {
                class ACE_UnloadPatients {
                    displayName = "$STR_ACE_Medical_UnloadPatient";
                    condition = "true";
                    statement = "";
                    insertChildren = QUOTE(_this call FUNC(addUnloadPatientActions));
                };
            };
        };
    };

    class StaticWeapon: LandVehicle {
        class ACE_Actions {
            class ACE_MainActions {
                class ACE_UnloadPatients {
                    displayName = "$STR_ACE_Medical_UnloadPatient";
                    condition = "true";
                    statement = "";
                    insertChildren = QUOTE(_this call FUNC(addUnloadPatientActions));
                };
            };
        };
    };

    class StaticMortar;
    class Mortar_01_base_F: StaticMortar {
        class ACE_Actions {
            class ACE_MainActions {
                class ACE_UnloadPatients {
                    displayName = "$STR_ACE_Medical_UnloadPatient";
                    condition = "true";
                    statement = "";
                    insertChildren = QUOTE(_this call FUNC(addUnloadPatientActions));
                };
            };
        };
    };
};
