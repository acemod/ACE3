class CfgVehicles {
    class CUP_T810_Unarmed_Base;
    class CUP_T810_Refuel_Base: CUP_T810_Unarmed_Base {
        EGVAR(refuel,hooks)[] = {{-1.01, 0.21, -0.5},{1.08, 0.2, -0.5}};
        EGVAR(refuel,fuelCargo) = 10000;
    };

    class Truck_02_fuel_base_F;
    class CUP_Kamaz_5350_Refuel_Base: Truck_02_fuel_base_F {
        EGVAR(refuel,hooks)[] = {{-0.02, -3.33, -1.05}};
        EGVAR(refuel,fuelCargo) = 10000;
    };

    class CUP_Ural_Support_Base;
    class CUP_Ural_Refuel_Base: CUP_Ural_Support_Base {
        EGVAR(refuel,hooks)[] = {{-0.05, -3.65, -0.42}};
        EGVAR(refuel,fuelCargo) = 10000;
    };

    class CUP_V3S_Open_Base;
    class CUP_V3S_Refuel_Base: CUP_V3S_Open_Base {
        EGVAR(refuel,hooks)[] = {{-0.35, -3.35, -0.4},{0.40, -3.35, -0.4}};
        EGVAR(refuel,fuelCargo) = 6500;
    };

    class CUP_MTVR_Base;
    class CUP_MTVR_Refuel_Base: CUP_MTVR_Base {
        EGVAR(refuel,hooks)[] = {{-1.09, -0.01, -0.5},{1, -0.01, -0.5}};
        EGVAR(refuel,fuelCargo) = 10000;
    };

    class Car_F;
    class CUP_LR_Base: Car_F {
        class EGVAR(interaction,anims) {
            class selection_jerry {
                positions[] = {{-0.65, 2.7, -0.55}, {0.65, 2.7, -0.55}, {-1, -0.25, -0.75}, {1, -0.25, -0.75}};
                items[] = {"Land_CanisterFuel_F", "Land_CanisterFuel_F", "Land_CanisterFuel_F", "Land_CanisterFuel_F", "Land_CanisterFuel_F", "Land_CanisterFuel_F"};
                name = ECSTRING(refuel,TakeFuelCanister);
                text = ECSTRING(refuel,TakeFuelCanisterAction);
            };
        };
    };
    class CUP_LR_MG_Base: CUP_LR_Base {
        class EGVAR(interaction,anims): EGVAR(interaction,anims) {
            class selection_jerry: selection_jerry {
                positions[] = {{-0.55, 2.45, 1.05}, {0.55, 2.45, 1.05}, {-1, -0.53, 0.9}, {1, -0.53, 0.9}};
            };
        };
    };
    class CUP_LR_SPG9_Base: CUP_LR_Base {
        class EGVAR(interaction,anims): EGVAR(interaction,anims) {
            class selection_jerry: selection_jerry {};
        };
    };
    class CUP_LR_AA_Base: CUP_LR_SPG9_Base {
        class EGVAR(interaction,anims): EGVAR(interaction,anims) {
            class selection_jerry: selection_jerry {
                positions[] = {{-0.65, 2.8, -1.1}, {0.65, 2.8, -1.1}, {-1, -0.15, -1.3}, {1, -0.15, -1.3}};
            };
        };
    };
    class CUP_LR_Ambulance_Base: CUP_LR_Base {
        class EGVAR(interaction,anims): EGVAR(interaction,anims) {
            class selection_jerry: selection_jerry {
                positions[] = {{-0.65, 3.1, -0.55}, {0.65, 3.1, -0.55}};
                items[] = {"Land_CanisterFuel_F", "Land_CanisterFuel_F", "Land_CanisterFuel_F", "Land_CanisterFuel_F"};
            };
        };
    };
    class CUP_LR_Special_Base: CUP_LR_Base {
        class EGVAR(interaction,anims): EGVAR(interaction,anims) {
            class selection_jerry: selection_jerry {
                positions[] = {{-0.7, 2.45, 1.05}, {0.55, 2.45, 1.05}};
                items[] = {"Land_CanisterFuel_F", "Land_CanisterFuel_F", "Land_CanisterFuel_F", "Land_CanisterFuel_F"};
            };
        };
    };

    class CUP_nHMMWV_Base: Car_F {
        class EGVAR(interaction,anims) {
            class hide_jerrycans {
                positions[] = {"(_target selectionPosition 'vhc_jerrycans') vectorAdd [0, 0, 0.15]"};
                items[] = {"Land_CanisterFuel_F", "Land_CanisterFuel_F"};
                name = ECSTRING(refuel,TakeFuelCanister);
                text = ECSTRING(refuel,TakeFuelCanisterAction);
            };
        };
    };
    // Don't inherit, as it's easier for the main compat
    class CUP_nM1025_SOV_Base: CUP_nHMMWV_Base {
        class EGVAR(interaction,anims) {
            class hide_jerrycans {
                positions[] = {"(_target selectionPosition 'vhc_jerrycans') vectorAdd [0, 0, 0.15]"};
                items[] = {"Land_CanisterFuel_F", "Land_CanisterFuel_F"};
                name = ECSTRING(refuel,TakeFuelCanister);
                text = ECSTRING(refuel,TakeFuelCanisterAction);
            };
            class hide_rear_rack_content {
                positions[] = {"_target selectionPosition ['vhc_rear_rack_content', 'FireGeometry', 'AveragePoint']"};
                items[] = {"Land_CanisterFuel_F", "Land_CanisterFuel_F", "Land_CanisterFuel_F", "Land_CanisterFuel_F", "Land_CanisterFuel_F", "Land_CanisterFuel_F"};
                name = ECSTRING(refuel,TakeFuelCanister);
                text = ECSTRING(refuel,TakeFuelCanisterAction);
            };
        };
    };

    class CUP_ECVHMMWV_Base: Car_F {
        class EGVAR(interaction,anims) {
            class hide_jerrycans {
                positions[] = {"(_target selectionPosition ['vhc_rear_trunk_door', 'FireGeometry', 'AveragePoint']) vectorAdd [-0.85, -0.22, -0.1]"};
                items[] = {"Land_CanisterFuel_F", "Land_CanisterFuel_F"};
                name = ECSTRING(refuel,TakeFuelCanister);
                text = ECSTRING(refuel,TakeFuelCanisterAction);
            };
        };
    };
};
