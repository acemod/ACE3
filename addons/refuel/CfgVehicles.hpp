#define REFUEL_ACTION_DISTANCE 4.5
#define MACRO_REFUEL_ACTIONS \
        class ACE_Actions : ACE_Actions { \
            class ACE_MainActions : ACE_MainActions { \
                class GVAR(TakeNozzle) { \
                    displayName = CSTRING(TakeNozzle); \
                    distance = REFUEL_ACTION_DISTANCE; \
                    condition = QUOTE([ARR_2(_player,_target)] call FUNC(canTakeNozzle)); \
                    statement = QUOTE([ARR_3(_player,_target,objNull)] call FUNC(TakeNozzle)); \
                    exceptions[] = {"isNotInside"}; \
                    icon = PATHTOF(ui\icon_refuel_interact.paa); \
                }; \
                class GVAR(CheckFuel) { \
                    displayName = CSTRING(CheckFuel); \
                    distance = REFUEL_ACTION_DISTANCE; \
                    condition = QUOTE(([ARR_2(_player,_target)] call FUNC(getFuel) >= 0) && {(_target distance _player) < REFUEL_ACTION_DISTANCE}); \
                    statement = QUOTE([ARR_2(_player,_target)] call FUNC(checkFuel)); \
                    exceptions[] = {"isNotInside"}; \
                    icon = PATHTOF(ui\icon_refuel_interact.paa); \
                }; \
            }; \
        }; 
#define MACRO_CONNECT_ACTIONS \
        class ACE_Actions { \
            class ACE_MainActions { \
                class GVAR(connect) { \
                    displayName = CSTRING(connect); \
                    distance = REFUEL_ACTION_DISTANCE; \
                    condition = QUOTE([ARR_2(_player,_target)] call FUNC(canConnectNozzle)); \
                    statement = QUOTE([ARR_2(_player,_target)] call DFUNC(connectNozzle)); \
                    exceptions[] = {"isNotInside"}; \
                    icon = PATHTOF(ui\icon_refuel_interact.paa); \
                }; \
                class GVAR(Disconnect) { \
                    displayName = CSTRING(Disconnect); \
                    distance = REFUEL_ACTION_DISTANCE; \
                    condition = QUOTE([ARR_2(_player,_target)] call FUNC(canDisconnect)); \
                    statement = QUOTE([ARR_2(_player,_target)] call DFUNC(disconnect)); \
                    exceptions[] = {"isNotInside"}; \
                    icon = PATHTOF(ui\icon_refuel_interact.paa); \
                }; \
                class GVAR(TurnOff) { \
                    displayName = CSTRING(TurnOff); \
                    distance = REFUEL_ACTION_DISTANCE; \
                    condition = QUOTE([ARR_2(_player,_target)] call FUNC(canTurnOff)); \
                    statement = QUOTE([ARR_2(_player,_target)] call DFUNC(turnOff)); \
                    exceptions[] = {"isNotInside"}; \
                    icon = PATHTOF(ui\icon_refuel_interact.paa); \
                }; \
            }; \
        }; 

// does not work
#define MACRO_NOZZLE_ACTIONS \
        class ACE_Actions { \
            class ACE_MainActions { \
                displayName = ECSTRING(interaction,MainAction); \
                selection = ""; \
                distance = 2; \
                condition = "true"; \
                class GVAR(TakeNozzle) { \
                    displayName = CSTRING(TakeNozzle); \
                    distance = REFUEL_ACTION_DISTANCE; \
                    condition = QUOTE([ARR_2(_player,_target)] call FUNC(canTakeNozzle)); \
                    statement = QUOTE([ARR_3(_player,_target,_target)] call FUNC(TakeNozzle)); \
                    exceptions[] = {"isNotInside"}; \
                    icon = PATHTOF(ui\icon_refuel_interact.paa); \
                }; \
            }; \
        };
        
class CfgVehicles {
    class ACE_Module;
    class ACE_moduleRefuelSettings : ACE_Module {
        scope = 2;
        displayName = CSTRING(RefuelSettings_Module_DisplayName);
        icon = QUOTE(PATHTOF(ui\icon_module_refuel.paa));
        category = "ACE";
        function = QUOTE(DFUNC(moduleRefuelSettings));
        functionPriority = 1;
        isGlobal = 1;
        isTriggerActivated = 0;
        author = ECSTRING(common,ACETeam);
        class Arguments {
            class rate {
                displayName = CSTRING(RefuelSettings_speed_DisplayName);
                description = CSTRING(RefuelSettings_speed_Description);
                typeName = "NUMBER";
                class values {
                    class fast {
                        name = CSTRING(RefuelSettings_basic);
                        value = 10;
                    };
                    class realistic  {
                        name = CSTRING(RefuelSettings_advanced);
                        value = 1;
                        default = 1;
                    };
                };
            };
            class civ_fuel {
                displayName = CSTRING(RefuelSettings_civ_fuel_DisplayName);
                description = CSTRING(RefuelSettings_civ_fuel_Description);
                typeName = "NUMBER";
                defaultValue = 5000;
            };
            class mil_fuel {
                displayName = CSTRING(RefuelSettings_mil_fuel_DisplayName);
                description = CSTRING(RefuelSettings_mil_fuel_Description);
                typeName = "NUMBER";
                defaultValue = 20000;
            };
            class stationary_fuel {
                displayName = CSTRING(RefuelSettings_stationary_fuel_DisplayName);
                description = CSTRING(RefuelSettings_stationary_fuel_Description);
                typeName = "NUMBER";
                defaultValue = -1;
            };
        };
    };
    
    class Sign_Sphere10cm_F;
    class ACE_refuel_fuelNozzle : Sign_Sphere10cm_F { 
        // TODO replace with custom model
    };

    // Add connect to all vehicles
    class LandVehicle;
    class Car : LandVehicle {
        MACRO_CONNECT_ACTIONS
    };

    class Tank : LandVehicle {
        MACRO_CONNECT_ACTIONS
    };
    
    class StaticWeapon : LandVehicle {
        MACRO_CONNECT_ACTIONS
    };

    class Air;
    class Helicopter : Air {
        MACRO_CONNECT_ACTIONS
    };

    class Plane : Air {
        MACRO_CONNECT_ACTIONS
    };

    class Ship;
    class Ship_F : Ship {
        MACRO_CONNECT_ACTIONS
    };
    
    class Car_F : Car {};
    class Offroad_01_base_f : Car_F {};
    class Truck_F : Car_F {};
	class Truck_01_base_F: Truck_F {};
	class Truck_02_base_F : Truck_F {};
	class Truck_03_base_F : Truck_F {};
	class Van_01_base_F : Truck_F {};
    class Van_01_fuel_base_F : Van_01_base_F {};
	
	class Tank_F : Tank {};
	class APC_Tracked_01_base_F: Tank_F {};
	class B_APC_Tracked_01_base_F: APC_Tracked_01_base_F {};
	class B_Truck_01_transport_F : Truck_01_base_F {};
	class B_Truck_01_mover_F: B_Truck_01_transport_F {};
    
    class ReammoBox_F;
    class Slingload_01_Base_F : ReammoBox_F {
        class ACE_Actions { // FIXME ace_interact should add interactions to "All" so we can always extend
            class ACE_MainActions {}; 
        };
    };
    class Helicopter_Base_F : Helicopter {};
    class Helicopter_Base_H : Helicopter_Base_F {};
    class Heli_Transport_04_base_F : Helicopter_Base_H {};
    class Pod_Heli_Transport_04_base_F : StaticWeapon {};
    
    // Vanilla classes
    class B_APC_Tracked_01_CRV_F : B_APC_Tracked_01_base_F {
        transportFuel = 0; //3k
        MACRO_REFUEL_ACTIONS
        ace_refuel_hooks[] = {{0,0,0}};
        ace_refuel_type = "mil";
    };

	class C_Van_01_fuel_F : Van_01_fuel_base_F {
		transportFuel = 0; //1k
        MACRO_REFUEL_ACTIONS
        ace_refuel_hooks[] = {{0,0,0}};
        ace_refuel_type = "civ";
	};
	class I_G_Van_01_fuel_F : Van_01_fuel_base_F {
		transportFuel = 0; //1k
        MACRO_REFUEL_ACTIONS
        ace_refuel_hooks[] = {{0,0,0}};
        ace_refuel_type = "civ";
    };
    
	class I_Truck_02_fuel_F : Truck_02_base_F {
		transportFuel = 0; //3k
        MACRO_REFUEL_ACTIONS
        ace_refuel_hooks[] = {{0,0,0}};
        ace_refuel_type = "mil";
	};
    class O_Truck_02_fuel_F : Truck_02_base_F {
		transportFuel = 0; //3k
        MACRO_REFUEL_ACTIONS
        ace_refuel_hooks[] = {{0,0,0}};
        ace_refuel_type = "mil";
	};
    
	class B_Truck_01_fuel_F : B_Truck_01_mover_F {
		transportFuel = 0; //3k
        MACRO_REFUEL_ACTIONS
        ace_refuel_hooks[] = {{0,0,0}};
        ace_refuel_type = "mil";
	};
    
	class O_Truck_03_fuel_F : Truck_03_base_F {
		transportFuel = 0; //3k
        MACRO_REFUEL_ACTIONS
        ace_refuel_hooks[] = {{0,0,0}};
        ace_refuel_type = "mil";
	};
    
    class B_Slingload_01_Fuel_F : Slingload_01_Base_F  {
        transportFuel = 0; //3k
        MACRO_REFUEL_ACTIONS
        ace_refuel_hooks[] = {{0,0,0}};
        ace_refuel_type = "mil";
    };
    
    class O_Heli_Transport_04_fuel_F : Heli_Transport_04_base_F  {
        transportFuel = 0; //3k
        MACRO_REFUEL_ACTIONS
        ace_refuel_hooks[] = {{0,0,0}};
        ace_refuel_type = "mil";
    };
    
    class Land_Pod_Heli_Transport_04_fuel_F : Pod_Heli_Transport_04_base_F {
        transportFuel = 0; //3k
        MACRO_REFUEL_ACTIONS
        ace_refuel_hooks[] = {{0,0,0}};
        ace_refuel_type = "mil";
    };

    class Static;
    class Building : Static {
        class ACE_Actions { 
            class ACE_MainActions {}; 
        };
    };
    class NonStrategic : Building {};
    class House_Base : NonStrategic {};
    class House : House_Base {};
    class House_F : House {};
    class House_Small_F : House_F {};
    class Strategic : Building {};
    // Vanilla buildings
    class Land_Fuelstation_Feed_F : House_Small_F {
        transportFuel = 0; //50k
        MACRO_REFUEL_ACTIONS
        ace_refuel_hooks[] = {{0,0,0}};
        ace_refuel_type = "stationary";
    };
    class Land_fs_feed_F : House_Small_F {
        transportFuel = 0; //50k
        MACRO_REFUEL_ACTIONS
        ace_refuel_hooks[] = {{0,0,0}};
        ace_refuel_type = "stationary";
    };
    
    class FuelStation : Strategic {
        transportFuel = 0; //50k
        MACRO_REFUEL_ACTIONS
        ace_refuel_hooks[] = {{0,0,0}};
        ace_refuel_type = "stationary";
    };
    class Land_Fuelstation : Strategic {
        transportFuel = 0; //50k
        MACRO_REFUEL_ACTIONS
        ace_refuel_hooks[] = {{0,0,0}};
        ace_refuel_type = "stationary";
    };
    class Land_Fuelstation_army : Strategic {
        transportFuel = 0; //50k
        MACRO_REFUEL_ACTIONS
        ace_refuel_hooks[] = {{0,0,0}};
        ace_refuel_type = "stationary";
    };
    class Land_Benzina_schnell : Strategic {
        transportFuel = 0; //50k
        MACRO_REFUEL_ACTIONS
        ace_refuel_hooks[] = {{0,0,0}};
        ace_refuel_type = "stationary";
    };
    class Land_A_FuelStation_Feed : Strategic {
        transportFuel = 0; //50k
        MACRO_REFUEL_ACTIONS
        ace_refuel_hooks[] = {{0,0,0}};
        ace_refuel_type = "stationary";
    };
    class Land_Ind_FuelStation_Feed_EP1 : Strategic {
        transportFuel = 0; //50k
        MACRO_REFUEL_ACTIONS
        ace_refuel_hooks[] = {{0,0,0}};
        ace_refuel_type = "stationary";
    };
    class Land_FuelStation_Feed_PMC : Strategic {
        transportFuel = 0; //50k
        MACRO_REFUEL_ACTIONS
        ace_refuel_hooks[] = {{0,0,0}};
        ace_refuel_type = "stationary";
    };
    
    /*  // Barrels from rhs?
        BarrelHelper : Misc_thing 100
        BarrelBase : BarrelHelper 100
        Barrels : BarrelBase 400
        Barrel1 : BarrelBase 100
        Barrel2 : BarrelBase 100
        Barrel3 : BarrelBase 100
        Barrel4 : BarrelBase 100
        Barrel5 : BarrelBase 100
        Barrel6 : BarrelBase 100
        Wooden_barrel : BarrelBase 100
        Wooden_barrels : Wooden_barrel 400
        
        // Warfare points
        Base_WarfareBVehicleServicePoint : WarfareBBaseStructure 3000
        Land_StorageBladder_01_F : StorageBladder_base_F 60000
        Land_FlexibleTank_01_F : FlexibleTank_base_F  300
        
        // Mods
        rhsusf_M978A2_usarmy_wd : rhsusf_M977A2_usarmy_wd 10000
        rhsusf_M978A2_CPK_usarmy_wd : rhsusf_M978A2_usarmy_wd 10000
        RHS_Ural_Fuel_MSV_01 : RHS_Ural_Support_MSV_Base_01 10000
        RHS_Ural_Fuel_VDV_01 : RHS_Ural_Fuel_MSV_01 10000
        RHS_Ural_Fuel_VMF_01 : RHS_Ural_Fuel_MSV_01 10000
        RHS_Ural_Fuel_VV_01 : RHS_Ural_Fuel_MSV_01 10000
        LOP_UA_Ural_fuel : RHS_Ural_Fuel_VV_01 10000
    */
};
