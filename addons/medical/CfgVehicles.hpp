
#define MEDICAL_ACTION_DISTANCE 1.75

class CfgVehicles {

    class Logic;
    class Module_F: Logic {
        class ArgumentsBaseUnits {
        };
        class ModuleDescription {
            class AnyPerson;
            class AnyStaticObject;
            class AnyVehicle;
        };
    };
    class ACE_Module;
    // TODO localization for all the modules
    class ACE_moduleMedicalSettings: ACE_Module {
        scope = 2;
        displayName = "Medical Settings [ACE]";
        icon = QUOTE(PATHTOF(UI\Icon_Module_Medical_ca.paa));
        category = "ACE_medical";
        function = QUOTE(DFUNC(moduleMedicalSettings));
        functionPriority = 1;
        isGlobal = 1;
        isTriggerActivated = 0;
        author = "$STR_ACE_Common_ACETeam";
        class Arguments {
            class level {
                displayName = "Medical Level";
                description = "What is the medical simulation level?";
                typeName = "NUMBER";
                class values {
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
            class allowLitterCreation {
                displayName = "Enable Litter";
                description = "Enable litter being created upon treatment";
                typeName = "BOOL";
                defaultValue = 1;
            };
            class litterCleanUpDelay {
                displayName = "Life time of litter objects";
                description = "How long should litter objects stay? In seconds. -1 is forever.";
                typeName = "NUMBER";
                defaultValue = 1800;
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
            class enableUnconsciousnessAI {
                displayName = "AI Unconsciousness";
                description = "Allow AI to go unconscious";
                typeName = "NUMBER";
                class values {
                    class disable {
                        name = "Disabled";
                        value = 0;
                    };
                    class normal {
                        name = "50/50";
                        value = 1;
                        default = 1;
                    };
                    class full {
                        name = "Enabled";
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
            class bleedingCoefficient {
                displayName = "Bleeding coefficient";
                description = "Coefficient to modify the bleeding speed";
                typeName = "NUMBER";
                defaultValue = 1;
            };
            class painCoefficient {
                displayName = "Pain coefficient";
                description = "Coefficient to modify the pain intensity";
                typeName = "NUMBER";
                defaultValue = 1;
            };
            class keepLocalSettingsSynced {
                displayName = "Sync status";
                description = "Keep unit status synced. Recommended on.";
                typeName = "BOOL";
                defaultValue = 1;
            };
        };
        class ModuleDescription {
            description = "Provides a medical system for both players and AI.";
            sync[] = {};
        };
    };

    class ACE_moduleAdvancedMedicalSettings: ACE_Module {
        scope = 2;
        displayName = "Advanced Medical Settings [ACE]";
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
                displayName = "Enabled for";
                description = "Select what units the advanced medical system will be enabled for";
                typeName = "NUMBER";
                class values {
                    class playableUnits {
                        name = "Players only.";
                        value = 0;
                        default = 1;
                    };
                    class playableUnitsAndAI {
                        name = "Players and AI";
                        value = 1;
                    };
                };
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
            class medicSetting_PAK {
                displayName = "Allow PAK";
                description = "Who can use the PAK for full heal?";
                typeName = "NUMBER";
                class values {
                    class anyone { name = "Anyone"; value = 0; };
                    class Medic { name = "Medics only"; value = 1; default = 1; };
                    class Special { name = "Doctors only"; value = 2; };
                };
            };
            class consumeItem_PAK {
                displayName = "Remove PAK on use";
                description = "Should PAK be removed on usage?";
                typeName = "NUMBER";
                class values {
                    class keep { name = "No"; value = 0; };
                    class remove { name = "Yes"; value = 1; default = 1; };
                };
            };
            class useLocation_PAK {
                displayName = "Locations PAK";
                description = "Where can the personal aid kit be used?";
                typeName = "NUMBER";
                class values {
                    class anywhere { name = "Anywhere"; value = 0; };
                    class vehicle { name = "Medical Vehicles"; value = 1; };
                    class facility { name = "Medical facility"; value = 2; };
                    class vehicleAndFacility { name = "Vehicles & facility"; value = 3; default = 1; };
                    class disabled { name = "Disabled"; value = 4;};
                };
            };
            class medicSetting_SurgicalKit: medicSetting_PAK {
                displayName = "Allow Surgical kit (Adv)";
                description = "Who can use the surgical kit?";
            };
            class consumeItem_SurgicalKit: consumeItem_PAK {
                displayName = "Remove Surgical kit (Adv)";
                description = "Should Surgical kit be removed on usage?";
            };
            class useLocation_SurgicalKit: useLocation_PAK {
                displayName = "Locations Surgical kit (Adv)";
                description = "Where can the Surgical kit be used?";
            };

        };
        class ModuleDescription {
            description = "Configure the treatment settings from ACE Medical";
            sync[] = {};
        };
    };


    class ACE_moduleReviveSettings: ACE_Module {
        scope = 2;
        displayName = "Revive Settings [ACE]";
        icon = QUOTE(PATHTOF(UI\Icon_Module_Medical_ca.paa));
        category = "ACE_medical";
        function = QUOTE(DFUNC(moduleReviveSettings));
        functionPriority = 1;
        isGlobal = 1;
        isTriggerActivated = 0;
        author = "$STR_ACE_Common_ACETeam";
        class Arguments {
            class enableRevive {
                displayName = "Enable Revive";
                description = "Enable a basic revive system";
                typeName = "NUMBER";
                defaultValue = 0;
                class values {
                    class disable { name = "Disabled"; value = 0; default = 1;};
                    class playerOnly { name = "Player only"; value = 1; };
                    class playerAndAI { name = "Player & AI"; value = 2; };
                };
            };
            class maxReviveTime {
                displayName = "Max Revive time";
                description = "Max amount of seconds a unit can spend in revive state";
                typeName = "NUMBER";
                defaultValue = 120;
            };
            class amountOfReviveLives {
                displayName = "Max Revive lives";
                description = "Max amount of lives a unit. 0 or -1 is disabled.";
                typeName = "NUMBER";
                defaultValue = -1;
            };
        };
        class ModuleDescription {
            description = "Provides a medical system for both players and AI.";
            sync[] = {};
        };
    };
    class ACE_moduleAssignMedicRoles: Module_F {
        scope = 2;
        displayName = "Set Medic Class [ACE]";
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
                        value = 2;
                    };
                };
            };
        };
        class ModuleDescription: ModuleDescription {
            description = "Assigns the ACE medic class to all synchronized/listed units";
            sync[] = {"AnyPerson"};

            class AnyPerson: AnyPerson {
                description = "Unit to be assigned as a medic";
                optional = 1;
            };
        };
    };

    class ACE_moduleAssignMedicVehicle: Module_F {
        scope = 2;
        displayName = "Set Medical Vehicle [ACE]";
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
                displayName = "List";
                description = "List of vehicles to be classified as medical vehicles, separated by commas.";
                defaultValue = "";
                typeName = "STRING";
            };
            class enabled {
                displayName = "Is Medical Vehicle";
                description = "Whether or not the objects in the list will be medical vehicles.";
                typeName = "NUMBER";
                class values {
                    class none {
                        name = "No";
                        value = 0;
                    };
                    class medic {
                        name = "Yes";
                        value = 1;
                        default = 1;
                    };
                };
            };
        };
        class ModuleDescription: ModuleDescription {
            description = "Assigns the ACE medic class to all synchronized/listed vehicles";
            sync[] = {"AnyVehicle"};

            class AnyVehicle: AnyVehicle {
                description = "Vehicle to be assigned as a medical vehicle";
                optional = 1;
            };
        };
    };
    class ACE_moduleAssignMedicalFacility: Module_F {
        scope = 2;
        displayName = "Set Medical Facility [ACE]";
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
                displayName = "Is Medical Facility";
                description = "Registers an object as a medical facility for CMS";
                typeName = "BOOL";
            };
        };
        class ModuleDescription: ModuleDescription {
            description = "Defines an object as a medical facility for CMS. This allows for more advanced treatments. Can be used on buildings and vehicles. ";
            sync[] = {"AnyStaticObject","AnyVehicle"};
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
                    displayName = "$STR_ACE_Medical_Actions_Medical";
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
                    displayName = "$STR_ACE_Medical_LoadPatient";
                    distance = 5;
                    condition = QUOTE(_target getvariable[ARR_2(QUOTE(QUOTE(ACE_isUnconscious)),false)] && vehicle _target == _target);
                    statement = QUOTE([ARR_2(_player, _target)] call DFUNC(actionLoadUnit));
                    showDisabled = 0;
                    priority = 2;
                    icon = PATHTOF(UI\icons\medical_cross.paa);
                    exceptions[] = {"isNotDragging", "isNotCarrying"};
                };
                class GVAR(UnLoadPatient) {
                    displayName = "$STR_ACE_Medical_UnloadPatient";
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
                displayName = "$STR_ACE_Interaction_MainAction";
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
        displayName = "[ACE] Medical Supply Crate (Basic)";
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
        displayName = "[ACE] Medical Supply Crate (Advanced)";
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
