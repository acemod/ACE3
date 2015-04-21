
#define MACRO_REPAIRVEHICLE \
    class ACE_Actions { \
        class ACE_MainActions { \
            class GVAR(Repair) { \
                displayName = "$STR_ACE_Repair_Repair"; \
                condition = ""; \
                statement = "'show a hint with the hitpart damage'"; \
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
        displayName = "Repair Settings";
        icon = QUOTE(PATHTOF(UI\Icon_Module_Medical_ca.paa));   //@todo
        category = "ACE";
        function = QUOTE(DFUNC(moduleRepairSettings));
        functionPriority = 1;
        isGlobal = 1;
        isTriggerActivated = 0;
        author = "$STR_ACE_Common_ACETeam";
        class Arguments {
            class engineerSetting_Repair {
                displayName = "Allow Repair";
                description = "Who can use the toolkit to fully repair?";
                typeName = "NUMBER";
                class values {
                    class anyone { name = "Anyone"; value = 0; };
                    class Medic { name = "Engineers only"; value = 1; default = 1; };
                    class Special { name = "Repair Specialists only"; value = 2; };
                };
            };
            class engineerSetting_Wheel {
                displayName = "Allow Wheel";
                description = "Who can remove and replace wheels?";
                typeName = "NUMBER";
                class values {
                    class anyone { name = "Anyone"; value = 0; default = 1; };
                    class Medic { name = "Engineers only"; value = 1; };
                    class Special { name = "Repair Specialists only"; value = 2; };
                };
            };
            class repairDamageThreshold {
                displayName = "Repair Threshold";
                description = "What is the maximum damage that can be repaired with a toolkit?";
                typeName = "NUMBER";
                defaultValue = 1;
            };
            class repairDamageThreshold_Engineer {
                displayName = "Repair Threshold (Engineer)";
                description = "What is the maximum damage that can be repaired by an engineer?";
                typeName = "NUMBER";
                defaultValue = 1;
            };
            class consumeItem_ToolKit {
                displayName = "Remove toolkit on use";
                description = "Should the toolkit be removed on usage?";
                typeName = "NUMBER";
                class values {
                    class keep { name = "No"; value = 0; default = 1; };
                    class remove { name = "Yes"; value = 1; };
                };
            };
        };
        class ModuleDescription {
            description = "Provides a repair system for all types of vehicles.";
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
        scope = 2;
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
};
