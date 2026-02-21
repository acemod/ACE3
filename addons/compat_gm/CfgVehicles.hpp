class CfgVehicles {

    // REPAIR, REFUEL, REARM

    class ReammoBox_F;
    class gm_AmmoBox_base: ReammoBox_F {
        EGVAR(cargo,size) = 1;
        EGVAR(cargo,canLoad) = 1;

        EGVAR(dragging,canCarry) = 1;
        EGVAR(dragging,carryPosition)[] = {0,1,1};
        EGVAR(dragging,carryDirection) = 0;

        EGVAR(dragging,canDrag) = 1;
        EGVAR(dragging,dragPosition)[] = {0,1.2,0};
        EGVAR(dragging,dragDirection) = 0;
    };

    class gm_jerrycan_base;
    class gm_jerrycan: gm_jerrycan_base {
        EGVAR(cargo,size) = 1;
        EGVAR(cargo,canLoad) = 1;

        EGVAR(dragging,canCarry) = 1;
        EGVAR(dragging,carryPosition)[] = {0,1,1};
        EGVAR(dragging,carryDirection) = 0;

        EGVAR(dragging,canDrag) = 1;
        EGVAR(dragging,dragPosition)[] = {0,1.2,0};
        EGVAR(dragging,dragDirection) = 0;
    };

    // STATIC

    class gm_ge_army_shelteraceII_repair_base;
    class gm_ge_army_shelteraceII_repair: gm_ge_army_shelteraceII_repair_base {
        EGVAR(repair,canRepair) = 1;
    };

    class gm_gc_army_shelterlakII_repair_base;
    class gm_gc_army_shelterlakII_repair: gm_gc_army_shelterlakII_repair_base {
        EGVAR(repair,canRepair) = 1;
    };


    // W H E E L E D

    class gm_wheeled_base;
    class gm_wheeled_truck_base;
    class gm_wheeled_APC_base;
    class gm_wheeled_motorcycle_base;

    // EAST

    class gm_wheeled_car_base: gm_wheeled_base {
        EGVAR(cargo,hasCargo) = 1;
        EGVAR(cargo,space) = 4;
        EGVAR(refuel,canReceive) = 1;
        EGVAR(vehicle_damage,hullDetonationProb) = 0.2;
        EGVAR(vehicle_damage,turretDetonationProb) = 0.03;
        EGVAR(vehicle_damage,engineDetonationProb) = 0.03;
        EGVAR(vehicle_damage,hullFireProb) = 0.6;
        EGVAR(vehicle_damage,turretFireProb) = 0.1;
        EGVAR(vehicle_damage,engineFireProb) = 0.2;
        EGVAR(vehicle_damage,detonationDuringFireProb) = 0.2;
        EGVAR(vehicle_damage,canHaveFireRing) = 0.1;
    };

    class gm_wheeled_bicycle_base: gm_wheeled_base {
        EGVAR(cargo,hasCargo) = 0;
        EGVAR(refuel,canReceive) = 0;
    };

    class gm_uaz469_base: gm_wheeled_car_base {
        EGVAR(refuel,fuelCapacity) = 78;
    };

    class gm_p601_base: gm_wheeled_car_base {
        EGVAR(refuel,fuelCapacity) = 26;
    };

    class gm_brdm2_base: gm_wheeled_APC_base {
        EGVAR(refuel,fuelCapacity) = 290;
        EGVAR(vehicle_damage,hullDetonationProb) = 0;
        EGVAR(vehicle_damage,turretDetonationProb) = 0.2;
        EGVAR(vehicle_damage,engineDetonationProb) = 0.2;
        EGVAR(vehicle_damage,hullFireProb) = 0.5;
        EGVAR(vehicle_damage,turretFireProb) = 0.7;
        EGVAR(vehicle_damage,engineFireProb) = 0.7;
        EGVAR(vehicle_damage,detonationDuringFireProb) = 0.5;
        EGVAR(vehicle_damage,canHaveFireRing) = 0;
        EGVAR(cookoff,canHaveFireJet) = 0;

        class EGVAR(interaction,anims) {
            class AmmoBox_01_unhide {
                phase = 0;
                positions[] = {"_target selectionPosition ['ammobox_01', 'FireGeometry', 'AveragePoint']"};
                items[] = {"gm_AmmoBox_wood_04_empty"};
                name = "$STR_DN_gm_AmmoBox_wood_04_base";
                text = "$STR_DN_gm_AmmoBox_wood_04_base";
            };
            class AmmoBox_02_unhide {
                phase = 0;
                positions[] = {"_target selectionPosition ['ammobox_02', 'FireGeometry', 'AveragePoint']"};
                items[] = {"gm_AmmoBox_wood_04_empty"};
                name = "$STR_DN_gm_AmmoBox_wood_04_base";
                text = "$STR_DN_gm_AmmoBox_wood_04_base";
            };
            class AmmoBox_03_unhide {
                phase = 0;
                positions[] = {"_target selectionPosition ['ammobox_03', 'FireGeometry', 'AveragePoint']"};
                items[] = {"gm_AmmoBox_wood_04_empty"};
                name = "$STR_DN_gm_AmmoBox_wood_04_base";
                text = "$STR_DN_gm_AmmoBox_wood_04_base";
            };
        };
    };
    class gm_brdm2um_base: gm_brdm2_base {
        EGVAR(vehicle_damage,hullDetonationProb) = 0;
        EGVAR(vehicle_damage,turretDetonationProb) = 0;
        EGVAR(vehicle_damage,engineDetonationProb) = 0.2;
        EGVAR(vehicle_damage,hullFireProb) = 0.5;
        EGVAR(vehicle_damage,turretFireProb) = 0;
        EGVAR(vehicle_damage,engineFireProb) = 0.7;
        EGVAR(vehicle_damage,detonationDuringFireProb) = 0.5;
        EGVAR(vehicle_damage,canHaveFireRing) = 0;
        EGVAR(cookoff,canHaveFireJet) = 0;
        class EGVAR(interaction,anims): EGVAR(interaction,anims) {
            class AmmoBox_01_unhide: AmmoBox_01_unhide {
                positions[] = {{-0.1, -1.9, -0.5}};
            };
            class AmmoBox_02_unhide: AmmoBox_02_unhide {
                positions[] = {{-0.55, -0.35, -0.35}};
            };
            class AmmoBox_03_unhide: AmmoBox_03_unhide {
                positions[] = {{0.3, -1.85, -0.5}};
            };
        };
    };
    class gm_brdm2_9p133_base: gm_brdm2_base {
        EGVAR(vehicle_damage,hullDetonationProb) = 0.2;
        EGVAR(vehicle_damage,turretDetonationProb) = 0.5;
    };

    class gm_btr60_base: gm_wheeled_APC_base {
        EGVAR(refuel,fuelCapacity) = 290;
        EGVAR(cookoff,cookoffSelections)[] = {"commanderturret_hatch"};
        EGVAR(vehicle_damage,hullDetonationProb) = 0;
        EGVAR(vehicle_damage,turretDetonationProb) = 0;
        EGVAR(vehicle_damage,engineDetonationProb) = 0.2;
        EGVAR(vehicle_damage,hullFireProb) = 0.2;
        EGVAR(vehicle_damage,turretFireProb) = 0;
        EGVAR(vehicle_damage,engineFireProb) = 0.7;
        EGVAR(vehicle_damage,detonationDuringFireProb) = 0.5;
        EGVAR(vehicle_damage,canHaveFireRing) = 0;
        EGVAR(cookoff,canHaveFireJet) = 0;

        class EGVAR(interaction,anims) {
            class AmmoBox_01_unhide {
                phase = 0;
                positions[] = {"_target selectionPosition ['ammobox_01', 'FireGeometry', 'AveragePoint']"};
                items[] = {"gm_AmmoBox_880Rnd_762x39mm_b_M43_ak47"};
                name = "$STR_DN_gm_AmmoBox_880Rnd_762x39mm_b_M43_ak47";
                text = "$STR_DN_gm_AmmoBox_880Rnd_762x39mm_b_M43_ak47";
            };
            class AmmoBox_02_unhide {
                phase = 0;
                positions[] = {"_target selectionPosition ['ammobox_02', 'FireGeometry', 'AveragePoint']"};
                items[] = {"gm_AmmoBox_880Rnd_762x39mm_b_M43_ak47"};
                name = "$STR_DN_gm_AmmoBox_880Rnd_762x39mm_b_M43_ak47";
                text = "$STR_DN_gm_AmmoBox_880Rnd_762x39mm_b_M43_ak47";
            };
            class AmmoBox_03_unhide {
                phase = 0;
                positions[] = {"_target selectionPosition ['ammobox_03', 'FireGeometry', 'AveragePoint']"};
                items[] = {"gm_AmmoBox_880Rnd_762x39mm_b_M43_ak47"};
                name = "$STR_DN_gm_AmmoBox_880Rnd_762x39mm_b_M43_ak47";
                text = "$STR_DN_gm_AmmoBox_880Rnd_762x39mm_b_M43_ak47";
            };
            class AmmoBox_04_unhide {
                phase = 0;
                positions[] = {"_target selectionPosition ['ammobox_04', 'FireGeometry', 'AveragePoint']"};
                items[] = {"gm_AmmoBox_880Rnd_762x39mm_b_M43_ak47"};
                name = "$STR_DN_gm_AmmoBox_880Rnd_762x39mm_b_M43_ak47";
                text = "$STR_DN_gm_AmmoBox_880Rnd_762x39mm_b_M43_ak47";
            };
            class AmmoBox_05_unhide {
                phase = 0;
                positions[] = {"_target selectionPosition ['ammobox_05', 'FireGeometry', 'AveragePoint']"};
                items[] = {"gm_AmmoBox_880Rnd_762x39mm_b_M43_ak47"};
                name = "$STR_DN_gm_AmmoBox_880Rnd_762x39mm_b_M43_ak47";
                text = "$STR_DN_gm_AmmoBox_880Rnd_762x39mm_b_M43_ak47";
            };
            class AmmoBox_06_unhide {
                phase = 0;
                positions[] = {"_target selectionPosition ['ammobox_06', 'FireGeometry', 'AveragePoint']"};
                items[] = {"gm_AmmoBox_880Rnd_762x39mm_b_M43_ak47"};
                name = "$STR_DN_gm_AmmoBox_880Rnd_762x39mm_b_M43_ak47";
                text = "$STR_DN_gm_AmmoBox_880Rnd_762x39mm_b_M43_ak47";
            };
            class AmmoBox_07_unhide {
                phase = 0;
                positions[] = {"_target selectionPosition ['ammobox_07', 'FireGeometry', 'AveragePoint']"};
                items[] = {"gm_AmmoBox_wood_04_empty"};
                name = "$STR_DN_gm_AmmoBox_wood_04_base";
                text = "$STR_DN_gm_AmmoBox_wood_04_base";
            };
        };
    };

    class gm_btr60pb_base: gm_btr60_base {
        EGVAR(vehicle_damage,hullDetonationProb) = 0;
        EGVAR(vehicle_damage,turretDetonationProb) = 0.2;
        EGVAR(vehicle_damage,engineDetonationProb) = 0.2;
        EGVAR(vehicle_damage,hullFireProb) = 0.2;
        EGVAR(vehicle_damage,turretFireProb) = 0.7;
        EGVAR(vehicle_damage,engineFireProb) = 0.7;
        EGVAR(vehicle_damage,detonationDuringFireProb) = 0.5;
        EGVAR(vehicle_damage,canHaveFireRing) = 0;
        EGVAR(cookoff,canHaveFireJet) = 0;
    };

    class gm_ot64_base: gm_wheeled_APC_base {
        EGVAR(vehicle_damage,hullDetonationProb) = 0;
        EGVAR(vehicle_damage,turretDetonationProb) = 0.2;
        EGVAR(vehicle_damage,engineDetonationProb) = 0.2;
        EGVAR(vehicle_damage,hullFireProb) = 0.2;
        EGVAR(vehicle_damage,turretFireProb) = 0.7;
        EGVAR(vehicle_damage,engineFireProb) = 0.7;
        EGVAR(vehicle_damage,detonationDuringFireProb) = 0.5;
        EGVAR(vehicle_damage,canHaveFireRing) = 0;
        EGVAR(cookoff,canHaveFireJet) = 0;
    };

    class gm_ural375d_base: gm_wheeled_truck_base {
        EGVAR(refuel,fuelCapacity) = 360;

        class EGVAR(interaction,anims) {
            class AmmoBox_01_unhide {
                phase = 0;
                positions[] = {{-0.55, 1.83, 0.7}};
                items[] = {"gm_AmmoBox_880Rnd_762x39mm_b_M43_ak47"};
                name = "$STR_DN_gm_AmmoBox_880Rnd_762x39mm_b_M43_ak47";
                text = "$STR_DN_gm_AmmoBox_880Rnd_762x39mm_b_M43_ak47";
                distance = 2.5;
            };
            class AmmoBox_02_unhide {
                phase = 0;
                positions[] = {{0, 1.83, 0.7}};
                items[] = {"gm_AmmoBox_880Rnd_762x39mm_b_M43_ak47"};
                name = "$STR_DN_gm_AmmoBox_880Rnd_762x39mm_b_M43_ak47";
                text = "$STR_DN_gm_AmmoBox_880Rnd_762x39mm_b_M43_ak47";
                distance = 3;
            };
            class AmmoBox_03_unhide {
                phase = 0;
                positions[] = {{0.55, 1.83, 0.7}};
                items[] = {"gm_AmmoBox_880Rnd_762x39mm_b_M43_ak47"};
                name = "$STR_DN_gm_AmmoBox_880Rnd_762x39mm_b_M43_ak47";
                text = "$STR_DN_gm_AmmoBox_880Rnd_762x39mm_b_M43_ak47";
                distance = 2.5;
            };
            class AmmoBox_04_unhide {
                phase = 0;
                positions[] = {{-0.45, 1.83, 0.7}};
                items[] = {"gm_AmmoBox_wood_04_empty"};
                name = "$STR_DN_gm_AmmoBox_wood_04_base";
                text = "$STR_DN_gm_AmmoBox_wood_04_base";
                distance = 2.5;
            };
        };
    };
    class gm_ural375d_mlrs_base: gm_ural375d_base {
        EGVAR(overpressure,noReflection) = 1;
        class EGVAR(interaction,anims): EGVAR(interaction,anims) {
            class AmmoBox_01_unhide: AmmoBox_01_unhide {
                positions[] = {{-0.55, 2, 0.5}};
            };
            class AmmoBox_02_unhide: AmmoBox_02_unhide {
                positions[] = {{0, 2, 0.5}};
            };
            class AmmoBox_03_unhide: AmmoBox_03_unhide {
                positions[] = {{0.55, 2, 0.5}};
            };
            class AmmoBox_04_unhide: AmmoBox_04_unhide {
                positions[] = {{-0.45, 2, 0.5}};
            };
        };
    };
    class gm_ural375d_medic_base: gm_ural375d_base {
        class EGVAR(interaction,anims): EGVAR(interaction,anims) {
            class AmmoBox_01_unhide: AmmoBox_01_unhide {
                positions[] = {{-0.55, 2, 0.7}};
            };
            class AmmoBox_02_unhide: AmmoBox_02_unhide {
                positions[] = {{0, 2, 0.7}};
            };
            class AmmoBox_03_unhide: AmmoBox_03_unhide {
                positions[] = {{0.55, 2, 0.7}};
            };
            class AmmoBox_04_unhide: AmmoBox_04_unhide {
                positions[] = {{-0.45, 2, 0.7}};
            };
        };
    };

    class gm_ural4320_base: gm_wheeled_truck_base {
        EGVAR(refuel,fuelCapacity) = 360;

        class EGVAR(interaction,anims) {
            class AmmoBox_01_unhide {
                phase = 0;
                positions[] = {{-0.55, 1.47, 0.7}};
                items[] = {"gm_AmmoBox_880Rnd_762x39mm_b_M43_ak47"};
                name = "$STR_DN_gm_AmmoBox_880Rnd_762x39mm_b_M43_ak47";
                text = "$STR_DN_gm_AmmoBox_880Rnd_762x39mm_b_M43_ak47";
                distance = 2.5;
            };
            class AmmoBox_02_unhide {
                phase = 0;
                positions[] = {{0, 1.47, 0.7}};
                items[] = {"gm_AmmoBox_880Rnd_762x39mm_b_M43_ak47"};
                name = "$STR_DN_gm_AmmoBox_880Rnd_762x39mm_b_M43_ak47";
                text = "$STR_DN_gm_AmmoBox_880Rnd_762x39mm_b_M43_ak47";
                distance = 3;
            };
            class AmmoBox_03_unhide {
                phase = 0;
                positions[] = {{0.55, 1.47, 0.7}};
                items[] = {"gm_AmmoBox_880Rnd_762x39mm_b_M43_ak47"};
                name = "$STR_DN_gm_AmmoBox_880Rnd_762x39mm_b_M43_ak47";
                text = "$STR_DN_gm_AmmoBox_880Rnd_762x39mm_b_M43_ak47";
                distance = 2.5;
            };
            class AmmoBox_04_unhide {
                phase = 0;
                positions[] = {{-0.45, 1.47, 0.7}};
                items[] = {"gm_AmmoBox_wood_04_empty"};
                name = "$STR_DN_gm_AmmoBox_wood_04_base";
                text = "$STR_DN_gm_AmmoBox_wood_04_base";
                distance = 2.5;
            };
        };
    };
    class gm_ural4320_repair_base: gm_ural4320_base {
        class EGVAR(interaction,anims): EGVAR(interaction,anims) {
            class AmmoBox_01_unhide: AmmoBox_01_unhide {
                positions[] = {{-0.55, 1.62, 0.7}};
            };
            class AmmoBox_02_unhide: AmmoBox_02_unhide {
                positions[] = {{0, 1.62, 0.7}};
            };
            class AmmoBox_03_unhide: AmmoBox_03_unhide {
                positions[] = {{0.55, 1.62, 0.7}};
            };
            class AmmoBox_04_unhide: AmmoBox_04_unhide {
                positions[] = {{-0.45, 1.62, 0.7}};
            };
        };
    };
    class gm_ural44202_base: gm_ural4320_base {
        class EGVAR(interaction,anims): EGVAR(interaction,anims) {
            class AmmoBox_01_unhide: AmmoBox_01_unhide {
                positions[] = {{-0.55, 1.37, 0.7}};
            };
            class AmmoBox_02_unhide: AmmoBox_02_unhide {
                positions[] = {{0, 1.37, 0.7}};
            };
            class AmmoBox_03_unhide: AmmoBox_03_unhide {
                positions[] = {{0.55, 1.37, 0.7}};
            };
            class AmmoBox_04_unhide: AmmoBox_04_unhide {
                positions[] = {{-0.45, 1.37, 0.7}};
            };
        };
    };

    class gm_ural4320_reammo_base: gm_ural4320_base {
        EGVAR(rearm,defaultSupply) = 1200;
    };

    class gm_ural4320_refuel_base: gm_ural4320_base {
        EGVAR(refuel,hooks)[] = {{-0.05,-3.6,-0.45}};
        EGVAR(refuel,fuelCargo) = 10000;
    };

    class gm_ural4320_medic_base: gm_ural4320_base {
        EGVAR(medical,medicClass) = 1;
    };


    // WEST

    class gm_k125_base: gm_wheeled_motorcycle_base {
        EGVAR(refuel,fuelCapacity) = 14.5;
    };

    class gm_typ1_base: gm_wheeled_car_base {
        EGVAR(refuel,fuelCapacity) = 47.3;
    };

    class gm_iltis_base: gm_wheeled_car_base {
        EGVAR(refuel,fuelCapacity) = 83;
    };


    class gm_u1300l_base: gm_wheeled_truck_base {
        EGVAR(refuel,fuelCapacity) = 90;
    };

    class gm_u1300l_medic_base: gm_u1300l_base {
        EGVAR(medical,medicClass) = 1;
    };

    class gm_kat1_base: gm_wheeled_truck_base {
        EGVAR(refuel,fuelCapacity) = 270;
    };

    class gm_kat1_451_base;
    class gm_kat1_451_refuel_base: gm_kat1_451_base {
        gm_InsigniasDefaultHazardSign = "gm_insignia_hazard_fuelF54_wht";
        EGVAR(refuel,fuelCargo) = 4600;
        EGVAR(refuel,hooks)[] = {{-0.60,-3.44,-0.919689},{0.60,-3.44,-0.919689}};
    };

    class gm_kat1_454_base;
    class gm_kat1_454_cargo_base: gm_kat1_454_base {
        EGVAR(cargo,space) = 10;
    };

    class gm_fuchs_base: gm_wheeled_APC_base {
        EGVAR(refuel,fuelCapacity) = 390;
        EGVAR(vehicle_damage,hullDetonationProb) = 0;
        EGVAR(vehicle_damage,turretDetonationProb) = 0;
        EGVAR(vehicle_damage,engineDetonationProb) = 0.1;
        EGVAR(vehicle_damage,hullFireProb) = 0.2;
        EGVAR(vehicle_damage,turretFireProb) = 0.05;
        EGVAR(vehicle_damage,engineFireProb) = 0.5;
        EGVAR(vehicle_damage,detonationDuringFireProb) = 0.5;
        EGVAR(vehicle_damage,canHaveFireRing) = 0;
        EGVAR(cookoff,canHaveFireJet) = 0;
    };

    class gm_luchs_base: gm_wheeled_APC_base {
        EGVAR(refuel,fuelCapacity) = 500;
        EGVAR(cookoff,cookoffSelections)[] = {"mainturret_hatch", "commanderturret_hatch"};
        EGVAR(vehicle_damage,hullDetonationProb) = 0;
        EGVAR(vehicle_damage,turretDetonationProb) = 0.2;
        EGVAR(vehicle_damage,engineDetonationProb) = 0.2;
        EGVAR(vehicle_damage,hullFireProb) = 0.2;
        EGVAR(vehicle_damage,turretFireProb) = 0.4;
        EGVAR(vehicle_damage,engineFireProb) = 0.5;
        EGVAR(vehicle_damage,detonationDuringFireProb) = 0.5;
        EGVAR(vehicle_damage,canHaveFireRing) = 0;
        EGVAR(cookoff,canHaveFireJet) = 1;
    };


    // T R A C K E D

    class Tank_F;
    class gm_tracked_base: Tank_F {
        EGVAR(cargo,hasCargo) = 1;
        EGVAR(cargo,space) = 4;
        EGVAR(refuel,canReceive) = 1;
    };
    class gm_tracked_APC_base: gm_tracked_base {
        EGVAR(vehicle_damage,hullDetonationProb) = 0.03;
        EGVAR(vehicle_damage,turretDetonationProb) = 0.03;
        EGVAR(vehicle_damage,engineDetonationProb) = 0.03;
        EGVAR(vehicle_damage,hullFireProb) = 0.3;
        EGVAR(vehicle_damage,turretFireProb) = 0.1;
        EGVAR(vehicle_damage,engineFireProb) = 0.2;
        EGVAR(vehicle_damage,detonationDuringFireProb) = 0.2;
        EGVAR(vehicle_damage,canHaveFireRing) = 0.1;
    };
    class gm_tracked_Tank_base: gm_tracked_base {
        EGVAR(vehicle_damage,hullDetonationProb) = 0.01;
        EGVAR(vehicle_damage,turretDetonationProb) = 0.01;
        EGVAR(vehicle_damage,engineDetonationProb) = 0.01;
        EGVAR(vehicle_damage,hullFireProb) = 0.2;
        EGVAR(vehicle_damage,turretFireProb) = 0.1;
        EGVAR(vehicle_damage,engineFireProb) = 0.2;
        EGVAR(vehicle_damage,detonationDuringFireProb) = 0.2;
        EGVAR(vehicle_damage,canHaveFireRing) = 0.1;
    };

    // EAST
    class gm_bmp1_base: gm_tracked_APC_base {
        EGVAR(map,vehicleLightColor)[] = {0,1,0,0.1};
        EGVAR(refuel,fuelCapacity) = 460;
        EGVAR(cookoff,cookoffSelections)[] = {"mainturret_hatch","commanderturret_hatch"};
    };
    class gm_bmp1sp2_base: gm_bmp1_base {
        class EGVAR(interaction,anims) {
            class AmmoBox_01_unhide {
                phase = 0;
                positions[] = {{-1.2, -2.52, -1.2}};
                items[] = {"gm_AmmoBox_880Rnd_762x39mm_b_M43_ak47"};
                name = "$STR_DN_gm_AmmoBox_880Rnd_762x39mm_b_M43_ak47";
                text = "$STR_DN_gm_AmmoBox_880Rnd_762x39mm_b_M43_ak47";
            };
            class AmmoBox_02_unhide {
                phase = 0;
                positions[] = {{-1.3, -2, -1.2}};
                items[] = {"gm_AmmoBox_880Rnd_762x39mm_b_M43_ak47"};
                name = "$STR_DN_gm_AmmoBox_880Rnd_762x39mm_b_M43_ak47";
                text = "$STR_DN_gm_AmmoBox_880Rnd_762x39mm_b_M43_ak47";
            };
            class AmmoBox_03_unhide {
                phase = 0;
                positions[] = {{-1.35, -1.43, -1.2}};
                items[] = {"gm_AmmoBox_880Rnd_762x39mm_b_M43_ak47"};
                name = "$STR_DN_gm_AmmoBox_880Rnd_762x39mm_b_M43_ak47";
                text = "$STR_DN_gm_AmmoBox_880Rnd_762x39mm_b_M43_ak47";
            };
            class AmmoBox_04_unhide {
                phase = 0;
                positions[] = {{1.2, -2.52, -1.2}};
                items[] = {"gm_AmmoBox_880Rnd_762x39mm_b_M43_ak47"};
                name = "$STR_DN_gm_AmmoBox_880Rnd_762x39mm_b_M43_ak47";
                text = "$STR_DN_gm_AmmoBox_880Rnd_762x39mm_b_M43_ak47";
            };
            class AmmoBox_05_unhide {
                phase = 0;
                positions[] = {{1.3, -2, -1.2}};
                items[] = {"gm_AmmoBox_880Rnd_762x39mm_b_M43_ak47"};
                name = "$STR_DN_gm_AmmoBox_880Rnd_762x39mm_b_M43_ak47";
                text = "$STR_DN_gm_AmmoBox_880Rnd_762x39mm_b_M43_ak47";
            };
            class AmmoBox_06_unhide {
                phase = 0;
                positions[] = {{1.35, -1.43, -1.2}};
                items[] = {"gm_AmmoBox_880Rnd_762x39mm_b_M43_ak47"};
                name = "$STR_DN_gm_AmmoBox_880Rnd_762x39mm_b_M43_ak47";
                text = "$STR_DN_gm_AmmoBox_880Rnd_762x39mm_b_M43_ak47";
            };
            class AmmoBox_07_unhide {
                phase = 0;
                positions[] = {{-1.45, 0.1, -1.3}};
                items[] = {"gm_AmmoBox_880Rnd_762x39mm_b_M43_ak47"};
                name = "$STR_DN_gm_AmmoBox_880Rnd_762x39mm_b_M43_ak47";
                text = "$STR_DN_gm_AmmoBox_880Rnd_762x39mm_b_M43_ak47";
            };
            class AmmoBox_08_unhide {
                phase = 0;
                positions[] = {{-1.45, 2, -1.3}};
                items[] = {"gm_AmmoBox_880Rnd_762x39mm_b_M43_ak47"};
                name = "$STR_DN_gm_AmmoBox_880Rnd_762x39mm_b_M43_ak47";
                text = "$STR_DN_gm_AmmoBox_880Rnd_762x39mm_b_M43_ak47";
            };
            class AmmoBox_09_unhide {
                phase = 0;
                positions[] = {{1.45, 2, -1.3}};
                items[] = {"gm_AmmoBox_880Rnd_762x39mm_b_M43_ak47"};
                name = "$STR_DN_gm_AmmoBox_880Rnd_762x39mm_b_M43_ak47";
                text = "$STR_DN_gm_AmmoBox_880Rnd_762x39mm_b_M43_ak47";
            };
        };
    };

    class gm_pt76_base: gm_tracked_Tank_base {
        EGVAR(refuel,fuelCapacity) = 250;

        class EGVAR(interaction,anims) {
            class AmmoBox_01_unhide {
                phase = 0;
                positions[] = {{0.08, -1.75, -1}};
                items[] = {"gm_AmmoBox_880Rnd_762x39mm_b_M43_ak47"};
                name = "$STR_DN_gm_AmmoBox_880Rnd_762x39mm_b_M43_ak47";
                text = "$STR_DN_gm_AmmoBox_880Rnd_762x39mm_b_M43_ak47";
                distance = 2.5;
            };
            class AmmoBox_02_unhide {
                phase = 0;
                positions[] = {{0.08, -1.38, -1}};
                items[] = {"gm_AmmoBox_880Rnd_762x39mm_b_M43_ak47"};
                name = "$STR_DN_gm_AmmoBox_880Rnd_762x39mm_b_M43_ak47";
                text = "$STR_DN_gm_AmmoBox_880Rnd_762x39mm_b_M43_ak47";
                distance = 2.5;
            };
            class AmmoBox_03_unhide {
                phase = 0;
                positions[] = {{0.08, -2.15, -1}};
                items[] = {"gm_AmmoBox_wood_04_empty"};
                name = "$STR_DN_gm_AmmoBox_wood_04_base";
                text = "$STR_DN_gm_AmmoBox_wood_04_base";
                distance = 2.5;
            };
        };
    };

    class gm_t55_base: gm_tracked_Tank_base {
        EGVAR(refuel,fuelCapacity) = 900; // only with external tanks
        EGVAR(cookoff,cookoffSelections)[] = {"machinegunturret_01_hatch","commanderturret_hatch"};
    };

    class gm_zsu234_base: gm_tracked_Tank_base {
        EGVAR(refuel,fuelCapacity) = 812;
    };

    class gm_tracked_Artillery_base;
    class gm_2s1_base: gm_tracked_Artillery_base {
        class EGVAR(interaction,anims) {
            class AmmoBox_01_unhide {
                phase = 0;
                // Rotate interactions with turret rotation
                positions[] = {"[0, -1.3, 0] vectorAdd ([[0, -1.1, -0.35], [0, 0, 1], deg (_target animationPhase 'mainturret_trav_anim')] call CBA_fnc_vectRotate3D)"};
                items[] = {"gm_AmmoBox_wood_04_empty"};
                name = "$STR_DN_gm_AmmoBox_wood_04_base";
                text = "$STR_DN_gm_AmmoBox_wood_04_base";
                distance = 2.5;
            };
        };
    };

    // WEST
    class gm_Leopard1_base;
    class gm_Leopard1a0_base: gm_Leopard1_base {
        EGVAR(refuel,fuelCapacity) = 955;
        EGVAR(cookoff,cookoffSelections)[] = {"mainturret_hatch_1","commanderturret_hatch"};
    };

    class gm_Leopard1a1_base: gm_Leopard1a0_base {
        class EGVAR(interaction,anims) {
            class AmmoBox_01_unhide {
                phase = 0;
                // Rotate interactions with turret rotation
                positions[] = {"[0, -0.6, 0] vectorAdd ([[0.7, -2, -0.6], [0, 0, 1], deg (_target animationPhase 'mainturret_trav_anim')] call CBA_fnc_vectRotate3D)"};
                items[] = {"gm_AmmoBox_wood_04_empty"};
                name = "$STR_DN_gm_AmmoBox_wood_04_base";
                text = "$STR_DN_gm_AmmoBox_wood_04_base";
            };
            class AmmoBox_02_unhide {
                phase = 0;
                // Rotate interactions with turret rotation
                positions[] = {"[0, -0.6, 0] vectorAdd ([[-0.3, -1.95, -0.6], [0, 0, 1], deg (_target animationPhase 'mainturret_trav_anim')] call CBA_fnc_vectRotate3D)"};
                items[] = {"gm_AmmoBox_wood_04_empty"};
                name = "$STR_DN_gm_AmmoBox_wood_04_base";
                text = "$STR_DN_gm_AmmoBox_wood_04_base";
            };
        };
    };

    class gm_Gepard_base: gm_Leopard1_base {
        EGVAR(refuel,fuelCapacity) = 985;
    };

    class gm_BPz2_base;
    class gm_BPz2a0_base: gm_BPz2_base {
        EGVAR(refuel,fuelCapacity) = 1160;
        EGVAR(cookoff,cookoffSelections)[] = {"commanderturret_hatch"};
    };

    class gm_marder1_base: gm_tracked_APC_base {
        EGVAR(refuel,fuelCapacity) = 652;
        EGVAR(cookoff,cookoffSelections)[] = {"observerturret_hatch", "commanderturret_hatch"};
    };

    class gm_m113_base: gm_tracked_APC_base {
        EGVAR(refuel,fuelCapacity) = 360;
    };

    class gm_m113a1g_base;
    class gm_m113a1g_medic_base: gm_m113a1g_base {
        EGVAR(medical,medicClass) = 1;
    };

    class gm_m113a1dk_base;
    class gm_m113a1dk_medic_base: gm_m113a1dk_base {
        EGVAR(medical,medicClass) = 1;
    };

    // If any hard edits are made, move to an appropriate subcomponent
    // fastroping not needed unlike RHS as no hard edits are made here
    // H E L I C O P T E R S

    class Helicopter_Base_F;
    class Helicopter_Base_H: Helicopter_Base_F {};
    class gm_helicopter_base: Helicopter_Base_H {};

    // WEST

    class gm_bo105_base: gm_helicopter_base {
        EGVAR(map,vehicleLightColor)[] = {1,0,0,0.1};
        EGVAR(refuel,fuelCapacity) = 3700;
        EGVAR(fastroping,enabled) = 0;

        class UserActions {
            class openDoor_L {
                displayNameDefault = "$STR_a3_cfgvehicles_useractions_openldoor0";
                displayName = "$STR_a3_cfgvehicles_useractions_openldoor0";
                position = "";
                radius = 2.7;
                onlyForPlayer = 1;
                condition = QUOTE((this animationSourcePhase 'door_2_1_unhide' > 0.5) && (this doorPhase 'door_2_1_source' < 0.5) && {alive this} && {!(this getVariable [ARR_2(QQEGVAR(fastroping,doorsLocked),false)])});
                statement = "this animateDoor ['door_2_1_source',1]";
            };
            class openDoor_R: openDoor_L {
                displayNameDefault = "$STR_a3_cfgvehicles_useractions_openrdoor0";
                displayName = "$STR_a3_cfgvehicles_useractions_openrdoor0";
                condition = QUOTE((this animationSourcePhase 'door_2_2_unhide' > 0.5) && (this doorPhase 'door_2_2_source' < 0.5) && {alive this} && {!(this getVariable [ARR_2(QQEGVAR(fastroping,doorsLocked),false)])});
                statement = "this animateDoor ['door_2_2_source',1]";
            };

            class closeDoor_L {
                displayNameDefault = "$STR_a3_cfgvehicles_useractions_closeldoor0";
                displayName = "$STR_a3_cfgvehicles_useractions_closeldoor0";
                position = "";
                radius = 2.7;
                onlyForPlayer = 1;
                condition = QUOTE((this animationSourcePhase 'door_2_1_unhide' > 0.5) && (this doorPhase 'door_2_1_source' > 0.5) && {alive this} && {!(this getVariable [ARR_2(QQEGVAR(fastroping,doorsLocked),false)])});
                statement = "this animateDoor ['door_2_1_source',0]";
            };
            class closeDoor_R: closeDoor_L {
                displayNameDefault = "$STR_a3_cfgvehicles_useractions_closerdoor0";
                displayName = "$STR_a3_cfgvehicles_useractions_closerdoor0";
                condition = QUOTE((this animationSourcePhase 'door_2_2_unhide' > 0.5) && (this doorPhase 'door_2_2_source' > 0.5) && {alive this} && {!(this getVariable [ARR_2(QQEGVAR(fastroping,doorsLocked),false)])});
                statement = "this animateDoor ['door_2_2_source',0]";
            };
        };
    };
    class gm_bo105p1m_vbh_base;
    class gm_bo105p1m_vbh_swooper_base: gm_bo105p1m_vbh_base {
        EGVAR(fastroping,enabled) = 1;
        EGVAR(fastroping,ropeOrigins)[] = {{-1.34,0.695,-0.0757732},{1.34,0.695,-0.0973468}};
        EGVAR(fastroping,onCut) = QFUNC(onCut);
        EGVAR(fastroping,onCutRopes) = QFUNC(onCutRopes);
        EGVAR(fastroping,onDeployRopes) = QFUNC(onDeployRopes);
        EGVAR(fastroping,onPrepare) = QFUNC(onPrepare);
    };

    class gm_ch53_base: gm_helicopter_base {
        EGVAR(map,vehicleLightColor)[] = {1,0,0,0.1};
        EGVAR(fastroping,enabled) = 1;
        EGVAR(fastroping,ropeOrigins)[] = {{0.6, -5.2, -0.8},{-0.6, -5.2, -0.8}};
        EGVAR(refuel,fuelCapacity) = 3850;
        EGVAR(fastroping,onCut) = QFUNC(onCut);
        EGVAR(fastroping,onPrepare) = QFUNC(onPrepare);
    };

    class gm_ch53g_base: gm_ch53_base {
        EGVAR(refuel,fuelCapacity) = 8770;
    };

    // EAST
    class gm_mi2_base: gm_helicopter_base {
        EGVAR(map,vehicleLightColor)[] = {1,0,0,0.1};
        EGVAR(fastroping,enabled) = 1;
        EGVAR(fastroping,ropeOrigins)[] = {{-1.17969,0.0205078,-0.178533}};
        EGVAR(refuel,fuelCapacity) = 600;
        EGVAR(fastroping,onCut) = QFUNC(onCut);
        EGVAR(fastroping,onPrepare) = QFUNC(onPrepare);
    };


    class gm_mi2sr_base: gm_mi2_base {
        EGVAR(refuel,fuelCapacity) = 1076;
    };

    class gm_mi2p_base: gm_mi2_base {
        EGVAR(refuel,fuelCapacity) = 1076;
    };

    class gm_mi2ch_base: gm_mi2_base {
        EGVAR(refuel,fuelCapacity) = 1076;
    };

    class gm_mi2platan_base: gm_mi2_base {
        EGVAR(refuel,fuelCapacity) = 1076;
    };

    // P L A N E S

    class Plane_Base_F;
    class gm_plane_base: Plane_Base_F {
        EGVAR(refuel,canReceive) = 1;
        EGVAR(cargo,hasCargo) = 1;
        EGVAR(cargo,space) = 4;
    };

    // EAST
    class gm_l410_base: gm_plane_base {
        EGVAR(refuel,fuelCapacity) = 1300;
    };

    // WEST
    class gm_do28d2_base: gm_plane_base {
        EGVAR(refuel,fuelCapacity) = 894; // source mondkalb
    };

    class gm_do28d2_medevac_base: gm_do28d2_base {
        EGVAR(medical,medicClass) = 1;
    };
};
