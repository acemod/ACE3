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
    };

    class gm_btr60_base: gm_wheeled_APC_base {
        EGVAR(refuel,fuelCapacity) = 290;
        EGVAR(cookoff,cookoffSelections)[] = {"commanderturret_hatch"};
    };

    class gm_ural4320_base: gm_wheeled_truck_base {
        EGVAR(refuel,fuelCapacity) = 360;
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
    };

    class gm_luchs_base: gm_wheeled_APC_base {
        EGVAR(refuel,fuelCapacity) = 500;
        EGVAR(cookoff,cookoffSelections)[] = {"mainturret_hatch", "commanderturret_hatch"};
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

    class gm_pt76_base: gm_tracked_Tank_base {
        EGVAR(refuel,fuelCapacity) = 250;
    };

    class gm_t55_base: gm_tracked_Tank_base {
        EGVAR(refuel,fuelCapacity) = 900; // only with external tanks
        EGVAR(cookoff,cookoffSelections)[] = {"machinegunturret_01_hatch","commanderturret_hatch"};
    };

    class gm_zsu234_base: gm_tracked_Tank_base {
        EGVAR(refuel,fuelCapacity) = 812;
    };

    // WEST
    class gm_Leopard1_base;
    class gm_Leopard1a0_base: gm_Leopard1_base {
        EGVAR(refuel,fuelCapacity) = 955;
        EGVAR(cookoff,cookoffSelections)[] = {"mainturret_hatch_1","commanderturret_hatch"};
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
    class Helicopter_Base_H: Helicopter_Base_F {
        class EventHandlers;
    };
    class gm_helicopter_base: Helicopter_Base_H {};

    // WEST

    class gm_bo105_base: gm_helicopter_base {
        EGVAR(map,vehicleLightColor)[] = {1,0,0,0.1};
        EGVAR(refuel,fuelCapacity) = 3700;
        EGVAR(fastroping,enabled) = 0;

        // TODO: stringtables
        class UserActions {
                class openDoor_L {
                    displayNameDefault = "Open left Door";
                    displayName = "Open left Door";
                    position = "";
                    radius = 2.7;
                    onlyForPlayer = 1;
                    condition = QUOTE((this animationSourcePhase 'door_2_1_unhide' > 0.5) && (this doorPhase 'door_2_1_source' < 0.5) && {alive this} && {!(this getVariable [ARR_2(QUOTE(QEGVAR(fastroping,doorsLocked)),false)])});
                    statement = "this animateDoor ['door_2_1_source',1]";
                };

                class openDoor_R: openDoor_L {
                    displayNameDefault = "Open right Door";
                    displayName = "Open right Door";
                    condition = QUOTE((this animationSourcePhase 'door_2_2_unhide' > 0.5) && (this doorPhase 'door_2_2_source' < 0.5) && {alive this} && {!(this getVariable [ARR_2(QUOTE(QEGVAR(fastroping,doorsLocked)),false)])});
                    statement = "this animateDoor ['door_2_2_source',1]";
                };

                class closeDoor_L {
                    displayNameDefault = "Close left Door";
                    displayName = "Close left Door";
                    position = "";
                    radius = 2.7;
                    onlyForPlayer = 1;
                    condition = QUOTE((this animationSourcePhase 'door_2_1_unhide' > 0.5) && (this doorPhase 'door_2_1_source' > 0.5) && {alive this} && {!(this getVariable [ARR_2(QUOTE(QEGVAR(fastroping,doorsLocked)),false)])});
                    statement = "this animateDoor ['door_2_1_source',0]";
                };

                class closeDoor_R: closeDoor_L {
                    displayNameDefault = "Close right Door";
                    displayName = "Close right Door";
                    condition = QUOTE((this animationSourcePhase 'door_2_2_unhide' > 0.5) && (this doorPhase 'door_2_2_source' > 0.5) && {alive this} && {!(this getVariable [ARR_2(QUOTE(QEGVAR(fastroping,doorsLocked)),false)])});
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
