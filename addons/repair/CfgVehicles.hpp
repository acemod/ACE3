#define MACRO_REPAIRVEHICLE \
    class ACE_Actions { \
        class ACE_MainActions { \
            class GVAR(Repair) { \
                displayName = CSTRING(Repair); \
                icon = "\A3\ui_f\data\igui\cfg\actions\repair_ca.paa"; \
                distance = 4; \
                exceptions[] = {"isNotSwimming", "isNotOnLadder"}; \
            }; \
        }; \
    };

class CBA_Extended_EventHandlers_base;

class CfgVehicles {
    class ACE_Module;
    class ACE_moduleRepairSettings: ACE_Module {
        scope = 1;
        displayName = CSTRING(moduleName);
        icon = QPATHTOF(ui\Icon_Module_Repair_ca.paa);
        category = "ACE_Logistics";
        function = QFUNC(moduleRepairSettings);
        functionPriority = 1;
        isGlobal = 1;
        isSingular = 1;
        isTriggerActivated = 0;
        author = ECSTRING(Common,ACETeam);
        class Arguments {
            class engineerSetting_Repair {
                displayName = CSTRING(engineerSetting_Repair_name);
                description = CSTRING(engineerSetting_Repair_description);
                typeName = "NUMBER";
                class values {
                    class anyone { name = CSTRING(engineerSetting_anyone); value = 0; };
                    class Engineer { name = CSTRING(engineerSetting_EngineerOnly); value = 1; default = 1; };
                    class Advanced { name = CSTRING(engineerSetting_AdvancedOnly); value = 2; };
                };
            };
            class engineerSetting_Wheel {
                displayName = CSTRING(engineerSetting_Wheel_name);
                description = CSTRING(engineerSetting_Wheel_description);
                typeName = "NUMBER";
                class values {
                    class anyone { name = CSTRING(engineerSetting_anyone); value = 0; default = 1; };
                    class Engineer { name = CSTRING(engineerSetting_EngineerOnly); value = 1; };
                    class Advanced { name = CSTRING(engineerSetting_AdvancedOnly); value = 2; };
                };
            };
            class repairDamageThreshold {
                displayName = CSTRING(repairDamageThreshold_name);
                description = CSTRING(repairDamageThreshold_description);
                typeName = "NUMBER";
                defaultValue = 0.6;
            };
            class repairDamageThreshold_Engineer {
                displayName = CSTRING(repairDamageThreshold_Engineer_name);
                description = CSTRING(repairDamageThreshold_Engineer_description);
                typeName = "NUMBER";
                defaultValue = 0.4;
            };
            class consumeItem_ToolKit {
                displayName = CSTRING(consumeItem_ToolKit_name);
                description = CSTRING(consumeItem_ToolKit_description);
                typeName = "NUMBER";
                class values {
                    class keep { name = ECSTRING(common,No); value = 0; default = 1; };
                    class remove { name = ECSTRING(common,Yes); value = 1; };
                };
            };
            class fullRepairLocation {
                displayName = CSTRING(fullRepairLocation);
                description = CSTRING(fullRepairLocation_description);
                typeName = "NUMBER";
                class values {
                    class anywhere { name = CSTRING(useAnywhere); value = 0; };
                    class vehicle { name = CSTRING(repairVehicleOnly); value = 1; };
                    class facility { name = CSTRING(repairFacilityOnly); value = 2; default = 1; };
                    class vehicleAndFacility { name = CSTRING(vehicleAndFacility); value = 3; };
                    class disabled { name = ECSTRING(common,Disabled); value = 4;};
                };
            };
            class engineerSetting_fullRepair {
                displayName = CSTRING(engineerSetting_fullRepair_name);
                description = CSTRING(engineerSetting_fullRepair_description);
                typeName = "NUMBER";
                class values {
                    class anyone { name = CSTRING(engineerSetting_anyone); value = 0; };
                    class Engineer { name = CSTRING(engineerSetting_EngineerOnly); value = 1; };
                    class Advanced { name = CSTRING(engineerSetting_AdvancedOnly); value = 2; default = 1;};
                };
            };
            class addSpareParts {
                displayName = CSTRING(addSpareParts_name);
                description = CSTRING(addSpareParts_description);
                typeName = "BOOL";
                defaultValue = 1;
            };
            class wheelRepairRequiredItems {
                displayName = CSTRING(WheelRepairRequiredItems_DisplayName);
                description = CSTRING(wheelRepairRequiredItems_description);
                typeName = "NUMBER";
                class values {
                    class None { name = "None"; value = 0;  default = 1;};
                    class ToolKit { name = "ToolKit"; value = 1; };
                };
            };
        };
        class ModuleDescription {
            description = CSTRING(moduleDescription);
            sync[] = {};
        };
    };

    class Module_F;
    class ACE_moduleAssignEngineerRoles: Module_F {
        scope = 1;
        displayName = CSTRING(AssignEngineerRole_Module_DisplayName);
        icon = QPATHTOF(ui\Icon_Module_Repair_ca.paa);
        category = "ACE_Logistics";
        function = QFUNC(moduleAssignEngineer);
        functionPriority = 10;
        isGlobal = 2;
        isTriggerActivated = 0;
        isDisposable = 0;
        author = ECSTRING(common,ACETeam);
        class Arguments {
            class EnableList {
                displayName = CSTRING(EnableList_DisplayName);
                description = CSTRING(AssignEngineerRole_EnableList_Description);
                defaultValue = "";
                typeName = "STRING";
            };
            class role {
                displayName = CSTRING(AssignEngineerRole_role_DisplayName);
                description = CSTRING(AssignEngineerRole_role_Description);
                typeName = "NUMBER";
                class values {
                    class none {
                        name = CSTRING(AssignEngineerRole_role_none);
                        value = 0;
                    };
                    class medic {
                        name = CSTRING(AssignEngineerRole_role_engineer);
                        value = 1;
                        default = 1;
                    };
                    class doctor {
                        name = CSTRING(AssignEngineerRole_role_advanced);
                        value = 2;
                    };
                };
            };
        };
        class ModuleDescription {
            description = CSTRING(AssignEngineerRole_Module_Description);
            sync[] = {};
        };
    };
    class ACE_moduleAssignRepairVehicle: Module_F {
        scope = 1;
        displayName = CSTRING(AssignRepairVehicle_Module_DisplayName);
        icon = QPATHTOF(ui\Icon_Module_Repair_ca.paa);
        category = "ACE_Logistics";
        function = QFUNC(moduleAssignRepairVehicle);
        functionPriority = 10;
        isGlobal = 2;
        isTriggerActivated = 0;
        isDisposable = 0;
        author = ECSTRING(common,ACETeam);
        class Arguments {
            class EnableList {
                displayName = CSTRING(EnableList_DisplayName);
                description = CSTRING(AssignRepairVehicle_EnableList_Description);
                defaultValue = "";
                typeName = "STRING";
            };
            class role {
                displayName = CSTRING(AssignRepairVehicle_role_DisplayName);
                description = CSTRING(AssignRepairVehicle_role_Description);
                typeName = "NUMBER";
                class values {
                    class none {
                        name = ECSTRING(common,No);
                        value = 0;
                    };
                    class isVehicle {
                        name = ECSTRING(common,Yes);
                        value = 1;
                        default = 1;
                    };
                };
            };
        };
        class ModuleDescription {
            description = CSTRING(AssignRepairVehicle_Module_Description);
            sync[] = {};
        };
    };
    class ACE_moduleAssignRepairFacility: ACE_moduleAssignRepairVehicle {
        displayName = CSTRING(AssignRepairFacility_Module_DisplayName);
        function = QFUNC(moduleAssignRepairFacility);
        class Arguments {
            class EnableList {
                displayName = CSTRING(EnableList_DisplayName);
                description = CSTRING(AssignRepairFacility_EnableList_Description);
                defaultValue = "";
                typeName = "STRING";
            };
            class role {
                displayName = CSTRING(AssignRepairFacility_role_DisplayName);
                description = CSTRING(AssignRepairFacility_role_Description);
                typeName = "NUMBER";
                class values {
                    class none {
                        name = ECSTRING(common,No);
                        value = 0;
                    };
                    class isFacility {
                        name = ECSTRING(common,Yes);
                        value = 1;
                        default = 1;
                    };
                };
            };
        };
        class ModuleDescription {
            description = CSTRING(AssignRepairFacility_Module_Description);
            sync[] = {};
        };
    };
    class ACE_moduleAddSpareParts: Module_F {
        scope = 1;
        displayName = CSTRING(AddSpareParts_Module_DisplayName);
        icon = QPATHTOF(ui\Icon_Module_Repair_ca.paa);
        category = "ACE_Logistics";
        function = QFUNC(moduleAddSpareParts);
        functionPriority = 10;
        isGlobal = 0;
        isTriggerActivated = 0;
        isDisposable = 0;
        author = ECSTRING(common,ACETeam);
        class Arguments {
            class List {
                displayName = CSTRING(EnableList_DisplayName);
                description = CSTRING(AddSpareParts_List_Description);
                defaultValue = "";
                typeName = "STRING";
            };
            class Part {
                displayName = CSTRING(AddSpareParts_Part_DisplayName);
                description = CSTRING(AddSpareParts_Part_Description);
                typeName = "STRING";
                class values {
                    class Wheel {
                        name = CSTRING(SpareWheel);
                        value = "ACE_Wheel";
                        default = 1;
                    };
                    class Track {
                        name = CSTRING(SpareTrack);
                        value = "ACE_Track";
                    };
                };
            };
            class Amount {
                displayName = CSTRING(AddSpareParts_Amount_DisplayName);
                description = CSTRING(AddSpareParts_Amount_Description);
                typeName = "NUMBER";
                defaultValue = 1;
            };
        };
        class ModuleDescription {
            description = CSTRING(AddSpareParts_Module_Description);
            sync[] = {};
        };
    };


    class LandVehicle;
    class Car: LandVehicle {
        MACRO_REPAIRVEHICLE
    };

    class Tank: LandVehicle {
        MACRO_REPAIRVEHICLE
    };

    class Motorcycle: LandVehicle {
        MACRO_REPAIRVEHICLE
    };

    class Air;
    class Helicopter: Air {
        MACRO_REPAIRVEHICLE
    };

    class Plane: Air {
        MACRO_REPAIRVEHICLE
    };

    class Ship;
    class Ship_F: Ship {
        MACRO_REPAIRVEHICLE
    };

    class ThingX;
    class ACE_RepairItem_Base: ThingX {
        class EventHandlers {
            class CBA_Extended_EventHandlers: CBA_Extended_EventHandlers_base {};
        };
        class ACE_Actions {
            class ACE_MainActions {
                modifierFunction = QUOTE(_this call FUNC(modifyInteraction));
            };
        };

        accuracy = 0.2;
        vehicleClass = "ACE_Logistics_Items";
        editorCategory = "EdCat_Supplies";
        editorSubcategory = QEGVAR(main,subcategory);
    };

    class ACE_Track: ACE_RepairItem_Base {
        EGVAR(cargo,size) = 2;
        EGVAR(cargo,canLoad) = 1;
        EGVAR(cargo,noRename) = 1;
        author = "Hawkins";
        scope = 2;
        model = QPATHTOF(data\ace_track.p3d);
        displayName = CSTRING(SpareTrack);
        icon = "iconObject_2x1";
        mapSize = 0.5;

        // damage handling
        armor = 1000;
        armorStructural = 1;
        minTotalDamageThreshold = 0.01;
        explosionShielding = 1;
        replaceDamagedLimit = 0.9;
        selectionDamage = "mat_track";

        class Damage {
            tex[] = {};
            mat[] = {
                QPATHTO_R(data\trailObjects_steel.rvmat),
                QPATHTO_R(data\trailObjects_steel_damage.rvmat),
                QPATHTO_R(data\trailObjects_steel_destruct.rvmat)
            };
        };

        editorPreview = QPATHTOF(data\preview_track.jpg);
    };

    class ACE_Wheel: ACE_RepairItem_Base {
        EGVAR(cargo,size) = 1;
        EGVAR(cargo,canLoad) = 1;
        EGVAR(cargo,noRename) = 1;
        author = "Hawkins";
        scope = 2;
        model = QPATHTOF(data\ace_wheel.p3d);
        displayName = CSTRING(SpareWheel);
        picture = QPATHTOF(ui\tire_ca.paa);
        icon = "iconObject_circle";
        mapSize = 0.7;

        // damage handling
        armor = 120;
        armorStructural = 1;
        minTotalDamageThreshold = 0.01;
        explosionShielding = 1;
        replaceDamagedLimit = 0.9;
        selectionDamage = "mat_tyre"; //"mat_rim"

        // necessary because only one "selectionDamage" (== "visual") is allowed for simple damage objects
        // can not take damage individually though, because of limitations of the thingX simulation type
        class HitPoints {
            class HitBody {
                armor = 1;
                material = -1;
                name = "mat_rim";
                visual = "mat_rim";
                passThrough = 1;
                radius = 0.1;
                explosionShielding = 1;
                minimalHit = 1;
            };
        };

        class Damage {
            tex[] = {};
            mat[] = {
                QPATHTO_R(data\trailObjects_tyre.rvmat),
                QPATHTO_R(data\trailObjects_tyre_damage.rvmat),
                QPATHTO_R(data\trailObjects_tyre_damage.rvmat),
                QPATHTO_R(data\trailObjects_steel.rvmat),
                QPATHTO_R(data\trailObjects_steel_damage.rvmat),
                QPATHTO_R(data\trailObjects_steel_destruct.rvmat)
            };
        };

        editorPreview = QPATHTOF(data\preview_wheel.jpg);

        class ACE_Actions: ACE_Actions {
            class ACE_MainActions: ACE_MainActions {
                class GVAR(Patch) {
                    displayName = CSTRING(PatchWheel);
                    distance = 4;
                    condition = QUOTE([ARR_2(_player,_target)] call FUNC(canPatchRemovedWheel));
                    statement = QUOTE([ARR_2(_player,_target)] call FUNC(patchRemovedWheel));
                    exceptions[] = {"isNotDragging", "isNotCarrying", "isNotOnLadder", "isNotSwimming", "isNotSitting"};
                    icon = QPATHTOF(ui\patch_ca.paa);
                };
            };
        };
    };

    class Heli_Transport_02_base_F;
    class I_Heli_Transport_02_F: Heli_Transport_02_base_F {
        GVAR(hitpointPositions)[] = {{"HitVRotor", {-1,-9.4,1.8}}, {"HitHRotor", {0,1.8,1.3}}};
    };

    class Helicopter_Base_F;
    class Heli_light_03_base_F: Helicopter_Base_F {
        GVAR(hitpointPositions)[] = {{"HitVRotor", {-0.5,-5.55,1.2}}, {"HitHRotor", {0,1.8,1.5}}};
    };

    class B_APC_Tracked_01_base_F;
    class B_APC_Tracked_01_AA_F: B_APC_Tracked_01_base_F {
        GVAR(hitpointPositions)[] = {{"HitTurret", {0,-2,0}}};
    };

    class Tank_F;
    class APC_Tracked_02_base_F: Tank_F {
        class EGVAR(interaction,anims) {
            class showTracks {
                phase = 0;
                selections[] = {"vhc_tracks"};
                positions[] = {"private _pos = _target selectionPosition 'vhc_tracks'; _pos set [0, -(_pos select 0)]; _pos"}; // Mirror position to other side of vehicle
                items[] = {"ACE_Track", "ACE_Track", "ACE_Track"};
                name = CSTRING(RemoveTrack);
                text = CSTRING(RemovingTrack);
            };
        };
    };

    class Car_F: Car {
        class HitPoints;
    };
    class Offroad_02_base_F: Car_F {
        class EGVAR(interaction,anims) {
            class hideSpareWheel {
                positions[] = {"_target selectionPosition ['spare_wheel', 'ViewGeometry', 'AveragePoint']"};
                items[] = {"ACE_Wheel"};
                name = CSTRING(RemoveWheel);
                text = CSTRING(RemovingWheel);
            };
        };
    };

    class Truck_F: Car_F {
        class HitPoints: HitPoints {
            class HitLBWheel;
            class HitRBWheel;
        };
    };
    class Truck_03_base_F: Truck_F {
        class HitPoints: HitPoints {
            class HitLBWheel: HitLBWheel {
                name = "wheel_1_4_steering"; // return original values back to fix double wheel hitpoint
            };
            class HitRBWheel: HitRBWheel {
                name = "wheel_2_4_steering";
            };
        };
    };

    class Truck_01_viv_base_F;
    class Truck_01_cargo_base_F: Truck_01_viv_base_F {
        class EGVAR(interaction,anims) {
            class Tyre1_hide {
                positions[] = {"_target selectionPosition ['tyre1_hide', 'ViewGeometry', 'AveragePoint']"};
                items[] = {"ACE_Wheel"};
                name = CSTRING(RemoveWheel);
                text = CSTRING(RemovingWheel);
                distance = 2.5;
            };
        };
    };
    class Truck_01_flatbed_base_F: Truck_01_viv_base_F {
        class EGVAR(interaction,anims) {
            class Tyre1_hide {
                positions[] = {"_target selectionPosition ['tyre1_hide', 'ViewGeometry', 'AveragePoint']"};
                items[] = {"ACE_Wheel"};
                name = CSTRING(RemoveWheel);
                text = CSTRING(RemovingWheel);
                distance = 2.5;
            };
        };
    };

    class Quadbike_01_base_F: Car_F {
        GVAR(hitpointPositions)[] = { {"HitEngine", {0, 0.5, -0.7}}, {"HitFuel", {0, 0, -0.5}} };
    };
    class Hatchback_01_base_F: Car_F {
        GVAR(hitpointPositions)[] = {{"HitBody", {0, 0.7, -0.5}}, {"HitFuel", {0, -1.75, -0.75}}};
    };

    class Van_02_base_F: Truck_F {
        class EGVAR(interaction,anims) {
            class spare_tyre_hide {
                positions[] = {"_target selectionPosition ['spare_tyre', 'ViewGeometry', 'AveragePoint']"};
                items[] = {"ACE_Wheel"};
                name = CSTRING(RemoveWheel);
                text = CSTRING(RemovingWheel);
            };
        };
    };
};
