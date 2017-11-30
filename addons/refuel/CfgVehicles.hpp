#define MACRO_NOZZLE_ACTIONS \
    class ACE_Actions { \
        class ACE_MainActions { \
            displayName = CSTRING(Refuel); \
            distance = REFUEL_ACTION_DISTANCE; \
            position = "[0,-0.025,0.125]"; \
            condition = "true"; \
            statement = ""; \
            exceptions[] = {INTERACT_EXCEPTIONS}; \
            showDisabled = 0; \
            priority = 2; \
            icon = QPATHTOF(ui\icon_refuel_interact.paa); \
            class GVAR(PickUpNozzle) { \
                displayName = CSTRING(TakeNozzle); \
                condition = QUOTE([ARR_2(_player,_target)] call FUNC(canTakeNozzle)); \
                statement = QUOTE([ARR_2(_player,_target)] call FUNC(takeNozzle)); \
                exceptions[] = {INTERACT_EXCEPTIONS_REFUELING}; \
                icon = QPATHTOF(ui\icon_refuel_interact.paa); \
            }; \
            class GVAR(TurnOn) { \
                displayName = CSTRING(TurnOn); \
                condition = QUOTE([ARR_2(_player,_target)] call FUNC(canTurnOn)); \
                statement = QUOTE([ARR_2(_player,_target)] call DFUNC(turnOn)); \
                exceptions[] = {INTERACT_EXCEPTIONS}; \
                icon = QPATHTOF(ui\icon_refuel_interact.paa); \
            }; \
            class GVAR(TurnOff) { \
                displayName = CSTRING(TurnOff); \
                condition = QUOTE([ARR_2(_player,_target)] call FUNC(canTurnOff)); \
                statement = QUOTE([ARR_2(_player,_target)] call DFUNC(turnOff)); \
                exceptions[] = {INTERACT_EXCEPTIONS}; \
                icon = QPATHTOF(ui\icon_refuel_interact.paa); \
            }; \
            class GVAR(Disconnect) { \
                displayName = CSTRING(Disconnect); \
                condition = QUOTE([ARR_2(_player,_target)] call FUNC(canDisconnect)); \
                statement = QUOTE([ARR_2(_player,_target)] call DFUNC(disconnect)); \
                exceptions[] = {INTERACT_EXCEPTIONS_REFUELING}; \
                icon = QPATHTOF(ui\icon_refuel_interact.paa); \
            }; \
        }; \
    };

class CBA_Extended_EventHandlers;

class CfgVehicles {
    class ACE_Module;
    class ACE_moduleRefuelSettings: ACE_Module {
        scope = 1;
        displayName = CSTRING(RefuelSettings_Module_DisplayName);
        icon = QPATHTOF(ui\icon_module_refuel.paa);
        category = "ACE_Logistics";
        function = QFUNC(moduleRefuelSettings);
        functionPriority = 1;
        isGlobal = 1;
        isTriggerActivated = 0;
        author = ECSTRING(common,ACETeam);
        class Arguments {
            class rate {
                displayName = CSTRING(RefuelSettings_speed_DisplayName);
                description = CSTRING(RefuelSettings_speed_Description);
                typeName = "NUMBER";
                defaultValue = 10;
            };
            class hoseLength {
                displayName = CSTRING(RefuelSettings_hoseLength_DisplayName);
                typeName = "NUMBER";
                defaultValue = 12;
            };
        };
    };

    class ThingX;
    class GVAR(fuelNozzle): ThingX {
        class EventHandlers {
            class CBA_Extended_EventHandlers: CBA_Extended_EventHandlers {};
        };

        MACRO_NOZZLE_ACTIONS
        displayName = QGVAR(fuelNozzle);
        scope = 1;
        scopeCurator = 1;
        model = QPATHTOF(data\nozzle.p3d);
    };

    class All;
    class Static: All {};
    class Building: Static {};
    class NonStrategic: Building {};
    class HouseBase: NonStrategic {};
    class House: HouseBase {};
    class House_F: House {
        class ACE_Actions {
            class ACE_MainActions {
                displayName = ECSTRING(interaction,MainAction);
                selection = "";
                distance = 5;
                condition = "true";
            };
        };
    };
    class House_Small_F: House_F {};

    class AllVehicles: All {
        GVAR(flowRate) = 1;
    };
    class Land: AllVehicles {};
    class LandVehicle: Land {};
    class Car: LandVehicle {
        GVAR(canReceive) = 1;
    };

    class Tank: LandVehicle {
        GVAR(canReceive) = 1;
        GVAR(flowRate) = 4;
    };

    class Air: AllVehicles {
        GVAR(flowRate) = 8;
    };

    class Helicopter: Air {
        GVAR(canReceive) = 1;
    };

    class Helicopter_Base_F: Helicopter {};
    class Helicopter_Base_H: Helicopter_Base_F {};

    class Plane: Air {
        GVAR(canReceive) = 1;
        GVAR(flowRate) = 16;
    };

    class Plane_Base_F: Plane {};

    class Ship: AllVehicles {};

    class Ship_F: Ship {
        GVAR(canReceive) = 1;
        GVAR(flowRate) = 4;
    };

    class Boat_Civil_01_base_F: Ship_F {
        GVAR(fuelCapacity) = 200;
    };

    class Boat_F: Ship_F {
        GVAR(flowRate) = 1;
    };

    class Boat_Armed_01_base_F: Boat_F {
        GVAR(fuelCapacity) = 300;
    };
    class Rubber_duck_base_F: Boat_F  {
        GVAR(fuelCapacity) = 30;
    };
/*    class SDV_01_base_F: Boat_F {
        // SDV is using electrical propulsion
        // but we can't recharge it ATM another way
        // TODO make recharging, maybe with this objects:
        // Land_PowerGenerator_F Land_Portable_generator_F
        GVAR(canReceive) = 0;
    };
*/
    class Car_F: Car {
        // Assuming large vehicle tank
        GVAR(fuelCapacity) = 60;
    };

    class Kart_01_Base_F: Car_F {
        GVAR(fuelCapacity) = 8;
    };

    class Offroad_01_base_F: Car_F {};

    class Wheeled_APC_F: Car_F {
        // Assuming average APC tank
        GVAR(fuelCapacity) = 300;
    };

    class Hatchback_01_base_F: Car_F {
        // Assume normal vehicle tank
        GVAR(fuelCapacity) = 50;
    };

    class Quadbike_01_base_F: Car_F {
        // Assuming usual Yamaha quad
        GVAR(fuelCapacity) = 10;
    };

    class MRAP_01_base_F: Car_F {
        // M-ATV
        // No data, assuming similar to Fennek
        GVAR(fuelCapacity) = 230;
    };

    class MRAP_02_base_F: Car_F {
        // Punisher
        // No data, assuming similar to Fennek
        GVAR(fuelCapacity) = 230;
    };

    class MRAP_03_base_F: Car_F {
        // Fennek
        GVAR(fuelCapacity) = 230;
    };

    class APC_Wheeled_01_base_F: Wheeled_APC_F {
        // Patria = LAV
        GVAR(fuelCapacity) = 269;
    };

    class Truck_F: Car_F {
        GVAR(fuelCapacity) = 400;
        GVAR(flowRate) = 2;
    };

    class Truck_01_base_F: Truck_F {
        // HEMTT
        GVAR(fuelCapacity) = 583;
    };

    class B_Truck_01_transport_F: Truck_01_base_F {};

    class B_Truck_01_mover_F: B_Truck_01_transport_F {};

    class Truck_02_base_F: Truck_F {
        // KamAZ
        // Assuming similar to Ural
        GVAR(fuelCapacity) = 400;
    };

    class Truck_03_base_F: Truck_F {
        // Tempest
        // Assuming heavier than KamAZ
        GVAR(fuelCapacity) = 600;
    };

    class Van_01_base_F: Truck_F {
        // Small Truck
        // Assuming 80L as in Ford Transit
        GVAR(fuelCapacity) = 80;
    };

    class Van_01_fuel_base_F: Van_01_base_F {
        GVAR(hooks)[] = {{0.38,-3.17,-.7},{-0.41,-3.17,-.7}};
        GVAR(fuelCargo) = 2000;
    };
    class C_Van_01_fuel_F: Van_01_fuel_base_F {
        transportFuel = 0; //1k
    };
    class I_G_Van_01_fuel_F: Van_01_fuel_base_F {
        transportFuel = 0; //1k
    };

    class Tank_F: Tank {
        GVAR(fuelCapacity) = 1200;
    };

    class APC_Tracked_01_base_F: Tank_F {
        // Namer
        // Assuming Merkava fuel
        GVAR(fuelCapacity) = 1400;
    };

    class B_APC_Tracked_01_base_F: APC_Tracked_01_base_F {};

    class B_APC_Tracked_01_CRV_F: B_APC_Tracked_01_base_F {
        transportFuel = 0; //3k
        GVAR(hooks)[] = {{-1.08,-4.81,-.8}};
        GVAR(fuelCargo) = 1000;
    };

    class APC_Tracked_02_base_F: Tank_F {
        // BM-2T
        // Assuming 1 L/km
        GVAR(fuelCapacity) = 1000;
    };

    class APC_Tracked_03_base_F: Tank_F {
        // FV 510
        // Assuming 1 L/km
        GVAR(fuelCapacity) = 660;
    };

    class MBT_01_base_F: Tank_F {
        // Merkava IV
        GVAR(fuelCapacity) = 1400;
    };

    class MBT_02_base_F: Tank_F {
        // T100 Black Eagle
        // Assuming T80
        GVAR(fuelCapacity) = 1100;
    };

    class MBT_03_base_F: Tank_F {
        // Leopard
        GVAR(fuelCapacity) = 1160;
    };

    class MBT_01_arty_base_F: MBT_01_base_F {
        // Assuming similar 2S3
        GVAR(fuelCapacity) = 830;
    };

    class MBT_02_arty_base_F: MBT_02_base_F {
        // Assuming similar 2S3
        GVAR(fuelCapacity) = 830;
    };

    class Heli_Light_02_base_F: Helicopter_Base_H {
        // Ka-60 Kasatka
        GVAR(fuelCapacity) = 1450;
    };

    class Heli_light_03_base_F: Helicopter_Base_F {
        // AW159
        GVAR(fuelCapacity) = 1004;
    };

    class Heli_Transport_01_base_F: Helicopter_Base_H  {
        // Ghost Hawk
        // Assuming similar UH60
        GVAR(fuelCapacity) = 1360;
    };

    class Heli_Transport_02_base_F: Helicopter_Base_H {
        // AW101
        GVAR(fuelCapacity) = 3222;
    };

    class Heli_Transport_03_base_F: Helicopter_Base_H {
        // Chinook 47I
        GVAR(fuelCapacity) = 3914;
    };

    class Heli_Transport_04_base_F: Helicopter_Base_H {
        // Mi-290 Taru
        GVAR(fuelCapacity) = 3914;
    };

    class Plane_CAS_01_base_F: Plane_Base_F {
        // Assuming similar to A10
        GVAR(fuelCapacity) = 6223;
    };

    class Plane_CAS_02_base_F: Plane_Base_F {
        // Yak-130
        GVAR(fuelCapacity) = 2099;
    };

    class UAV_01_base_F: Helicopter_Base_F {
        // Darter is electrical
        GVAR(canReceive) = 0;
    };
    class UAV_06_base_F: Helicopter_Base_F {
        // Orange UAV is electrical
        GVAR(canReceive) = 0;
    };

    class UAV: Plane {};

    class UAV_02_base_F: UAV {
        // Assuming similar YAHBON-R2
        GVAR(fuelCapacity) = 270;
    };

    class Plane_Fighter_03_base_F: Plane_Base_F {
        // L-159 ALCA
        GVAR(fuelCapacity) = 1914;
    };

    // Vanilla fuel vehicles
    class Truck_02_fuel_base_F: Truck_02_base_F {
        transportFuel = 0; //3k
        GVAR(hooks)[] = {{0.99,-3.47,-0.67},{-1.04,-3.47,-0.67}};
        GVAR(fuelCargo) = 10000;
    };
    class Truck_02_water_base_F: Truck_02_fuel_base_F {
        GVAR(fuelCargo) = REFUEL_DISABLED_FUEL;
    };

    class B_Truck_01_fuel_F: B_Truck_01_mover_F {
        transportFuel = 0; //3k
        GVAR(hooks)[] = {{.28,-4.99,-.3},{-.25,-4.99,-.3}};
        GVAR(fuelCargo) = 10000;
    };

    class O_Truck_03_fuel_F: Truck_03_base_F {
        transportFuel = 0; //3k
        GVAR(hooks)[] = {{1.3,-1.59,-.62},{-1.16,-1.59,-.62}};
        GVAR(fuelCargo) = 10000;
    };

    class ReammoBox_F: ThingX {
        class ACE_Actions {
            class ACE_MainActions {};
        };
    };
    class Slingload_base_F: ReammoBox_F {};

    class Pod_Heli_Transport_04_base_F: Slingload_base_F {};
    class Land_Pod_Heli_Transport_04_fuel_F: Pod_Heli_Transport_04_base_F {
        transportFuel = 0; //3k
        GVAR(hooks)[] = {{-1.49,1.41,-.3}};
        GVAR(fuelCargo) = 10000;
    };

    class Slingload_01_Base_F: Slingload_base_F {};
    class B_Slingload_01_Fuel_F: Slingload_01_Base_F {
        transportFuel = 0; //3k
        GVAR(hooks)[] = {{0.55,3.02,-0.5},{-0.52,3.02,-0.5}};
        GVAR(fuelCargo) = 10000;
    };

    class O_Heli_Transport_04_fuel_F: Heli_Transport_04_base_F  {
        transportFuel = 0; //3k
        GVAR(hooks)[] = {{-1.52,1.14,-1.18}};
        GVAR(fuelCargo) = 10000;
    };

    // Vanilla fuel objects
    class StorageBladder_base_F: NonStrategic {
        class ACE_Actions {
            class ACE_MainActions {
                displayName = ECSTRING(interaction,MainAction);
                position = "[-3.35,2.45,0.17]";
                distance = 4;
                condition = "true";
            };
        };
    };
    class Land_StorageBladder_01_F: StorageBladder_base_F {
        class EventHandlers {
            class CBA_Extended_EventHandlers: CBA_Extended_EventHandlers {};
        };

        transportFuel = 0; //60k
        GVAR(hooks)[] = {{-3.35,2.45,0.17}};
        GVAR(fuelCargo) = 60000;
    };

    class FlexibleTank_base_F: ThingX {
        class ACE_Actions {
            class ACE_MainActions {
                displayName = ECSTRING(interaction,MainAction);
                position = "[0, 0, 0.5]";
                distance = 4;
                condition = "true";
            };
        };
    };
    class Land_FlexibleTank_01_F: FlexibleTank_base_F {
        transportFuel = 0; //300
        GVAR(hooks)[] = {{0, 0, 0.5}};
        GVAR(fuelCargo) = 300;
    };

    // Vanilla buildings
    class Land_Fuelstation_Feed_F: House_Small_F {
        transportFuel = 0; //50k
        GVAR(hooks)[] = {{0,0,-0.5}};
        GVAR(fuelCargo) = REFUEL_INFINITE_FUEL;
    };

    class Land_fs_feed_F: House_Small_F {
        transportFuel = 0; //50k
        GVAR(hooks)[] = {{-0.4,0.022,-.23}};
        GVAR(fuelCargo) = REFUEL_INFINITE_FUEL;
    };

    class Land_FuelStation_01_pump_F: House_F {
        transportFuel = 0; //50k
        GVAR(hooks)[] = {{0, 0.4, -0.5}, {0, -0.4, -0.5}};
        GVAR(fuelCargo) = REFUEL_INFINITE_FUEL;
    };
    class Land_FuelStation_01_pump_malevil_F: House_F {
        transportFuel = 0; //50k
        GVAR(hooks)[] = {{0, 0.4, -0.5}, {0, -0.4, -0.5}};
        GVAR(fuelCargo) = REFUEL_INFINITE_FUEL;
    };

    // Helper object for non-AllVehicles objects
    class GVAR(helper): Helicopter_Base_F {
        scope = 1;
        displayName = "Refuel Helper";
        model = "\A3\Weapons_f\empty";
        class ACE_Actions {};
        class ACE_SelfActions {};
        EGVAR(cargo,hasCargo) = 0;
        EGVAR(cargo,space) = 0;
        damageEffect = "";
        destrType = "";
        class HitPoints {};
        class Turrets {};
        class TransportItems {};
    };

    /* // Barrels found in config  \
        BarrelHelper: Misc_thing 100
        BarrelBase: BarrelHelper 100
        Barrels: BarrelBase 400
        Barrel1: BarrelBase 100
        Barrel2: BarrelBase 100
        Barrel3: BarrelBase 100
        Barrel4: BarrelBase 100
        Barrel5: BarrelBase 100
        Barrel6: BarrelBase 100
        Wooden_barrel: BarrelBase 100
        Wooden_barrels: Wooden_barrel 400
    */

    // Trucks
    // Src: HEMTT http://www.inetres.com/gp/military/cv/eng/M977.html 583L > 483km
    // Src: https://en.wikipedia.org/wiki/Heavy_Expanded_Mobility_Tactical_Truck 587L > 483km
    // Src: https://en.wikipedia.org/wiki/Kamaz_Typhoon ? > 1200km
    // Src: https://en.wikipedia.org/wiki/Humvee 95L
    // Src: https://en.wikipedia.org/wiki/RG-33 80 gal = 302
    // Src: MTVR http://oshkoshdefense.com/wp-content/uploads/2013/08/MTVR_StndCargo_SS_6-13-11.pdf 295L
    // Src: M1078 http://tarakia.weebly.com/ta-vehicles.html 219L
    // Src: https://en.wikipedia.org/wiki/Ural-4320 360L
    // Src: http://www.automobile-catalog.com/car/2012/1024400/gaz_233011_tigr.html 138L
    // Src: https://en.wikipedia.org/wiki/UAZ-469 78L
    // Src: https://en.wikipedia.org/wiki/GAZ-66 210L

    // Tracked IFV
    // Src: https://en.wikipedia.org/wiki/Marder_%28IFV%29 652L > 520km
    // Src: https://en.wikipedia.org/wiki/Tanque_Argentino_Mediano ~250L > 500km (200L additional tank for 400km range boost)
    // Src: https://en.wikipedia.org/wiki/ACEC_Cobra 309L > 600km
    // Src: https://en.wikipedia.org/wiki/Egyptian_Infantry_Fighting_Vehicle 454L > 482km
    // Src: https://en.wikipedia.org/wiki/Lazika 400L > 400-450km
    // Src: https://en.wikipedia.org/wiki/Type_73_Armored_Personnel_Carrier 450L > 300km
    // Src: https://en.wikipedia.org/wiki/BMP-1 462L > 500-600km
    // Src: http://www.inetres.com/gp/military/cv/inf/BMP-1.html 460L > 600km
    // Src: http://www.inetres.com/gp/military/cv/inf/BMP-2.html 460L > 600km
    // Src: http://www.inetres.com/gp/military/cv/inf/M2.html  662L > 483-402km
    // Src: https://en.wikipedia.org/wiki/2T_Stalker ? > 1000km
    // Src: https://en.wikipedia.org/wiki/Namer ? > 500km
    // Src: https://en.wikipedia.org/wiki/Warrior_tracked_armoured_vehicle ? > 660km
    // Src: http://www.globalsecurity.org/military/systems/ground/m113-specs.htm 360L
    // Src: http://afvdb.50megs.com/usa/m2bradley.html 746L
    // Src: https://en.wikipedia.org/wiki/BMD-1 300L
    // Trend: 1-2 L/km

    // Wheeled IFV/APC
    // Src: https://en.wikipedia.org/wiki/BTR-60 290L > 500km
    // Src: http://www.inetres.com/gp/military/cv/inf/BTR-70.html 350L > 600km
    // Src: http://www.inetres.com/gp/military/cv/inf/BTR-80.html 300L > 600km
    // Src: https://en.wikipedia.org/wiki/Mowag_Piranha 4x4 200L > 700km
    // Src: https://en.wikipedia.org/wiki/Mowag_Piranha 6x6 200L > 500km
    // Src: https://en.wikipedia.org/wiki/ERC_90_Sagaie 242L > 700km
    // Src: https://en.wikipedia.org/wiki/V%C3%A9hicule_de_l%27Avant_Blind%C3%A9 310L > 1200km
    // Src: https://en.wikipedia.org/wiki/Panhard_M3 165L > 600km
    // Src: https://fr.wikipedia.org/wiki/V%C3%A9hicule_blind%C3%A9_de_combat_d%27infanterie 400L > 750km
    // Src: https://de.wikipedia.org/wiki/Sp%C3%A4hwagen_Fennek 230L > 460-1000km
    // Src: http://www.inetres.com/gp/military/cv/inf/LAV.html 269L > 660km
    // Src: http://www.inetres.com/gp/military/cv/inf/M1126.html 200L > 531km
    // Src: https://en.wikipedia.org/wiki/Patria_AMV ? > 600-850km
    // Src: https://en.wikipedia.org/wiki/Otokar_Arma ? > 700km
    // Trend: 0.3-0.6 L/km

    // MBT
    // Src: http://www.inetres.com/gp/military/cv/tank/Leopard2.html 1200L > 550km
    // Src: http://www.inetres.com/gp/military/cv/tank/M1.html 1909L > 479km
    // Src: https://en.wikipedia.org/wiki/T-80 1100L > 335km
    // Src: https://en.wikipedia.org/wiki/T-72 1200L > 490km
    // Trend: 2-4 L/km

    // Artillery
    // Src: http://www.inetres.com/gp/military/cv/arty/M109.html 511L > 349km
    // Src: https://en.wikipedia.org/wiki/2S3_Akatsiya 830L > 500km

    // Other
    // https://en.wikipedia.org/wiki/ZSU-23-4 515L

    // Helicopter
    // Src: http://www.bga-aeroweb.com/Defense/UH-1Y-Venom.html 1172kg / 0.81 kg/L = 1447L
    // Src: http://www.bga-aeroweb.com/Defense/AH-1Z-Viper.html 1296kg / 0.81 kg/L = 1600L
    // Src: http://www.army-technology.com/projects/black_hawk/ 1360L
    // Src: http://www.bga-aeroweb.com/Defense/CH-47-Chinook.html 3914L
    // Src: http://helicopters.axlegeeks.com/l/61/Boeing-AH-64-Apache 375 gal = 1420L
    // Src: https://en.wikipedia.org/wiki/Mil_Mi-8 3700l
    // Src: Google Ka-52 1870L
    // Src: http://www.airforce-technology.com/projects/hind/ 1500kg / 0.81 kg/L = 1851L
    // Src: https://en.wikipedia.org/wiki/MD_Helicopters_MH-6_Little_Bird 242L
    // Src: http://www.globalsecurity.org/military/world/europe/aw159-specs.htm 1004L
    // Src: https://en.wikipedia.org/wiki/AgustaWestland_AW101 3 * 1074L = 3222L
    // Src: http://www.aviastar.org/helicopters_eng/ka-62.php 1450L

    // Planes
    // Src: http://www.theaviationzone.com/factsheets/c130j.asp 20820kg / 0.81 kg/L = 25704L
    // Src: http://www.avialogs.com/viewer/avialogs-documentviewer.php?id=3298  p29  1644 gal = 6223L
    // Src: http://www.airforce-technology.com/projects/su25/ 3600L
    // Src: http://www.thaitechnics.com/aircraft/L159.html 1551kg / 0.81 kg/L = 1914L
    // Src: https://en.wikipedia.org/wiki/Yakovlev_Yak-130 1700kg / 0.81 kg/L = 2099L
    // Src: http://www.adcom-systems.com/ENG/UAV/YAHBON-R2/Overview.html 270L
};
