class CfgVehicles {
    // Vehicle animation interactions
    class SPE_Car_base;
    class SPE_G503_MB_base: SPE_Car_base {
        class EGVAR(interaction,anims) {
            class hide_jerry_can_source {
                positions[] = {"_target selectionPosition ['hide_jerry_can', 'ViewGeometry', 'AveragePoint']"};
                items[] = {"Land_CanisterFuel_F"};
                name = ECSTRING(refuel,TakeFuelCanister);
                text = ECSTRING(refuel,TakeFuelCanisterAction);
            };
        };
    };

    class SPE_Truck_base;
    class SPE_CCKW_353_Base: SPE_Truck_base {
        class EGVAR(interaction,anims) {
            class spare_fuel_hide_source {
                positions[] = {{0.8, 1.8, -1}, {-0.8, 1.8, -1}, {0.8, 3.5, -1}, {-0.8, 3.5, -1}};
                items[] = {"Land_CanisterFuel_F", "Land_CanisterFuel_F", "Land_CanisterFuel_F", "Land_CanisterFuel_F", "Land_CanisterFuel_F", "Land_CanisterFuel_F"};
                name = ECSTRING(refuel,TakeFuelCanister);
                text = ECSTRING(refuel,TakeFuelCanisterAction);
            };
        };
    };
    class SPE_CCKW_353_Ammo: SPE_CCKW_353_Base {
        class EGVAR(interaction,anims): EGVAR(interaction,anims) {
            class spare_fuel_hide_source: spare_fuel_hide_source {
                positions[] = {{0.8, 1.8, -0.85}, {-0.8, 1.8, -0.85}, {0.8, 3.5, -0.85}, {-0.8, 3.5, -0.85}};
            };
        };
    };
    class SPE_CCKW_353_Repair: SPE_CCKW_353_Base {
        class EGVAR(interaction,anims): EGVAR(interaction,anims) {
            class spare_fuel_hide_source: spare_fuel_hide_source {
                positions[] = {{0.8, 1.9, -0.85}, {-0.8, 1.9, -0.85}, {0.8, 3.6, -0.85}, {-0.8, 3.6, -0.85}};
            };
        };
    };
    class SPE_CCKW_353_Fuel: SPE_CCKW_353_Base {
        class EGVAR(interaction,anims): EGVAR(interaction,anims) {
            class spare_fuel_hide_source: spare_fuel_hide_source {
                positions[] = {{0.8, 1.25, -0.8}, {-0.8, 1.25, -0.8}, {0.8, 2.95, -0.8}, {-0.8, 2.95, -0.8}, {0.8, -1, -0.3}, {-0.8, -1, -0.3}};
                items[] = { // 32x
                    "Land_CanisterFuel_F", "Land_CanisterFuel_F", "Land_CanisterFuel_F", "Land_CanisterFuel_F",
                    "Land_CanisterFuel_F", "Land_CanisterFuel_F", "Land_CanisterFuel_F", "Land_CanisterFuel_F",
                    "Land_CanisterFuel_F", "Land_CanisterFuel_F", "Land_CanisterFuel_F", "Land_CanisterFuel_F",
                    "Land_CanisterFuel_F", "Land_CanisterFuel_F", "Land_CanisterFuel_F", "Land_CanisterFuel_F",
                    "Land_CanisterFuel_F", "Land_CanisterFuel_F", "Land_CanisterFuel_F", "Land_CanisterFuel_F",
                    "Land_CanisterFuel_F", "Land_CanisterFuel_F", "Land_CanisterFuel_F", "Land_CanisterFuel_F",
                    "Land_CanisterFuel_F", "Land_CanisterFuel_F", "Land_CanisterFuel_F", "Land_CanisterFuel_F",
                    "Land_CanisterFuel_F", "Land_CanisterFuel_F", "Land_CanisterFuel_F", "Land_CanisterFuel_F"
                };
            };
        };
    };
};
