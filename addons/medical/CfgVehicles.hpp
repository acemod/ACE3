
#define MEDICAL_ACTION_DISTANCE 1.75

class CfgVehicles {

    class Logic;
    class Module_F: Logic {
        class ArgumentsBaseUnits {
        };
    };
    class ACE_Module;
    class ACE_moduleMedicalSettings: ACE_Module {
        scope = 2;
        displayName = CSTRING(MedicalSettings_Module_DisplayName);
        icon = QUOTE(PATHTOF(UI\Icon_Module_Medical_ca.paa));
        category = "ACE_medical";
        function = QUOTE(DFUNC(moduleMedicalSettings));
        functionPriority = 1;
        isGlobal = 1;
        isTriggerActivated = 0;
        author = ECSTRING(common,ACETeam);
        class Arguments {
            class level {
                displayName = CSTRING(MedicalSettings_level_DisplayName);
                description = CSTRING(MedicalSettings_level_Description);
                typeName = "NUMBER";
                class values {
                    class normal {
                        name = CSTRING(MedicalSettings_basic);
                        value = 1;
                        default = 1;
                    };
                    class full  {
                        name = CSTRING(MedicalSettings_advanced);
                        value = 2;
                    };
                };
            };
            class medicSetting {
                displayName = CSTRING(MedicalSettings_medicSetting_DisplayName);
                description = CSTRING(MedicalSettings_medicSetting_Description);
                typeName = "NUMBER";
                class values {
                    class disable {
                        name = CSTRING(MedicalSettings_medicSetting_disable);
                        value = 0;
                    };
                    class normal {
                        name = CSTRING(MedicalSettings_basic);
                        value = 1;
                        default = 1;
                    };
                    class full  {
                        name = CSTRING(MedicalSettings_advanced);
                        value = 2;
                    };
                };
            };
            class allowLitterCreation {
                displayName = CSTRING(MedicalSettings_allowLitterCreation_DisplayName);
                description = CSTRING(MedicalSettings_allowLitterCreation_Description);
                typeName = "BOOL";
                defaultValue = 1;
            };
            class litterCleanUpDelay {
                displayName = CSTRING(MedicalSettings_litterCleanUpDelay_DisplayName);
                description = CSTRING(MedicalSettings_litterCleanUpDelay_Description);
                typeName = "NUMBER";
                defaultValue = 1800;
            };
            class enableScreams {
                displayName = CSTRING(MedicalSettings_enableScreams_DisplayName);
                description = CSTRING(MedicalSettings_enableScreams_Description);
                typeName = "BOOL";
                defaultValue = 1;
            };
            class playerDamageThreshold {
                displayName = CSTRING(MedicalSettings_playerDamageThreshold_DisplayName);
                description = CSTRING(MedicalSettings_playerDamageThreshold_Description);
                typeName = "NUMBER";
                defaultValue = 1;
            };
            class AIDamageThreshold {
                displayName = CSTRING(MedicalSettings_AIDamageThreshold_DisplayName);
                description = CSTRING(MedicalSettings_AIDamageThreshold_Description);
                typeName = "NUMBER";
                defaultValue = 1;
            };
            class enableUnconsciousnessAI {
                displayName = CSTRING(MedicalSettings_enableUnconsciousnessAI_DisplayName);
                description = CSTRING(MedicalSettings_enableUnconsciousnessAI_Description);
                typeName = "NUMBER";
                class values {
                    class disable {
                        name = ECSTRING(common,Disabled);
                        value = 0;
                    };
                    class normal {
                        name = "50/50";
                        value = 1;
                        default = 1;
                    };
                    class full {
                        name = ECSTRING(common,Enabled);
                        value = 2;
                    };
                };
            };
            class remoteControlledAI {
                displayName = CSTRING(MedicalSettings_remoteControlledAI_DisplayName);
                description = CSTRING(MedicalSettings_remoteControlledAI_Description);
                typeName = "BOOL";
                defaultValue = 1;
            };
            class preventInstaDeath {
                displayName = CSTRING(MedicalSettings_preventInstaDeath_DisplayName);
                description = CSTRING(MedicalSettings_preventInstaDeath_Description);
                typeName = "BOOL";
                defaultValue = 0;
            };
            class bleedingCoefficient {
                displayName = CSTRING(MedicalSettings_bleedingCoefficient_DisplayName);
                description = CSTRING(MedicalSettings_bleedingCoefficient_Description);
                typeName = "NUMBER";
                defaultValue = 1;
            };
            class painCoefficient {
                displayName = CSTRING(MedicalSettings_painCoefficient_DisplayName);
                description = CSTRING(MedicalSettings_painCoefficient_Description);
                typeName = "NUMBER";
                defaultValue = 1;
            };
            class keepLocalSettingsSynced {
                displayName = CSTRING(MedicalSettings_keepLocalSettingsSynced_DisplayName);
                description = CSTRING(MedicalSettings_keepLocalSettingsSynced_Description);
                typeName = "BOOL";
                defaultValue = 1;
            };
        };
        class ModuleDescription {
            description = CSTRING(MedicalSettings_Module_Description);
            sync[] = {};
        };
    };

    class ACE_moduleAdvancedMedicalSettings: ACE_Module {
        scope = 2;
        displayName = CSTRING(AdvancedMedicalSettings_Module_DisplayName);
        icon = QUOTE(PATHTOF(UI\Icon_Module_Medical_ca.paa));
        category = "ACE_medical";
        function = QUOTE(FUNC(moduleAdvancedMedicalSettings));
        functionPriority = 10;
        isGlobal = 2;
        isTriggerActivated = 0;
        isDisposable = 0;
        author = ECSTRING(common,ACETeam);
        class Arguments {
            class enableFor {
                displayName = CSTRING(AdvancedMedicalSettings_enableFor_DisplayName);
                description = CSTRING(AdvancedMedicalSettings_enableFor_Description);
                typeName = "NUMBER";
                class values {
                    class playableUnits {
                        name = CSTRING(playeronly);
                        value = 0;
                        default = 1;
                    };
                    class playableUnitsAndAI {
                        name = CSTRING(playersandai);
                        value = 1;
                    };
                };
            };
            class enableAdvancedWounds {
                displayName = CSTRING(AdvancedMedicalSettings_enableAdvancedWounds_DisplayName);
                description = CSTRING(AdvancedMedicalSettings_enableAdvancedWounds_Description);
                typeName = "BOOL";
                defaultValue = 0;
            };
            class enableVehicleCrashes {
                displayName = CSTRING(AdvancedMedicalSettings_enableVehicleCrashes_DisplayName);
                description = CSTRING(AdvancedMedicalSettings_enableVehicleCrashes_Description);
                typeName = "BOOL";
                defaultValue = 1;
            };
            class medicSetting_PAK {
                displayName = CSTRING(AdvancedMedicalSettings_medicSetting_PAK_DisplayName);
                description = CSTRING(AdvancedMedicalSettings_medicSetting_PAK_Description);
                typeName = "NUMBER";
                class values {
                    class anyone { name = CSTRING(AdvancedMedicalSettings_anyone); value = 0; };
                    class Medic { name = CSTRING(AdvancedMedicalSettings_Medic); value = 1; default = 1; };
                    class Special { name = CSTRING(AdvancedMedicalSettings_Special); value = 2; };
                };
            };
            class consumeItem_PAK {
                displayName = CSTRING(AdvancedMedicalSettings_consumeItem_PAK_DisplayName);
                description = CSTRING(AdvancedMedicalSettings_consumeItem_PAK_Description);
                typeName = "NUMBER";
                class values {
                    class keep { name = ECSTRING(common,No); value = 0; };
                    class remove { name = ECSTRING(common,Yes); value = 1; default = 1; };
                };
            };
            class useCondition_PAK {
                displayName = CSTRING(AdvancedMedicalSettings_useCondition_PAK_DisplayName);
                description = CSTRING(AdvancedMedicalSettings_useCondition_PAK_Description);
                typeName = "NUMBER";
                class values {
                    class AnyTime { name = CSTRING(AnyTime); value = 0; };
                    class Stable { name = CSTRING(Stable); value = 1; default = 1; };
                };
            };
            class useLocation_PAK {
                displayName = CSTRING(AdvancedMedicalSettings_useLocation_PAK_DisplayName);
                description = CSTRING(AdvancedMedicalSettings_useLocation_PAK_Description);
                typeName = "NUMBER";
                class values {
                    class anywhere { name = CSTRING(AdvancedMedicalSettings_anywhere); value = 0; };
                    class vehicle { name = CSTRING(AdvancedMedicalSettings_vehicle); value = 1; };
                    class facility { name = CSTRING(AdvancedMedicalSettings_facility); value = 2; };
                    class vehicleAndFacility { name = CSTRING(AdvancedMedicalSettings_vehicleAndFacility); value = 3; default = 1; };
                    class disabled { name = ECSTRING(common,Disabled); value = 4;};
                };
            };
            class medicSetting_SurgicalKit: medicSetting_PAK {
                displayName = CSTRING(AdvancedMedicalSettings_medicSetting_SurgicalKit_DisplayName);
                description = CSTRING(AdvancedMedicalSettings_medicSetting_SurgicalKit_Description);
            };
            class consumeItem_SurgicalKit: consumeItem_PAK {
                displayName = CSTRING(AdvancedMedicalSettings_consumeItem_SurgicalKit_DisplayName);
                description = CSTRING(AdvancedMedicalSettings_consumeItem_SurgicalKit_Description);
            };
            class useLocation_SurgicalKit: useLocation_PAK {
                displayName = CSTRING(AdvancedMedicalSettings_useLocation_SurgicalKit_DisplayName);
                description = CSTRING(AdvancedMedicalSettings_useLocation_SurgicalKit_Description);
            };
            class useCondition_SurgicalKit: useCondition_PAK {
                displayName = CSTRING(AdvancedMedicalSettings_useCondition_SurgicalKit_DisplayName);
                description = CSTRING(AdvancedMedicalSettings_useCondition_SurgicalKit_Description);
                class values {
                    class AnyTime { name = CSTRING(AnyTime); value = 0; default = 1; };
                    class Stable { name = CSTRING(Stable); value = 1; };
                };
            };
            class healHitPointAfterAdvBandage {
                displayName = CSTRING(AdvancedMedicalSettings_healHitPointAfterAdvBandage_DisplayName);
                description = CSTRING(AdvancedMedicalSettings_healHitPointAfterAdvBandage_Description);
                typeName = "BOOL";
                defaultValue = 0;
            };
            class painIsOnlySuppressed {
                displayName = CSTRING(AdvancedMedicalSettings_painIsOnlySuppressed_DisplayName);
                description = CSTRING(AdvancedMedicalSettings_painIsOnlySuppressed_Description);
                typeName = "BOOL";
                defaultValue = 1;
            };
        };
        class ModuleDescription {
            description = CSTRING(AdvancedMedicalSettings_Module_Description);
            sync[] = {};
        };
    };


    class ACE_moduleReviveSettings: ACE_Module {
        scope = 2;
        displayName = CSTRING(ReviveSettings_Module_DisplayName);
        icon = QUOTE(PATHTOF(UI\Icon_Module_Medical_ca.paa));
        category = "ACE_medical";
        function = QUOTE(DFUNC(moduleReviveSettings));
        functionPriority = 1;
        isGlobal = 1;
        isTriggerActivated = 0;
        author = ECSTRING(common,ACETeam);
        class Arguments {
            class enableRevive {
                displayName = CSTRING(ReviveSettings_enableRevive_DisplayName);
                description = CSTRING(ReviveSettings_enableRevive_Description);
                typeName = "NUMBER";
                defaultValue = 0;
                class values {
                    class disable { name = ECSTRING(common,Disabled); value = 0; default = 1;};
                    class playerOnly { name = CSTRING(playeronly); value = 1; };
                    class playerAndAI { name = CSTRING(playersandai); value = 2; };
                };
            };
            class maxReviveTime {
                displayName = CSTRING(ReviveSettings_maxReviveTime_DisplayName);
                description = CSTRING(ReviveSettings_maxReviveTime_Description);
                typeName = "NUMBER";
                defaultValue = 120;
            };
            class amountOfReviveLives {
                displayName = CSTRING(ReviveSettings_amountOfReviveLives_DisplayName);
                description = CSTRING(ReviveSettings_amountOfReviveLives_Description);
                typeName = "NUMBER";
                defaultValue = -1;
            };
        };
        class ModuleDescription {
            description = CSTRING(ReviveSettings_Module_Description);
            sync[] = {};
        };
    };
    class ACE_moduleAssignMedicRoles: Module_F {
        scope = 2;
        displayName = CSTRING(AssignMedicRoles_Module_DisplayName);
        icon = QUOTE(PATHTOF(UI\Icon_Module_Medical_ca.paa));
        category = "ACE_medical";
        function = QUOTE(FUNC(moduleAssignMedicRoles));
        functionPriority = 10;
        isGlobal = 2;
        isTriggerActivated = 0;
        isDisposable = 0;
        author = ECSTRING(common,ACETeam);
        class Arguments {
            class EnableList {
                displayName = CSTRING(AssignMedicRoles_EnableList_DisplayName);
                description = CSTRING(AssignMedicRoles_EnableList_Description);
                defaultValue = "";
                typeName = "STRING";
            };
            class role {
                displayName = CSTRING(AssignMedicRoles_role_DisplayName);
                description = CSTRING(AssignMedicRoles_role_Description);
                typeName = "NUMBER";
                class values {
                    class none {
                        name = CSTRING(AssignMedicRoles_role_none);
                        value = 0;
                    };
                    class medic {
                        name = CSTRING(AssignMedicRoles_role_medic);
                        value = 1;
                        default = 1;
                    };
                    class doctor {
                        name = CSTRING(AssignMedicRoles_role_doctor);
                        value = 2;
                    };
                };
            };
        };
        class ModuleDescription {
            description = CSTRING(AssignMedicRoles_Module_Description);
            sync[] = {};
        };
    };

    class ACE_moduleAssignMedicVehicle: Module_F {
        scope = 2;
        displayName = CSTRING(AssignMedicVehicle_Module_DisplayName);
        icon = QUOTE(PATHTOF(UI\Icon_Module_Medical_ca.paa));
        category = "ACE_medical";
        function = QUOTE(FUNC(moduleAssignMedicalVehicle));
        functionPriority = 10;
        isGlobal = 2;
        isTriggerActivated = 0;
        isDisposable = 0;
        author = ECSTRING(common,ACETeam);
        class Arguments {
            class EnableList {
                displayName = CSTRING(AssignMedicVehicle_EnableList_DisplayName);
                description = CSTRING(AssignMedicVehicle_EnableList_Description);
                defaultValue = "";
                typeName = "STRING";
            };
            class enabled {
                displayName = CSTRING(AssignMedicVehicle_enabled_DisplayName);
                description = CSTRING(AssignMedicVehicle_enabled_Description);

                typeName = "NUMBER";
                class values {
                    class none {
                        name = ECSTRING(common,No);
                        value = 0;
                    };
                    class medic {
                        name = ECSTRING(common,Yes);
                        value = 1;
                        default = 1;
                    };
                };
            };
        };
        class ModuleDescription {
            description = CSTRING(AssignMedicVehicle_Module_Description);
            sync[] = {};
        };
    };
    class ACE_moduleAssignMedicalFacility: Module_F {
        scope = 2;
        displayName = CSTRING(AssignMedicalFacility_Module_DisplayName);
        icon = QUOTE(PATHTOF(UI\Icon_Module_Medical_ca.paa));
        category = "ACE_medical";
        function = QUOTE(FUNC(moduleAssignMedicalFacility));
        functionPriority = 10;
        isGlobal = 2;
        isTriggerActivated = 0;
        isDisposable = 0;
        author = ECSTRING(common,ACETeam);
        class Arguments {
            class enabled {
                displayName = CSTRING(AssignMedicalFacility_enabled_DisplayName);
                description = CSTRING(AssignMedicalFacility_enabled_Description);
                typeName = "BOOL";
            };
        };
        class ModuleDescription {
            description = CSTRING(AssignMedicalFacility_Module_Description);
            sync[] = {};
        };
    };

    #define ARM_LEG_ARMOR_DEFAULT 2
    #define ARM_LEG_ARMOR_BETTER  3
    #define ARM_LEG_ARMOR_CSAT    4

    class Land;
    class Man: Land {
        class HitPoints {
            class HitHead {
                visual = "";
                armor = 1;
                material = -1;
                name = "head";
                passThrough = 1;
                radius = 0.1;
                explosionShielding = 0.5;
                minimalHit = 0;
            };
            class HitBody {
                armor = 1;
                material = -1;
                name = "body";
                passThrough = 1;
                radius = 0.15;
                explosionShielding = 10;
                visual = "injury_body";
                minimalHit = 0;
            };
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
        };
    };
    class CAManBase: Man {
        class HitPoints: HitPoints {

            class HitFace: HitHead {
                armor = 999;
                material = -1;
                name = "face_hub";
                passThrough = 1;
                radius = 0.08;
                explosionShielding = 0.1;
                minimalHit = 0.01;
            };
            class HitNeck: HitFace {
                armor = 999;
                material = -1;
                name = "neck";
                passThrough = 1;
                radius = 0.08;
                explosionShielding = 0.5;
                minimalHit = 0.01;
            };
            class HitHead: HitNeck {
                armor = 1;
                material = -1;
                name = "head";
                passThrough = 1;
                radius = 0.1;
                explosionShielding = 0.5;
                minimalHit = 0.01;
            };
            class HitPelvis: HitBody {
                armor = 999;
                material = -1;
                name = "pelvis";
                passThrough = 1;
                radius = 0.15;
                explosionShielding = 0.5;
                visual = "injury_body";
                minimalHit = 0.01;
            };
            class HitAbdomen: HitPelvis {
                armor = 999;
                material = -1;
                name = "spine1";
                passThrough = 1;
                radius = 0.15;
                explosionShielding = 1;
                visual = "injury_body";
                minimalHit = 0.01;
            };
            class HitDiaphragm: HitAbdomen {
                armor = 999;
                material = -1;
                name = "spine2";
                passThrough = 1;
                radius = 0.15;
                explosionShielding = 6;
                visual = "injury_body";
                minimalHit = 0.01;
            };
            class HitChest: HitDiaphragm {
                armor = 999;
                material = -1;
                name = "spine3";
                passThrough = 1;
                radius = 0.15;
                explosionShielding = 6;
                visual = "injury_body";
                minimalHit = 0.01;
            };
            class HitBody: HitChest {
                armor = 1;
                material = -1;
                name = "body";
                passThrough = 1;
                radius = 0.15;
                explosionShielding = 10;
                visual = "injury_body";
                minimalHit = 0.01;
            };
            class HitArms: HitHands {
                armor = 999;
                material = -1;
                name = "arms";
                passThrough = 1;
                radius = 0.08;
                explosionShielding = 1;
                visual = "injury_hands";
                minimalHit = 0.01;
            };
            class HitHands: HitArms {
                armor = 999;
                material = -1;
                name = "hands";
                passThrough = 1;
                radius = 0.08;
                explosionShielding = 1;
                visual = "injury_hands";
                minimalHit = 0.01;
            };
            class HitLegs: HitLegs {
                armor = 999;
                material = -1;
                name = "legs";
                passThrough = 1;
                radius = 0.1;
                explosionShielding = 1;
                visual = "injury_legs";
                minimalHit = 0.01;
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
            #include "ACE_Medical_SelfActions.hpp"
        };

        class ACE_Actions {
            // Include actions in body parts for treatment while in the open
            #define EXCEPTIONS exceptions[] = {};
            #define ACTION_CONDITION condition = QUOTE(GVAR(menuTypeStyle) == 0);
            #include "ACE_Medical_Actions.hpp"

            // Create a consolidates medical menu for treatment while boarded
            class ACE_MainActions {
                class Medical {
                    displayName = CSTRING(Actions_Medical);
                    runOnHover = 1;
                    exceptions[] = {"isNotInside"};
                    condition = QUOTE((vehicle _target != _target && vehicle _target == vehicle _player) || GVAR(menuTypeStyle) == 1);
                    statement = QUOTE([ARR_3(_target, true, 0)] call DFUNC(displayPatientInformation));
                    icon = PATHTOF(UI\icons\medical_cross.paa);

                    #undef EXCEPTIONS
                    #undef ACTION_CONDITION
                    #define EXCEPTIONS exceptions[] = {"isNotInside"};
                    #define ACTION_CONDITION condition = "true";
                    #include "ACE_Medical_Actions.hpp"
                };
                class GVAR(loadPatient) {
                    displayName = CSTRING(LoadPatient);
                    distance = 5;
                    condition = QUOTE(_target getvariable[ARR_2(QUOTE(QUOTE(ACE_isUnconscious)),false)] && vehicle _target == _target);
                    statement = QUOTE([ARR_2(_player, _target)] call DFUNC(actionLoadUnit));
                    showDisabled = 0;
                    priority = 2;
                    icon = PATHTOF(UI\icons\medical_cross.paa);
                    exceptions[] = {"isNotDragging", "isNotCarrying"};
                };
                class GVAR(UnLoadPatient) {
                    displayName = CSTRING(UnloadPatient);
                    distance = 5;
                    condition = QUOTE(_target getvariable[ARR_2(QUOTE(QUOTE(ACE_isUnconscious)),false)] && vehicle _target != _target);
                    statement = QUOTE([ARR_2(_player, _target)] call DFUNC(actionUnloadUnit));
                    showDisabled = 0;
                    priority = 2;
                    icon = PATHTOF(UI\icons\medical_cross.paa);
                    exceptions[] = {"isNotDragging", "isNotCarrying", "isNotInside"};
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
            class HitFace: HitHead {
                armor = 999;
            };
            class HitNeck: HitFace {
                armor = 999;
            };
            class HitHead: HitNeck {
                armor = 1;
            };
            class HitPelvis: HitBody {
                armor = 999;
                passThrough = 0.5;
                explosionShielding = 2.4;
            };
            class HitAbdomen: HitPelvis {
                armor = 999;
                passThrough = 0.5;
                explosionShielding = 2.4;
            };
            class HitDiaphragm: HitAbdomen {
                armor = 999;
                passThrough = 0.5;
                explosionShielding = 2.4;
            };
            class HitChest: HitDiaphragm {
                armor = 999;
                passThrough = 0.5;
                explosionShielding = 2.4;
            };
            class HitBody: HitChest {
                armor = 2;
                passThrough = 0.5;
                explosionShielding = 2.4;
            };
            class HitArms: HitHands {
                armor = 999;
                passThrough = 0.5;
                explosionShielding = 1.2;
            };
            class HitHands: HitArms {
                armor = 999;
                passThrough = 0.5;
                explosionShielding = 1.2;
            };
            class HitLegs: HitLegs {
                armor = 999;
                passThrough = 0.5;
                explosionShielding = 1.2;
            };

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
            class HitFace: HitHead {
                armor = 999;
            };
            class HitNeck: HitFace {
                armor = 999;
            };
            class HitHead: HitNeck {
                armor = 1;
            };
            class HitPelvis: HitBody {
                armor = 999;
                passThrough = 0.5;
                explosionShielding = 2.4;
            };
            class HitAbdomen: HitPelvis {
                armor = 999;
                passThrough = 0.5;
                explosionShielding = 2.4;
            };
            class HitDiaphragm: HitAbdomen {
                armor = 999;
                passThrough = 0.5;
                explosionShielding = 2.4;
            };
            class HitChest: HitDiaphragm {
                armor = 999;
                passThrough = 0.5;
                explosionShielding = 2.4;
            };
            class HitBody: HitChest {
                armor = 3;
                passThrough = 0.5;
                explosionShielding = 2.4;
            };
            class HitArms: HitHands {
                armor = 999;
                passThrough = 0.5;
                explosionShielding = 1.2;
            };
            class HitHands: HitArms {
                armor = 999;
                passThrough = 0.5;
                explosionShielding = 1.2;
            };
            class HitLegs: HitLegs {
                armor = 999;
                passThrough = 0.5;
                explosionShielding = 1.2;
            };


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
            class HitFace: HitHead {
                armor = 999;
            };
            class HitNeck: HitFace {
                armor = 999;
            };
            class HitHead: HitNeck {
                armor = 1;
            };
            class HitPelvis: HitBody {
                armor = 999;
                passThrough = 0.5;
                explosionShielding = 2.4;
            };
            class HitAbdomen: HitPelvis {
                armor = 999;
                passThrough = 0.5;
                explosionShielding = 2.4;
            };
            class HitDiaphragm: HitAbdomen {
                armor = 999;
                passThrough = 0.5;
                explosionShielding = 2.4;
            };
            class HitChest: HitDiaphragm {
                armor = 999;
                passThrough = 0.5;
                explosionShielding = 2.4;
            };
            class HitBody: HitChest {
                armor = 2;
                passThrough = 0.5;
                explosionShielding = 2.4;
            };
            class HitArms: HitHands {
                armor = 999;
                passThrough = 0.5;
                explosionShielding = 1.2;
            };
            class HitHands: HitArms {
                armor = 999;
                passThrough = 0.5;
                explosionShielding = 1.2;
            };
            class HitLegs: HitLegs {
                armor = 999;
                passThrough = 0.5;
                explosionShielding = 1.2;
            };

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
            class HitFace: HitHead {
                armor = 999;
            };
            class HitNeck: HitFace {
                armor = 999;
            };
            class HitHead: HitNeck {
                armor = 1;
            };
            class HitPelvis: HitBody {
                armor = 999;
                passThrough = 0.5;
                explosionShielding = 2.4;
            };
            class HitAbdomen: HitPelvis {
                armor = 999;
                passThrough = 0.5;
                explosionShielding = 2.4;
            };
            class HitDiaphragm: HitAbdomen {
                armor = 999;
                passThrough = 0.5;
                explosionShielding = 2.4;
            };
            class HitChest: HitDiaphragm {
                armor = 999;
                passThrough = 0.5;
                explosionShielding = 2.4;
            };
            class HitBody: HitChest {
                armor = 3;
                passThrough = 0.5;
                explosionShielding = 2.4;
            };
            class HitArms: HitHands {
                armor = 999;
                passThrough = 0.5;
                explosionShielding = 1.2;
            };
            class HitHands: HitArms {
                armor = 999;
                passThrough = 0.5;
                explosionShielding = 1.2;
            };
            class HitLegs: HitLegs {
                armor = 999;
                passThrough = 0.5;
                explosionShielding = 1.2;
            };


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
            class HitFace: HitHead {
                armor = 999;
            };
            class HitNeck: HitFace {
                armor = 999;
            };
            class HitHead: HitNeck {
                armor = 1;
            };
            class HitPelvis: HitBody {
                armor = 999;
                passThrough = 0.5;
                explosionShielding = 2.4;
            };
            class HitAbdomen: HitPelvis {
                armor = 999;
                passThrough = 0.5;
                explosionShielding = 2.4;
            };
            class HitDiaphragm: HitAbdomen {
                armor = 999;
                passThrough = 0.5;
                explosionShielding = 2.4;
            };
            class HitChest: HitDiaphragm {
                armor = 999;
                passThrough = 0.5;
                explosionShielding = 2.4;
            };
            class HitBody: HitChest {
                armor = 4;
                passThrough = 0.5;
                explosionShielding = 2.4;
            };
            class HitArms: HitHands {
                armor = 999;
                passThrough = 0.5;
                explosionShielding = 1.2;
            };
            class HitHands: HitArms {
                armor = 999;
                passThrough = 0.5;
                explosionShielding = 1.2;
            };
            class HitLegs: HitLegs {
                armor = 999;
                passThrough = 0.5;
                explosionShielding = 1.2;
            };


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
            class HitFace: HitHead {
                armor = 999;
            };
            class HitNeck: HitFace {
                armor = 999;
            };
            class HitHead: HitNeck {
                armor = 1;
            };
            class HitPelvis: HitBody {
                armor = 999;
                passThrough = 0.5;
                explosionShielding = 2.4;
            };
            class HitAbdomen: HitPelvis {
                armor = 999;
                passThrough = 0.5;
                explosionShielding = 2.4;
            };
            class HitDiaphragm: HitAbdomen {
                armor = 999;
                passThrough = 0.5;
                explosionShielding = 2.4;
            };
            class HitChest: HitDiaphragm {
                armor = 999;
                passThrough = 0.5;
                explosionShielding = 2.4;
            };
            class HitBody: HitChest {
                armor = 4;
                passThrough = 0.5;
                explosionShielding = 2.4;
            };
            class HitArms: HitHands {
                armor = 999;
                passThrough = 0.5;
                explosionShielding = 1.2;
            };
            class HitHands: HitArms {
                armor = 999;
                passThrough = 0.5;
                explosionShielding = 1.2;
            };
            class HitLegs: HitLegs {
                armor = 999;
                passThrough = 0.5;
                explosionShielding = 1.2;
            };

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
    class ACE_bodyBagObject: MapBoard_altis_F {
        XEH_ENABLED;
        scope = 1;
        side = -1;
        model = QUOTE(PATHTOEF(apl,bodybag.p3d));
        icon = "";
        displayName = CSTRING(Bodybag_Display);
        EGVAR(dragging,canDrag) = 1;
        EGVAR(dragging,dragPosition[]) = {0,1.2,0};
        EGVAR(dragging,dragDirection) = 0;
        EGVAR(cargo,size) = 1;
        EGVAR(cargo,canLoad) = 1;
        class ACE_Actions {
            class ACE_MainActions {
                displayName = ECSTRING(interaction,MainAction);
                distance = 5;
                condition = QUOTE(true);
                statement = "";
                icon = "\a3\ui_f\data\IGUI\Cfg\Actions\eject_ca.paa";
                selection = "";
            };
        };
    };

    // Medical litter classes
    class Thing;
    class ACE_MedicalLitterBase: Thing {
        scope = 1;
        displayName = " ";
        destrType = "DestructNo";
        model = QUOTE(PATHTOF(data\littergeneric.p3d));
    };
    class ACE_MedicalLitter_clean: ACE_MedicalLitterBase {
        model = QUOTE(PATHTOF(data\littergeneric_clean.p3d));
    };
    class ACE_MedicalLitter_bandage1: ACE_MedicalLitterBase {
        model = QUOTE(PATHTOF(data\littergeneric_bandages1.p3d));
    };
    class ACE_MedicalLitter_bandage2: ACE_MedicalLitterBase {
        model = QUOTE(PATHTOF(data\littergeneric_bandages2.p3d));
    };
    class ACE_MedicalLitter_bandage3: ACE_MedicalLitterBase {
        model = QUOTE(PATHTOF(data\littergeneric_bandages3.p3d));
    };
    class ACE_MedicalLitter_packingBandage: ACE_MedicalLitterBase {
        model = QUOTE(PATHTOF(data\littergeneric_packingBandage.p3d));
    };
    class ACE_MedicalLitter_gloves: ACE_MedicalLitterBase {
        model = QUOTE(PATHTOF(data\littergeneric_gloves.p3d));
    };
    class ACE_MedicalLitter_atropine: ACE_MedicalLitterBase {
        model = QUOTE(PATHTOF(data\littergeneric_atropine.p3d));
    };
    class ACE_MedicalLitter_epinephrine: ACE_MedicalLitterBase {
        model = QUOTE(PATHTOF(data\littergeneric_epinephrine.p3d));
    };
    class ACE_MedicalLitter_morphine: ACE_MedicalLitterBase {
        model = QUOTE(PATHTOF(data\littergeneric_morphine.p3d));
    };
    class ACE_MedicalLitter_QuickClot: ACE_MedicalLitterBase {
        model = QUOTE(PATHTOF(data\littergeneric_Quikclot.p3d));
    };
    class Item_Base_F;
    class ACE_fieldDressingItem: Item_Base_F {
        scope = 2;
        scopeCurator = 2;
        displayName = CSTRING(Bandage_Basic_Display);
        author = ECSTRING(common,ACETeam);
        vehicleClass = "Items";
        class TransportItems {
            MACRO_ADDITEM(ACE_fieldDressing,1);
        };
    };
    class ACE_packingBandageItem: Item_Base_F {
        scope = 2;
        scopeCurator = 2;
        displayName = CSTRING(Packing_Bandage_Display);
        author = ECSTRING(common,ACETeam);
        vehicleClass = "Items";
        class TransportItems {
            MACRO_ADDITEM(ACE_packingBandage,1);
        };
    };
    class ACE_elasticBandageItem: Item_Base_F {
        scope = 2;
        scopeCurator = 2;
        displayName = CSTRING(Bandage_Elastic_Display);
        author = ECSTRING(common,ACETeam);
        vehicleClass = "Items";
        class TransportItems {
            MACRO_ADDITEM(ACE_elasticBandage,1);
        };
    };
    class ACE_tourniquetItem: Item_Base_F {
        scope = 2;
        scopeCurator = 2;
        displayName = CSTRING(Tourniquet_Display);
        author = ECSTRING(common,ACETeam);
        vehicleClass = "Items";
        class TransportItems {
            MACRO_ADDITEM(ACE_tourniquet,1);
        };
    };
    class ACE_morphineItem: Item_Base_F {
        scope = 2;
        scopeCurator = 2;
        displayName = CSTRING(Morphine_Display);
        author = ECSTRING(common,ACETeam);
        vehicleClass = "Items";
        class TransportItems {
            MACRO_ADDITEM(ACE_morphine,1);
        };
    };
    class ACE_atropineItem: Item_Base_F {
        scope = 2;
        scopeCurator = 2;
        displayName = CSTRING(Atropine_Display);
        author = ECSTRING(common,ACETeam);
        vehicleClass = "Items";
        class TransportItems {
            MACRO_ADDITEM(ACE_atropine,1);
        };
    };
    class ACE_epinephrineItem: Item_Base_F {
        scope = 2;
        scopeCurator = 2;
        displayName = CSTRING(Epinephrine_Display);
        author = ECSTRING(common,ACETeam);
        vehicleClass = "Items";
        class TransportItems {
            MACRO_ADDITEM(ACE_epinephrine,1);
        };
    };
    class ACE_plasmaIVItem: Item_Base_F {
        scope = 2;
        scopeCurator = 2;
        displayName = CSTRING(Plasma_IV);
        author = ECSTRING(common,ACETeam);
        vehicleClass = "Items";
        class TransportItems {
            MACRO_ADDITEM(ACE_plasmaIV,1);
        };
    };

    class ACE_bloodIVItem: Item_Base_F {
        scope = 2;
        scopeCurator = 2;
        displayName = CSTRING(Blood_IV);
        author = ECSTRING(common,ACETeam);
        vehicleClass = "Items";
        class TransportItems {
            MACRO_ADDITEM(ACE_bloodIV,1);
        };
    };
    class ACE_salineIVItem: Item_Base_F {
        scope = 2;
        scopeCurator = 2;
        displayName = CSTRING(Saline_IV);
        author = ECSTRING(common,ACETeam);
        vehicleClass = "Items";
        class TransportItems {
            MACRO_ADDITEM(ACE_salineIV,1);
        };
    };
    class ACE_quikClotItem: Item_Base_F {
        scope = 2;
        scopeCurator = 2;
        displayName = CSTRING(QuikClot_Display);
        author = ECSTRING(common,ACETeam);
        vehicleClass = "Items";
        class TransportItems {
            MACRO_ADDITEM(ACE_quikclot,1);
        };
    };
    class ACE_personalAidKitItem: Item_Base_F {
        scope = 2;
        scopeCurator = 2;
        displayName = CSTRING(Aid_Kit_Display);
        author = ECSTRING(common,ACETeam);
        vehicleClass = "Items";
        class TransportItems {
            MACRO_ADDITEM(ACE_personalAidKit,1);
        };
    };
    class ACE_surgicalKitItem: Item_Base_F {
        scope = 2;
        scopeCurator = 2;
        displayName = CSTRING(SurgicalKit_Display);
        author = ECSTRING(common,ACETeam);
        vehicleClass = "Items";
        class TransportItems {
            MACRO_ADDITEM(ACE_surgicalKit,1);
        };
    };
    class ACE_bodyBagItem: Item_Base_F {
        scope = 2;
        scopeCurator = 2;
        displayName = CSTRING(Bodybag_Display);
        author = ECSTRING(common,ACETeam);
        vehicleClass = "Items";
        class TransportItems {
            MACRO_ADDITEM(ACE_bodyBag,1);
        };
    };

    class NATO_Box_Base;
    class ACE_medicalSupplyCrate: NATO_Box_Base {
        scope = 2;
        accuracy = 1000;
        displayName = CSTRING(medicalSupplyCrate);
        model = PATHTOF(data\ace_medcrate.p3d);
        author = ECSTRING(common,ACETeam);
        class TransportItems {
            MACRO_ADDITEM(ACE_fieldDressing,50);
            MACRO_ADDITEM(ACE_morphine,25);
            MACRO_ADDITEM(ACE_epinephrine,25);
            MACRO_ADDITEM(ACE_bloodIV,15);
            MACRO_ADDITEM(ACE_bloodIV_500,15);
            MACRO_ADDITEM(ACE_bloodIV_250,15);
            MACRO_ADDITEM(ACE_bodyBag,10);
        };
    };
    class ACE_medicalSupplyCrate_advanced: ACE_medicalSupplyCrate {
        displayName = CSTRING(medicalSupplyCrate_advanced);
        class TransportItems {
            MACRO_ADDITEM(ACE_fieldDressing,25);
            MACRO_ADDITEM(ACE_packingBandage,25);
            MACRO_ADDITEM(ACE_elasticBandage,25);
            MACRO_ADDITEM(ACE_tourniquet,15);
            MACRO_ADDITEM(ACE_morphine,15);
            MACRO_ADDITEM(ACE_atropine,15);
            MACRO_ADDITEM(ACE_epinephrine,15);
            MACRO_ADDITEM(ACE_plasmaIV,7);
            MACRO_ADDITEM(ACE_plasmaIV_500,7);
            MACRO_ADDITEM(ACE_plasmaIV_250,7);
            MACRO_ADDITEM(ACE_salineIV,7);
            MACRO_ADDITEM(ACE_salineIV_500,7);
            MACRO_ADDITEM(ACE_salineIV_250,7);
            MACRO_ADDITEM(ACE_bloodIV,7);
            MACRO_ADDITEM(ACE_bloodIV_500,7);
            MACRO_ADDITEM(ACE_bloodIV_250,7);
            MACRO_ADDITEM(ACE_quikClot,20);
            MACRO_ADDITEM(ACE_personalAidKit,3);
            MACRO_ADDITEM(ACE_surgicalKit,2);
            MACRO_ADDITEM(ACE_bodyBag,5);
        };
    };
};
