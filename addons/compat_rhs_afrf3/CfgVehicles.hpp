class CfgVehicles {
    class Tank_F;
    class LandVehicle;
    class Car: LandVehicle {
        class ACE_Actions {
            class ACE_MainActions {};
        };
    };
    class Car_F: Car {};
    class Wheeled_APC_F: Car_F {};

    class rhs_tank_base: Tank_F {
        EGVAR(refuel,fuelCapacity) = 1200;
        EGVAR(vehicle_damage,hullDetonationProb) = 0.8;
        EGVAR(vehicle_damage,turretDetonationProb) = 0.2;
        EGVAR(vehicle_damage,engineDetonationProb) = 0.2;
        EGVAR(vehicle_damage,hullFireProb) = 0.8;
        EGVAR(vehicle_damage,turretFireProb) = 0.2;
        EGVAR(vehicle_damage,engineFireProb) = 0.5;
        EGVAR(vehicle_damage,detonationDuringFireProb) = 0.2;
    };
    class rhs_btr_base: Wheeled_APC_F {
        EGVAR(map,vehicleLightColor)[] = {0,0,1,0.1};
        EGVAR(refuel,fuelCapacity) = 300;
        EGVAR(vehicle_damage,hullDetonationProb) = 0.2;
        EGVAR(vehicle_damage,turretDetonationProb) = 0.2;
        EGVAR(vehicle_damage,engineDetonationProb) = 0;
        EGVAR(vehicle_damage,hullFireProb) = 0.7;
        EGVAR(vehicle_damage,turretFireProb) = 0.7;
        EGVAR(vehicle_damage,engineFireProb) = 0.7;
        EGVAR(vehicle_damage,detonationDuringFireProb) = 0.5;

        class EGVAR(interaction,anims) {};
    };

    class rhs_infantry_msv_base;
    class rhs_pilot_base: rhs_infantry_msv_base {
        ace_gforcecoef = 0.55;
    };

    class O_Plane_CAS_02_F;
    class RHS_su25_base: O_Plane_CAS_02_F {
        EGVAR(refuel,fuelCapacity) = 3600;
    };

    class Heli_Light_02_base_F;
    class RHS_Mi8_base: Heli_Light_02_base_F {
        EGVAR(map,vehicleLightColor)[] = {1,0,0,0.1};
        EGVAR(refuel,fuelCapacity) = 3700;
    };
    class Heli_Attack_02_base_F;
    class RHS_Ka52_base: Heli_Attack_02_base_F {
        EGVAR(refuel,fuelCapacity) = 1870;
    };

    class RHS_Mi24_base: Heli_Attack_02_base_F {
        EGVAR(map,vehicleLightColor)[] = {1,0,0,0.1};
        EGVAR(refuel,fuelCapacity) = 1851;
    };

    class rhs_t80b: rhs_tank_base {
        EGVAR(refuel,fuelCapacity) = 1100;
        EGVAR(vehicle_damage,canHaveFireRing) = 1;
    };
    class Truck_F: Car_F {};
    class RHS_Ural_BaseTurret: Truck_F {
        EGVAR(refuel,fuelCapacity) = 360;
    };

    class RHS_BM21_MSV_01: RHS_Ural_BaseTurret {
        EGVAR(overpressure,noReflection) = 1;
    };

    class RHS_Ural_Base: RHS_Ural_BaseTurret {};
    class RHS_Ural_MSV_Base: RHS_Ural_Base {};
    class RHS_Ural_Support_MSV_Base_01: RHS_Ural_MSV_Base {};
    class RHS_Ural_Fuel_MSV_01: RHS_Ural_Support_MSV_Base_01 {
        EGVAR(refuel,hooks)[] = {{-0.05,-3.6,-0.45}};
        EGVAR(refuel,fuelCargo) = 10000;
    };
    class RHS_Ural_Ammo_Base: RHS_Ural_Base {
        EGVAR(rearm,defaultSupply) = 1200;
    };

    class rhs_kraz255b1_base;
    class rhs_kraz255b1_fuel_base: rhs_kraz255b1_base {
        EGVAR(refuel,hooks)[] = {{-0.05,-3.6,-0.45}};
        EGVAR(refuel,fuelCargo) = 10000;
    };

    class rhs_truck: Truck_F {
        EGVAR(refuel,fuelCapacity) = 210;
    };

    class rhs_gaz66_vmf;
    class rhs_gaz66_ammo_base: rhs_gaz66_vmf {
        EGVAR(rearm,defaultSupply) = 1200;
    };

    class rhs_kamaz5350;
    class rhs_kamaz5350_ammo_base: rhs_kamaz5350 {
        EGVAR(rearm,defaultSupply) = 1200;
    };

    class MRAP_02_base_F;
    class rhs_tigr_base: MRAP_02_base_F {
        EGVAR(refuel,fuelCapacity) = 138;
    };

    class Offroad_01_base_f;
    class RHS_UAZ_Base: Offroad_01_base_f {
        EGVAR(refuel,fuelCapacity) = 78;
    };

    class APC_Tracked_02_base_F;
    class rhs_zsutank_base: APC_Tracked_02_base_F {
        EGVAR(refuel,fuelCapacity) = 515;
        EGVAR(vehicle_damage,hullDetonationProb) = 0;
        EGVAR(vehicle_damage,turretDetonationProb) = 0;
        EGVAR(vehicle_damage,engineDetonationProb) = 0.2;
        EGVAR(vehicle_damage,hullFireProb) = 0.7;
        EGVAR(vehicle_damage,turretFireProb) = 0.7;
        EGVAR(vehicle_damage,engineFireProb) = 0.8;
        EGVAR(vehicle_damage,detonationDuringFireProb) = 0.8;
        EGVAR(vehicle_damage,canHaveFireRing) = 1;
    };

    class rhs_btr60_base: rhs_btr_base {
        EGVAR(refuel,fuelCapacity) = 290;

        class EGVAR(interaction,anims): EGVAR(interaction,anims) {
            class crate_l1_unhide {
                positions[] = {{-1.1, 2, -0.3}};
                items[] = {"rhs_3Ya40_1_single"};
                name = "3Ya40-1 Crate";
                text = "3Ya40-1 Crate";
            };
            class crate_l2_unhide {
                positions[] = {{-1.1, 1.05, -0.3}};
                items[] = {"rhs_3Ya40_1_single"};
                name = "3Ya40-1 Crate";
                text = "3Ya40-1 Crate";
            };
            class crate_l3_unhide {
                positions[] = {{-1.1, -1.1, -0.3}};
                items[] = {"rhs_3Ya40_1_single"};
                name = "3Ya40-1 Crate";
                text = "3Ya40-1 Crate";
            };
            class crate_r1_unhide {
                positions[] = {{1.1, 1.93, -0.3}};
                items[] = {"rhs_3Ya40_1_single"};
                name = "3Ya40-1 Crate";
                text = "3Ya40-1 Crate";
            };
            class crate_r2_unhide {
                positions[] = {{1.1, 0.25, -0.3}};
                items[] = {"rhs_3Ya40_1_single"};
                name = "3Ya40-1 Crate";
                text = "3Ya40-1 Crate";
            };
            class crate_r3_unhide {
                positions[] = {{1.1, -1.1, -0.3}};
                items[] = {"rhs_3Ya40_1_single"};
                name = "3Ya40-1 Crate";
                text = "3Ya40-1 Crate";
            };
        };
    };
    class rhs_btr70_vmf: rhs_btr_base {
        EGVAR(refuel,fuelCapacity) = 350;

        class ace_viewports {
            class view_0 {
                camLocation[] = {0.478394, -0.575, -0.145};
                camAttach = 90;
                compartments[] = {"Compartment1"};
                roles[] = {"cargo"};
            };
            class view_1 {
                camLocation[] = {-1.38184, -0.575, -0.145};
                camAttach = -90;
                compartments[] = {"Compartment1"};
                roles[] = {"cargo"};
            };
        };

        class EGVAR(interaction,anims): EGVAR(interaction,anims) {
            class crate_l1_unhide {
                positions[] = {{-1.7, 0.55, -0.4}};
                items[] = {"rhs_3Ya40_1_single"};
                name = "3Ya40-1 Crate";
                text = "3Ya40-1 Crate";
            };
            class crate_l2_unhide {
                positions[] = {{-1.7, -0.95, -0.4}};
                items[] = {"rhs_3Ya40_1_single"};
                name = "3Ya40-1 Crate";
                text = "3Ya40-1 Crate";
            };
            class crate_l3_unhide {
                positions[] = {{-1.7, -1.45, -0.4}};
                items[] = {"rhs_3Ya40_1_single"};
                name = "3Ya40-1 Crate";
                text = "3Ya40-1 Crate";
            };
            class crate_l4_unhide {
                positions[] = {{-1.7, -2.7, -0.4}};
                items[] = {"rhs_3Ya40_1_single"};
                name = "3Ya40-1 Crate";
                text = "3Ya40-1 Crate";
            };
            class crate_r1_unhide {
                positions[] = {{0.8, 1, -0.4}};
                items[] = {"rhs_3Ya40_1_single"};
                name = "3Ya40-1 Crate";
                text = "3Ya40-1 Crate";
            };
            class crate_r2_unhide {
                positions[] = {{0.8, 0.12, -0.4}};
                items[] = {"rhs_3Ya40_1_single"};
                name = "3Ya40-1 Crate";
                text = "3Ya40-1 Crate";
            };
            class crate_r3_unhide {
                positions[] = {{0.8, -0.7, -0.4}};
                items[] = {"rhs_3Ya40_1_single"};
                name = "3Ya40-1 Crate";
                text = "3Ya40-1 Crate";
            };
            class crate_r4_unhide {
                positions[] = {{0.8, -1.85, -0.4}};
                items[] = {"rhs_3Ya40_1_single"};
                name = "3Ya40-1 Crate";
                text = "3Ya40-1 Crate";
            };
        };
    };
    class rhs_btr70_msv: rhs_btr70_vmf {};
    class rhs_btr80_msv: rhs_btr70_msv {
        EGVAR(refuel,fuelCapacity) = 300;

        class ace_viewports {
            class view_0 {
                camLocation[] = {0.534424, -0.336914, 0.636819};
                camAttach = 45;
                compartments[] = {"Compartment1"};
                roles[] = {"cargo"};
            };
            class view_1 {
                camLocation[] = {0.760254, -0.459473, 0.526328};
                camAttach = 90;
                compartments[] = {"Compartment1"};
                roles[] = {"cargo"};
            };
            class view_2 {
                camLocation[] = {0.770508, -1.21924, 0.526954};
                camAttach = 90;
                compartments[] = {"Compartment1"};
                roles[] = {"cargo"};
            };
            class view_3 {
                camLocation[] = {-1.13, -1.2085, 0.490339};
                camAttach = -90;
                compartments[] = {"Compartment1"};
                roles[] = {"cargo"};
            };
            class view_4 {
                camLocation[] = {-1.14124, -0.416992, 0.460611};
                camAttach = -90;
                compartments[] = {"Compartment1"};
                roles[] = {"cargo"};
            };
            class view_5 {
                camLocation[] = {-0.932983, -0.326172, 0.647666};
                camAttach = -45;
                compartments[] = {"Compartment1"};
                roles[] = {"cargo"};
            };
        };

        class EGVAR(interaction,anims): EGVAR(interaction,anims) {
            class crate_l1_unhide: crate_l1_unhide {
                positions[] = {{-1.45, 0, 0.25}};
            };
            class crate_l2_unhide: crate_l2_unhide {
                positions[] = {{-1.45, -1.68, 0.15}};
            };
            class crate_l3_unhide: crate_l3_unhide {
                positions[] = {{-1.45, -2.87, 0.15}};
            };
            class crate_l4_unhide: crate_l4_unhide {
                enabled = 0;
            };
            class crate_r1_unhide: crate_r1_unhide {
                positions[] = {{1.1, 0.97, 0.15}};
            };
            class crate_r2_unhide: crate_r2_unhide {
                positions[] = {{1.1, -1.5, 0.15}};
            };
            class crate_r3_unhide: crate_r3_unhide {
                enabled = 0;
            };
            class crate_r4_unhide: crate_r4_unhide {
                enabled = 0;
            };
        };
    };
    class rhs_btr80a_msv: rhs_btr80_msv {
        class ace_viewports {
            class view_0 {
                camLocation[] = {0.589844, -0.314941, 0.449678};
                camAttach = 45;
                compartments[] = {"Compartment1"};
                roles[] = {"cargo"};
            };
            class view_1 {
                camLocation[] = {0.809082, -0.442871, 0.276865};
                camAttach = 90;
                compartments[] = {"Compartment1"};
                roles[] = {"cargo"};
            };
            class view_2 {
                camLocation[] = {0.819092, -1.24414, 0.27857};
                camAttach = 90;
                compartments[] = {"Compartment1"};
                roles[] = {"cargo"};
            };
            class view_3 {
                camLocation[] = {-1.1012, -1.22461, 0.341089};
                camAttach = -90;
                compartments[] = {"Compartment1"};
                roles[] = {"cargo"};
            };
            class view_4 {
                camLocation[] = {-1.11597, -0.458984, 0.307256};
                camAttach = -90;
                compartments[] = {"Compartment1"};
                roles[] = {"cargo"};
            };
            class view_5 {
                camLocation[] = {-0.869995, -0.304688, 0.461181};
                camAttach = -45;
                compartments[] = {"Compartment1"};
                roles[] = {"cargo"};
            };
        };

        class EGVAR(interaction,anims): EGVAR(interaction,anims) {
            class crate_l1_unhide: crate_l1_unhide {
                positions[] = {{-1.45, 0, 0}};
            };
            class crate_l2_unhide: crate_l2_unhide {
                positions[] = {{-1.45, -1.68, 0}};
            };
            class crate_l3_unhide: crate_l3_unhide {
                positions[] = {{-1.45, -2.87, 0}};
            };
            class crate_r1_unhide: crate_l3_unhide {
                positions[] = {{1.1, 0.97, 0}};
            };
            class crate_r2_unhide: crate_r2_unhide {
                positions[] = {{1.1, -1.5, 0}};
            };
        };
    };

    class rhs_2s3tank_base: Tank_F {
        EGVAR(refuel,fuelCapacity) = 830;
    };

    class OTR21_Base: Truck_F {
        EGVAR(overpressure,noReflection) = 1;
        EGVAR(refuel,fuelCapacity) = 500;
    };

    class rhs_bmd_base: Tank_F {
        EGVAR(refuel,fuelCapacity) = 300;
        EGVAR(vehicle_damage,hullDetonationProb) = 0;
        EGVAR(vehicle_damage,turretDetonationProb) = 0.2;
        EGVAR(vehicle_damage,engineDetonationProb) = 0;
        EGVAR(vehicle_damage,hullFireProb) = 0.8;
        EGVAR(vehicle_damage,turretFireProb) = 0.5;
        EGVAR(vehicle_damage,engineFireProb) = 0.8;
        EGVAR(vehicle_damage,detonationDuringFireProb) = 0.5;

        class EGVAR(interaction,anims) {
            class crate_l1_unhide {
                positions[] = {{-1.45, 0.5, -0.65}};
                items[] = {"rhs_3Ya40_1_single"};
                name = "3Ya40-1 Crate";
                text = "3Ya40-1 Crate";
            };
            class crate_l2_unhide {
                positions[] = {{-1.45, -0.2, -0.65}};
                items[] = {"rhs_3Ya40_1_single"};
                name = "3Ya40-1 Crate";
                text = "3Ya40-1 Crate";
            };
            class crate_l3_unhide {
                positions[] = {{-1.45, -1.2, -0.65}};
                items[] = {"rhs_3Ya40_1_single"};
                name = "3Ya40-1 Crate";
                text = "3Ya40-1 Crate";
            };
            class crate_r1_unhide {
                positions[] = {{1.45, 0.6, -0.65}};
                items[] = {"rhs_3Ya40_1_single"};
                name = "3Ya40-1 Crate";
                text = "3Ya40-1 Crate";
            };
            class crate_r2_unhide {
                positions[] = {{1.45, -0.4, -0.65}};
                items[] = {"rhs_3Ya40_1_single"};
                name = "3Ya40-1 Crate";
                text = "3Ya40-1 Crate";
            };
            class crate_r3_unhide {
                positions[] = {{1.45, -1.2, -0.65}};
                items[] = {"rhs_3Ya40_1_single"};
                name = "3Ya40-1 Crate";
                text = "3Ya40-1 Crate";
            };
        };
    };
    class rhs_bmd1_base: rhs_bmd_base {};
    class rhs_bmd1p: rhs_bmd1_base {
        class EGVAR(interaction,anims): EGVAR(interaction,anims) {
            class crate_l1_unhide: crate_l1_unhide {
                positions[] = {{-1.45, 0.5, -0.8}};
            };
            class crate_l2_unhide: crate_l2_unhide {
                positions[] = {{-1.45, -0.2, -0.8}};
            };
            class crate_l3_unhide: crate_l3_unhide {
                positions[] = {{-1.45, -1.2, -0.8}};
            };
            class crate_r1_unhide: crate_l3_unhide {
                positions[] = {{1.45, 0.6, -0.8}};
            };
            class crate_r2_unhide: crate_r2_unhide {
                positions[] = {{1.45, -0.4, -0.8}};
            };
            class crate_r3_unhide: crate_r3_unhide {
                positions[] = {{1.45, -1.2, -0.8}};
            };
        };
    };
    class rhs_bmd2_base: rhs_bmd_base {};
    class rhs_bmd2: rhs_bmd2_base {
        class EGVAR(interaction,anims): EGVAR(interaction,anims) {
            class crate_l1_unhide: crate_l1_unhide {
                positions[] = {{-1.45, 0.5, -0.8}};
            };
            class crate_l2_unhide: crate_l2_unhide {
                positions[] = {{-1.45, -0.2, -0.8}};
            };
            class crate_l3_unhide: crate_l3_unhide {
                positions[] = {{-1.45, -1.2, -0.8}};
            };
            class crate_r1_unhide: crate_l3_unhide {
                positions[] = {{1.45, 0.6, -0.8}};
            };
            class crate_r2_unhide: crate_r2_unhide {
                positions[] = {{1.45, -0.4, -0.8}};
            };
            class crate_r3_unhide: crate_r3_unhide {
                positions[] = {{1.45, -1.2, -0.8}};
            };
        };
    };
    class rhs_bmd2m: rhs_bmd2 {
        class EGVAR(interaction,anims): EGVAR(interaction,anims) {
            class crate_l1_unhide: crate_l1_unhide {
                positions[] = {{-1.45, 0.5, -0.7}};
            };
            class crate_l2_unhide: crate_l2_unhide {
                positions[] = {{-1.45, -0.2, -0.7}};
            };
            class crate_l3_unhide: crate_l3_unhide {
                positions[] = {{-1.45, -1.2, -0.7}};
            };
            class crate_r1_unhide: crate_l3_unhide {
                positions[] = {{1.45, 0.6, -0.7}};
            };
            class crate_r2_unhide: crate_r2_unhide {
                positions[] = {{1.45, -0.4, -0.7}};
            };
            class crate_r3_unhide: crate_r3_unhide {
                positions[] = {{1.45, -1.2, -0.7}};
            };
        };
    };

    class rhs_bmp1tank_base: Tank_F {
        EGVAR(map,vehicleLightColor)[] = {0,1,0,0.1};
        EGVAR(refuel,fuelCapacity) = 460;
    };
    class rhs_bmp_base: rhs_bmp1tank_base {
        EGVAR(vehicle_damage,hullDetonationProb) = 0;
        EGVAR(vehicle_damage,turretDetonationProb) = 0.2;
        EGVAR(vehicle_damage,engineDetonationProb) = 0;
        EGVAR(vehicle_damage,hullFireProb) = 0.8;
        EGVAR(vehicle_damage,turretFireProb) = 0.5;
        EGVAR(vehicle_damage,engineFireProb) = 0.8;
        EGVAR(vehicle_damage,detonationDuringFireProb) = 0.5;

        class EGVAR(interaction,anims) {
            class crate_l1_unhide {
                positions[] = {{-1.55, 1.1, -0.55}};
                items[] = {"rhs_3Ya40_1_single"};
                name = "3Ya40-1 Crate";
                text = "3Ya40-1 Crate";
            };
            class crate_l2_unhide {
                positions[] = {{-1.55, 0.35, -0.55}};
                items[] = {"rhs_3Ya40_1_single"};
                name = "3Ya40-1 Crate";
                text = "3Ya40-1 Crate";
            };
            class crate_l3_unhide {
                positions[] = {{-1.55, -0.6, -0.55}};
                items[] = {"rhs_3Ya40_1_single"};
                name = "3Ya40-1 Crate";
                text = "3Ya40-1 Crate";
            };
            class crate_r1_unhide {
                positions[] = {{1.55, 1.75, -0.55}};
                items[] = {"rhs_3Ya40_1_single"};
                name = "3Ya40-1 Crate";
                text = "3Ya40-1 Crate";
            };
            class crate_r2_unhide {
                positions[] = {{1.55, -0.25, -0.55}};
                items[] = {"rhs_3Ya40_1_single"};
                name = "3Ya40-1 Crate";
                text = "3Ya40-1 Crate";
            };
            class crate_r3_unhide {
                positions[] = {{1.55, -1, -0.55}};
                items[] = {"rhs_3Ya40_1_single"};
                name = "3Ya40-1 Crate";
                text = "3Ya40-1 Crate";
            };
        };
    };
    class rhs_bmp1_vdv: rhs_bmp_base {};
    class rhs_bmp1d_vdv: rhs_bmp1_vdv {
        class EGVAR(interaction,anims): EGVAR(interaction,anims) {
            class crate_r3_unhide: crate_r3_unhide {
                positions[] = {{1.5, -1.2, -0.55}};
            };
        };
    };
    class rhs_prp3_vdv: rhs_bmp1_vdv {
        class EGVAR(interaction,anims): EGVAR(interaction,anims) {
            class crate_l1_unhide: crate_l1_unhide {
                enabled = 0;
            };
            class crate_l2_unhide: crate_l2_unhide {
                enabled = 0;
            };
            class crate_l3_unhide: crate_l3_unhide {
                enabled = 0;
            };
            class crate_r1_unhide: crate_l3_unhide {
                enabled = 0;
            };
            class crate_r2_unhide: crate_r2_unhide {
                enabled = 0;
            };
            class crate_r3_unhide: crate_r3_unhide {
                enabled = 0;
            };
        };
    };

    class rhs_bmp2e_vdv: rhs_bmp1_vdv {
        class EGVAR(interaction,anims): EGVAR(interaction,anims) {
            class crate_l1_unhide: crate_l1_unhide {
                positions[] = {{-1.8, 1.05, -0.55}};
            };
            class crate_l2_unhide: crate_l2_unhide {
                positions[] = {{-1.8, 0.35, -0.55}};
            };
            class crate_l3_unhide: crate_l3_unhide {
                positions[] = {{-1.8, -0.65, -0.55}};
            };
            class crate_r1_unhide: crate_l3_unhide {
                positions[] = {{1.4, 1.7, -0.55}};
            };
            class crate_r2_unhide: crate_r2_unhide {
                positions[] = {{1.4, -0.25, -0.55}};
            };
            class crate_r3_unhide: crate_r3_unhide {
                positions[] = {{1.4, -1.05, -0.55}};
            };
        };
    };
    class rhs_bmp2_vdv: rhs_bmp2e_vdv {
        class EGVAR(interaction,anims): EGVAR(interaction,anims) {
            class crate_l1_unhide: crate_l1_unhide {
                positions[] = {{-1.8, 1.2, -0.55}};
            };
            class crate_l2_unhide: crate_l2_unhide {
                positions[] = {{-1.8, 0.5, -0.55}};
            };
            class crate_l3_unhide: crate_l3_unhide {
                positions[] = {{-1.8, -0.5, -0.55}};
            };
            class crate_r1_unhide: crate_l3_unhide {
                positions[] = {{1.4, 1.85, -0.55}};
            };
            class crate_r2_unhide: crate_r2_unhide {
                positions[] = {{1.4, -0.1, -0.55}};
            };
            class crate_r3_unhide: crate_r3_unhide {
                positions[] = {{1.4, -0.9, -0.55}};
            };
        };
    };
    class rhs_bmp2e_msv: rhs_bmp2e_vdv {};
    class rhs_Ob_681_2: rhs_bmp2e_msv {
        class EGVAR(interaction,anims): EGVAR(interaction,anims) {
            class crate_l1_unhide: crate_l1_unhide {
                positions[] = {{-1.8, 1.2, -0.55}};
            };
            class crate_l2_unhide: crate_l2_unhide {
                positions[] = {{-1.8, 0.5, -0.55}};
            };
            class crate_l3_unhide: crate_l3_unhide {
                positions[] = {{-1.8, -0.5, -0.55}};
            };
            class crate_r1_unhide: crate_l3_unhide {
                positions[] = {{1.4, 1.85, -0.55}};
            };
            class crate_r2_unhide: crate_r2_unhide {
                positions[] = {{1.4, -0.1, -0.55}};
            };
            class crate_r3_unhide: crate_r3_unhide {
                positions[] = {{1.4, -0.9, -0.55}};
            };
        };
    };

    class rhs_brm1k_base: rhs_bmp2e_vdv {
        class EGVAR(interaction,anims): EGVAR(interaction,anims) {
            class crate_l1_unhide: crate_l1_unhide {
                enabled = 0;
            };
            class crate_l2_unhide: crate_l2_unhide {
                enabled = 0;
            };
            class crate_l3_unhide: crate_l3_unhide {
                enabled = 0;
            };
            class crate_r1_unhide: crate_l3_unhide {
                enabled = 0;
            };
            class crate_r2_unhide: crate_r2_unhide {
                enabled = 0;
            };
            class crate_r3_unhide: crate_r3_unhide {
                enabled = 0;
            };
        };
    };

    class rhs_bmp3tank_base: Tank_F {
        EGVAR(refuel,fuelCapacity) = 460;
        EGVAR(vehicle_damage,hullDetonationProb) = 0.2;
        EGVAR(vehicle_damage,turretDetonationProb) = 0.2;
        EGVAR(vehicle_damage,engineDetonationProb) = 0;
        EGVAR(vehicle_damage,hullFireProb) = 0.5;
        EGVAR(vehicle_damage,turretFireProb) = 0.2;
        EGVAR(vehicle_damage,engineFireProb) = 0.8;
        EGVAR(vehicle_damage,detonationDuringFireProb) = 0.5;

        class ace_viewports {
            class view_0 {
                camLocation[] = {1.02881, -0.923828, -0.647231};
                screenLocation[] = {1.12881, -0.653828, -1.08223};
                camAttach = 50;
                maxDistance = 0.5;
                roles[] = {"cargo"};
            };
            class view_1 {
                camLocation[] = {1.01709, -1.55664, -0.647231};
                screenLocation[] = {1.10709, -1.42664, -1.14223};
                camAttach = 82;
                maxDistance = 0.5;
                roles[] = {"cargo"};
            };
            class view_2 {
                camLocation[] = {-0.871094, -1.55762, -0.647231};
                screenLocation[] = {-0.981094, -1.42762, -1.13223};
                camAttach = 285;
                maxDistance = 0.5;
                roles[] = {"cargo"};
            };
            class view_3 {
                camLocation[] = {-1.00879, -0.939941, -0.650259};
                screenLocation[] = {-0.97879, -0.689941, -1.09526};
                camAttach = 310;
                maxDistance = 0.5;
                roles[] = {"cargo"};
            };
        };
    };

    class rhs_a3spruttank_base: Tank_F {
        EGVAR(refuel,fuelCapacity) = 400;
        EGVAR(vehicle_damage,hullDetonationProb) = 0.2;
        EGVAR(vehicle_damage,turretDetonationProb) = 0.2;
        EGVAR(vehicle_damage,engineDetonationProb) = 0;
        EGVAR(vehicle_damage,hullFireProb) = 0.5;
        EGVAR(vehicle_damage,turretFireProb) = 0.2;
        EGVAR(vehicle_damage,engineFireProb) = 0.8;
        EGVAR(vehicle_damage,detonationDuringFireProb) = 0.5;
    };

    class rhs_a3t72tank_base: Tank_F {
        EGVAR(refuel,fuelCapacity) = 1200;
        EGVAR(vehicle_damage,hullDetonationProb) = 0.8;
        EGVAR(vehicle_damage,turretDetonationProb) = 0.2;
        EGVAR(vehicle_damage,engineDetonationProb) = 0.2;
        EGVAR(vehicle_damage,hullFireProb) = 0.8;
        EGVAR(vehicle_damage,turretFireProb) = 0.2;
        EGVAR(vehicle_damage,engineFireProb) = 0.5;
        EGVAR(vehicle_damage,detonationDuringFireProb) = 0.2;
    };
    class rhs_t72bd_tv: rhs_a3t72tank_base {
        EGVAR(vehicle_damage,eraHitpoints)[] = {
            "era_1_hitpoint", "era_2_hitpoint", "era_3_hitpoint", "era_4_hitpoint", "era_5_hitpoint", "era_6_hitpoint", "era_7_hitpoint",
            "era_8_hitpoint", "era_9_hitpoint", "era_10_hitpoint", "era_11_hitpoint", "era_12_hitpoint", "era_13_hitpoint", "era_14_hitpoint",
            "era_15_hitpoint", "era_16_hitpoint", "era_17_hitpoint", "era_18_hitpoint", "era_19_hitpoint", "era_20_hitpoint", "era_21_hitpoint",
            "era_22_hitpoint", "era_23_hitpoint", "era_24_hitpoint", "era_25_hitpoint", "era_26_hitpoint", "era_27_hitpoint", "era_28_hitpoint",
            "era_29_hitpoint", "era_30_hitpoint", "era_31_hitpoint", "era_32_hitpoint", "era_33_hitpoint", "era_34_hitpoint", "era_35_hitpoint",
            "era_36_hitpoint", "era_37_hitpoint", "era_38_hitpoint", "era_39_hitpoint", "era_40_hitpoint", "era_41_hitpoint", "era_42_hitpoint",
            "era_43_hitpoint", "era_44_hitpoint", "era_45_hitpoint", "era_46_hitpoint", "era_47_hitpoint", "era_48_hitpoint", "era_49_hitpoint",
            "era_50_hitpoint", "era_51_hitpoint", "era_52_hitpoint", "era_53_hitpoint", "era_51_hitpoint", "era_55_hitpoint", "era_56_hitpoint",
            "era_57_hitpoint", "era_58_hitpoint", "era_59_hitpoint", "era_60_hitpoint", "era_61_hitpoint", "era_62_hitpoint", "era_63_hitpoint",
            "era_64_hitpoint", "era_65_hitpoint", "era_66_hitpoint", "era_67_hitpoint"
        };
        EGVAR(vehicle_damage,slatHitpoints)[] = {
            "SLAT_68_hitpoint", "SLAT_69_hitpoint", "SLAT_70_hitpoint"
        };
    };
    class rhs_t90_tv: rhs_t72bd_tv {
        EGVAR(vehicle_damage,hullDetonationProb) = 0;
        EGVAR(vehicle_damage,turretDetonationProb) = 0;
        EGVAR(vehicle_damage,engineDetonationProb) = 0;
        EGVAR(vehicle_damage,hullFireProb) = 0.2;
        EGVAR(vehicle_damage,turretFireProb) = 0.2;
        EGVAR(vehicle_damage,engineFireProb) = 0.5;
        EGVAR(vehicle_damage,detonationDuringFireProb) = 0;
    };

    class rhs_t14_base: Tank_F {
        EGVAR(vehicle_damage,hullDetonationProb) = 0;
        EGVAR(vehicle_damage,turretDetonationProb) = 0;
        EGVAR(vehicle_damage,engineDetonationProb) = 0;
        EGVAR(vehicle_damage,hullFireProb) = 0.2;
        EGVAR(vehicle_damage,turretFireProb) = 0.2;
        EGVAR(vehicle_damage,engineFireProb) = 0.5;
        EGVAR(vehicle_damage,detonationDuringFireProb) = 0;
        // Dear LORD RHS loves their ERA
        EGVAR(vehicle_damage,eraHitpoints)[] = {
            "era_1_hitpoint", "era_2_hitpoint", "era_3_hitpoint", "era_4_hitpoint", "era_5_hitpoint", "era_6_hitpoint",
            "era_7_hitpoint", "era_8_hitpoint", "era_9_hitpoint", "era_10_hitpoint", "era_11_hitpoint", "era_12_hitpoint",
            "era_13_hitpoint", "era_14_hitpoint", "era_15_hitpoint", "era_16_hitpoint", "era_17_hitpoint", "era_18_hitpoint",
            "era_19_hitpoint", "era_20_hitpoint", "era_21_hitpoint", "era_22_hitpoint", "era_23_hitpoint", "era_24_hitpoint",
            "era_25_hitpoint", "era_26_hitpoint", "era_27_hitpoint", "era_28_hitpoint", "era_29_hitpoint", "era_30_hitpoint",
            "era_31_hitpoint", "era_32_hitpoint", "era_33_hitpoint", "era_34_hitpoint", "era_35_hitpoint", "era_36_hitpoint",
            "era_37_hitpoint"
        };
        EGVAR(vehicle_damage,slatHitpoints)[] = {
            "SLAT_38_hitpoint", "SLAT_39_hitpoint", "SLAT_40_hitpoint", "SLAT_41_hitpoint"
        };
        EGVAR(vehicle_damage,canHaveFireRing) = 1;
    };

    class rhs_t72bb_tv: rhs_a3t72tank_base {
        EGVAR(vehicle_damage,eraHitpoints)[] = {
            "era_1_hitpoint", "era_2_hitpoint", "era_3_hitpoint", "era_4_hitpoint", "era_5_hitpoint", "era_6_hitpoint",
            "era_7_hitpoint", "era_8_hitpoint", "era_9_hitpoint", "era_10_hitpoint", "era_11_hitpoint", "era_12_hitpoint",
            "era_13_hitpoint", "era_14_hitpoint", "era_15_hitpoint", "era_16_hitpoint", "era_17_hitpoint", "era_18_hitpoint",
            "era_19_hitpoint", "era_20_hitpoint", "era_21_hitpoint", "era_22_hitpoint", "era_23_hitpoint", "era_24_hitpoint",
            "era_25_hitpoint", "era_26_hitpoint", "era_27_hitpoint", "era_28_hitpoint", "era_29_hitpoint", "era_30_hitpoint",
            "era_31_hitpoint", "era_32_hitpoint", "era_33_hitpoint", "era_34_hitpoint", "era_35_hitpoint", "era_36_hitpoint",
            "era_37_hitpoint"
        };
    };

    class rhs_t72bc_tv: rhs_a3t72tank_base {
        EGVAR(vehicle_damage,eraHitpoints)[] = {
            "era_1_hitpoint", "era_2_hitpoint", "era_3_hitpoint", "era_4_hitpoint", "era_5_hitpoint", "era_6_hitpoint",
            "era_7_hitpoint", "era_8_hitpoint", "era_9_hitpoint", "era_10_hitpoint", "era_11_hitpoint", "era_12_hitpoint",
            "era_13_hitpoint", "era_14_hitpoint", "era_15_hitpoint", "era_16_hitpoint", "era_17_hitpoint", "era_18_hitpoint",
            "era_19_hitpoint", "era_20_hitpoint", "era_21_hitpoint", "era_22_hitpoint", "era_23_hitpoint", "era_24_hitpoint",
            "era_25_hitpoint", "era_26_hitpoint", "era_27_hitpoint", "era_28_hitpoint", "era_29_hitpoint", "era_30_hitpoint",
            "era_31_hitpoint", "era_32_hitpoint"
        };
    };

    class rhs_t72be_tv: rhs_t72bd_tv {
        EGVAR(vehicle_damage,eraHitpoints)[] = {
            "era_1_hitpoint", "era_2_hitpoint", "era_3_hitpoint", "era_4_hitpoint", "era_5_hitpoint", "era_6_hitpoint",
            "era_7_hitpoint", "era_8_hitpoint", "era_9_hitpoint", "era_10_hitpoint", "era_11_hitpoint", "era_12_hitpoint",
            "era_13_hitpoint", "era_14_hitpoint", "era_15_hitpoint", "era_16_hitpoint", "era_17_hitpoint", "era_18_hitpoint",
            "era_19_hitpoint", "era_20_hitpoint", "era_21_hitpoint", "era_22_hitpoint", "era_23_hitpoint", "era_24_hitpoint",
            "era_25_hitpoint", "era_26_hitpoint", "era_27_hitpoint", "era_28_hitpoint", "era_29_hitpoint", "era_30_hitpoint",
            "era_31_hitpoint", "era_32_hitpoint", "era_33_hitpoint", "era_34_hitpoint", "era_35_hitpoint", "era_36_hitpoint",
            "era_37_hitpoint", "era_38_hitpoint", "era_39_hitpoint", "era_40_hitpoint", "era_41_hitpoint", "era_42_hitpoint",
            "era_43_hitpoint", "era_44_hitpoint", "era_45_hitpoint", "era_46_hitpoint", "era_47_hitpoint", "era_48_hitpoint",
            "era_49_hitpoint", "era_50_hitpoint", "era_58_hitpoint", "era_59_hitpoint", "era_60_hitpoint", "era_61_hitpoint",
            "era_62_hitpoint", "era_63_hitpoint", "era_64_hitpoint", "era_65_hitpoint", "era_66_hitpoint", "era_67_hitpoint"
        };
        EGVAR(vehicle_damage,slatHitpoints)[] = {
            "SLAT_51_hitpoint", "SLAT_52_hitpoint", "SLAT_53_hitpoint",
            "SLAT_54_hitpoint", "SLAT_55_hitpoint", "SLAT_56_hitpoint",
            "SLAT_57_hitpoint", "SLAT_68_hitpoint", "SLAT_69_hitpoint",
            "SLAT_70_hitpoint"
        };
    };

    class rhs_t90a_tv: rhs_t90_tv {};
    class rhs_t90saa_tv: rhs_t90a_tv {
        EGVAR(vehicle_damage,eraHitpoints)[] = {
            "era_1_hitpoint", "era_2_hitpoint", "era_3_hitpoint", "era_4_hitpoint", "era_5_hitpoint", "era_6_hitpoint",
            "era_7_hitpoint", "era_8_hitpoint", "era_9_hitpoint", "era_10_hitpoint", "era_11_hitpoint", "era_12_hitpoint",
            "era_13_hitpoint", "era_14_hitpoint", "era_15_hitpoint", "era_16_hitpoint", "era_17_hitpoint", "era_18_hitpoint",
            "era_19_hitpoint", "era_20_hitpoint", "era_21_hitpoint", "era_22_hitpoint", "era_23_hitpoint", "era_24_hitpoint",
            "era_25_hitpoint", "era_26_hitpoint", "era_27_hitpoint", "era_28_hitpoint", "era_29_hitpoint", "era_30_hitpoint",
            "era_31_hitpoint", "era_32_hitpoint"
        };
        EGVAR(vehicle_damage,slatHitpoints)[] = {
            "SLAT_51_hitpoint", "SLAT_52_hitpoint", "SLAT_53_hitpoint", "SLAT_54_hitpoint"
        };
    };
    class rhs_t90sab_tv: rhs_t90a_tv {
        EGVAR(vehicle_damage,eraHitpoints)[] = {
            "era_1_hitpoint", "era_2_hitpoint", "era_3_hitpoint", "era_4_hitpoint", "era_5_hitpoint", "era_6_hitpoint",
            "era_7_hitpoint", "era_8_hitpoint", "era_9_hitpoint", "era_10_hitpoint", "era_11_hitpoint", "era_12_hitpoint",
            "era_13_hitpoint", "era_14_hitpoint", "era_15_hitpoint", "era_16_hitpoint", "era_17_hitpoint", "era_18_hitpoint",
            "era_19_hitpoint", "era_20_hitpoint", "era_21_hitpoint", "era_22_hitpoint", "era_23_hitpoint", "era_24_hitpoint",
            "era_25_hitpoint", "era_26_hitpoint", "era_27_hitpoint", "era_28_hitpoint", "era_29_hitpoint", "era_30_hitpoint",
            "era_31_hitpoint", "era_32_hitpoint", "era_33_hitpoint", "era_34_hitpoint", "era_35_hitpoint", "era_36_hitpoint",
            "era_37_hitpoint", "era_38_hitpoint", "era_39_hitpoint", "era_40_hitpoint", "era_41_hitpoint", "era_42_hitpoint",
            "era_43_hitpoint", "era_44_hitpoint", "era_45_hitpoint", "era_46_hitpoint", "era_47_hitpoint", "era_48_hitpoint",
            "era_49_hitpoint", "era_50_hitpoint"
        };
        EGVAR(vehicle_damage,slatHitpoints)[] = {
            "slat_51_hitpoint", "slat_52_hitpoint", "slat_53_hitpoint", "slat_54_hitpoint"
        };
    };
    class rhs_t90am_tv: rhs_t90_tv {
        EGVAR(vehicle_damage,eraHitpoints)[] = {
            "era_1_hitpoint", "era_2_hitpoint", "era_3_hitpoint", "era_4_hitpoint", "era_5_hitpoint", "era_6_hitpoint",
            "era_7_hitpoint", "era_8_hitpoint", "era_9_hitpoint", "era_10_hitpoint", "era_11_hitpoint", "era_12_hitpoint",
            "era_13_hitpoint", "era_14_hitpoint", "era_15_hitpoint", "era_16_hitpoint", "era_17_hitpoint", "era_18_hitpoint",
            "era_19_hitpoint", "era_20_hitpoint", "era_21_hitpoint", "era_22_hitpoint", "era_23_hitpoint", "era_24_hitpoint",
            "era_25_hitpoint", "era_26_hitpoint", "era_27_hitpoint", "era_28_hitpoint", "era_29_hitpoint", "era_30_hitpoint",
            "era_31_hitpoint", "era_32_hitpoint", "era_33_hitpoint", "era_34_hitpoint", "era_35_hitpoint", "era_36_hitpoint",
            "era_37_hitpoint", "era_38_hitpoint", "era_39_hitpoint", "era_40_hitpoint", "era_41_hitpoint", "era_42_hitpoint",
            "era_43_hitpoint", "era_44_hitpoint", "era_45_hitpoint", "era_46_hitpoint", "era_47_hitpoint", "era_48_hitpoint",
            "era_49_hitpoint", "era_50_hitpoint", "era_51_hitpoint", "era_52_hitpoint", "era_53_hitpoint", "era_54_hitpoint",
            "era_55_hitpoint", "era_56_hitpoint", "era_57_hitpoint", "era_58_hitpoint", "era_59_hitpoint", "era_60_hitpoint",
            "era_61_hitpoint", "era_62_hitpoint", "era_63_hitpoint", "era_64_hitpoint", "era_65_hitpoint", "era_66_hitpoint"
        };
        EGVAR(vehicle_damage,slatHitpoints)[] = {
            "SLAT_18_hitpoint", "SLAT_19_hitpoint", "SLAT_20_hitpoint", "SLAT_21_hitpoint",
            "SLAT_22_hitpoint", "SLAT_23_hitpoint", "SLAT_24_hitpoint", "SLAT_25_hitpoint",
            "SLAT_51_hitpoint", "SLAT_52_hitpoint", "SLAT_53_hitpoint", "SLAT_54_hitpoint"
        };
    };
    class rhs_t90sm_tv: rhs_t90am_tv {
        EGVAR(vehicle_damage,eraHitpoints)[] = {
            "era_1_hitpoint", "era_2_hitpoint", "era_3_hitpoint", "era_4_hitpoint",
            "era_5_hitpoint", "era_6_hitpoint", "era_7_hitpoint", "era_8_hitpoint",
            "era_9_hitpoint", "era_10_hitpoint", "era_11_hitpoint", "era_12_hitpoint",
            "era_13_hitpoint", "era_14_hitpoint", "era_15_hitpoint", "era_16_hitpoint",
            "era_17_hitpoint", "era_18_hitpoint", "era_19_hitpoint", "era_20_hitpoint",
            "era_21_hitpoint", "era_22_hitpoint", "era_24_hitpoint", "era_25_hitpoint",
            "era_27_hitpoint", "era_28_hitpoint", "era_29_hitpoint", "era_30_hitpoint",
            "era_31_hitpoint", "era_32_hitpoint", "era_33_hitpoint", "era_34_hitpoint",
            "era_35_hitpoint", "era_36_hitpoint", "era_37_hitpoint", "era_38_hitpoint",
            "era_39_hitpoint", "era_40_hitpoint", "era_41_hitpoint", "era_42_hitpoint",
            "era_43_hitpoint", "era_44_hitpoint", "era_45_hitpoint", "era_46_hitpoint",
            "era_47_hitpoint", "era_48_hitpoint", "era_49_hitpoint", "era_50_hitpoint",
            "era_26_hitpoint", "era_55_hitpoint", "era_56_hitpoint", "era_57_hitpoint",
            "era_58_hitpoint", "era_59_hitpoint", "era_60_hitpoint", "era_61_hitpoint",
            "era_62_hitpoint", "era_63_hitpoint", "era_64_hitpoint", "era_65_hitpoint",
            "era_66_hitpoint", "era_23_hitpoint"
        };
        EGVAR(vehicle_damage,slatHitpoints)[] = {
            "slat_23_hitpoint", "slat_26_hitpoint", "slat_51_hitpoint",
            "slat_52_hitpoint", "slat_53_hitpoint", "slat_54_hitpoint",
            "slat_55_hitpoint", "slat_56_hitpoint", "slat_57_hitpoint",
            "slat_18_hitpoint", "slat_19_hitpoint", "slat_20_hitpoint",
            "slat_21_hitpoint", "slat_22_hitpoint", "slat_24_hitpoint",
            "slat_25_hitpoint"
        };
    };

    class rhs_t80bv: rhs_t80b {
        EGVAR(vehicle_damage,eraHitpoints)[] = {
            "era_1_hitpoint", "era_2_hitpoint", "era_3_hitpoint", "era_4_hitpoint", "era_5_hitpoint", "era_6_hitpoint",
            "era_7_hitpoint", "era_8_hitpoint", "era_9_hitpoint", "era_10_hitpoint", "era_11_hitpoint", "era_12_hitpoint",
            "era_13_hitpoint", "era_14_hitpoint", "era_15_hitpoint", "era_16_hitpoint", "era_17_hitpoint", "era_18_hitpoint",
            "era_19_hitpoint", "era_20_hitpoint", "era_21_hitpoint", "era_22_hitpoint", "era_23_hitpoint", "era_24_hitpoint",
            "era_25_hitpoint", "era_26_hitpoint", "era_27_hitpoint", "era_28_hitpoint"
        };
    };
    class rhs_t80a;
    class rhs_t80u: rhs_t80a {
        EGVAR(vehicle_damage,eraHitpoints)[] = {
            "era_1_hitpoint", "era_2_hitpoint", "era_3_hitpoint", "era_4_hitpoint", "era_5_hitpoint", "era_6_hitpoint",
            "era_7_hitpoint", "era_8_hitpoint", "era_9_hitpoint", "era_10_hitpoint", "era_11_hitpoint", "era_12_hitpoint",
            "era_13_hitpoint", "era_14_hitpoint", "era_15_hitpoint", "era_16_hitpoint", "era_17_hitpoint", "era_18_hitpoint",
            "era_19_hitpoint", "era_20_hitpoint", "era_21_hitpoint", "era_22_hitpoint", "era_23_hitpoint", "era_24_hitpoint",
            "era_25_hitpoint", "era_26_hitpoint", "era_27_hitpoint", "era_28_hitpoint", "era_29_hitpoint", "era_30_hitpoint",
            "era_31_hitpoint", "era_32_hitpoint", "era_33_hitpoint", "era_34_hitpoint", "era_35_hitpoint"
        };
    };
    class rhs_t80uk: rhs_t80u {
        EGVAR(vehicle_damage,eraHitpoints)[] = {
            "era_1_hitpoint", "era_2_hitpoint", "era_3_hitpoint", "era_4_hitpoint", "era_5_hitpoint", "era_6_hitpoint",
            "era_7_hitpoint", "era_8_hitpoint", "era_9_hitpoint", "era_10_hitpoint", "era_11_hitpoint", "era_12_hitpoint",
            "era_13_hitpoint", "era_14_hitpoint", "era_15_hitpoint", "era_16_hitpoint", "era_17_hitpoint", "era_18_hitpoint",
            "era_19_hitpoint", "era_20_hitpoint", "era_21_hitpoint", "era_22_hitpoint", "era_23_hitpoint", "era_24_hitpoint",
            "era_25_hitpoint", "era_26_hitpoint", "era_27_hitpoint", "era_28_hitpoint", "era_29_hitpoint", "era_30_hitpoint",
            "era_31_hitpoint", "era_32_hitpoint", "era_33_hitpoint", "era_34_hitpoint", "era_35_hitpoint", "era_36_hitpoint"
        };
    };
    class rhs_t80ue1: rhs_t80a {
        EGVAR(vehicle_damage,eraHitpoints)[] = {
            "era_1_hitpoint", "era_2_hitpoint", "era_3_hitpoint", "era_4_hitpoint", "era_5_hitpoint", "era_6_hitpoint",
            "era_7_hitpoint", "era_8_hitpoint", "era_9_hitpoint", "era_10_hitpoint", "era_11_hitpoint", "era_12_hitpoint",
            "era_13_hitpoint", "era_14_hitpoint", "era_15_hitpoint", "era_16_hitpoint", "era_17_hitpoint", "era_18_hitpoint",
            "era_19_hitpoint", "era_20_hitpoint", "era_21_hitpoint", "era_22_hitpoint", "era_23_hitpoint", "era_24_hitpoint",
            "era_25_hitpoint", "era_26_hitpoint", "era_27_hitpoint", "era_28_hitpoint", "era_29_hitpoint", "era_30_hitpoint",
            "era_31_hitpoint", "era_32_hitpoint", "era_33_hitpoint", "era_34_hitpoint", "era_35_hitpoint", "era_36_hitpoint"
        };
    };
    class rhs_t80um: rhs_t80u {
        EGVAR(vehicle_damage,eraHitpoints)[] = {
            "era_1_hitpoint", "era_2_hitpoint", "era_3_hitpoint", "era_4_hitpoint", "era_5_hitpoint", "era_6_hitpoint",
            "era_7_hitpoint", "era_8_hitpoint", "era_9_hitpoint", "era_10_hitpoint", "era_11_hitpoint", "era_12_hitpoint",
            "era_13_hitpoint", "era_14_hitpoint", "era_15_hitpoint", "era_16_hitpoint", "era_17_hitpoint", "era_18_hitpoint",
            "era_19_hitpoint", "era_20_hitpoint", "era_21_hitpoint", "era_22_hitpoint", "era_23_hitpoint", "era_24_hitpoint",
            "era_25_hitpoint", "era_26_hitpoint", "era_27_hitpoint", "era_28_hitpoint", "era_29_hitpoint", "era_30_hitpoint",
            "era_31_hitpoint", "era_32_hitpoint", "era_33_hitpoint", "era_34_hitpoint", "era_35_hitpoint", "era_36_hitpoint"
        };
    };

    class rhs_t15_base;
    class rhs_t15_tv: rhs_t15_base {
        EGVAR(vehicle_damage,eraHitpoints)[] = {
            "era_1_hitpoint", "era_2_hitpoint", "era_3_hitpoint", "era_4_hitpoint",
            "era_5_hitpoint", "era_6_hitpoint", "era_7_hitpoint", "era_8_hitpoint",
            "era_9_hitpoint", "era_10_hitpoint", "era_11_hitpoint", "era_12_hitpoint",
            "era_13_hitpoint", "era_14_hitpoint", "era_15_hitpoint", "era_16_hitpoint",
            "era_17_hitpoint", "era_18_hitpoint", "era_19_hitpoint", "era_20_hitpoint",
            "era_21_hitpoint", "era_22_hitpoint", "era_23_hitpoint", "era_24_hitpoint",
            "era_25_hitpoint", "era_26_hitpoint", "era_27_hitpoint", "era_28_hitpoint",
            "era_29_hitpoint", "era_30_hitpoint", "era_31_hitpoint", "era_32_hitpoint",
            "era_33_hitpoint", "era_34_hitpoint", "era_35_hitpoint", "era_36_hitpoint",
            "era_37_hitpoint"
        };
        EGVAR(vehicle_damage,slatHitpoints)[] = {
            "slat_38_hitpoint", "slat_39_hitpoint", "slat_40_hitpoint", "slat_41_hitpoint"
        };
    };

    // Wirecutter Backpacks
    class rhs_assault_umbts;
    class rhs_assault_umbts_engineer: rhs_assault_umbts {
        EGVAR(logistics_wirecutter,hasWirecutter) = 1;
    };

    class rhs_rk_sht_30_emr;
    class rhs_rk_sht_30_emr_engineer: rhs_rk_sht_30_emr {
        EGVAR(logistics_wirecutter,hasWirecutter) = 1;
    };

    class rhs_rk_sht_30_olive;
    class rhs_rk_sht_30_olive_engineer: rhs_rk_sht_30_olive {
        EGVAR(logistics_wirecutter,hasWirecutter) = 1;
    };

    // Interaction positions for static weapons
    // Not a fan of this style of inheritance but it's less of a headache in this case
    class StaticWeapon: LandVehicle {
        class ACE_Actions {
            class ACE_MainActions {};
        };
    };
    class StaticMGWeapon: StaticWeapon {};
    class AT_01_base_F: StaticMGWeapon {};
    class StaticMortar: StaticWeapon {};

    class rhs_SPG9_base: AT_01_base_F {
        class ACE_Actions: ACE_Actions {
            class ACE_MainActions: ACE_MainActions {
                position = "";
            };
        };
    };
    class rhs_Kornet_Base: AT_01_base_F {
        class ACE_Actions: ACE_Actions {
            class ACE_MainActions: ACE_MainActions {
                position = "";
                selection = "tripod";
            };
        };
    };

    class rhs_2b14_82mm_Base: StaticMortar {
        class ACE_Actions: ACE_Actions {
            class ACE_MainActions: ACE_MainActions {
                position = "";
                selection = ""; // no good selections for this mortar
            };
        };
    };
};
