class CfgVehicles {
    class LandVehicle;
    class Tank: LandVehicle {
        class NewTurret;
    };
    class Tank_F: Tank {
        class Turrets {
            class MainTurret: NewTurret {
                class Turrets {
                    class CommanderOptics;
                };
            };
        };
    };
    class Car: LandVehicle {
        class ACE_Actions {
            class ACE_MainActions {};
        };
    };
    class Car_F: Car {
        class ViewPilot;
        class NewTurret;
    };
    class Wheeled_APC_F: Car_F {
        class NewTurret;
        class Turrets {
            class MainTurret: NewTurret
            {
                class ViewOptics;
            };
        };
        class CommanderOptics;
    };
    class Air;
    class Helicopter: Air {
        class Turrets;
    };
    class Helicopter_Base_F: Helicopter {
        class Turrets: Turrets {
            class MainTurret;
        };
    };
    
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
    };

    class rhs_infantry_msv_base;
    class rhs_pilot_base: rhs_infantry_msv_base {
        ace_gforcecoef = 0.55;
    };

    class O_Plane_CAS_02_F;
    class RHS_su25_base: O_Plane_CAS_02_F {
        EGVAR(refuel,fuelCapacity) = 3600;
    };

    class Helicopter_Base_H: Helicopter_Base_F {
        class EventHandlers;
    };
    class Heli_Light_02_base_F: Helicopter_Base_H {};
    class RHS_Mi8_base: Heli_Light_02_base_F {
        EGVAR(map,vehicleLightColor)[] = {1,0,0,0.1};
        EGVAR(refuel,fuelCapacity) = 3700;
        EGVAR(fastroping,enabled) = 0;
        class EventHandlers: EventHandlers {
            class RHS_EventHandlers;
        };
    };

    class RHS_Mi8amt_base: RHS_Mi8_base {
        EGVAR(fastroping,enabled) = 1;
        EGVAR(fastroping,ropeOrigins)[] = {{-1.13, 4.67, -0.89}};
        EGVAR(fastroping,onCut) = QFUNC(onCut);
        EGVAR(fastroping,onPrepare) = QFUNC(onPrepare);

        class UserActions {
            class openDoor;
            class closeDoor_L: openDoor {
                condition = QUOTE((this doorPhase 'LeftDoor' > 0.5) && {alive this} && {!(this getVariable [ARR_2(QUOTE(QEGVAR(fastroping,doorsLocked)),false)])});
            };
        };

        class EventHandlers: EventHandlers {
            class RHS_EventHandlers: RHS_EventHandlers {
                getOut = QUOTE(if !((_this select 0) getVariable [ARR_2(QUOTE(QEGVAR(fastroping,doorsLocked)),false)]) then {_this call rhs_fnc_mi8_doors});
            };
        };
    };

    class RHS_Mi8_VVS_Base: RHS_Mi8_base {};
    class RHS_Mi8mt_vvs: RHS_Mi8_VVS_Base {};
    class RHS_Mi8mt_Cargo_vvs: RHS_Mi8mt_vvs {
        EGVAR(fastroping,enabled) = 1;
        EGVAR(fastroping,ropeOrigins)[] = {{-1.13, 4.67, -0.89}};
        EGVAR(fastroping,onCut) = QFUNC(onCut);
        EGVAR(fastroping,onPrepare) = QFUNC(onPrepare);

        class UserActions {
            class openDoor_L;
            class closeDoor_L: openDoor_L {
                condition = QUOTE((this doorPhase 'LeftDoor' > 0.5) && {alive this} && {!(this getVariable [ARR_2(QUOTE(QEGVAR(fastroping,doorsLocked)),false)])});
            };
        };

        class EventHandlers: EventHandlers {
            class RHS_EventHandlers: RHS_EventHandlers {
                getOut = QUOTE(if !((_this select 0) getVariable [ARR_2(QUOTE(QEGVAR(fastroping,doorsLocked)),false)]) then {_this call rhs_fnc_mi8_doors});
            };
        };
    };

    class Heli_Attack_02_base_F: Helicopter_Base_F {};
    class RHS_Ka52_base: Heli_Attack_02_base_F {
        EGVAR(refuel,fuelCapacity) = 1870;
        EGVAR(fastroping,enabled) = 0;
    };

    class RHS_Mi24_base: Heli_Attack_02_base_F {
        EGVAR(map,vehicleLightColor)[] = {1,0,0,0.1};
        EGVAR(refuel,fuelCapacity) = 1851;
        EGVAR(fastroping,enabled) = 0;
    };

    class rhs_t80b: rhs_tank_base {
        EGVAR(refuel,fuelCapacity) = 1100;
        EGVAR(vehicle_damage,canHaveFireRing) = 1;
    };
    class Truck_F: Car_F {};
    class RHS_Ural_BaseTurret: Truck_F {
        EGVAR(refuel,fuelCapacity) = 360;
    };

    class RHS_Ural_Base: RHS_Ural_BaseTurret {};
    class RHS_Ural_MSV_Base: RHS_Ural_Base {};
    class RHS_Ural_Support_MSV_Base_01: RHS_Ural_MSV_Base {};
    class RHS_Ural_Fuel_MSV_01: RHS_Ural_Support_MSV_Base_01 {
        transportFuel = 0;
        EGVAR(refuel,hooks)[] = {{-0.05,-3.6,-0.45}};
        EGVAR(refuel,fuelCargo) = 10000;
    };
    class RHS_Ural_Repair_MSV_01: RHS_Ural_Support_MSV_Base_01 {
        transportRepair = 0;
        EGVAR(repair,canRepair) = 1;
    };
    class RHS_Ural_Ammo_Base: RHS_Ural_Base {
        transportAmmo = 0;
        ace_rearm_defaultSupply = 1200;
    };

    class rhs_kraz255b1_base;
    class rhs_kraz255b1_fuel_base: rhs_kraz255b1_base {
        transportFuel = 0;
        EGVAR(refuel,hooks)[] = {{-0.05,-3.6,-0.45}};
        EGVAR(refuel,fuelCargo) = 10000;
    };

    class rhs_truck: Truck_F {
        EGVAR(refuel,fuelCapacity) = 210;
    };

    class rhs_gaz66_vmf: rhs_truck {};
    class rhs_gaz66_repair_base: rhs_gaz66_vmf {
        transportRepair = 0;
        EGVAR(repair,canRepair) = 1;
    };

    class rhs_gaz66_ammo_base: rhs_gaz66_vmf {
        transportAmmo = 0;
        ace_rearm_defaultSupply = 1200;
    };

    class rhs_kamaz5350: rhs_truck {};
    class rhs_kamaz5350_ammo_base: rhs_kamaz5350 {
        transportAmmo = 0;
        ace_rearm_defaultSupply = 1200;
    };

    class MRAP_02_base_F;
    class rhs_tigr_base: MRAP_02_base_F {
        EGVAR(refuel,fuelCapacity) = 138;
    };

    class Offroad_01_base_f;
    class RHS_UAZ_Base: Offroad_01_base_f {
        EGVAR(refuel,fuelCapacity) = 78;
    };

    class APC_Tracked_02_base_F: Tank_F {
        class Turrets: Turrets {
            class MainTurret: MainTurret {};
        };
    };

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
    };
    class rhs_btr70_vmf: rhs_btr_base {
        EGVAR(refuel,fuelCapacity) = 350;
    };

    class rhs_btr70_msv: rhs_btr70_vmf {};
    class rhs_btr80_msv: rhs_btr70_msv {
        EGVAR(refuel,fuelCapacity) = 300;
    };

    class rhs_2s3tank_base: Tank_F {
        EGVAR(refuel,fuelCapacity) = 830;
    };

    class OTR21_Base: Truck_F {
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
    };
    class rhs_bmp1tank_base: Tank_F {
        EGVAR(map,vehicleLightColor)[] = {0,1,0,0.1};
        EGVAR(refuel,fuelCapacity) = 460;
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
    class rhs_bmp_base: rhs_bmp1tank_base {
        EGVAR(vehicle_damage,hullDetonationProb) = 0;
        EGVAR(vehicle_damage,turretDetonationProb) = 0.2;
        EGVAR(vehicle_damage,engineDetonationProb) = 0;
        EGVAR(vehicle_damage,hullFireProb) = 0.8;
        EGVAR(vehicle_damage,turretFireProb) = 0.5;
        EGVAR(vehicle_damage,engineFireProb) = 0.8;
        EGVAR(vehicle_damage,detonationDuringFireProb) = 0.5;
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
            "era_37_hitpoint",
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
            "era_37_hitpoint",
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
            "era_31_hitpoint", "era_32_hitpoint"
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
            "era_51_hitpoint", "era_62_hitpoint", "era_63_hitpoint", "era_64_hitpoint", "era_65_hitpoint", "era_66_hitpoint"
        };
        EGVAR(vehicle_damage,slatHitpoints)[] = {
            "SLAT_18_hitpoint", "SLAT_19_hitpoint", "SLAT_20_hitpoint", "SLAT_21_hitpoint",
            "SLAT_22_hitpoint", "SLAT_23_hitpoint", "SLAT_24_hitpoint", "SLAT_25_hitpoint",
            "SLAT_51_hitpoint", "SLAT_52_hitpoint", "SLAT_53_hitpoint", "SLAT_54_hitpoint"
        };
    };
    class rhs_t90sm_tv: rhs_t90am_tv {
        EGVAR(vehicle_damage,slatHitpoints)[] = {
            "SLAT_23_hitpoint", "SLAT_26_hitpoint", "SLAT_51_hitpoint", "SLAT_52_hitpoint",
            "SLAT_53_hitpoint", "SLAT_54_hitpoint", "SLAT_55_hitpoint", "SLAT_56_hitpoint",
            "SLAT_57_hitpoint"
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

    class StaticWeapon: LandVehicle {
        class ACE_Actions {
            class ACE_MainActions;
        };
    };
    class StaticMGWeapon: StaticWeapon {};
    class AT_01_base_F: StaticMGWeapon {};

    class rhs_SPG9_base: AT_01_base_F {
        class ACE_Actions: ACE_Actions {
            class ACE_MainActions: ACE_MainActions {
                position = "";
            };
        };
        // ENABLE_CSW_ATTRIBUTE;
        class ACE_CSW {
            enabled = 1;
            proxyWeapon = QGVAR(rhs_weap_SPG9);
            magazineLocation = "_target selectionPosition 'breach'";
            disassembleWeapon = QGVAR(spg9_carry);
            disassembleTurret = QEGVAR(csw,spg9Tripod);
            desiredAmmo = 1;
            ammoLoadTime = 5;
            ammoUnloadTime = 3;
        };
    };
    class rhs_Kornet_Base: AT_01_base_F {
        class ACE_Actions: ACE_Actions {
            class ACE_MainActions: ACE_MainActions {
                position = "";
                selection = "tripod";
            };
        };
        // ENABLE_CSW_ATTRIBUTE;
        class ACE_CSW {
            enabled = 1;
            proxyWeapon = QGVAR(rhs_weap_9K133_launcher);
            magazineLocation = "_target selectionPosition 'gun'";
            disassembleWeapon = QGVAR(kornet_carry);
            disassembleTurret = "";
            desiredAmmo = 1;
            ammoLoadTime = 7;
            ammoUnloadTime = 5;
        };
    };

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

    class StaticMortar: StaticWeapon {};
    class rhs_2b14_82mm_Base: StaticMortar {
        class ACE_Actions: ACE_Actions {
            class ACE_MainActions: ACE_MainActions {
                position = "";
                selection = ""; // no good selections for this mortar
            };
        };
        // ENABLE_CSW_ATTRIBUTE;
        class ACE_CSW {
            enabled = 1;
            magazineLocation = "";
            proxyWeapon = QGVAR(rhs_weap_2b14);
            disassembleWeapon = QGVAR(2b14_carry); // carry weapon [CfgWeapons]
            disassembleTurret = QEGVAR(csw,mortarBaseplate); // turret [CfgVehicles]
            desiredAmmo = 1;
            ammoLoadTime = 3;
            ammoUnloadTime = 3;
        };
    };

    class rhs_nsv_tripod_base: StaticMGWeapon {
        class ACE_CSW {
            enabled = 1;
            proxyWeapon = QGVAR(rhs_weap_nsvt_effects);
            magazineLocation = "_target selectionPosition 'magazine'";
            disassembleWeapon = QGVAR(nsv_carry);
            disassembleTurret = QEGVAR(csw,kordTripodLow);
            desiredAmmo = 50;
            ammoLoadTime = 10;
            ammoUnloadTime = 8;
        };
    };

    class RHS_KORD_Base: rhs_nsv_tripod_base {
        class ACE_CSW: ACE_CSW {
            enabled = 1;
            proxyWeapon = QGVAR(rhs_weap_KORD);
            disassembleWeapon = QGVAR(kord_carry);
            disassembleTurret = QEGVAR(csw,kordTripodLow);
        };
    };

    class RHS_KORD_high_base: RHS_KORD_Base {
        class ACE_CSW: ACE_CSW {
            enabled = 1;
            proxyWeapon = QGVAR(rhs_weap_KORD);
            disassembleWeapon = QGVAR(kord_carry);
            disassembleTurret = QEGVAR(csw,kordTripod);
        };
    };

    class StaticGrenadeLauncher: StaticWeapon {};
    class RHS_AGS30_TriPod_base: StaticGrenadeLauncher {
        // ENABLE_CSW_ATTRIBUTE;
        class ACE_CSW {
            enabled = 1;
            proxyWeapon = QGVAR(rhs_weap_AGS30);
            magazineLocation = "_target selectionPosition 'magazine'";
            disassembleWeapon = QGVAR(ags30_carry);
            disassembleTurret = QEGVAR(csw,sag30Tripod);
            desiredAmmo = 30;
            ammoLoadTime = 10;
            ammoUnloadTime = 8;
        };
    };

    class rhs_SPG9M_base: rhs_SPG9_base {
        class ACE_CSW: ACE_CSW {
            enabled = 1;
            disassembleWeapon = QGVAR(spg9m_carry);
        };
    };

    class rhs_Metis_Base: AT_01_base_F {
        // ENABLE_CSW_ATTRIBUTE;
        class ACE_CSW {
            enabled = 1;
            proxyWeapon = QGVAR(rhs_weap_9K115_2_launcher);
            magazineLocation = "_target selectionPosition 'gun'";
            disassembleWeapon = QGVAR(metis_carry);
            disassembleTurret = "";
            desiredAmmo = 1;
            ammoLoadTime = 7;
            ammoUnloadTime = 5;
        };
    };

    // ACE Explosives
    class Items_base_F;
    class ACE_Explosives_Place: Items_base_F {
        class ACE_Actions {
            class ACE_MainActions;
        };
    };

    class ACE_Explosives_Place_rhs_mine_tm62m: ACE_Explosives_Place {
        displayName = "$STR_RHS_CFGMAGAZINES_TM62M0";
        model = "\rhsafrf\addons\rhs_weapons\mines\rhs_tm62m";
        class ACE_Actions: ACE_Actions {
            class ACE_MainActions: ACE_MainActions {
                position = "[0.005, -0.025, 0.06]";
            };
        };
    };

    class ACE_Explosives_Place_rhs_mine_pmn2: ACE_Explosives_Place {
        displayName = "$STR_RHS_CFGMAGAZINES_PMN20";
        model = "\rhsafrf\addons\rhs_weapons\mines\rhs_pmn2";
        class ACE_Actions: ACE_Actions {
            class ACE_MainActions: ACE_MainActions {
                position = "[0, 0, 0.012]";
            };
        };
    };

    class ACE_Explosives_Place_rhs_mine_ptm1: ACE_Explosives_Place {
        displayName = "$STR_RHS_PTM1_NAME";
        model = "\rhsafrf\addons\rhs_airweapons\rhs_m_ptm1_d";
        class ACE_Actions: ACE_Actions {
            class ACE_MainActions: ACE_MainActions {
                position = "[0, -0.17, 0.02]";
            };
        };
    };

    class ACE_Explosives_Place_rhs_mine_pfm1: ACE_Explosives_Place {
        displayName = "$STR_RHS_PFM1_NAME";
        model = "\rhsafrf\addons\rhs_airweapons\rhs_m_pfm1_d";
        class ACE_Actions: ACE_Actions {
            class ACE_MainActions: ACE_MainActions {
                position = "[-0.015, 0.018, 0]";
            };
        };
    };

    class ACE_Explosives_Place_rhs_ec75: ACE_Explosives_Place {
        displayName = "$STR_RHS_CFGMAGAZINES_EC75";
        model = "\rhsafrf\addons\rhs_weapons2\explosives\rhs_ec75_e";
        class ACE_Actions: ACE_Actions {
            class ACE_MainActions: ACE_MainActions {
                position = "[0, -0.04, 0.02]";
            };
        };
    };

    class ACE_Explosives_Place_rhs_ec75_sand: ACE_Explosives_Place_rhs_ec75 {
        displayName = "$STR_RHS_CFGMAGAZINES_EC75_SAND";
        model = "\rhsafrf\addons\rhs_weapons2\explosives\rhs_ec75_sand_e";
    };

    class ACE_Explosives_Place_rhs_ec200: ACE_Explosives_Place {
        displayName = "$STR_RHS_CFGMAGAZINES_EC200";
        model = "\rhsafrf\addons\rhs_weapons2\explosives\rhs_ec200_e";
        class ACE_Actions: ACE_Actions {
            class ACE_MainActions: ACE_MainActions {
                position = "[0, -0.05, 0.008]";
            };
        };
    };

    class ACE_Explosives_Place_rhs_ec200_sand: ACE_Explosives_Place_rhs_ec200 {
        displayName = "$STR_RHS_CFGMAGAZINES_EC200_SAND";
        model = "\rhsafrf\addons\rhs_weapons2\explosives\rhs_ec200_sand_e";
    };

    class ACE_Explosives_Place_rhs_ec400: ACE_Explosives_Place {
        displayName = "$STR_RHS_CFGMAGAZINES_EC400";
        model = "\rhsafrf\addons\rhs_weapons2\explosives\rhs_ec400_e";
        class ACE_Actions: ACE_Actions {
            class ACE_MainActions: ACE_MainActions {
                position = "[0, -0.03, 0.02]";
            };
        };
    };

    class ACE_Explosives_Place_rhs_ec400_sand: ACE_Explosives_Place_rhs_ec400 {
        displayName = "$STR_RHS_CFGMAGAZINES_EC400_SAND";
        model = "\rhsafrf\addons\rhs_weapons2\explosives\rhs_ec400_sand_e";
    };

    class ACE_Explosives_Place_rhs_mine_msk40p_white: ACE_Explosives_Place {
        displayName = "$STR_RHS_MINE_MSK40P_W_MAG_DISPLAYNAME";
        model = "\rhsafrf\addons\rhs_weapons\mines\rhs_msk40p_white_e";
        class ACE_Actions: ACE_Actions {
            class ACE_MainActions: ACE_MainActions {
               position = "[-0.025, 0, 0.4]";
            };
        };
    };

    class ACE_Explosives_Place_rhs_mine_msk40p_red: ACE_Explosives_Place_rhs_mine_msk40p_white {
        displayName = "$STR_RHS_MINE_MSK40P_R_MAG_DISPLAYNAME";
        model = "\rhsafrf\addons\rhs_weapons\mines\rhs_msk40p_red_e";
    };

    class ACE_Explosives_Place_rhs_mine_msk40p_green: ACE_Explosives_Place_rhs_mine_msk40p_white {
        displayName = "$STR_RHS_MINE_MSK40P_G_MAG_DISPLAYNAME";
        model = "\rhsafrf\addons\rhs_weapons\mines\rhs_msk40p_green_e";
    };

    class ACE_Explosives_Place_rhs_mine_msk40p_blue: ACE_Explosives_Place_rhs_mine_msk40p_white {
        displayName = "$STR_RHS_MINE_MSK40P_B_MAG_DISPLAYNAME";
        model = "\rhsafrf\addons\rhs_weapons\mines\rhs_msk40p_blue_e";
    };

    class ACE_Explosives_Place_rhs_mine_sm320_white: ACE_Explosives_Place {
        displayName = "$STR_RHS_MINE_SM320_W_MAG_DISPLAYNAME";
        model = "\rhsafrf\addons\rhs_weapons\mines\rhs_sm320_white_e";
        class ACE_Actions: ACE_Actions {
            class ACE_MainActions: ACE_MainActions {
               position = "[-0.01, 0, 0.25]";
            };
        };
    };

    class ACE_Explosives_Place_rhs_mine_sm320_red: ACE_Explosives_Place_rhs_mine_sm320_white {
        displayName = "$STR_RHS_MINE_SM320_R_MAG_DISPLAYNAME";
        model = "\rhsafrf\addons\rhs_weapons\mines\rhs_sm320_red_e";
    };

    class ACE_Explosives_Place_rhs_mine_sm320_green: ACE_Explosives_Place_rhs_mine_sm320_white {
        displayName = "$STR_RHS_MINE_SM320_G_MAG_DISPLAYNAME";
        model = "\rhsafrf\addons\rhs_weapons\mines\rhs_sm320_green_e";
    };

    class ACE_Explosives_Place_rhs_mine_ozm72_a: ACE_Explosives_Place {
        displayName = "$STR_RHS_CFGMAGAZINES_OZM72A";
        model = "\rhsafrf\addons\rhs_weapons\mines\rhs_ozm72_a_e";
        class ACE_Actions: ACE_Actions {
            class ACE_MainActions: ACE_MainActions {
               position = "[0, 0.125, 0.11]";
            };
        };
    };

    class ACE_Explosives_Place_rhs_mine_ozm72_b: ACE_Explosives_Place_rhs_mine_ozm72_a {
        displayName = "$STR_RHS_CFGMAGAZINES_OZM72B";
        model = "\rhsafrf\addons\rhs_weapons\mines\rhs_ozm72_b_e";
    };

    class ACE_Explosives_Place_rhs_mine_ozm72_c: ACE_Explosives_Place_rhs_mine_ozm72_a {
        displayName = "$STR_RHS_CFGMAGAZINES_OZM72C";
        model = "\rhsafrf\addons\rhs_weapons\mines\rhs_ozm72_c_e";
        class ACE_Actions: ACE_Actions {
            class ACE_MainActions: ACE_MainActions {
               position = "[0, 0.015, 0.12]";
            };
        };
    };
};
