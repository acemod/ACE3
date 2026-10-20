#define XEH_INHERITED class EventHandlers {class CBA_Extended_EventHandlers: CBA_Extended_EventHandlers {};}

class CfgVehicles {
    // fuel pumps
    class Land_vn_commercial_base;
    class Land_vn_fuelstation_01_pump_f: Land_vn_commercial_base {
        XEH_INHERITED;
        EGVAR(refuel,hooks)[] = {{0, 0.4, -0.5}, {0, -0.4, -0.5}};
        EGVAR(refuel,fuelCargo) = REFUEL_INFINITE_FUEL;
    };
    class Land_vn_fuelstation_02_pump_f: Land_vn_commercial_base {
        XEH_INHERITED;
        EGVAR(refuel,hooks)[] = {{0, 0.4, -0.5}, {0, -0.4, -0.5}};
        EGVAR(refuel,fuelCargo) = REFUEL_INFINITE_FUEL;
    };
    class Land_vn_fuelstation_feed_f: Land_vn_commercial_base {
        XEH_INHERITED;
        EGVAR(refuel,hooks)[] = {{0, 0.4, -0.5}, {0, -0.4, -0.5}};
        EGVAR(refuel,fuelCargo) = REFUEL_INFINITE_FUEL;
    };

    // fuel objects
    class Land_vn_building_b_base;
    class Land_vn_usaf_fueltank_75_01: Land_vn_building_b_base {
        XEH_INHERITED;
        EGVAR(refuel,hooks)[] = {{-2.52, -2.2, -2.05}, {2.5, 0, -1.3}};
        EGVAR(refuel,fuelCargo) = 2840; // 750 * 3.785
    };
    class Land_vn_b_prop_fuelbladder_01: Land_vn_usaf_fueltank_75_01 {
        EGVAR(refuel,hooks)[] = {{-1.75, -6.7, -1}};
        EGVAR(refuel,fuelCargo) = 3785; // 1000 * 3.785
    };
    class Land_vn_b_prop_fuelbladder_03: Land_vn_b_prop_fuelbladder_01 {
        EGVAR(refuel,hooks)[] = {{-1.55, -6.5, -1}};
    };
    class Land_vn_building_industrial_base;
    class Land_vn_fuel_tank_stairs: Land_vn_building_industrial_base {
        XEH_INHERITED;
        EGVAR(refuel,hooks)[] = {{0, 0.4, -1.3}, {0, -0.4, -1.3}};
        EGVAR(refuel,fuelCargo) = 10000; // reference is B_Slingload_01_Fuel_F
    };
    class Land_vn_object_b_base;
    class Land_vn_b_prop_fueldrum_01: Land_vn_object_b_base {
        XEH_INHERITED;
        EGVAR(refuel,hooks)[] = {{0, 0, 0}};
        EGVAR(refuel,fuelCargo) = 300; // reference is Land_FlexibleTank_01_F
    };
    class Land_vn_b_prop_fueldrum_02: Land_vn_b_prop_fueldrum_01 {
        EGVAR(refuel,hooks)[] = {{0, -1.3, -0.15}, {2.3, 1.25, -0.15}};
        EGVAR(refuel,fuelCargo) = 14100; // (23 + 24) * 300
    };

    // Vehicle animation interactions
    // BTR-40
    class vn_wheeled_car_base;
    class vn_wheeled_btr40_base: vn_wheeled_car_base {
        class EGVAR(interaction,anims) {
            class refuel_can_hide {
                positions[] = {{0.7, -2.35, -0.9}};
                items[] = {"Land_CanisterFuel_F"};
                name = ECSTRING(refuel,TakeFuelCanister);
                text = ECSTRING(refuel,TakeFuelCanisterAction);
            };
        };
    };
    class vn_wheeled_btr40_01_base: vn_wheeled_btr40_base {
        class EGVAR(interaction,anims): EGVAR(interaction,anims) {
            class refuel_can_hide: refuel_can_hide {
                positions[] = {{0.72, -2.35, -0.45}};
            };
        };
    };
    class vn_wheeled_btr40_ambulance_base: vn_wheeled_btr40_base {
        class EGVAR(interaction,anims): EGVAR(interaction,anims) {
            class refuel_can_hide: refuel_can_hide {
                positions[] = {{0.72, -2.35, -0.45}};
            };
        };
    };
    class vn_wheeled_btr40_mg_01_base: vn_wheeled_btr40_base {
        class EGVAR(interaction,anims): EGVAR(interaction,anims) {
            class refuel_can_hide: refuel_can_hide {
                positions[] = {{0.72, -2.35, -0.9}};
            };
        };
    };
    class vn_wheeled_btr40_mg_03_base: vn_wheeled_btr40_base {
        class EGVAR(interaction,anims): EGVAR(interaction,anims) {
            class refuel_can_hide: refuel_can_hide {
                positions[] = {{0.82, -2.35, -1.25}};
            };
        };
    };
    class vn_wheeled_btr40_mg_04_base: vn_wheeled_btr40_mg_01_base {
        class EGVAR(interaction,anims): EGVAR(interaction,anims) {
            class refuel_can_hide: refuel_can_hide {
                positions[] = {{0.72, -2.35, -1}};
            };
        };
    };
    class vn_wheeled_btr40_mg_05_base: vn_wheeled_btr40_mg_04_base {
        class EGVAR(interaction,anims): EGVAR(interaction,anims) {
            class refuel_can_hide: refuel_can_hide {
                positions[] = {{0.65, -2.25, -1}};
            };
        };
    };

    // M151
    class vn_wheeled_m151_base: vn_wheeled_car_base {
        class EGVAR(interaction,anims) {
            class user_refuel_can_hide {
                positions[] = {{-0.48, -1.5, -1.1}};
                items[] = {"Land_CanisterFuel_F"};
                name = ECSTRING(refuel,TakeFuelCanister);
                text = ECSTRING(refuel,TakeFuelCanisterAction);
            };
        };
    };
    class vn_wheeled_m151_mg_03_base: vn_wheeled_m151_base {
        class EGVAR(interaction,anims): EGVAR(interaction,anims) {
            class user_refuel_can_hide: user_refuel_can_hide {
                positions[] = {{-0.75, -1.5, -1}};
            };
        };
    };
    class vn_wheeled_m151_mg_05_base: vn_wheeled_m151_base {
        class EGVAR(interaction,anims): EGVAR(interaction,anims) {
            class user_refuel_can_hide: user_refuel_can_hide {
                positions[] = {{0.9, -0.1, -1.1}};
            };
        };
    };
    class vn_wheeled_m151_mg_06_base: vn_wheeled_m151_base {
        class EGVAR(interaction,anims): EGVAR(interaction,anims) {
            class user_refuel_can_hide: user_refuel_can_hide {
                positions[] = {{0.3, 0.1, -1.1}};
            };
        };
    };
    class vn_wheeled_m151_01_base: vn_wheeled_m151_base {
        class EGVAR(interaction,anims): EGVAR(interaction,anims) {
            class user_refuel_can_hide: user_refuel_can_hide {
                positions[] = {{-0.4, -1.5, -0.7}};
            };
        };
    };

    // M577
    class vn_armor_m113_base;
    class vn_armor_m577_base: vn_armor_m113_base {
        class EGVAR(interaction,anims) {
            class hide_fuel_cans {
                selections[] = {"hide_fuel_cans"};
                positions[] = {{1.07, 1.05, -1}};
                items[] = {"Land_CanisterFuel_F", "Land_CanisterFuel_F", "Land_CanisterFuel_F", "Land_CanisterFuel_F", "Land_CanisterFuel_F", "Land_CanisterFuel_F"};
                name = ECSTRING(refuel,TakeFuelCanister);
                text = ECSTRING(refuel,TakeFuelCanisterAction);
            };
        };
    };

    // M48
    class vn_armor_tank_base;
    class vn_armor_m48_base: vn_armor_tank_base {
        class EGVAR(interaction,anims) {
            class hide_mainturret_jerrycan {
                positions[] = {"_target selectionPosition ['hide_jerrycan', 'FireGeometry', 'AveragePoint']"};
                items[] = {"Land_CanisterFuel_F"};
                name = ECSTRING(refuel,TakeFuelCanister);
                text = ECSTRING(refuel,TakeFuelCanisterAction);
            };
        };
    };

    // BTR-50PK
    class vn_armor_btr50pk_base: vn_armor_tank_base {
        class EGVAR(interaction,anims) {
            class hide_barrels {
                selections[] = {"hide_barrels"};
                positions[] = {"private _pos = _target selectionPosition 'hide_barrels'; _pos set [0, -(_pos select 0)]; _pos"}; // Mirror position to other side of vehicle
                items[] = {"Land_CanisterFuel_F", "Land_CanisterFuel_F"};
                name = ECSTRING(refuel,TakeFuelCanister);
                text = ECSTRING(refuel,TakeFuelCanisterAction);
            };
        };
    };

    // PT-76
    class vn_armor_pt76_base: vn_armor_tank_base {
        class EGVAR(interaction,anims) {
            class hide_barrels {
                selections[] = {"hide_barrels"};
                positions[] = {"private _pos = _target selectionPosition 'hide_barrels'; _pos set [0, -(_pos select 0)]; _pos"}; // Mirror position to other side of vehicle
                items[] = {"Land_CanisterFuel_F", "Land_CanisterFuel_F"};
                name = ECSTRING(refuel,TakeFuelCanister);
                text = ECSTRING(refuel,TakeFuelCanisterAction);
            };
        };
    };

    // Type 63
    class vn_armor_type63_base: vn_armor_tank_base {
        class EGVAR(interaction,anims) {
            class hide_barrels {
                selections[] = {"hide_barrels"};
                positions[] = {"private _pos = _target selectionPosition 'hide_barrels'; _pos set [0, -(_pos select 0)]; _pos"}; // Mirror position to other side of vehicle
                items[] = {"Land_CanisterFuel_F", "Land_CanisterFuel_F"};
                name = ECSTRING(refuel,TakeFuelCanister);
                text = ECSTRING(refuel,TakeFuelCanisterAction);
            };
        };
    };
};
