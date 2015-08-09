
#define MACRO_REPAIRVEHICLE \
    class ACE_Actions { \
        class ACE_MainActions { \
            class GVAR(Repair) { \
                displayName = CSTRING(Repair); \
                condition = "true"; \
                statement = ""; \
                runOnHover = 1; \
                showDisabled = 0; \
                priority = 2; \
                icon = "\A3\ui_f\data\igui\cfg\actions\repair_ca.paa"; \
                distance = 4; \
            }; \
        }; \
    };

class CfgVehicles {
    class ACE_Module;
    // @todo localization for all the modules
    class ACE_moduleRepairSettings: ACE_Module {
        scope = 2;
        displayName = CSTRING(moduleName);
        icon = QUOTE(PATHTOF(ui\Icon_Module_Repair_ca.paa));   //@todo
        category = "ACE";
        function = QUOTE(DFUNC(moduleRepairSettings));
        functionPriority = 1;
        isGlobal = 1;
        isTriggerActivated = 0;
        author = ECSTRING(Common,ACETeam);
        class Arguments {
            class engineerSetting_Repair {
                displayName = CSTRING(enginerSetting_Repair_name);
                description = CSTRING(enginerSetting_Repair_description);
                typeName = "NUMBER";
                class values {
                    class anyone { name = CSTRING(engineerSetting_anyone); value = 0; };
                    class Engineer { name = CSTRING(engineerSetting_EngineerOnly); value = 1; default = 1; };
                    class Special { name = CSTRING(engineerSetting_RepairSpecialistOnly); value = 2; };
                };
            };
            class engineerSetting_Wheel {
                displayName = CSTRING(enginerSetting_Wheel_name);
                description = CSTRING(enginerSetting_Wheel_description);
                typeName = "NUMBER";
                class values {
                    class anyone { name = CSTRING(engineerSetting_anyone); value = 0; default = 1; };
                    class Engineer { name = CSTRING(engineerSetting_EngineerOnly); value = 1; };
                    class Special { name = CSTRING(engineerSetting_RepairSpecialistOnly); value = 2; };
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
        };
        class ModuleDescription {
            description = CSTRING(moduleDescription);
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

    class thingX;
    class ACE_RepairItem_Base: thingX {
        XEH_ENABLED;
        icon = "iconObject_circle";
        mapSize = 0.7;
        accuracy = 0.2;
        vehicleClass = QGVAR(items);
        destrType = "DesturctNo";
    };

    class ACE_Track: ACE_RepairItem_Base {
        author = "Hawkins";
        //scope = 2;
        model = QUOTE(PATHTOF(ace_track.p3d));
        displayName = "$STR_ACE_Repair_SpareTrack";
    };

    class ACE_Wheel: ACE_RepairItem_Base {
        author = "Hawkins";
        scope = 2;
        model = QUOTE(PATHTOF(ace_wheel.p3d));
        displayName = "$STR_ACE_Repair_SpareWheel";
        picture = QUOTE(PATHTOF(ui\tire_ca.paa));
    };

    // disable vanilla repair
    // "getNumber (_x >> ""transportRepair"") > 0" configClasses (configFile >> "CfgVehicles")

    class Slingload_01_Base_F;
    class B_Slingload_01_Repair_F: Slingload_01_Base_F {
        GVAR(canRepair) = 1;
        transportRepair = 0;
    };

    class Heli_Transport_04_base_F;
    class O_Heli_Transport_04_repair_F: Heli_Transport_04_base_F {
        GVAR(canRepair) = 1;
        transportRepair = 0;
    };

    class Pod_Heli_Transport_04_base_F;
    class Land_Pod_Heli_Transport_04_repair_F: Pod_Heli_Transport_04_base_F {
        GVAR(canRepair) = 1;
        transportRepair = 0;
    };

    class B_APC_Tracked_01_base_F;
    class B_APC_Tracked_01_CRV_F: B_APC_Tracked_01_base_F {
        GVAR(canRepair) = 1;
        transportRepair = 0;
    };

    class Offroad_01_base_F;
    class Offroad_01_repair_base_F: Offroad_01_base_F {
        GVAR(canRepair) = 1;
        transportRepair = 0;
    };

    class B_Truck_01_mover_F;
    class B_Truck_01_Repair_F: B_Truck_01_mover_F {
        GVAR(canRepair) = 1;
        transportRepair = 0;
    };

    class B_Truck_01_fuel_F: B_Truck_01_mover_F {  // the fuel hemet apparently can repair. GJ BI
        transportRepair = 0;
    };

    class Truck_02_base_F;
    class Truck_02_box_base_F: Truck_02_base_F {
        GVAR(canRepair) = 1;
        transportRepair = 0;
    };

    class Truck_02_engineeral_base_F: Truck_02_box_base_F {
        GVAR(canRepair) = 0;
    };

    class Truck_03_base_F;
    class O_Truck_03_repair_F: Truck_03_base_F {
        GVAR(canRepair) = 1;
        transportRepair = 0;
    };
};
