class CfgVehicles {
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
