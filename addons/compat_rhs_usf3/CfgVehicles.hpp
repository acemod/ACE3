#if __has_include("\z\ace\addons\fastroping\script_macros.hpp")
#include "\z\ace\addons\fastroping\script_macros.hpp"
#else
#define EQUIP_FRIES_ATTRIBUTE
#endif

class CfgVehicles {
    class LandVehicle;
    class Car: LandVehicle {
        class ACE_Actions {
            class ACE_MainActions {};
        };
    };
    class Car_F: Car {};
    class Truck_F: Car_F {};
    class rhs_truck: Truck_F {};

    class Tank: LandVehicle {
        class NewTurret;
        class ACE_Actions {
            class ACE_MainActions {};
        };
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
    class Air;
    class Helicopter: Air {
        class Turrets {
            class MainTurret;
        };
    };

    class MBT_01_base_F: Tank_F {};
    class Helicopter_Base_F: Helicopter {
        class Eventhandlers;
    };
    class Heli_Light_03_base_F: Helicopter_Base_F {};
    class RHS_UH1_Base: Heli_light_03_base_F {
        EGVAR(refuel,fuelCapacity) = 1447;
    };

    class RHS_UH1Y_base: RHS_UH1_Base {
        class Attributes {
            EQUIP_FRIES_ATTRIBUTE;
        };
    };
    class RHS_UH1Y_US_base: RHS_UH1Y_base {};
    class RHS_UH1Y: RHS_UH1Y_US_base {
        EGVAR(fastroping,enabled) = 2;
        EGVAR(fastroping,friesType) = "ACE_friesAnchorBar";
        EGVAR(fastroping,friesAttachmentPoint)[] = {0, 2.38, -0.135};
        EGVAR(fastroping,onCut) = QFUNC(onCut);
        EGVAR(fastroping,onPrepare) = QFUNC(onPrepare);
        EGVAR(fastroping,ropeOrigins)[] = {"ropeOriginLeft", "ropeOriginRight"};

        class UserActions;
        class EventHandlers: EventHandlers {
            class RHSUSF_EventHandlers;
        };
    };
    class RHS_UH1Y_FFAR: RHS_UH1Y {
        class UserActions: UserActions {
            class OpenCargoDoor;
            class CloseCargoDoor: OpenCargoDoor {
                condition = QUOTE([ARR_2(this,'doorRB')] call FUNC(canCloseDoor));
            };
            class CloseCargoLDoor: OpenCargoDoor {
                condition = QUOTE([ARR_2(this,'doorLB')] call FUNC(canCloseDoor));
            };
        };
    };

    class Helicopter_Base_H: Helicopter_Base_F {
        class Eventhandlers;
    };
    class Heli_Transport_01_base_F: Helicopter_Base_H {};

    class RHS_MELB_base: Helicopter_Base_H {};
    class RHS_MELB_MH6M: RHS_MELB_base {
        EGVAR(fastroping,enabled) = 1;
        EGVAR(fastroping,ropeOrigins)[] = {{1.166, 0.79, -0.01}, {-1.166, 0.79, -0.01}};
        EGVAR(fastroping,onCut) = QFUNC(onCut);
        EGVAR(fastroping,onPrepare) = QFUNC(onPrepare);
    };
    class RHS_UH60_Base: Heli_Transport_01_base_F {
        EGVAR(refuel,fuelCapacity) = 1360;
    };

    class RHS_UH60M_base: RHS_UH60_Base {
        class Attributes {
            EQUIP_FRIES_ATTRIBUTE;
        };
    };
    class RHS_UH60M_US_base: RHS_UH60M_base {};
    class RHS_UH60M: RHS_UH60M_US_base {
        EGVAR(fastroping,enabled) = 2;
        EGVAR(fastroping,friesType) = "ACE_friesAnchorBar";
        EGVAR(fastroping,friesAttachmentPoint)[] = {0, 1.25, -0.65};
        EGVAR(fastroping,onCut) = QFUNC(onCut);
        EGVAR(fastroping,onPrepare) = QFUNC(onPrepare);
        EGVAR(fastroping,ropeOrigins)[] = {"ropeOriginLeft", "ropeOriginRight"};

        class UserActions {
            class OpenCargoDoor;
            class CloseCargoDoor: OpenCargoDoor {
                condition = QUOTE([ARR_2(this,'doorRB')] call FUNC(canCloseDoor));
            };
            class CloseCargoLDoor: OpenCargoDoor {
                condition = QUOTE([ARR_2(this,'doorLB')] call FUNC(canCloseDoor));
            };
        };
    };
    class RHS_UH60M2: RHS_UH60M {};

    class RHS_UH60M_ESSS: RHS_UH60M2 {
        EGVAR(fastroping,enabled) = 0;
        class Attributes: Attributes {
            delete EGVAR(fastroping,equipFRIES);
        };
    };

    class RHS_UH60M_MEV: RHS_UH60M {
        EGVAR(fastroping,enabled) = 0;
        class Attributes: Attributes {
            delete EGVAR(fastroping,equipFRIES);
        };
    };

    class RHS_UH60M_MEV2: RHS_UH60M_MEV {
        EGVAR(fastroping,enabled) = 2;
        class Attributes: Attributes {
            EQUIP_FRIES_ATTRIBUTE;
        };
    };

    class Heli_Transport_02_base_F;
    class RHS_CH_47F_base: Heli_Transport_02_base_F {
        EGVAR(refuel,fuelCapacity) = 3914;
        EGVAR(fastroping,enabled) = 1;
        EGVAR(fastroping,ropeOrigins)[] = {{0.5, -7.15, -0.95}, {-0.5, -7.15, -0.95}};
        EGVAR(fastroping,onCut) = QFUNC(onCut);
        EGVAR(fastroping,onPrepare) = QFUNC(onPrepare);

        class UserActions {
            class OpenCargoDoor;
            class CloseCargoDoor: OpenCargoDoor {
                condition = QUOTE([ARR_2(this,'ramp_anim')] call FUNC(canCloseDoor));
            };
        };
    };

    class rhsusf_CH53E_USMC: Helicopter_Base_H {
        EGVAR(interaction,bodyWidth) = 3.5;
        EGVAR(map,vehicleLightColor)[] = {1,0,0,0.1};
        EGVAR(fastroping,enabled) = 1;
        EGVAR(fastroping,ropeOrigins)[] = {{0,-9.5,2.6}};
        EGVAR(fastroping,onCut) = QFUNC(onCut);
        EGVAR(fastroping,onPrepare) = QFUNC(onPrepare);

        class UserActions {
            class RampOpen;
            class RampClose: RampOpen {
                condition = QUOTE([ARR_2(this,'ramp_bottom')] call FUNC(canCloseDoor));
            };
        };
    };

    class Heli_Attack_01_base_F: Helicopter_Base_F {};

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
    class RHS_M2A3;
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
