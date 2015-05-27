
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
        displayName = CSTRING(Module_DisplayName);
        icon = QUOTE(PATHTOF(UI\Icon_Module_Medical_ca.paa));
        category = "ACE_medical";
        function = QUOTE(DFUNC(moduleMedicalSettings));
        functionPriority = 1;
        isGlobal = 1;
        isTriggerActivated = 0;
        author = "$STR_ACE_Common_ACETeam";
        class Arguments {
            class level {
                displayName = CSTRING(level_DisplayName);
                description = CSTRING(level_Description);
                typeName = "NUMBER";
                class values {
                    class normal {
                        name = CSTRING(basic);
                        value = 1;
                        default = 1;
                    };
                    class full  {
                        name = CSTRING(advanced);
                        value = 2;
                    };
                };
            };
            class medicSetting {
                displayName = CSTRING(medicSetting_DisplayName);
                description = CSTRING(medicSetting_Description);
                typeName = "NUMBER";
                class values {
                    class disable {
                        name = CSTRING(medicSetting_disable);
                        value = 0;
                    };
                    class normal {
                        name = CSTRING(basic);
                        value = 1;
                        default = 1;
                    };
                    class full  {
                        name = CSTRING(advanced);
                        value = 2;
                    };
                };
            };
            class allowLitterCreation {
                displayName = CSTRING(allowLitterCreation_DisplayName);
                description = CSTRING(allowLitterCreation_Description);
                typeName = "BOOL";
                defaultValue = 1;
            };
            class litterCleanUpDelay {
                displayName = CSTRING(litterCleanUpDelay_DisplayName);
                description = CSTRING(litterCleanUpDelay_Description);
                typeName = "NUMBER";
                defaultValue = 1800;
            };
            class enableScreams {
                displayName = CSTRING(enableScreams_DisplayName);
                description = CSTRING(enableScreams_Description);
                typeName = "BOOL";
                defaultValue = 1;
            };
            class playerDamageThreshold {
                displayName = CSTRING(playerDamageThreshold_DisplayName);
                description = CSTRING(playerDamageThreshold_Description);
                typeName = "NUMBER";
                defaultValue = 1;
            };
            class AIDamageThreshold {
                displayName = CSTRING(AIDamageThreshold_DisplayName);
                description = CSTRING(AIDamageThreshold_Description);
                typeName = "NUMBER";
                defaultValue = 1;
            };
            class enableUnconsciousnessAI {
                displayName = CSTRING(enableUnconsciousnessAI_DisplayName);
                description = CSTRING(enableUnconsciousnessAI_Description);
                typeName = "NUMBER";
                class values {
                    class disable {
                        name = CSTRING(disabled);
                        value = 0;
                    };
                    class normal {
                        name = "50/50";
                        value = 1;
                        default = 1;
                    };
                    class full {
                        name = CSTRING(enabled);
                        value = 2;
                    };
                };
            };
            class preventInstaDeath {
                displayName = CSTRING(preventInstaDeath_DisplayName);
                description = CSTRING(preventInstaDeath_Description);
                typeName = "BOOL";
                defaultValue = 0;
            };
            class bleedingCoefficient {
                displayName = CSTRING(bleedingCoefficient_DisplayName);
                description = CSTRING(bleedingCoefficient_Description);
                typeName = "NUMBER";
                defaultValue = 1;
            };
            class painCoefficient {
                displayName = CSTRING(painCoefficient_DisplayName);
                description = CSTRING(painCoefficient_Description);
                typeName = "NUMBER";
                defaultValue = 1;
            };
            class keepLocalSettingsSynced {
                displayName = CSTRING(keepLocalSettingsSynced_DisplayName);
                description = CSTRING(keepLocalSettingsSynced_Description);
                typeName = "BOOL";
                defaultValue = 1;
            };
        };
        class ModuleDescription {
            description = CSTRING(Module_Description);
            sync[] = {};
        };
    };

    class ACE_moduleAdvancedMedicalSettings: ACE_Module {
        scope = 2;
        displayName = CSTRING(Module_DisplayName);
        icon = QUOTE(PATHTOF(UI\Icon_Module_Medical_ca.paa));
        category = "ACE_medical";
        function = QUOTE(FUNC(moduleAdvancedMedicalSettings));
        functionPriority = 10;
        isGlobal = 2;
        isTriggerActivated = 0;
        isDisposable = 0;
        author = "$STR_ACE_Common_ACETeam";
        class Arguments {
            class enableFor {
                displayName = CSTRING(enableFor_DisplayName);
                description = CSTRING(enableFor_Description);
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
                displayName = CSTRING(enableAdvancedWounds_DisplayName);
                description = CSTRING(enableAdvancedWounds_Description);
                typeName = "BOOL";
                defaultValue = 0;
            };
            class enableVehicleCrashes {
                displayName = CSTRING(enableVehicleCrashes_DisplayName);
                description = CSTRING(enableVehicleCrashes_Description);
                typeName = "BOOL";
                defaultValue = 1;
            };
            class medicSetting_PAK {
                displayName = CSTRING(medicSetting_PAK_DisplayName);
                description = CSTRING(medicSetting_PAK_Description);
                typeName = "NUMBER";
                class values {
                    class anyone { name = CSTRING(anyone); value = 0; };
                    class Medic { name = CSTRING(Medic); value = 1; default = 1; };
                    class Special { name = CSTRING(Special); value = 2; };
                };
            };
            class consumeItem_PAK {
                displayName = CSTRING(consumeItem_PAK_DisplayName);
                description = CSTRING(consumeItem_PAK_Description);

                typeName = "NUMBER";
                class values {
                    class keep { name = CSTRING(No); value = 0; };
                    class remove { name = CSTRING(Yes); value = 1; default = 1; };
                };
            };
            class useLocation_PAK {
                displayName = CSTRING(useLocation_PAK_DisplayName);
                description = CSTRING(useLocation_PAK_Description);
                typeName = "NUMBER";
                class values {
                    class anywhere { name = CSTRING(anywhere); value = 0; };
                    class vehicle { name = CSTRING(vehicle); value = 1; };
                    class facility { name = CSTRING(facility); value = 2; };
                    class vehicleAndFacility { name = CSTRING(vehicleAndFacility); value = 3; default = 1; };
                    class disabled { name = CSTRING(disabled); value = 4;};
                };
            };
            class medicSetting_SurgicalKit: medicSetting_PAK {
                displayName = CSTRING(medicSetting_SurgicalKit_DisplayName);
                description = CSTRING(medicSetting_SurgicalKit_Description);
            };
            class consumeItem_SurgicalKit: consumeItem_PAK {
                displayName = CSTRING(consumeItem_SurgicalKit_DisplayName);
                description = CSTRING(consumeItem_SurgicalKit_Description);
            };
            class useLocation_SurgicalKit: useLocation_PAK {
                displayName = CSTRING(useLocation_SurgicalKit_DisplayName);
                description = CSTRING(useLocation_SurgicalKit_Description);
            };

        };
        class ModuleDescription {
            description = CSTRING(Module_Description);
            sync[] = {};
        };
    };


    class ACE_moduleReviveSettings: ACE_Module {
        scope = 2;
        displayName = CSTRING(Module_DisplayName);
        icon = QUOTE(PATHTOF(UI\Icon_Module_Medical_ca.paa));
        category = "ACE_medical";
        function = QUOTE(DFUNC(moduleReviveSettings));
        functionPriority = 1;
        isGlobal = 1;
        isTriggerActivated = 0;
        author = "$STR_ACE_Common_ACETeam";
        class Arguments {
            class enableRevive {
                displayName = CSTRING(enableRevive_DisplayName);
                description = CSTRING(enableRevive_Description);
                typeName = "NUMBER";
                defaultValue = 0;
                class values {
                    class disable { name = CSTRING(disabled); value = 0; default = 1;};
                    class playerOnly { name = CSTRING(playeronly); value = 1; };
                    class playerAndAI { name = CSTRING(playersandai); value = 2; };
                };
            };
            class maxReviveTime {
                displayName = CSTRING(maxReviveTime_DisplayName);
                description = CSTRING(maxReviveTime_Description);
                typeName = "NUMBER";
                defaultValue = 120;
            };
            class amountOfReviveLives {
                displayName = CSTRING(amountOfReviveLives_DisplayName);
                description = CSTRING(amountOfReviveLives_Description);
                typeName = "NUMBER";
                defaultValue = -1;
            };
        };
        class ModuleDescription {
            description = CSTRING(Module_Description);
            sync[] = {};
        };
    };
    class ACE_moduleAssignMedicRoles: Module_F {
        scope = 2;
        displayName = CSTRING(Module_DisplayName);
        icon = QUOTE(PATHTOF(UI\Icon_Module_Medical_ca.paa));
        category = "ACE_medical";
        function = QUOTE(FUNC(moduleAssignMedicRoles));
        functionPriority = 10;
        isGlobal = 2;
        isTriggerActivated = 0;
        isDisposable = 0;
        author = "$STR_ACE_Common_ACETeam";
        class Arguments {
            class EnableList {
                displayName = CSTRING(EnableList_DisplayName);
                description = CSTRING(EnableList_Description);
                defaultValue = "";
                typeName = "STRING";
            };
            class role {
                displayName = CSTRING(role_DisplayName);
                description = CSTRING(role_Description);
                typeName = "NUMBER";
                class values {
                    class none {
                        name = CSTRING(role_none);
                        value = 0;
                    };
                    class medic {
                        name = CSTRING(role_medic);
                        value = 1;
                        default = 1;
                    };
                    class doctor {
                        name = CSTRING(role_doctor);
                        value = 2;
                    };
                };
            };
        };
        class ModuleDescription {
            description = CSTRING(Module_Description);
            sync[] = {};
        };
    };

    class ACE_moduleAssignMedicVehicle: Module_F {
        scope = 2;
        displayName = CSTRING(Module_DisplayName);
        icon = QUOTE(PATHTOF(UI\Icon_Module_Medical_ca.paa));
        category = "ACE_medical";
        function = QUOTE(FUNC(moduleAssignMedicalVehicle));
        functionPriority = 10;
        isGlobal = 2;
        isTriggerActivated = 0;
        isDisposable = 0;
        author = "$STR_ACE_Common_ACETeam";
        class Arguments {
            class EnableList {
                displayName = CSTRING(EnableList_DisplayName);
                description = CSTRING(EnableList_Description);
                defaultValue = "";
                typeName = "STRING";
            };
            class enabled {
                displayName = CSTRING(enabled_DisplayName);
                description = CSTRING(enabled_Description);

                typeName = "NUMBER";
                class values {
                    class none {
                        name = CSTRING(No);
                        value = 0;
                    };
                    class medic {
                        name = CSTRING(Yes);
                        value = 1;
                        default = 1;
                    };
                };
            };
        };
        class ModuleDescription {
            description = CSTRING(Module_Description);
            sync[] = {};
        };
    };
    class ACE_moduleAssignMedicalFacility: Module_F {
        scope = 2;
        displayName = CSTRING(Module_DisplayName);
        icon = QUOTE(PATHTOF(UI\Icon_Module_Medical_ca.paa));
        category = "ACE_medical";
        function = QUOTE(FUNC(moduleAssignMedicalFacility));
        functionPriority = 10;
        isGlobal = 2;
        isTriggerActivated = 0;
        isDisposable = 0;
        author = "$STR_ACE_Common_ACETeam";
        class Arguments {
            class enabled {
                displayName = CSTRING(enabled_DisplayName);
                description = CSTRING(enabled_Description);
                typeName = "BOOL";
            };
        };
        class ModuleDescription {
            description = CSTRING(Module_Description);
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
    class ACE_bodyBagObject: MapBoard_altis_F {
        XEH_ENABLED;
        scope = 1;
        side = -1;
        model = QUOTE(PATHTOEF(apl,bodybag.p3d));
        icon = "";
        displayName = $STR_ACE_Medical_Bodybag_Display;
        EGVAR(dragging,canDrag) = 1;
        EGVAR(dragging,dragPosition[]) = {0,1.2,0};
        EGVAR(dragging,dragDirection) = 0;
        class ACE_Actions {
            class ACE_MainActions {
                displayName = CSTRING(MainAction);
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
        model = QUOTE(PATHTOF(data\litter_packingBandage.p3d));
    };
    class ACE_MedicalLitter_gloves: ACE_MedicalLitterBase {
        model = QUOTE(PATHTOF(data\littergeneric_gloves.p3d));
    };
    class ACE_MedicalLitter_atropine: ACE_MedicalLitterBase {
        model = QUOTE(PATHTOF(data\litter_atropine.p3d));
    };
    class ACE_MedicalLitter_epinephrine: ACE_MedicalLitterBase {
        model = QUOTE(PATHTOF(data\litter_epinephrine.p3d));
    };
    class ACE_MedicalLitter_morphine: ACE_MedicalLitterBase {
        model = QUOTE(PATHTOF(data\litter_morphine.p3d));
    };

    class Item_Base_F;
    class ACE_fieldDressingItem: Item_Base_F {
        scope = 2;
        scopeCurator = 2;
        displayName = $STR_ACE_Medical_Bandage_Basic_Display;
        author = "$STR_ACE_Common_ACETeam";
        vehicleClass = "Items";
        class TransportItems {
            class ACE_fieldDressing {
                name = "ACE_fieldDressing";
                count = 1;
            };
        };
    };
    class ACE_packingBandageItem: Item_Base_F {
        scope = 2;
        scopeCurator = 2;
        displayName = $STR_ACE_Medical_Packing_Bandage_Display;
        author = "$STR_ACE_Common_ACETeam";
        vehicleClass = "Items";
        class TransportItems {
            class ACE_packingBandage {
                name = "ACE_packingBandage";
                count = 1;
            };
        };
    };
    class ACE_elasticBandageItem: Item_Base_F {
        scope = 2;
        scopeCurator = 2;
        displayName = $STR_ACE_Medical_Bandage_Elastic_Display;
        author = "$STR_ACE_Common_ACETeam";
        vehicleClass = "Items";
        class TransportItems {
            class ACE_elasticBandage {
                name = "ACE_elasticBandage";
                count = 1;
            };
        };
    };
    class ACE_tourniquetItem: Item_Base_F {
        scope = 2;
        scopeCurator = 2;
        displayName = $STR_ACE_Medical_Tourniquet_Display;
        author = "$STR_ACE_Common_ACETeam";
        vehicleClass = "Items";
        class TransportItems {
            class ACE_tourniquet {
                name = "ACE_tourniquet";
                count = 1;
            };
        };
    };
    class ACE_morphineItem: Item_Base_F {
        scope = 2;
        scopeCurator = 2;
        displayName = $STR_ACE_Medical_Morphine_Display;
        author = "$STR_ACE_Common_ACETeam";
        vehicleClass = "Items";
        class TransportItems {
            class ACE_morphine {
                name = "ACE_morphine";
                count = 1;
            };
        };
    };
    class ACE_atropineItem: Item_Base_F {
        scope = 2;
        scopeCurator = 2;
        displayName = $STR_ACE_Medical_Atropine_Display;
        author = "$STR_ACE_Common_ACETeam";
        vehicleClass = "Items";
        class TransportItems {
            class ACE_atropine {
                name = "ACE_atropine";
                count = 1;
            };
        };
    };
    class ACE_epinephrineItem: Item_Base_F {
        scope = 2;
        scopeCurator = 2;
        displayName = $STR_ACE_Medical_Epinephrine_Display;
        author = "$STR_ACE_Common_ACETeam";
        vehicleClass = "Items";
        class TransportItems {
            class ACE_epinephrine {
                name = "ACE_epinephrine";
                count = 1;
            };
        };
    };
    class ACE_plasmaIVItem: Item_Base_F {
        scope = 2;
        scopeCurator = 2;
        displayName = $STR_ACE_Medical_Plasma_IV;
        author = "$STR_ACE_Common_ACETeam";
        vehicleClass = "Items";
        class TransportItems {
            class ACE_plasmaIV {
                name = "ACE_plasmaIV";
                count = 1;
            };
        };
    };

    class ACE_bloodIVItem: Item_Base_F {
        scope = 2;
        scopeCurator = 2;
        displayName = $STR_ACE_Medical_Blood_IV;
        author = "$STR_ACE_Common_ACETeam";
        vehicleClass = "Items";
        class TransportItems {
            class ACE_bloodIV {
                name = "ACE_bloodIV";
                count = 1;
            };
        };
    };
    class ACE_salineIVItem: Item_Base_F {
        scope = 2;
        scopeCurator = 2;
        displayName = $STR_ACE_Medical_Saline_IV;
        author = "$STR_ACE_Common_ACETeam";
        vehicleClass = "Items";
        class TransportItems {
            class ACE_salineIV {
                name = "ACE_salineIV";
                count = 1;
            };
        };
    };
    class ACE_quikClotItem: Item_Base_F {
        scope = 2;
        scopeCurator = 2;
        displayName = $STR_ACE_Medical_QuikClot_Display;
        author = "$STR_ACE_Common_ACETeam";
        vehicleClass = "Items";
        class TransportItems {
            class ACE_quikClot {
                name = "ACE_quikclot";
                count = 1;
            };
        };
    };
    class ACE_personalAidKitItem: Item_Base_F {
        scope = 2;
        scopeCurator = 2;
        displayName = $STR_ACE_Medical_Aid_Kit_Display;
        author = "$STR_ACE_Common_ACETeam";
        vehicleClass = "Items";
        class TransportItems {
            class ACE_personalAidKit {
                name = "ACE_personalAidKit";
                count = 1;
            };
        };
    };
    class ACE_surgicalKitItem: Item_Base_F {
        scope = 2;
        scopeCurator = 2;
        displayName = $STR_ACE_Medical_SurgicalKit_Display;
        author = "$STR_ACE_Common_ACETeam";
        vehicleClass = "Items";
        class TransportItems {
            class ACE_surgicalKit {
                name = "ACE_surgicalKit";
                count = 1;
            };
        };
    };
    class ACE_bodyBagItem: Item_Base_F {
        scope = 2;
        scopeCurator = 2;
        displayName = $STR_ACE_Medical_Bodybag_Display;
        author = "$STR_ACE_Common_ACETeam";
        vehicleClass = "Items";
        class TransportItems {
            class ACE_bodyBag {
                name = "ACE_bodyBag";
                count = 1;
            };
        };
    };

    class NATO_Box_Base;
    class ACE_medicalSupplyCrate: NATO_Box_Base {
        scope = 2;
        accuracy = 1000;
        displayName = "$STR_ACE_medicalSupplyCrate";
        model = PATHTOF(data\ace_medcrate.p3d);
        author = "$STR_ACE_Common_ACETeam";
        class TransportItems {
            class ACE_fieldDressing {
                name = "ACE_fieldDressing";
                count = 50;
            };
            class ACE_morphine {
                name = "ACE_morphine";
                count = 25;
            };
            class ACE_epinephrine {
                name = "ACE_epinephrine";
                count = 25;
            };
            class ACE_bloodIV {
                name = "ACE_bloodIV";
                count = 15;
            };
            class ACE_bloodIV_500 {
                name = "ACE_bloodIV_500";
                count = 15;
            };
            class ACE_bloodIV_250 {
                name = "ACE_bloodIV_250";
                count = 15;
            };
            class ACE_bodyBag {
                name = "ACE_bodyBag";
                count = 10;
            };
        };
    };
    class ACE_medicalSupplyCrate_advanced: ACE_medicalSupplyCrate {
        displayName = CSTRING(advanced);
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
};
