class CfgVehicles {
    class gm_typ2_base;
    class gm_typ251_base: gm_typ2_base {
        class EGVAR(interaction,anims) {
            class canister_01_unhide {
                phase = 0;
                positions[] = {{-0.55, -0.17, 0.4}};
                items[] = {"Land_CanisterFuel_F"};
                name = ECSTRING(refuel,TakeFuelCanister);
                text = ECSTRING(refuel,TakeFuelCanisterAction);
            };
            class canister_02_unhide {
                phase = 0;
                positions[] = {{-0.55, -0.65, 0.4}};
                items[] = {"Land_CanisterFuel_F"};
                name = ECSTRING(refuel,TakeFuelCanister);
                text = ECSTRING(refuel,TakeFuelCanisterAction);
            };
        };
    };
    class gm_typ253_base: gm_typ2_base {
        class EGVAR(interaction,anims) {
            class canister_01_unhide {
                phase = 0;
                positions[] = {{-0.55, -0.19, 0.4}};
                items[] = {"Land_CanisterFuel_F"};
                name = ECSTRING(refuel,TakeFuelCanister);
                text = ECSTRING(refuel,TakeFuelCanisterAction);
            };
            class canister_02_unhide {
                phase = 0;
                positions[] = {{-0.55, -0.68, 0.4}};
                items[] = {"Land_CanisterFuel_F"};
                name = ECSTRING(refuel,TakeFuelCanister);
                text = ECSTRING(refuel,TakeFuelCanisterAction);
            };
        };
    };

    class gm_wheeled_truck_base;
    class gm_ural375d_base: gm_wheeled_truck_base {
        class EGVAR(interaction,anims) {
            class fuelcan_1_1_unhide {
                phase = 0;
                positions[] = {{-0.95, 3.15, -0.45}};
                items[] = {"Land_CanisterFuel_F"};
                name = ECSTRING(refuel,TakeFuelCanister);
                text = ECSTRING(refuel,TakeFuelCanisterAction);
            };
            class fuelcan_1_2_unhide {
                phase = 0;
                positions[] = {{0.9, 3.15, -0.45}};
                items[] = {"Land_CanisterFuel_F"};
                name = ECSTRING(refuel,TakeFuelCanister);
                text = ECSTRING(refuel,TakeFuelCanisterAction);
            };
        };
    };
    class gm_ural375d_mlrs_base: gm_ural375d_base {
        class EGVAR(interaction,anims): EGVAR(interaction,anims) {
            class fuelcan_1_1_unhide: fuelcan_1_1_unhide {
                positions[] = {{-0.95, 3.35, -0.55}};
            };
            class fuelcan_1_2_unhide: fuelcan_1_2_unhide {
                positions[] = {{0.9, 3.35, -0.55}};
            };
        };
    };
    class gm_ural375d_medic_base: gm_ural375d_base {
        class EGVAR(interaction,anims): EGVAR(interaction,anims) {
            class fuelcan_1_1_unhide: fuelcan_1_1_unhide {
                positions[] = {{-0.95, 3.35, -0.45}};
            };
            class fuelcan_1_2_unhide: fuelcan_1_2_unhide {
                positions[] = {{0.9, 3.35, -0.45}};
            };
        };
    };

    class gm_ural4320_base: gm_wheeled_truck_base {
        class EGVAR(interaction,anims) {
            class fuelcan_1_1_unhide {
                phase = 0;
                positions[] = {{-0.9, 3.1, -0.4}};
                items[] = {"Land_CanisterFuel_F"};
                name = ECSTRING(refuel,TakeFuelCanister);
                text = ECSTRING(refuel,TakeFuelCanisterAction);
            };
            class fuelcan_1_2_unhide {
                phase = 0;
                positions[] = {{0.9, 3.1, -0.4}};
                items[] = {"Land_CanisterFuel_F"};
                name = ECSTRING(refuel,TakeFuelCanister);
                text = ECSTRING(refuel,TakeFuelCanisterAction);
            };
        };
    };
    class gm_ural4320_repair_base: gm_ural4320_base {
        class EGVAR(interaction,anims): EGVAR(interaction,anims) {
            class fuelcan_1_1_unhide: fuelcan_1_1_unhide {
                positions[] = {{-0.9, 3.25, -0.4}};
            };
            class fuelcan_1_2_unhide: fuelcan_1_2_unhide {
                positions[] = {{0.9, 3.25, -0.4}};
            };
        };
    };
    class gm_ural44202_base: gm_ural4320_base {
        class EGVAR(interaction,anims): EGVAR(interaction,anims) {
            class fuelcan_1_1_unhide: fuelcan_1_1_unhide {
                positions[] = {{-0.9, 3, -0.4}};
            };
            class fuelcan_1_2_unhide: fuelcan_1_2_unhide {
                positions[] = {{0.9, 3, -0.4}};
            };
        };
    };

    class gm_wheeled_APC_base;
    class gm_brdm2_base: gm_wheeled_APC_base {
        class EGVAR(interaction,anims) {
            class FuelCanister_01_unhide {
                phase = 0;
                positions[] = {"_target selectionPosition ['fuelcanister_01', 'FireGeometry', 'AveragePoint']"};
                items[] = {"Land_CanisterFuel_F"};
                name = ECSTRING(refuel,TakeFuelCanister);
                text = ECSTRING(refuel,TakeFuelCanisterAction);
            };
            class FuelCanister_02_unhide {
                phase = 0;
                positions[] = {"_target selectionPosition ['fuelcanister_02', 'FireGeometry', 'AveragePoint']"};
                items[] = {"Land_CanisterFuel_F"};
                name = ECSTRING(refuel,TakeFuelCanister);
                text = ECSTRING(refuel,TakeFuelCanisterAction);
            };
            class FuelCanister_03_unhide {
                phase = 0;
                positions[] = {"_target selectionPosition ['fuelcanister_03', 'FireGeometry', 'AveragePoint']"};
                items[] = {"Land_CanisterFuel_F"};
                name = ECSTRING(refuel,TakeFuelCanister);
                text = ECSTRING(refuel,TakeFuelCanisterAction);
            };
        };
    };
    class gm_brdm2um_base: gm_brdm2_base {
        class EGVAR(interaction,anims): EGVAR(interaction,anims) {
            class FuelCanister_01_unhide: FuelCanister_01_unhide {
                positions[] = {{0.87, -3, -1.2}};
            };
            class FuelCanister_02_unhide: FuelCanister_02_unhide {
                positions[] = {{-0.87, -3, -1.2}};
            };
            class FuelCanister_03_unhide: FuelCanister_03_unhide {
                positions[] = {{-0.4, -1.85, -0.5}};
            };
        };
    };

    class gm_btr60_base: gm_wheeled_APC_base {
        class EGVAR(interaction,anims) {
            class FuelCanister_01_unhide {
                phase = 0;
                positions[] = {"_target selectionPosition ['fuelcanister_01', 'FireGeometry', 'AveragePoint']"};
                items[] = {"Land_CanisterFuel_F"};
                name = ECSTRING(refuel,TakeFuelCanister);
                text = ECSTRING(refuel,TakeFuelCanisterAction);
            };
            class FuelCanister_02_unhide {
                phase = 0;
                positions[] = {"_target selectionPosition ['fuelcanister_02', 'FireGeometry', 'AveragePoint']"};
                items[] = {"Land_CanisterFuel_F"};
                name = ECSTRING(refuel,TakeFuelCanister);
                text = ECSTRING(refuel,TakeFuelCanisterAction);
            };
            class FuelCanister_03_unhide {
                phase = 0;
                positions[] = {"_target selectionPosition ['fuelcanister_03', 'FireGeometry', 'AveragePoint']"};
                items[] = {"Land_CanisterFuel_F"};
                name = ECSTRING(refuel,TakeFuelCanister);
                text = ECSTRING(refuel,TakeFuelCanisterAction);
            };
            class FuelCanister_04_unhide {
                phase = 0;
                positions[] = {"_target selectionPosition ['fuelcanister_04', 'FireGeometry', 'AveragePoint']"};
                items[] = {"Land_CanisterFuel_F"};
                name = ECSTRING(refuel,TakeFuelCanister);
                text = ECSTRING(refuel,TakeFuelCanisterAction);
            };
            class FuelCanister_05_unhide {
                phase = 0;
                positions[] = {"_target selectionPosition ['fuelcanister_05', 'FireGeometry', 'AveragePoint']"};
                items[] = {"Land_CanisterFuel_F"};
                name = ECSTRING(refuel,TakeFuelCanister);
                text = ECSTRING(refuel,TakeFuelCanisterAction);
            };
            class FuelCanister_06_unhide {
                phase = 0;
                positions[] = {"_target selectionPosition ['fuelcanister_06', 'FireGeometry', 'AveragePoint']"};
                items[] = {"Land_CanisterFuel_F"};
                name = ECSTRING(refuel,TakeFuelCanister);
                text = ECSTRING(refuel,TakeFuelCanisterAction);
            };
        };
    };
    class gm_btr60pa_base: gm_btr60_base {
        class EGVAR(interaction,anims): EGVAR(interaction,anims) {
            class FuelCanister_05_unhide: FuelCanister_05_unhide {
                items[] = {"Land_CanisterFuel_F", "Land_CanisterFuel_F"};
            };
            class FuelCanister_06_unhide: FuelCanister_06_unhide {
                items[] = {"Land_CanisterFuel_F", "Land_CanisterFuel_F"};
            };
        };
    };
    class gm_btr60pb_base: gm_btr60_base {
        class EGVAR(interaction,anims): EGVAR(interaction,anims) {
            class FuelCanister_03_unhide: FuelCanister_03_unhide {
                items[] = {"Land_CanisterFuel_F", "Land_CanisterFuel_F"};
            };
            class FuelCanister_04_unhide: FuelCanister_04_unhide {
                items[] = {"Land_CanisterFuel_F", "Land_CanisterFuel_F"};
            };
        };
    };
    class gm_btr60pu12_base: gm_btr60_base {
        class EGVAR(interaction,anims): EGVAR(interaction,anims) {
            class FuelCanister_03_unhide: FuelCanister_03_unhide {
                items[] = {"Land_CanisterFuel_F", "Land_CanisterFuel_F"};
            };
            class FuelCanister_04_unhide: FuelCanister_04_unhide {
                items[] = {"Land_CanisterFuel_F", "Land_CanisterFuel_F"};
            };
        };
    };

    class gm_bmp1_base;
    class gm_bmp1sp2_base: gm_bmp1_base {
        class EGVAR(interaction,anims) {
            class FuelCanister_01_unhide {
                phase = 0;
                positions[] = {{-1.2, -2.52, -1.2}};
                items[] = {"Land_CanisterFuel_F"};
                name = ECSTRING(refuel,TakeFuelCanister);
                text = ECSTRING(refuel,TakeFuelCanisterAction);
            };
            class FuelCanister_02_unhide {
                phase = 0;
                positions[] = {{1.2, -2.52, -1.2}};
                items[] = {"Land_CanisterFuel_F"};
                name = ECSTRING(refuel,TakeFuelCanister);
                text = ECSTRING(refuel,TakeFuelCanisterAction);
            };
        };
    };

    class gm_zsu234_base;
    class gm_zsu234v1_base: gm_zsu234_base {
        class EGVAR(interaction,anims) {
            class FuelCanister_01_unhide {
                phase = 0;
                // Rotate interactions with turret rotation
                positions[] = {"[0, 0.2, 0] vectorAdd ([[-0.85, -2.2, -0.9], [0, 0, 1], deg (_target animationPhase 'mainturret_trav_anim')] call CBA_fnc_vectRotate3D)"};
                items[] = {"Land_CanisterFuel_F"};
                name = ECSTRING(refuel,TakeFuelCanister);
                text = ECSTRING(refuel,TakeFuelCanisterAction);
            };
            class FuelCanister_02_unhide {
                phase = 0;
                // Rotate interactions with turret rotation
                positions[] = {"[0, 0.2, 0] vectorAdd ([[0.7, -2.25, -0.85], [0, 0, 1], deg (_target animationPhase 'mainturret_trav_anim')] call CBA_fnc_vectRotate3D)"};
                items[] = {"Land_CanisterFuel_F"};
                name = ECSTRING(refuel,TakeFuelCanister);
                text = ECSTRING(refuel,TakeFuelCanisterAction);
            };
            class FuelCanister_03_unhide {
                phase = 0;
                // Rotate interactions with turret rotation
                positions[] = {"[0, 0.2, 0] vectorAdd ([[0.92, -2.25, -0.85], [0, 0, 1], deg (_target animationPhase 'mainturret_trav_anim')] call CBA_fnc_vectRotate3D)"};
                items[] = {"Land_CanisterFuel_F"};
                name = ECSTRING(refuel,TakeFuelCanister);
                text = ECSTRING(refuel,TakeFuelCanisterAction);
            };
        };
    };

    class gm_tracked_Tank_base;
    class gm_pt76_base: gm_tracked_Tank_base {
        class EGVAR(interaction,anims) {
            class FuelTank_01_unhide {
                phase = 0;
                positions[] = {{-1, -2.85, -1}};
                items[] = {"Land_CanisterFuel_F"};
                name = ECSTRING(refuel,TakeFuelCanister);
                text = ECSTRING(refuel,TakeFuelCanisterAction);
            };
            class FuelTank_02_unhide {
                phase = 0;
                positions[] = {{1, -2.85, -1}};
                items[] = {"Land_CanisterFuel_F"};
                name = ECSTRING(refuel,TakeFuelCanister);
                text = ECSTRING(refuel,TakeFuelCanisterAction);
            };
        };
    };

    class gm_Leopard1a0_base;
    class gm_Leopard1a1_base: gm_Leopard1a0_base {
        class EGVAR(interaction,anims) {
            class FuelCanister_01_unhide {
                phase = 0;
                // Rotate interactions with turret rotation
                positions[] = {"[0, -0.6, 0] vectorAdd ([[0.25, -1.9, -0.55], [0, 0, 1], deg (_target animationPhase 'mainturret_trav_anim')] call CBA_fnc_vectRotate3D)"};
                items[] = {"Land_CanisterFuel_F"};
                name = ECSTRING(refuel,TakeFuelCanister);
                text = ECSTRING(refuel,TakeFuelCanisterAction);
                distance = 2.5;
            };
            class FuelCanister_02_unhide {
                phase = 0;
                // Rotate interactions with turret rotation
                positions[] = {"[0, -0.6, 0] vectorAdd ([[-0.8, -1.65, -0.55], [0, 0, 1], deg (_target animationPhase 'mainturret_trav_anim')] call CBA_fnc_vectRotate3D)"};
                items[] = {"Land_CanisterFuel_F"};
                name = ECSTRING(refuel,TakeFuelCanister);
                text = ECSTRING(refuel,TakeFuelCanisterAction);
            };
            class FuelCanister_03_unhide {
                phase = 0;
                // Rotate interactions with turret rotation
                positions[] = {"[0, -0.6, 0] vectorAdd ([[0.8, -1.8, -0.55], [0, 0, 1], deg (_target animationPhase 'mainturret_trav_anim')] call CBA_fnc_vectRotate3D)"};
                items[] = {"Land_CanisterFuel_F"};
                name = ECSTRING(refuel,TakeFuelCanister);
                text = ECSTRING(refuel,TakeFuelCanisterAction);
            };
        };
    };
};
