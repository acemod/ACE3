
class CfgVehicles {

    class ACE_Module;
    class ACE_moduleCargoSettings: ACE_Module {
        scope = 2;
        displayName = CSTRING(SettingsModule_DisplayName);
        icon = QUOTE(PATHTOF(UI\Icon_Module_Medical_ca.paa));
        category = "ACE";
        function = QUOTE(DFUNC(moduleSettings));
        functionPriority = 1;
        isGlobal = 1;
        isTriggerActivated = 0;
        author = ECSTRING(common,ACETeam);
        class Arguments {
            class enable {
                displayName = CSTRING(ModuleSettings_enable);
                description = CSTRING(ModuleSettings_enable_desc);
                typeName = "BOOL";
                defaultValue = 1;
            };
        };
        class ModuleDescription {
            description = CSTRING(SettingsModule_Desc);
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

    class Air;
    // Repair helicopters
    class Helicopter: Air {
        GVAR(space) = 8;
        GVAR(hasCargo) = 1;
    };

    class Heli_Transport_02_base_F;
    class I_Heli_Transport_02_F : Heli_Transport_02_base_F {
        GVAR(space) = 20;
        GVAR(hasCargo) = 1;
    };

    // Repair fixed wing aircraft
    class Plane: Air {
        GVAR(space) = 4;
        GVAR(hasCargo) = 1;
    };

    // boats
    class Ship;
    class Ship_F: Ship {
        GVAR(space) = 4;
        GVAR(hasCargo) = 1;
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
    class Land_Cargo20_military_ruins_F: Cargo_base_F {
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
    class Land_Cargo40_military_ruins_F: Cargo_base_F {
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
