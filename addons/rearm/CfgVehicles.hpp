#define REARM_ACTION_DISTANCE 4.5
#define MACRO_REARM_ACTIONS \
        class ACE_Actions { \
            class ACE_MainActions { \
                displayName = ECSTRING(interaction,MainAction); \
                selection = ""; \
                distance = 10; \
                condition = "true"; \
                class GVAR(rearm) { \
                    displayName = CSTRING(rearm); \
                    distance = REARM_ACTION_DISTANCE; \
                    condition = QUOTE([ARR_2(_player,_target)] call FUNC(canRearm)); \
                    statement = QUOTE([ARR_2(_player,_target)] call FUNC(rearm)); \
                    exceptions[] = {"isNotInside"}; \
                    icon = PATHTOF(ui\icon_rearm_interact.paa); \
                }; \
            }; \
        }; 

#define MACRO_REARM_PICKUPAMMO \
        class ACE_Actions : ACE_Actions { \
            class ACE_MainActions : ACE_MainActions { \
                class GVAR(pickUpAmmo) { \
                    displayName = CSTRING(pickUpAmmo); \
                    distance = REARM_ACTION_DISTANCE; \
                    condition = QUOTE([ARR_2(_player,_target)] call FUNC(canPickUpAmmo)); \
                    insertChildren = QUOTE([ARR_1(_target)] call DFUNC(addRearmActions)); \
                    exceptions[] = {"isNotInside"}; \
                    icon = PATHTOF(ui\icon_rearm_interact.paa); \
                }; \
            }; \
        };
        
class CfgVehicles {
    class ACE_Module;
    class ACE_moduleRearmSettings : ACE_Module {
        scope = 2;
        displayName = CSTRING(RearmSettings_Module_DisplayName);
        icon = QUOTE(PATHTOF(ui\icon_module_rearm.paa));
        category = "ACE";
        function = QUOTE(DFUNC(moduleRearmSettings));
        functionPriority = 1;
        isGlobal = 0;
        isTriggerActivated = 0;
        author = ECSTRING(common,ACETeam);
        class Arguments {
            class level {
                displayName = CSTRING(RearmSettings_level_DisplayName);
                description = CSTRING(RearmSettings_level_Description);
                typeName = "NUMBER";
                class values {
                    class vehicle {
                        name = CSTRING(RearmSettings_vehicle);
                        value = 0;
                    };
                    class magazine {
                        name = CSTRING(RearmSettings_magazine);
                        value = 1;
                    };
                    class caliber  {
                        name = CSTRING(RearmSettings_caliber);
                        value = 2;
                        default = 1;
                    };
                };
            };
        };
    };

    class LandVehicle;
    class Car : LandVehicle {
        MACRO_REARM_ACTIONS
    };

    class Tank : LandVehicle {
        MACRO_REARM_ACTIONS
    };
    
    class StaticWeapon : LandVehicle {
        MACRO_REARM_ACTIONS
    };

    class Air;
    class Helicopter : Air {
        MACRO_REARM_ACTIONS
    };

    class Plane : Air {
        MACRO_REARM_ACTIONS
    };

    class Ship;
    class Ship_F : Ship {
        MACRO_REARM_ACTIONS
    };

    class Car_F : Car {};
    class Truck_F : Car_F {};
    class Truck_01_base_F: Truck_F {};
    class Truck_02_base_F : Truck_F {};
    class Truck_03_base_F : Truck_F {};
    
    class B_Truck_01_transport_F : Truck_01_base_F {};
    class B_Truck_01_mover_F: B_Truck_01_transport_F {};
    
    class I_Truck_02_ammo_F : Truck_02_base_F {
        transportAmmo = 0;
        MACRO_REARM_PICKUPAMMO
    };

    class B_Truck_01_ammo_F : B_Truck_01_mover_F {
        transportAmmo = 0;
        MACRO_REARM_PICKUPAMMO
    };
    
    class O_Truck_02_Ammo_F : Truck_02_base_F {
        transportAmmo = 0;
        MACRO_REARM_PICKUPAMMO
    };

    class O_Truck_03_ammo_F : Truck_03_base_F {
        transportAmmo = 0;
        MACRO_REARM_PICKUPAMMO
    };
};
