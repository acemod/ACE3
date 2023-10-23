class CfgVehicles {
    class Heli_light_03_base_F;
    class RHS_UH1_Base: Heli_light_03_base_F {
        EGVAR(refuel,fuelCapacity) = 1447;
    };
    class Heli_Transport_01_base_F;
    class RHS_UH60_Base: Heli_Transport_01_base_F {
        EGVAR(refuel,fuelCapacity) = 1360;
    };

    class Heli_Transport_02_base_F;
    class RHS_CH_47F_base: Heli_Transport_02_base_F {
        EGVAR(refuel,fuelCapacity) = 3914;
    };
    class Helicopter_Base_H;
    class rhsusf_CH53E_USMC: Helicopter_Base_H {
        EGVAR(interaction,bodyWidth) = 3.5;
        EGVAR(map,vehicleLightColor)[] = {1,0,0,0.1};
    };

    class Heli_Attack_01_base_F;
    class RHS_AH1Z_base: Heli_Attack_01_base_F {
        EGVAR(refuel,fuelCapacity) = 1600;
        EGVAR(hellfire,addLaserDesignator) = 1;
    };

    class RHS_AH64_base: Heli_Attack_01_base_F {
        EGVAR(refuel,fuelCapacity) = 1420;
        EGVAR(hellfire,addLaserDesignator) = 1;
    };

    class MBT_01_arty_base_F;
    class rhsusf_m109tank_base: MBT_01_arty_base_F {
        EGVAR(refuel,fuelCapacity) = 511;
    };

    class MRAP_01_base_F;
    class rhsusf_hmmwe_base: MRAP_01_base_F {
        EGVAR(refuel,fuelCapacity) = 95;
    };

    class rhsusf_rg33_base: MRAP_01_base_F {
        EGVAR(refuel,fuelCapacity) = 302;
    };

    class Truck_F;
    class Truck_01_base_F: Truck_F {};
    class rhsusf_fmtv_base: Truck_01_base_F {
        EGVAR(refuel,fuelCapacity) = 219;
    };
    class rhsusf_M1078A1P2_B_M2_fmtv_usarmy;
    class rhsusf_M1078A1R_SOV_M2_D_fmtv_socom: rhsusf_M1078A1P2_B_M2_fmtv_usarmy {
        EGVAR(rearm,defaultSupply) = 800;
        EGVAR(refuel,hooks)[] = {{1.1,0.9,-1.2}};
        EGVAR(refuel,fuelCargo) = 900; // 45 jerrycans
    };

    class rhsusf_HEMTT_A4_base: Truck_01_base_F {};
    class rhsusf_M977A4_usarmy_wd: rhsusf_HEMTT_A4_base {};
    class rhsusf_M977A4_AMMO_usarmy_wd: rhsusf_M977A4_usarmy_wd {
        EGVAR(rearm,defaultSupply) = 1200;
    };

    class rhsusf_M977A4_BKIT_usarmy_wd;
    class rhsusf_M977A4_AMMO_BKIT_usarmy_wd: rhsusf_M977A4_BKIT_usarmy_wd {
        EGVAR(rearm,defaultSupply) = 1200;
    };

    class rhsusf_M977A4_BKIT_M2_usarmy_wd;
    class rhsusf_M977A4_AMMO_BKIT_M2_usarmy_wd: rhsusf_M977A4_BKIT_M2_usarmy_wd {
        EGVAR(rearm,defaultSupply) = 1200;
    };

    class rhsusf_M978A4_usarmy_wd: rhsusf_M977A4_usarmy_wd {
        EGVAR(refuel,hooks)[] = {{-0.44,-4.87,0}, {0.5,-4.87,0}};
        EGVAR(refuel,fuelCargo) = 10000;
    };

    class rhsusf_M978A4_BKIT_usarmy_wd: rhsusf_M977A4_usarmy_wd {
        EGVAR(refuel,hooks)[] = {{-0.44,-4.87,0}, {0.5,-4.87,0}};
        EGVAR(refuel,fuelCargo) = 10000;
    };
    class Tank_F;
    class APC_Tracked_02_base_F: Tank_F {};
    class rhsusf_m113tank_base: APC_Tracked_02_base_F {
        EGVAR(map,vehicleLightColor)[] = {0,1,0,0.1};
        EGVAR(refuel,fuelCapacity) = 360;
        EGVAR(vehicle_damage,hullDetonationProb) = 0.2;
        EGVAR(vehicle_damage,turretDetonationProb) = 0.2;
        EGVAR(vehicle_damage,engineDetonationProb) = 0;
        EGVAR(vehicle_damage,hullFireProb) = 0.7;
        EGVAR(vehicle_damage,turretFireProb) = 0.2;
        EGVAR(vehicle_damage,engineFireProb) = 0.8;
        EGVAR(vehicle_damage,detonationDuringFireProb) = 0.5;
    };

    class rhsusf_m113_usarmy;
    class rhsusf_m113_usarmy_supply: rhsusf_m113_usarmy {
        EGVAR(rearm,defaultSupply) = 1200;
    };

    class Wheeled_APC_F;
    class APC_Tracked_03_base_F;
    class RHS_M2A2_Base: APC_Tracked_03_base_F {
        EGVAR(refuel,fuelCapacity) = 746;
        EGVAR(vehicle_damage,canHaveFireRing) = 1;
        EGVAR(vehicle_damage,hullDetonationProb) = 0.2;
        EGVAR(vehicle_damage,turretDetonationProb) = 0.2;
        EGVAR(vehicle_damage,engineDetonationProb) = 0;
        EGVAR(vehicle_damage,hullFireProb) = 0.2;
        EGVAR(vehicle_damage,turretFireProb) = 0.2;
        EGVAR(vehicle_damage,engineFireProb) = 0.8;
        EGVAR(vehicle_damage,detonationDuringFireProb) = 0.5;
    };
    class rhsusf_M1117_base: Wheeled_APC_F {
        EGVAR(vehicle_damage,hullDetonationProb) = 0.2;
        EGVAR(vehicle_damage,turretDetonationProb) = 0.2;
        EGVAR(vehicle_damage,engineDetonationProb) = 0;
        EGVAR(vehicle_damage,hullFireProb) = 0.7;
        EGVAR(vehicle_damage,turretFireProb) = 0.2;
        EGVAR(vehicle_damage,engineFireProb) = 0.8;
        EGVAR(vehicle_damage,detonationDuringFireProb) = 0.5;
    };
    class rhsusf_stryker_base: Wheeled_APC_F {
        EGVAR(vehicle_damage,hullDetonationProb) = 0.2;
        EGVAR(vehicle_damage,turretDetonationProb) = 0.2;
        EGVAR(vehicle_damage,engineDetonationProb) = 0;
        EGVAR(vehicle_damage,hullFireProb) = 0.5;
        EGVAR(vehicle_damage,turretFireProb) = 0.2;
        EGVAR(vehicle_damage,engineFireProb) = 0.7;
        EGVAR(vehicle_damage,detonationDuringFireProb) = 0.5;
    };
    class MBT_01_base_F;
    class rhsusf_m1a1tank_base: MBT_01_base_F {
        EGVAR(refuel,fuelCapacity) = 1909;
        EGVAR(vehicle_damage,hullDetonationProb) = 0;
        EGVAR(vehicle_damage,turretDetonationProb) = 0;
        EGVAR(vehicle_damage,engineDetonationProb) = 0;
        EGVAR(vehicle_damage,hullFireProb) = 0;
        EGVAR(vehicle_damage,turretFireProb) = 0;
        EGVAR(vehicle_damage,engineFireProb) = 0.5;
        EGVAR(vehicle_damage,detonationDuringFireProb) = 0;
        EGVAR(vehicle_damage,hitpointAlias)[] = { { "hull", { "hitammohull", "hitammo" } } };
    };

    class RHS_M2A2;
    class RHS_M2A2_BUSKI: RHS_M2A2 {
        EGVAR(vehicle_damage,eraHitpoints)[] = {
            "era_1_hitpoint", "era_2_hitpoint", "era_3_hitpoint", "era_4_hitpoint", "era_5_hitpoint",
            "era_6_hitpoint", "era_7_hitpoint", "era_8_hitpoint", "era_9_hitpoint", "era_10_hitpoint",
            "era_11_hitpoint", "era_12_hitpoint", "era_13_hitpoint", "era_14_hitpoint", "era_15_hitpoint",
            "era_16_hitpoint", "era_17_hitpoint", "era_18_hitpoint", "era_19_hitpoint", "era_20_hitpoint",
            "era_21_hitpoint", "era_22_hitpoint", "era_23_hitpoint", "era_24_hitpoint", "era_25_hitpoint",
            "era_26_hitpoint", "era_27_hitpoint", "era_28_hitpoint", "era_29_hitpoint", "era_30_hitpoint",
            "era_31_hitpoint", "era_32_hitpoint", "era_33_hitpoint", "era_34_hitpoint", "era_35_hitpoint",
            "era_36_hitpoint", "era_37_hitpoint", "era_38_hitpoint", "era_39_hitpoint", "era_40_hitpoint",
            "era_41_hitpoint", "era_42_hitpoint", "era_43_hitpoint", "era_44_hitpoint", "era_45_hitpoint"
        };
        EGVAR(vehicle_damage,canHaveFireRing) = 1;
    };
    class RHS_M2A3: RHS_M2A2 {
        ace_hunterkiller = 1;
    };
    class RHS_M2A3_BUSKI: RHS_M2A3 {
        EGVAR(vehicle_damage,eraHitpoints)[] = {
            "era_1_hitpoint", "era_2_hitpoint", "era_3_hitpoint", "era_4_hitpoint", "era_5_hitpoint",
            "era_6_hitpoint", "era_7_hitpoint", "era_8_hitpoint", "era_9_hitpoint", "era_10_hitpoint",
            "era_11_hitpoint", "era_12_hitpoint", "era_13_hitpoint", "era_14_hitpoint", "era_15_hitpoint",
            "era_16_hitpoint", "era_17_hitpoint", "era_18_hitpoint", "era_19_hitpoint", "era_20_hitpoint",
            "era_21_hitpoint", "era_22_hitpoint", "era_23_hitpoint", "era_24_hitpoint", "era_25_hitpoint",
            "era_26_hitpoint", "era_27_hitpoint", "era_28_hitpoint", "era_29_hitpoint", "era_30_hitpoint",
            "era_31_hitpoint", "era_32_hitpoint", "era_33_hitpoint", "era_34_hitpoint", "era_35_hitpoint",
            "era_36_hitpoint", "era_37_hitpoint", "era_38_hitpoint", "era_39_hitpoint", "era_40_hitpoint",
            "era_41_hitpoint", "era_42_hitpoint", "era_43_hitpoint", "era_44_hitpoint", "era_45_hitpoint"
        };
        EGVAR(vehicle_damage,canHaveFireRing) = 1;
    };
    class RHS_M2A3_BUSKIII: RHS_M2A3_BUSKI {
        EGVAR(vehicle_damage,eraHitpoints)[] = {
            "era_1_hitpoint", "era_2_hitpoint", "era_3_hitpoint", "era_4_hitpoint", "era_5_hitpoint",
            "era_6_hitpoint", "era_7_hitpoint", "era_8_hitpoint", "era_9_hitpoint", "era_10_hitpoint",
            "era_11_hitpoint", "era_12_hitpoint", "era_13_hitpoint", "era_14_hitpoint", "era_15_hitpoint",
            "era_16_hitpoint", "era_17_hitpoint", "era_18_hitpoint", "era_19_hitpoint", "era_20_hitpoint",
            "era_21_hitpoint", "era_22_hitpoint", "era_23_hitpoint", "era_24_hitpoint", "era_25_hitpoint",
            "era_26_hitpoint", "era_27_hitpoint", "era_28_hitpoint", "era_29_hitpoint", "era_30_hitpoint",
            "era_31_hitpoint", "era_32_hitpoint", "era_33_hitpoint", "era_34_hitpoint", "era_35_hitpoint",
            "era_36_hitpoint", "era_37_hitpoint", "era_38_hitpoint", "era_39_hitpoint", "era_40_hitpoint",
            "era_41_hitpoint", "era_42_hitpoint", "era_43_hitpoint", "era_44_hitpoint", "era_45_hitpoint",
            "era_46_hitpoint", "era_47_hitpoint", "era_48_hitpoint", "era_49_hitpoint", "era_50_hitpoint",
            "era_51_hitpoint", "era_52_hitpoint", "era_53_hitpoint", "era_54_hitpoint", "era_55_hitpoint",
            "era_56_hitpoint", "era_57_hitpoint", "era_58_hitpoint", "era_59_hitpoint"
        };
    };
    class rhsusf_m1a1aim_tuski_wd: rhsusf_m1a1tank_base {
        EGVAR(vehicle_damage,eraHitpoints)[] = {
            "era_1_hitpoint", "era_2_hitpoint", "era_3_hitpoint", "era_4_hitpoint", "era_5_hitpoint",
            "era_6_hitpoint", "era_7_hitpoint", "era_8_hitpoint", "era_9_hitpoint", "era_10_hitpoint",
            "era_11_hitpoint", "era_12_hitpoint", "era_13_hitpoint", "era_14_hitpoint", "era_15_hitpoint",
            "era_16_hitpoint", "era_17_hitpoint", "era_18_hitpoint", "era_19_hitpoint", "era_20_hitpoint",
            "era_21_hitpoint", "era_22_hitpoint", "era_23_hitpoint", "era_24_hitpoint", "era_25_hitpoint",
            "era_26_hitpoint", "era_27_hitpoint", "era_28_hitpoint", "era_29_hitpoint", "era_30_hitpoint",
            "era_31_hitpoint", "era_32_hitpoint", "era_33_hitpoint", "era_34_hitpoint"
        };
        EGVAR(vehicle_damage,slatHitpoints)[] = { "SLAT_1_hitpoint" };
    };
    class rhsusf_m1a2tank_base;
    class rhsusf_m1a2sep1tuskid_usarmy: rhsusf_m1a2tank_base {
        EGVAR(vehicle_damage,eraHitpoints)[] = {
            "era_1_hitpoint", "era_2_hitpoint", "era_3_hitpoint", "era_4_hitpoint", "era_5_hitpoint",
            "era_6_hitpoint", "era_7_hitpoint", "era_8_hitpoint", "era_9_hitpoint", "era_10_hitpoint",
            "era_11_hitpoint", "era_12_hitpoint", "era_13_hitpoint", "era_14_hitpoint", "era_15_hitpoint",
            "era_16_hitpoint", "era_17_hitpoint", "era_18_hitpoint", "era_19_hitpoint", "era_20_hitpoint",
            "era_21_hitpoint", "era_22_hitpoint", "era_23_hitpoint", "era_24_hitpoint", "era_25_hitpoint",
            "era_26_hitpoint", "era_27_hitpoint", "era_28_hitpoint", "era_29_hitpoint", "era_30_hitpoint",
            "era_31_hitpoint", "era_32_hitpoint", "era_33_hitpoint", "era_34_hitpoint"
        };
        EGVAR(vehicle_damage,slatHitpoints)[] = { "SLAT_1_hitpoint" };
    };
    class rhsusf_m1a2sep1tuskiiwd_usarmy: rhsusf_m1a2sep1tuskid_usarmy {
        EGVAR(vehicle_damage,eraHitpoints)[] = {
            "era_1_hitpoint", "era_2_hitpoint", "era_3_hitpoint", "era_4_hitpoint", "era_5_hitpoint",
            "era_6_hitpoint", "era_7_hitpoint", "era_8_hitpoint", "era_9_hitpoint", "era_10_hitpoint",
            "era_11_hitpoint", "era_12_hitpoint", "era_13_hitpoint", "era_14_hitpoint", "era_15_hitpoint",
            "era_16_hitpoint", "era_17_hitpoint", "era_18_hitpoint", "era_19_hitpoint", "era_20_hitpoint",
            "era_21_hitpoint", "era_22_hitpoint", "era_23_hitpoint", "era_24_hitpoint", "era_25_hitpoint",
            "era_26_hitpoint", "era_27_hitpoint", "era_28_hitpoint", "era_29_hitpoint", "era_30_hitpoint",
            "era_31_hitpoint", "era_32_hitpoint", "era_33_hitpoint", "era_34_hitpoint", "era_35_hitpoint",
            "era_36_hitpoint", "era_37_hitpoint", "era_38_hitpoint", "era_39_hitpoint", "era_40_hitpoint",
            "era_41_hitpoint", "era_42_hitpoint", "era_43_hitpoint", "era_44_hitpoint", "era_45_hitpoint",
            "era_46_hitpoint"
        };
    };

    class Plane_CAS_01_base_F;
    class RHS_A10: Plane_CAS_01_base_F {
        EGVAR(refuel,fuelCapacity) = 6223;
    };

    class Plane_Base_F;
    class RHS_C130J_Base: Plane_Base_F {
        EGVAR(refuel,fuelCapacity) = 25704;
        EGVAR(cargo,space) = 4;
        EGVAR(cargo,hasCargo) = 1;
    };

    class rhsusf_infantry_usmc_base;
    class rhsusf_usmc_marpat_wd_helipilot: rhsusf_infantry_usmc_base {
        ace_gforcecoef = 0.55;
    };

    class rhsusf_infantry_army_base;
    class rhsusf_army_ocp_helipilot: rhsusf_infantry_army_base {
        ace_gforcecoef = 0.55;
    };

    class rhsusf_usmc_marpat_wd_rifleman_m4;
    class rhsusf_airforce_jetpilot: rhsusf_usmc_marpat_wd_rifleman_m4 {
        ace_gforcecoef = 0.55;
    };

    class Items_base_F;
    class rhsusf_props_JerryCan_Base: Items_base_F {
        EGVAR(cargo,canLoad) = 1;
        EGVAR(cargo,size) = 1;
        EGVAR(dragging,canCarry) = 1;
    };

    class rhsusf_props_ScepterMWC_Base: rhsusf_props_JerryCan_Base {
        EXGVAR(field_rations,waterSupply) = 20;
        EXGVAR(field_rations,offset)[] = {-0.13, 0, 0.2};
    };
};
