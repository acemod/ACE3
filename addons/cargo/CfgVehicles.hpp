class CfgVehicles {
    class ACE_Module;
    class ACE_moduleCargoSettings: ACE_Module {
        scope = 2;
        displayName = CSTRING(SettingsModule_DisplayName);
        icon = QUOTE(PATHTOF(UI\Icon_Module_Cargo_ca.paa));
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
        };

        class ModuleDescription {
            description = CSTRING(SettingsModule_Description);
            sync[] = {};
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

    class Heli_Transport_02_base_F;
    class I_Heli_Transport_02_F : Heli_Transport_02_base_F {
        GVAR(space) = 20;
        GVAR(hasCargo) = 1;
    };

    // jets
    class Plane: Air {
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

    class StaticMortar;
    class Mortar_01_base_F: StaticMortar {
        GVAR(size) = 2; // 1 = small, 2 = large
        GVAR(canLoad) = 1;
    };

    // Ammo boxes
    class ThingX;
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



    class Scrapyard_base_F;
    class Land_PaperBox_closed_F: Scrapyard_base_F {
        GVAR(space) = 10;
        GVAR(hasCargo) = 1;
        GVAR(size) = 11;
        GVAR(canLoad) = 1;
        XEH_ENABLED;

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
        GVAR(space) = 14;
        GVAR(size) = 15;
        XEH_ENABLED;
    };
    class Land_Cargo20_blue_F: Cargo_base_F {
        GVAR(space) = 49;
        GVAR(size) = 50;
        XEH_ENABLED;
    };
    class Land_Cargo20_brick_red_F: Cargo_base_F {
        GVAR(space) = 49;
        GVAR(size) = 50;
        XEH_ENABLED;
    };
    class Land_Cargo20_cyan_F: Cargo_base_F {
        GVAR(space) = 49;
        GVAR(size) = 50;
        XEH_ENABLED;
    };
    class Land_Cargo20_grey_F: Cargo_base_F {
        GVAR(space) = 49;
        GVAR(size) = 50;
        XEH_ENABLED;
    };
    class Land_Cargo20_light_blue_F: Cargo_base_F {
        GVAR(space) = 49;
        GVAR(size) = 50;
        XEH_ENABLED;
    };
    class Land_Cargo20_light_green_F: Cargo_base_F {
        GVAR(space) = 49;
        GVAR(size) = 50;
        XEH_ENABLED;
    };
    class Land_Cargo20_military_green_F: Cargo_base_F {
        GVAR(space) = 49;
        GVAR(size) = 50;
        XEH_ENABLED;
    };

    class Ruins_F;
    class Land_Cargo20_military_ruins_F: Ruins_F {
        GVAR(space) = 49;
        GVAR(size) = 50;
        XEH_ENABLED;
    };

    class Land_Cargo20_orange_F: Cargo_base_F {
        GVAR(space) = 49;
        GVAR(size) = 50;
        XEH_ENABLED;
    };
    class Land_Cargo20_red_F: Cargo_base_F {
        GVAR(space) = 49;
        GVAR(size) = 50;
        XEH_ENABLED;
    };
    class Land_Cargo20_sand_F: Cargo_base_F {
        GVAR(space) = 49;
        GVAR(size) = 50;
        XEH_ENABLED;
    };
    class Land_Cargo20_vr_F: Cargo_base_F {
        GVAR(space) = 49;
        GVAR(size) = 50;
        XEH_ENABLED;
    };
    class Land_Cargo20_white_F: Cargo_base_F {
        GVAR(space) = 49;
        GVAR(size) = 50;
        XEH_ENABLED;
    };
    class Land_Cargo20_yellow_F: Cargo_base_F {
        GVAR(space) = 49;
        GVAR(size) = 50;
        XEH_ENABLED;
    };

    class Land_Cargo40_blue_F: Cargo_base_F {
        GVAR(space) = 99;
        GVAR(size) = 100;
        XEH_ENABLED;
    };
    class Land_Cargo40_brick_red_F: Cargo_base_F {
        GVAR(space) = 99;
        GVAR(size) = 100;
        XEH_ENABLED;
    };
    class Land_Cargo40_cyan_F: Cargo_base_F {
        GVAR(space) = 99;
        GVAR(size) = 100;
        XEH_ENABLED;
    };
    class Land_Cargo40_grey_F: Cargo_base_F {
        GVAR(space) = 99;
        GVAR(size) = 100;
        XEH_ENABLED;
    };
    class Land_Cargo40_light_blue_F: Cargo_base_F {
        GVAR(space) = 99;
        GVAR(size) = 100;
        XEH_ENABLED;
    };
    class Land_Cargo40_light_green_F: Cargo_base_F {
        GVAR(space) = 99;
        GVAR(size) = 100;
        XEH_ENABLED;
    };
    class Land_Cargo40_military_green_F: Cargo_base_F {
        GVAR(space) = 99;
        GVAR(size) = 100;
        XEH_ENABLED;
    };

    class Land_Cargo40_military_ruins_F: Ruins_F {
        GVAR(space) = 99;
        GVAR(size) = 100;
        XEH_ENABLED;
    };

    class Land_Cargo40_orange_F: Cargo_base_F {
        GVAR(space) = 99;
        GVAR(size) = 100;
        XEH_ENABLED;
    };
    class Land_Cargo40_red_F: Cargo_base_F {
        GVAR(space) = 99;
        GVAR(size) = 100;
        XEH_ENABLED;
    };
    class Land_Cargo40_sand_F: Cargo_base_F {
        GVAR(space) = 99;
        GVAR(size) = 100;
        XEH_ENABLED;
    };
    class Land_Cargo40_vr_F: Cargo_base_F {
        GVAR(space) = 99;
        GVAR(size) = 100;
        XEH_ENABLED;
    };
    class Land_Cargo40_white_F: Cargo_base_F {
        GVAR(space) = 99;
        GVAR(size) = 100;
        XEH_ENABLED;
    };
    class Land_Cargo40_yellow_F: Cargo_base_F {
        GVAR(space) = 99;
        GVAR(size) = 100;
        XEH_ENABLED;
    };

    // small
    class Land_CargoBox_V1_F: ThingX {
        GVAR(space) = 7;
        GVAR(hasCargo) = 1;
        GVAR(size) = 7;
        XEH_ENABLED;

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
};
