
class CBA_Extended_EventHandlers;

class CfgVehicles {
    class Logic;
    class Module_F: Logic {
        class ModuleDescription;
    };
    class ACE_Module: Module_F {};
    class ACE_moduleCargoSettings: ACE_Module {
        scope = 2;
        displayName = CSTRING(SettingsModule_DisplayName);
        icon = QPATHTOF(UI\Icon_Module_Cargo_ca.paa);
        category = "ACE_Logistics";
        function = QFUNC(moduleSettings);
        functionPriority = 1;
        isGlobal = 1;
        isSingular = 1;
        isTriggerActivated = 0;
        author = ECSTRING(common,ACETeam);

        class Arguments {
            class enable {
                displayName = CSTRING(ModuleSettings_enable);
                description = CSTRING(ModuleSettings_enable_Description);
                typeName = "BOOL";
                defaultValue = 1;
            };
            class paradropTimeCoefficent {
                displayName = CSTRING(paradropTimeCoefficent);
                description = CSTRING(paradropTimeCoefficent_description);
                typeName = "SCALAR";
                defaultValue = 2.5;
            };
        };

        class ModuleDescription {
            description = CSTRING(SettingsModule_Description);
            sync[] = {};
        };
    };
    class GVAR(makeLoadable): ACE_Module {
        scope = 2;
        displayName = CSTRING(makeLoadable_displayName);
        icon = QPATHTOF(UI\Icon_Module_makeLoadable_ca.paa);
        category = "ACE_Logistics";
        function = QFUNC(moduleMakeLoadable);
        isGlobal = 1;
        isTriggerActivated = 0;
        author = ECSTRING(common,ACETeam);
        class Arguments {
            class canLoad {
                displayName = CSTRING(makeLoadable_displayName);
                description = CSTRING(MakeLoadable_description);
                typeName = "BOOL";
                defaultValue = 1;
            };
            class setSize {
                displayName = CSTRING(makeLoadable_setSize_displayName);
                typeName = "NUMBER";
                defaultValue = 1;
            };
        };
        class ModuleDescription: ModuleDescription {
            description = CSTRING(makeLoadable_description);
            sync[] = {"AnyStaticObject"};
        };
    };

    class LandVehicle;
    class Car: LandVehicle {
        GVAR(space) = 4;
        GVAR(hasCargo) = 1;
        class ACE_Cargo {
            /*
            class Cargo {
                class ACE_medicalSupplyCrate {
                    type = "ACE_medicalSupplyCrate";
                    amount = 1;
                };
            };*/
        };
    };

    class Tank: LandVehicle {
        GVAR(space) = 4;
        GVAR(hasCargo) = 1;
    };

    class Car_F;
    class Truck_F: Car_F {
        GVAR(space) = 8;
        GVAR(hasCargo) = 1;
    };

    // hemets
    class Truck_01_base_F: Truck_F {
        GVAR(space) = 8;
    };
    class B_Truck_01_transport_F: Truck_01_base_F {
        GVAR(space) = 20;
    };
    class B_Truck_01_covered_F: B_Truck_01_transport_F {
        GVAR(space) = 20;
    };
    class B_Truck_01_mover_F: B_Truck_01_transport_F {
        GVAR(space) = 4;
    };
    class B_Truck_01_box_F: B_Truck_01_mover_F {
        GVAR(space) = 40;
    };
    class B_Truck_01_Repair_F: B_Truck_01_mover_F {
        GVAR(space) = 20;
    };
    class B_Truck_01_ammo_F: B_Truck_01_mover_F {
        GVAR(space) = 8;
    };
    class B_Truck_01_fuel_F: B_Truck_01_mover_F {
        GVAR(space) = 4;
    };
    class B_Truck_01_medical_F: B_Truck_01_transport_F {
        GVAR(space) = 8;
    };

    // kamaz'
    class Truck_02_base_F: Truck_F { //covers "covered" variants
        GVAR(space) = 20;
    };
    class Truck_02_transport_base_F: Truck_02_base_F {
        GVAR(space) = 20;
    };
    class Truck_02_box_base_F: Truck_02_base_F { // repair variant, not actually cargo box like hemet
        GVAR(space) = 12;
    };
    class Truck_02_medical_base_F: Truck_02_box_base_F {
        GVAR(space) = 8;
    };
    class Truck_02_Ammo_base_F: Truck_02_base_F {
        GVAR(space) = 12;
    };
    class Truck_02_fuel_base_F: Truck_02_base_F {
        GVAR(space) = 4;
    };

    // typhoon
    class Truck_03_base_F: Truck_F {
        GVAR(space) = 8;
    };
    class O_Truck_03_transport_F: Truck_03_base_F {
        GVAR(space) = 20;
    };
    class O_Truck_03_covered_F: Truck_03_base_F {
        GVAR(space) = 20;
    };
    class O_Truck_03_repair_F: Truck_03_base_F {
        GVAR(space) = 12;
    };
    class O_Truck_03_ammo_F: Truck_03_base_F {
        GVAR(space) = 8;
    };
    class O_Truck_03_fuel_F: Truck_03_base_F {
        GVAR(space) = 4;
    };
    class O_Truck_03_medical_F: Truck_03_base_F {
        GVAR(space) = 8;
    };
    class O_Truck_03_device_F: Truck_03_base_F {
        GVAR(space) = 4;
    };

    // civ trucks
    class Van_01_base_F: Truck_F {
        GVAR(space) = 8;
    };
    class Van_01_transport_base_F: Van_01_base_F {
        GVAR(space) = 8;
    };
    class Van_01_box_base_F: Van_01_base_F { // repair variant, not actually cargo box like hemet
        GVAR(space) = 12;
    };
    class Van_01_fuel_base_F: Van_01_base_F {
        GVAR(space) = 4;
    };

    // misc. vehicles
    class Quadbike_01_base_F: Car_F {
        GVAR(space) = 0;
        GVAR(hasCargo) = 0;
    };

    class Kart_01_Base_F: Car_F {
        GVAR(space) = 0;
        GVAR(hasCargo) = 0;
    };

    // helicopters
    class Air;
    class Helicopter: Air {
        GVAR(space) = 8;
        GVAR(hasCargo) = 1;
    };

    class Helicopter_Base_H;
    class Heli_Light_01_base_F: Helicopter_Base_H {
        GVAR(space) = 0;
        GVAR(hasCargo) = 0;
    };

    class Heli_Light_02_base_F: Helicopter_Base_H {
        GVAR(space) = 4;
    };

    class Helicopter_Base_F;
    class Heli_light_03_base_F: Helicopter_Base_F {
        GVAR(space) = 4;
    };

    class Heli_Transport_01_base_F: Helicopter_Base_H {
        GVAR(space) = 8;
    };

    class Heli_Transport_02_base_F: Helicopter_Base_H {
        GVAR(space) = 20;
    };

    class Heli_Transport_03_base_F: Helicopter_Base_H {
        GVAR(space) = 40;
    };

    class Heli_Transport_04_base_F: Helicopter_Base_H {
        // note the double brackets are because loadmasterTurrets is an array of arrays / turret paths
        GVAR(loadmasterTurrets)[] = {{1}};
        GVAR(space) = 0;
        GVAR(hasCargo) = 0;
    };

    class O_Heli_Transport_04_box_F: Heli_Transport_04_base_F {
        GVAR(space) = 20;
        GVAR(hasCargo) = 1;
    };

    class O_Heli_Transport_04_repair_F: Heli_Transport_04_base_F {
        GVAR(space) = 12;
        GVAR(hasCargo) = 1;
    };

    class O_Heli_Transport_04_ammo_F: Heli_Transport_04_base_F {
        GVAR(space) = 8;
        GVAR(hasCargo) = 1;
    };

    class O_Heli_Transport_04_fuel_F: Heli_Transport_04_base_F {};

    class O_Heli_Transport_04_medevac_F: Heli_Transport_04_base_F {
        GVAR(space) = 8;
        GVAR(hasCargo) = 1;
    };

    class Heli_Attack_01_base_F: Helicopter_Base_F {
        GVAR(space) = 0;
        GVAR(hasCargo) = 0;
    };

    class Heli_Attack_02_base_F: Helicopter_Base_F {
        GVAR(space) = 4;
    };

    // planes (off by default as most are attack jets)
    class Plane: Air {
        GVAR(space) = 0;
        GVAR(hasCargo) = 0;
    };

    class Plane_Base_F: Plane {};
    class Plane_Civil_01_base_F: Plane_Base_F { // Tanoa Civilian Prop Plane
        GVAR(space) = 2;
        GVAR(hasCargo) = 1;
    };
    class VTOL_Base_F;
    class VTOL_01_base_F: VTOL_Base_F {
        GVAR(space) = 4;
        GVAR(hasCargo) = 1;
    };
    class VTOL_02_base_F: VTOL_Base_F {
        GVAR(space) = 4;
        GVAR(hasCargo) = 1;
    };

    // autonomus
    class UAV_01_base_F: Helicopter_Base_F {
        GVAR(space) = 0;
        GVAR(hasCargo) = 0;
    };

    // boats
    class Ship;
    class Ship_F: Ship {
        GVAR(space) = 4;
        GVAR(hasCargo) = 1;
    };

    class Boat_Civil_01_base_F: Ship_F {
        GVAR(space) = 4;
        GVAR(hasCargo) = 1;
    };

    class Boat_F: Ship_F {};
    class Rubber_duck_base_F: Boat_F {
        GVAR(space) = 0;
        GVAR(hasCargo) = 0;
    };

    class Boat_Armed_01_base_F: Boat_F {
        GVAR(space) = 8;
        GVAR(hasCargo) = 1;
    };

    // submarines
    class SDV_01_base_F: Boat_F {
        GVAR(space) = 0;
        GVAR(hasCargo) = 0;
    };

    // Static weapons
    class StaticWeapon: LandVehicle {
        GVAR(size) = 2; // 1 = small, 2 = large
        GVAR(canLoad) = 1;
    };

    // Taru pods
    class Pod_Heli_Transport_04_base_F;
    class Land_Pod_Heli_Transport_04_ammo_F: Pod_Heli_Transport_04_base_F {
        GVAR(space) = 8;
        GVAR(hasCargo) = 1;
    };
    class Land_Pod_Heli_Transport_04_box_F: Pod_Heli_Transport_04_base_F {
        GVAR(space) = 20;
        GVAR(hasCargo) = 1;
    };
    class Land_Pod_Heli_Transport_04_repair_F: Pod_Heli_Transport_04_base_F {
        GVAR(space) = 12;
        GVAR(hasCargo) = 1;
    };
    class Pod_Heli_Transport_04_crewed_base_F;
    class Land_Pod_Heli_Transport_04_medevac_F: Pod_Heli_Transport_04_crewed_base_F {
        GVAR(space) = 8;
        GVAR(hasCargo) = 1;
    };

    class StaticMortar;
    class Mortar_01_base_F: StaticMortar {
        GVAR(size) = 2; // 1 = small, 2 = large
        GVAR(canLoad) = 1;
    };

    // Ammo boxes
    class ThingX;
    class Items_base_F;
    class ReammoBox_F: ThingX {
        GVAR(size) = 2; // 1 = small, 2 = large
        GVAR(canLoad) = 1;
    };
    //"Supply Box" - Small Pallets
    class B_supplyCrate_F: ReammoBox_F {
        GVAR(size) = 6;
    };
    class IG_supplyCrate_F: ReammoBox_F {
        GVAR(size) = 6;
    };
    class C_supplyCrate_F: ReammoBox_F {
        GVAR(size) = 6;
    };

    class Slingload_base_F: ReammoBox_F {};
    class CargoNet_01_base_F: Slingload_base_F { //Slingload pallets
        GVAR(size) = 6;
    };
    class Slingload_01_Base_F: Slingload_base_F { //Huron 20ft containers
        GVAR(canLoad) = 0;
    };

    //Plastic and metal case
    class PlasticCase_01_base_F: Items_base_F {
        GVAR(size) = 1; // 1 = small, 2 = large
        GVAR(canLoad) = 1;
    };
    class Land_PlasticCase_01_large_F: PlasticCase_01_base_F {
        GVAR(size) = 2; // 1 = small, 2 = large
    };
    class MetalCase_01_base_F: Items_base_F {
        GVAR(size) = 1; // 1 = small, 2 = large
        GVAR(canLoad) = 1;
    };
    class Land_MetalCase_01_large_F: MetalCase_01_base_F {
        GVAR(size) = 2; // 1 = small, 2 = large
    };

    // objects
    class RoadCone_F: ThingX {
        GVAR(size) = 1;
        GVAR(canLoad) = 1;
    };
    class RoadBarrier_F: RoadCone_F {
        GVAR(size) = 2;
    };

    class Scrapyard_base_F;
    class Land_PaperBox_closed_F: Scrapyard_base_F {
        class EventHandlers {
            class CBA_Extended_EventHandlers: CBA_Extended_EventHandlers {};
        };

        GVAR(space) = 10;
        GVAR(hasCargo) = 1;
        GVAR(size) = 11;
        GVAR(canLoad) = 1;

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
    class Constructions_base_F;
    class Land_WoodenBox_F: Constructions_base_F {
        class EventHandlers {
            class CBA_Extended_EventHandlers: CBA_Extended_EventHandlers {};
        };

        GVAR(space) = 2;
        GVAR(hasCargo) = 2;
        GVAR(size) = 3;
        GVAR(canLoad) = 1;

        maximumLoad = 2000;
        transportMaxBackpacks = 12;
        transportMaxMagazines = 64;
        transportMaxWeapons = 12;
    };
    class Land_WoodenCrate_01_F: ThingX {
        class EventHandlers {
            class CBA_Extended_EventHandlers: CBA_Extended_EventHandlers {};
        };
        GVAR(space) = 3;
        GVAR(hasCargo) = 3;
        GVAR(size) = 3;
        GVAR(canLoad) = 1;

        maximumLoad = 2000;
        transportMaxBackpacks = 12;
        transportMaxMagazines = 64;
        transportMaxWeapons = 12;
    };

    class Cargo_base_F: ThingX {
        GVAR(space) = 4;
        GVAR(hasCargo) = 1;
        GVAR(size) = 4;
        GVAR(canLoad) = 1;

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
    class Cargo10_base_F: Cargo_base_F {
        class EventHandlers {
            class CBA_Extended_EventHandlers: CBA_Extended_EventHandlers {};
        };

        GVAR(space) = 14;
        GVAR(size) = 15;
    };
    class Land_Cargo20_blue_F: Cargo_base_F {
        class EventHandlers {
            class CBA_Extended_EventHandlers: CBA_Extended_EventHandlers {};
        };

        GVAR(space) = 49;
        GVAR(size) = 50;
    };
    class Land_Cargo20_brick_red_F: Cargo_base_F {
        class EventHandlers {
            class CBA_Extended_EventHandlers: CBA_Extended_EventHandlers {};
        };

        GVAR(space) = 49;
        GVAR(size) = 50;
    };
    class Land_Cargo20_cyan_F: Cargo_base_F {
        class EventHandlers {
            class CBA_Extended_EventHandlers: CBA_Extended_EventHandlers {};
        };

        GVAR(space) = 49;
        GVAR(size) = 50;
    };
    class Land_Cargo20_grey_F: Cargo_base_F {
        class EventHandlers {
            class CBA_Extended_EventHandlers: CBA_Extended_EventHandlers {};
        };

        GVAR(space) = 49;
        GVAR(size) = 50;
    };
    class Land_Cargo20_light_blue_F: Cargo_base_F {
        class EventHandlers {
            class CBA_Extended_EventHandlers: CBA_Extended_EventHandlers {};
        };

        GVAR(space) = 49;
        GVAR(size) = 50;
    };
    class Land_Cargo20_light_green_F: Cargo_base_F {
        class EventHandlers {
            class CBA_Extended_EventHandlers: CBA_Extended_EventHandlers {};
        };

        GVAR(space) = 49;
        GVAR(size) = 50;
    };
    class Land_Cargo20_military_green_F: Cargo_base_F {
        class EventHandlers {
            class CBA_Extended_EventHandlers: CBA_Extended_EventHandlers {};
        };

        GVAR(space) = 49;
        GVAR(size) = 50;
    };

    class Ruins_F;
    class Land_Cargo20_military_ruins_F: Ruins_F {
        class EventHandlers {
            class CBA_Extended_EventHandlers: CBA_Extended_EventHandlers {};
        };

        GVAR(space) = 49;
        GVAR(size) = 50;
    };

    class Land_Cargo20_orange_F: Cargo_base_F {
        class EventHandlers {
            class CBA_Extended_EventHandlers: CBA_Extended_EventHandlers {};
        };

        GVAR(space) = 49;
        GVAR(size) = 50;
    };
    class Land_Cargo20_red_F: Cargo_base_F {
        class EventHandlers {
            class CBA_Extended_EventHandlers: CBA_Extended_EventHandlers {};
        };

        GVAR(space) = 49;
        GVAR(size) = 50;
    };
    class Land_Cargo20_sand_F: Cargo_base_F {
        class EventHandlers {
            class CBA_Extended_EventHandlers: CBA_Extended_EventHandlers {};
        };

        GVAR(space) = 49;
        GVAR(size) = 50;
    };
    class Land_Cargo20_vr_F: Cargo_base_F {
        class EventHandlers {
            class CBA_Extended_EventHandlers: CBA_Extended_EventHandlers {};
        };

        GVAR(space) = 49;
        GVAR(size) = 50;
    };
    class Land_Cargo20_white_F: Cargo_base_F {
        class EventHandlers {
            class CBA_Extended_EventHandlers: CBA_Extended_EventHandlers {};
        };

        GVAR(space) = 49;
        GVAR(size) = 50;
    };
    class Land_Cargo20_yellow_F: Cargo_base_F {
        class EventHandlers {
            class CBA_Extended_EventHandlers: CBA_Extended_EventHandlers {};
        };

        GVAR(space) = 49;
        GVAR(size) = 50;
    };

    class Land_Cargo40_blue_F: Cargo_base_F {
        class EventHandlers {
            class CBA_Extended_EventHandlers: CBA_Extended_EventHandlers {};
        };

        GVAR(space) = 99;
        GVAR(size) = 100;
    };
    class Land_Cargo40_brick_red_F: Cargo_base_F {
        class EventHandlers {
            class CBA_Extended_EventHandlers: CBA_Extended_EventHandlers {};
        };

        GVAR(space) = 99;
        GVAR(size) = 100;
    };
    class Land_Cargo40_cyan_F: Cargo_base_F {
        class EventHandlers {
            class CBA_Extended_EventHandlers: CBA_Extended_EventHandlers {};
        };

        GVAR(space) = 99;
        GVAR(size) = 100;
    };
    class Land_Cargo40_grey_F: Cargo_base_F {
        class EventHandlers {
            class CBA_Extended_EventHandlers: CBA_Extended_EventHandlers {};
        };

        GVAR(space) = 99;
        GVAR(size) = 100;
    };
    class Land_Cargo40_light_blue_F: Cargo_base_F {
        class EventHandlers {
            class CBA_Extended_EventHandlers: CBA_Extended_EventHandlers {};
        };

        GVAR(space) = 99;
        GVAR(size) = 100;
    };
    class Land_Cargo40_light_green_F: Cargo_base_F {
        class EventHandlers {
            class CBA_Extended_EventHandlers: CBA_Extended_EventHandlers {};
        };

        GVAR(space) = 99;
        GVAR(size) = 100;
    };
    class Land_Cargo40_military_green_F: Cargo_base_F {
        class EventHandlers {
            class CBA_Extended_EventHandlers: CBA_Extended_EventHandlers {};
        };

        GVAR(space) = 99;
        GVAR(size) = 100;
    };

    class Land_Cargo40_military_ruins_F: Ruins_F {
        class EventHandlers {
            class CBA_Extended_EventHandlers: CBA_Extended_EventHandlers {};
        };

        GVAR(space) = 99;
        GVAR(size) = 100;
    };

    class Land_Cargo40_orange_F: Cargo_base_F {
        class EventHandlers {
            class CBA_Extended_EventHandlers: CBA_Extended_EventHandlers {};
        };

        GVAR(space) = 99;
        GVAR(size) = 100;
    };
    class Land_Cargo40_red_F: Cargo_base_F {
        class EventHandlers {
            class CBA_Extended_EventHandlers: CBA_Extended_EventHandlers {};
        };

        GVAR(space) = 99;
        GVAR(size) = 100;
    };
    class Land_Cargo40_sand_F: Cargo_base_F {
        class EventHandlers {
            class CBA_Extended_EventHandlers: CBA_Extended_EventHandlers {};
        };

        GVAR(space) = 99;
        GVAR(size) = 100;
    };
    class Land_Cargo40_vr_F: Cargo_base_F {
        class EventHandlers {
            class CBA_Extended_EventHandlers: CBA_Extended_EventHandlers {};
        };

        GVAR(space) = 99;
        GVAR(size) = 100;
    };
    class Land_Cargo40_white_F: Cargo_base_F {
        class EventHandlers {
            class CBA_Extended_EventHandlers: CBA_Extended_EventHandlers {};
        };

        GVAR(space) = 99;
        GVAR(size) = 100;
    };
    class Land_Cargo40_yellow_F: Cargo_base_F {
        class EventHandlers {
            class CBA_Extended_EventHandlers: CBA_Extended_EventHandlers {};
        };

        GVAR(space) = 99;
        GVAR(size) = 100;
    };

    // small
    class Land_CargoBox_V1_F: ThingX {
        class EventHandlers {
            class CBA_Extended_EventHandlers: CBA_Extended_EventHandlers {};
        };

        GVAR(space) = 7;
        GVAR(hasCargo) = 1;
        GVAR(size) = 7;

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

    class Lamps_base_F;
    class Land_PortableLight_single_F: Lamps_base_F {
        GVAR(size) = 1;
        GVAR(canLoad) = 1;
    };
};
