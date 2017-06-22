
class CfgVehicles {
    // static weapons
    class StaticMGWeapon;
    class HMG_01_base_F: StaticMGWeapon {
        displayName = CSTRING(HMG_01_Name);
    };
    class HMG_01_A_base_F: HMG_01_base_F {
        displayName = CSTRING(HMG_01_A_Name);
    };
    class HMG_01_high_base_F: HMG_01_base_F {
        displayName = CSTRING(HMG_01_high_Name);
    };

    class AT_01_base_F;
    class B_static_AT_F: AT_01_base_F {
        displayName = CSTRING(static_AT_Name);
    };
    class O_static_AT_F: AT_01_base_F {
        displayName = CSTRING(static_AT_Name);
    };
    class I_static_AT_F: AT_01_base_F {
        displayName = CSTRING(static_AT_Name);
    };

    class AA_01_base_F;
    class B_static_AA_F: AA_01_base_F {
        displayName = CSTRING(static_AA_Name);
    };
    class O_static_AA_F: AA_01_base_F {
        displayName = CSTRING(static_AA_Name);
    };
    class I_static_AA_F: AA_01_base_F {
        displayName = CSTRING(static_AA_Name);
    };

    class GMG_TriPod;
    class GMG_01_base_F: GMG_TriPod {
        displayName = CSTRING(GMG_01_Name);
    };
    class GMG_01_A_base_F: GMG_01_base_F {
        displayName = CSTRING(GMG_01_A_Name);
    };
    class GMG_01_high_base_F: GMG_01_base_F {
        displayName = CSTRING(GMG_01_high_Name);
    };

    // M-ATV
    class MRAP_01_base_F;
    class B_MRAP_01_F: MRAP_01_base_F {
        displayName = CSTRING(MRAP_01_Name);
    };

    class MRAP_01_gmg_base_F: MRAP_01_base_F {};
    class B_MRAP_01_gmg_F: MRAP_01_gmg_base_F {
        displayName = CSTRING(MRAP_01_gmg_Name);
    };

    class MRAP_01_hmg_base_F: MRAP_01_gmg_base_F {};
    class B_MRAP_01_hmg_F: MRAP_01_hmg_base_F {
        displayName = CSTRING(MRAP_01_hmg_Name);
    };

    // punisher
    class MRAP_02_base_F;
    class O_MRAP_02_F: MRAP_02_base_F {
        displayName = CSTRING(MRAP_02_Name);
    };

    class MRAP_02_hmg_base_F: MRAP_02_base_F {};
    class O_MRAP_02_hmg_F: MRAP_02_hmg_base_F {
        displayName = CSTRING(MRAP_02_hmg_Name);
    };

    class MRAP_02_gmg_base_F: MRAP_02_hmg_base_F {};
    class O_MRAP_02_gmg_F: MRAP_02_gmg_base_F {
        displayName = CSTRING(MRAP_02_gmg_Name);
    };

    // strider
    class MRAP_03_base_F;
    class I_MRAP_03_F: MRAP_03_base_F {
        displayName = CSTRING(MRAP_03_Name);
    };

    class MRAP_03_hmg_base_F: MRAP_03_base_F {};
    class I_MRAP_03_hmg_F: MRAP_03_hmg_base_F {
        displayName = CSTRING(MRAP_03_hmg_Name);
    };

    class MRAP_03_gmg_base_F: MRAP_03_hmg_base_F {};
    class I_MRAP_03_gmg_F: MRAP_03_gmg_base_F {
        displayName = CSTRING(MRAP_03_gmg_Name);
    };

    // merkava derivates
    class MBT_01_base_F;
    class B_MBT_01_base_F: MBT_01_base_F {};

    class B_MBT_01_cannon_F: B_MBT_01_base_F {
        displayName = CSTRING(MBT_01_cannon_Name);
    };
    class B_MBT_01_TUSK_F: B_MBT_01_cannon_F {
        displayName = CSTRING(MBT_01_TUSK_Name);
    };

    class MBT_01_arty_base_F: MBT_01_base_F {};
    class B_MBT_01_arty_base_F: MBT_01_arty_base_F {};

    class B_MBT_01_arty_F: B_MBT_01_arty_base_F {
        displayName = CSTRING(MBT_01_arty_Name);
    };

    class MBT_01_mlrs_base_F: MBT_01_base_F {};
    class B_MBT_01_mlrs_base_F: MBT_01_mlrs_base_F {};

    class B_MBT_01_mlrs_F: B_MBT_01_mlrs_base_F {
        displayName = CSTRING(MBT_01_mlrs_Name); // Fictional name, (probably wrong) hebrew translation of storm.
    };

    // T100 derivates
    class MBT_02_base_F;
    class O_MBT_02_base_F: MBT_02_base_F {};

    class O_MBT_02_cannon_F: O_MBT_02_base_F {
        displayName = CSTRING(MBT_02_cannon_Name);
    };

    class MBT_02_arty_base_F: MBT_02_base_F {};
    class O_MBT_02_arty_base_F: MBT_02_arty_base_F {};

    class O_MBT_02_arty_F: O_MBT_02_arty_base_F {
        displayName = CSTRING(MBT_02_arty_Name);
    };

    // leopard sg
    class I_MBT_03_base_F;
    class I_MBT_03_cannon_F: I_MBT_03_base_F {
        displayName = CSTRING(MBT_03_cannon_Name);
    };

    // tracked apcs
    class B_APC_Tracked_01_base_F;
    class B_APC_Tracked_01_rcws_F: B_APC_Tracked_01_base_F {
        displayName = CSTRING(APC_Tracked_01_rcws_Name);
    };

    class B_APC_Tracked_01_AA_F: B_APC_Tracked_01_base_F {
        displayName = CSTRING(APC_Tracked_01_AA_Name); // Fictional name, (probably wrong) hebrew translation of cheetah.
    };

    class B_APC_Tracked_01_CRV_F: B_APC_Tracked_01_base_F {
        displayName = CSTRING(APC_Tracked_01_CRV_Name);
    };

    class O_APC_Tracked_02_base_F;
    class O_APC_Tracked_02_cannon_F: O_APC_Tracked_02_base_F {
        displayName = CSTRING(APC_Tracked_02_cannon_Name);
    };

    class O_APC_Tracked_02_AA_F: O_APC_Tracked_02_base_F {
        displayName = CSTRING(APC_Tracked_02_AA_Name);
    };

    class I_APC_tracked_03_base_F;
    class I_APC_tracked_03_cannon_F: I_APC_tracked_03_base_F {
        displayName = CSTRING(APC_tracked_03_cannon_Name);
    };

    // wheeled apcs
    class B_APC_Wheeled_01_base_F;
    class B_APC_Wheeled_01_cannon_F: B_APC_Wheeled_01_base_F {
        displayName = CSTRING(APC_Wheeled_01_cannon_Name);
    };

    class O_APC_Wheeled_02_base_F;
    class O_APC_Wheeled_02_rcws_F: O_APC_Wheeled_02_base_F {
        displayName = CSTRING(APC_Wheeled_02_rcws_Name);
    };

    class I_APC_Wheeled_03_base_F;
    class I_APC_Wheeled_03_cannon_F: I_APC_Wheeled_03_base_F {
        displayName = CSTRING(APC_Wheeled_03_cannon_Name);
    };

    // trucks
    class Truck_01_base_F;
    class B_Truck_01_transport_F: Truck_01_base_F {
        displayName = CSTRING(Truck_01_transport_Name);
    };
    class B_Truck_01_covered_F: B_Truck_01_transport_F {
        displayName = CSTRING(Truck_01_covered_Name);
    };
    class B_Truck_01_mover_F: B_Truck_01_transport_F {
        displayName = CSTRING(Truck_01_mover_Name);
    };
    class B_Truck_01_box_F: B_Truck_01_mover_F {
        displayName = CSTRING(Truck_01_box_Name);
    };
    class B_Truck_01_medical_F: B_Truck_01_transport_F {
        displayName = CSTRING(Truck_01_medical_Name);
    };
    class B_Truck_01_ammo_F: B_Truck_01_mover_F {
        displayName = CSTRING(Truck_01_ammo_Name);
    };
    class B_Truck_01_fuel_F: B_Truck_01_mover_F {
        displayName = CSTRING(Truck_01_fuel_Name);
    };
    class B_Truck_01_Repair_F: B_Truck_01_mover_F {
        displayName = CSTRING(Truck_01_Repair_Name);
    };
    class Truck_02_transport_base_F;
    class O_Truck_02_transport_F: Truck_02_transport_base_F {
        displayName = CSTRING(Truck_02_transport_Name);
    };
    class Truck_02_base_F;
    class O_Truck_02_covered_F: Truck_02_base_F {
        displayName = CSTRING(Truck_02_covered_Name);
    };
    class Truck_02_Ammo_base_F;
    class O_Truck_02_ammo_F: Truck_02_Ammo_base_F {
        displayName = CSTRING(Truck_02_ammo_Name);
    };
    class Truck_02_fuel_base_F;
    class O_Truck_02_fuel_F: Truck_02_fuel_base_F {
        displayName = CSTRING(Truck_02_fuel_Name);
    };
    class Truck_02_box_base_F;
    class O_Truck_02_box_F: Truck_02_box_base_F {
        displayName = CSTRING(Truck_02_box_Name);
    };
    class Truck_02_medical_base_F;
    class O_Truck_02_medical_F: Truck_02_medical_base_F {
        displayName = CSTRING(Truck_02_medical_Name);
    };
    class I_Truck_02_transport_F: Truck_02_transport_base_F {
        displayName = CSTRING(Truck_02_transport_Name);
    };
    class I_Truck_02_covered_F: Truck_02_base_F {
        displayName = CSTRING(Truck_02_covered_Name);
    };
    class I_Truck_02_ammo_F: Truck_02_Ammo_base_F {
        displayName = CSTRING(Truck_02_ammo_Name);
    };
    class I_Truck_02_fuel_F: Truck_02_fuel_base_F {
        displayName = CSTRING(Truck_02_fuel_Name);
    };
    class I_Truck_02_box_F: Truck_02_box_base_F {
        displayName = CSTRING(Truck_02_box_Name);
    };
    class I_Truck_02_medical_F: Truck_02_medical_base_F {
        displayName = CSTRING(Truck_02_medical_Name);
    };
    class C_Truck_02_transport_F: Truck_02_transport_base_F {
        displayName = CSTRING(Truck_02_transport_Name);
    };
    class C_Truck_02_covered_F: Truck_02_base_F {
        displayName = CSTRING(Truck_02_covered_Name);
    };
    class C_Truck_02_fuel_F: Truck_02_fuel_base_F {
        displayName = CSTRING(Truck_02_fuel_Name);
    };
    class C_Truck_02_box_F: Truck_02_box_base_F {
        displayName = CSTRING(Truck_02_box_Name);
    };

    class Truck_03_base_F;
    class O_Truck_03_transport_F: Truck_03_base_F {
        displayName = CSTRING(Truck_03_transport_Name);
    };
    class O_Truck_03_covered_F: Truck_03_base_F {
        displayName = CSTRING(Truck_03_covered_Name);
    };
    class O_Truck_03_device_F: Truck_03_base_F {
        displayName = CSTRING(Truck_03_device_Name);
    };
    class O_Truck_03_ammo_F: Truck_03_base_F {
        displayName = CSTRING(Truck_03_ammo_Name);
    };
    class O_Truck_03_fuel_F: Truck_03_base_F {
        displayName = CSTRING(Truck_03_fuel_Name);
    };
    class O_Truck_03_repair_F: Truck_03_base_F {
        displayName = CSTRING(Truck_03_repair_Name);
    };
    class O_Truck_03_medical_F: Truck_03_base_F {
        displayName = CSTRING(Truck_03_medical_Name);
    };

    // helicopters
    class Heli_Attack_01_base_F;
    class B_Heli_Attack_01_F: Heli_Attack_01_base_F {
        displayName = CSTRING(Heli_Attack_01_Name);
    };

    class Heli_Attack_01_dynamicLoadout_base_F;
    class B_Heli_Attack_01_dynamicLoadout_F: Heli_Attack_01_dynamicLoadout_base_F {
        displayName = CSTRING(Heli_Attack_01_Name);
    };

    class Heli_Light_01_unarmed_base_F;
    class B_Heli_Light_01_F: Heli_Light_01_unarmed_base_F {
        displayName = CSTRING(Heli_Light_01_Name);
    };
    class Heli_Light_01_civil_base_F: Heli_Light_01_unarmed_base_F {
        displayName = CSTRING(Heli_Light_01_civil_Name);
    };

    class Heli_Light_01_armed_base_F;
    class B_Heli_Light_01_armed_F: Heli_Light_01_armed_base_F {
        displayName = CSTRING(Heli_Light_01_armed_Name);
    };

    class Heli_Light_01_dynamicLoadout_base_F;
    class B_Heli_Light_01_dynamicLoadout_F: Heli_Light_01_dynamicLoadout_base_F {
        displayName = CSTRING(Heli_Light_01_armed_Name);
    };

    class Heli_Transport_03_base_F;
    class B_Heli_Transport_03_F: Heli_Transport_03_base_F {
        displayName = CSTRING(Heli_Transport_03_Name);
    };
    class Heli_Transport_03_unarmed_base_F;
    class B_Heli_Transport_03_unarmed_F: Heli_Transport_03_unarmed_base_F {
        displayName = CSTRING(Heli_Transport_03_unarmed_Name);
    };

    class Heli_Light_02_base_F;
    class O_Heli_Light_02_F: Heli_Light_02_base_F {
        displayName = CSTRING(Heli_Light_02_Name);
    };
    class O_Heli_Light_02_v2_F: Heli_Light_02_base_F {
        displayName = CSTRING(Heli_Light_02_v2_Name);
    };
    class Heli_Light_02_unarmed_base_F;
    class O_Heli_Light_02_unarmed_F: Heli_Light_02_unarmed_base_F {
        displayName = CSTRING(Heli_Light_02_unarmed_Name);
    };

    class Heli_Light_02_dynamicLoadout_base_F;
    class O_Heli_Light_02_dynamicLoadout_F: Heli_Light_02_dynamicLoadout_base_F {
        displayName = CSTRING(Heli_Light_02_Name);
    };

    class Heli_light_03_base_F;
    class I_Heli_light_03_F: Heli_light_03_base_F {
        displayName = CSTRING(Heli_light_03_Name);
    };

    class Heli_light_03_unarmed_base_F;
    class I_Heli_light_03_unarmed_F: Heli_light_03_unarmed_base_F {
        displayName = CSTRING(Heli_light_03_unarmed_Name);
    };

    class Heli_light_03_dynamicLoadout_base_F;
    class I_Heli_light_03_dynamicLoadout_F: Heli_light_03_dynamicLoadout_base_F {
        displayName = CSTRING(Heli_light_03_Name);
    };

    class Heli_Transport_02_base_F;
    class I_Heli_Transport_02_F: Heli_Transport_02_base_F {
        displayName = CSTRING(Heli_Transport_02_Name);
    };

    // planes
    class Plane_CAS_01_base_F;
    class B_Plane_CAS_01_F: Plane_CAS_01_base_F {
        displayName = CSTRING(Plane_CAS_01_Name);
    };

    class Plane_CAS_01_dynamicLoadout_base_F;
    class B_Plane_CAS_01_dynamicLoadout_F: Plane_CAS_01_dynamicLoadout_base_F {
        displayName = CSTRING(Plane_CAS_01_Name);
    };

    class Plane_CAS_02_base_F;
    class O_Plane_CAS_02_F: Plane_CAS_02_base_F {
        displayName = CSTRING(Plane_CAS_02_Name);
    };

    class Plane_CAS_02_dynamicLoadout_base_F;
    class O_Plane_CAS_02_dynamicLoadout_F: Plane_CAS_02_dynamicLoadout_base_F {
        displayName = CSTRING(Plane_CAS_02_Name);
    };

    class Plane_Fighter_03_base_F;
    class I_Plane_Fighter_03_CAS_F: Plane_Fighter_03_base_F {
        displayName = CSTRING(Plane_Fighter_03_CAS_Name);
    };

    class I_Plane_Fighter_03_AA_F: I_Plane_Fighter_03_CAS_F {
        displayName = CSTRING(Plane_Fighter_03_AA_Name);
    };

    class Plane_Fighter_03_dynamicLoadout_base_F;
    class I_Plane_Fighter_03_dynamicLoadout_F: Plane_Fighter_03_dynamicLoadout_base_F {
        displayName = CSTRING(Plane_Fighter_03_Name);
    };

    // uavs
    class UAV_02_base_F;
    class B_UAV_02_F: UAV_02_base_F {
        displayName = CSTRING(UAV_02_Name);
    };
    class O_UAV_02_F: UAV_02_base_F {
        displayName = CSTRING(UAV_02_Name);
    };
    class I_UAV_02_F: UAV_02_base_F {
        displayName = CSTRING(UAV_02_Name);
    };

    class UAV_02_CAS_base_F;
    class B_UAV_02_CAS_F: UAV_02_CAS_base_F {
        displayName = CSTRING(UAV_02_CAS_Name);
    };
    class O_UAV_02_CAS_F: UAV_02_CAS_base_F {
        displayName = CSTRING(UAV_02_CAS_Name);
    };
    class I_UAV_02_CAS_F: UAV_02_CAS_base_F {
        displayName = CSTRING(UAV_02_CAS_Name);
    };

    class UAV_02_dynamicLoadout_base_F;
    class B_UAV_02_dynamicLoadout_F: UAV_02_dynamicLoadout_base_F {
        displayName = CSTRING(UAV_02_Name);
    };
    class O_UAV_02_dynamicLoadout_F: UAV_02_dynamicLoadout_base_F {
        displayName = CSTRING(UAV_02_Name);
    };
    class I_UAV_02_dynamicLoadout_F: UAV_02_dynamicLoadout_base_F {
        displayName = CSTRING(UAV_02_Name);
    };

    // pistols
    class Pistol_Base_F;
    class Weapon_hgun_P07_F: Pistol_Base_F {
        displayName = CSTRING(hgun_P07_Name);
    };

    class Weapon_hgun_Rook40_F: Pistol_Base_F {
        displayName = CSTRING(hgun_Rook40_Name);
    };

    class Weapon_hgun_ACPC2_F: Pistol_Base_F {
        displayName = CSTRING(hgun_ACPC2_Name);
    };

    class Weapon_hgun_Pistol_heavy_01_F: Pistol_Base_F {
        displayName = CSTRING(hgun_Pistol_heavy_01_Name);
    };

    class Weapon_hgun_Pistol_heavy_02_F: Pistol_Base_F {
        displayName = CSTRING(hgun_Pistol_heavy_02_Name);
    };

    class Weapon_hgun_Pistol_Signal_F: Pistol_Base_F {
        displayName = CSTRING(hgun_Pistol_Signal_Name);
    };

    // rocket launchers
    class Launcher_Base_F;
    class Weapon_launch_NLAW_F: Launcher_Base_F {
        displayName = CSTRING(launch_NLAW_Name);
    };

    class Weapon_launch_RPG32_F: Launcher_Base_F {
        displayName = CSTRING(launch_RPG32_Name);
    };

    /*class Weapon_launch_Titan_F: Launcher_Base_F {
        displayName = CSTRING(launch_Titan_Name);
    };

    class Weapon_launch_Titan_short_F: Launcher_Base_F {
        displayName = CSTRING(launch_Titan_short_Name);
    };

    class Weapon_launch_B_Titan_F: Launcher_Base_F {
        displayName = CSTRING(launch_Titan_Name);
    };*/
    //class Weapon_launch_I_Titan_F: Weapon_launch_B_Titan_F {};
    //class Weapon_launch_O_Titan_F: Weapon_launch_B_Titan_F {};

    /*class Weapon_launch_launch_B_Titan_short_F: Launcher_Base_F {
        displayName = CSTRING(launch_Titan_short_Name);
    };*/
    //class Weapon_launch_I_Titan_short_F: Weapon_launch_launch_B_Titan_short_F {};
    //class Weapon_launch_O_Titan_short_F: Weapon_launch_launch_B_Titan_short_F {};

    // rifles

    // MX
    class Weapon_Base_F;
    class Weapon_arifle_MX_F: Weapon_Base_F {
        displayName = CSTRING(arifle_MX_Name);
    };

    class Weapon_arifle_MXC_F: Weapon_Base_F {
        displayName = CSTRING(arifle_MXC_Name);
    };

    class Weapon_arifle_MX_GL_F: Weapon_Base_F {
        displayName = CSTRING(arifle_MX_GL_Name);
    };

    class Weapon_arifle_MX_SW_F: Weapon_Base_F {
        displayName = CSTRING(arifle_MX_SW_Name);
    };

    class Weapon_arifle_MXM_F: Weapon_Base_F {
        displayName = CSTRING(arifle_MXM_Name);
    };

    // Katiba
    class Weapon_arifle_Katiba_F: Weapon_Base_F {
        displayName = CSTRING(arifle_Katiba_Name);
    };

    class Weapon_arifle_Katiba_C_F: Weapon_Base_F {
        displayName = CSTRING(arifle_Katiba_C_Name);
    };

    class Weapon_arifle_Katiba_GL_F: Weapon_Base_F {
        displayName = CSTRING(arifle_Katiba_GL_Name);
    };

    // F2000
    class Weapon_arifle_Mk20_F: Weapon_Base_F {
        displayName = CSTRING(arifle_Mk20_Name);
    };

    class Weapon_arifle_Mk20_plain_F: Weapon_Base_F {
        displayName = CSTRING(arifle_Mk20_plain_Name);
    };

    class Weapon_arifle_Mk20C_F: Weapon_Base_F {
        displayName = CSTRING(arifle_Mk20C_Name);
    };

    class Weapon_arifle_Mk20C_plain_F: Weapon_Base_F {
        displayName = CSTRING(arifle_Mk20C_plain_Name);
    };

    class Weapon_arifle_Mk20_GL_F: Weapon_Base_F {
        displayName = CSTRING(arifle_Mk20_GL_Name);
    };

    class Weapon_arifle_Mk20_GL_plain_F: Weapon_Base_F {
        displayName = CSTRING(arifle_Mk20_GL_plain_Name);
    };

    // TAR-21
    class Weapon_arifle_TRG21_F: Weapon_Base_F {
        displayName = CSTRING(arifle_TRG21_Name);
    };

    class Weapon_arifle_TRG20_F: Weapon_Base_F {
        displayName = CSTRING(arifle_TRG20_Name);
    };

    class Weapon_arifle_TRG21_GL_F: Weapon_Base_F {
        displayName = CSTRING(arifle_TRG21_GL_Name);
    };

    // sub machine guns
    class Weapon_SMG_01_F: Weapon_Base_F {
        displayName = CSTRING(SMG_01_Name);
    };

    class Weapon_SMG_02_F: Weapon_Base_F {
        displayName = CSTRING(SMG_02_Name);
    };

    class Weapon_SMG_05_F: Weapon_Base_F {
        displayName = CSTRING(SMG_05);
    };

    class Weapon_hgun_PDW2000_F: Weapon_Base_F {
        displayName = CSTRING(hgun_PDW2000_Name);
    };

    class Weapon_arifle_SDAR_F: Weapon_Base_F {
        displayName = CSTRING(arifle_SDAR_Name);
    };

    // machine guns
    class Weapon_LMG_Mk200_F: Weapon_Base_F {
        displayName = CSTRING(LMG_Mk200_Name);
    };

    class Weapon_LMG_Zafir_F: Weapon_Base_F {
        displayName = CSTRING(LMG_Zafir_Name);
    };

    // sniper rifles
    class Weapon_srifle_EBR_F: Weapon_Base_F {
        displayName = CSTRING(srifle_EBR_Name);
    };

    class Weapon_srifle_GM6_F: Weapon_Base_F {
        displayName = CSTRING(srifle_GM6_Name);
    };

    class Weapon_srifle_GM6_camo_F: Weapon_Base_F {
        displayName = CSTRING(srifle_GM6_camo_Name);
    };

    class Weapon_srifle_LRR_F: Weapon_Base_F {
        displayName = CSTRING(srifle_LRR_Name);
    };

    class Weapon_srifle_LRR_camo_F: Weapon_Base_F {
        displayName = CSTRING(srifle_LRR_camo_Name);
    };

    class Weapon_srifle_DMR_01_F: Weapon_Base_F {
        displayName = CSTRING(srifle_DMR_01_Name);
    };

    // marksmen
    /*class Weapon_srifle_DMR_02_F: Weapon_Base_F {
        displayName = CSTRING(srifle_DMR_02);
    };

    class Weapon_srifle_DMR_02_camo_F: Weapon_Base_F {
        displayName = CSTRING(srifle_DMR_02_camo);
    };

    class Weapon_srifle_DMR_02_sniper_F: Weapon_Base_F {
        displayName = CSTRING(srifle_DMR_02_sniper);
    };

    class Weapon_srifle_DMR_03_F: Weapon_Base_F {
        displayName = CSTRING(srifle_DMR_03);
    };

    class Weapon_srifle_DMR_03_khaki_F: Weapon_Base_F {
        displayName = CSTRING(srifle_DMR_03_khaki);
    };

    class Weapon_srifle_DMR_03_tan_F: Weapon_Base_F {
        displayName = CSTRING(srifle_DMR_03_tan);
    };

    class Weapon_srifle_DMR_03_multicam_F: Weapon_Base_F {
        displayName = CSTRING(srifle_DMR_03_multicam);
    };

    class Weapon_srifle_DMR_03_woodland_F: Weapon_Base_F {
        displayName = CSTRING(srifle_DMR_03_woodland);
    };

    class Weapon_srifle_DMR_04_F: Weapon_Base_F {
        displayName = CSTRING(srifle_DMR_04);
    };

    class Weapon_srifle_DMR_04_Tan_F: Weapon_Base_F {
        displayName = CSTRING(srifle_DMR_04_Tan);
    };

    class Weapon_srifle_DMR_05_blk_F: Weapon_Base_F {
        displayName = CSTRING(srifle_DMR_05_blk);
    };

    class Weapon_srifle_DMR_05_hex_F: Weapon_Base_F {
        displayName = CSTRING(srifle_DMR_05_hex);
    };

    class Weapon_srifle_DMR_05_tan_f: Weapon_Base_F {
        displayName = CSTRING(srifle_DMR_05_tan);
    };

    class Weapon_srifle_DMR_06_camo_F: Weapon_Base_F {
        displayName = CSTRING(srifle_DMR_06_camo);
    };

    class Weapon_srifle_DMR_06_olive_F: Weapon_Base_F {
        displayName = CSTRING(srifle_DMR_06_olive);
    };

    class Weapon_MMG_01_hex_F: Weapon_Base_F {
        displayName = CSTRING(MMG_01_hex);
    };

    class Weapon_MMG_01_tan_F: Weapon_Base_F {
        displayName = CSTRING(MMG_01_tan);
    };

    class Weapon_MMG_02_camo_F: Weapon_Base_F {
        displayName = CSTRING(MMG_02_camo);
    };

    class Weapon_MMG_02_black_F: Weapon_Base_F {
        displayName = CSTRING(MMG_02_black);
    };

    class Weapon_MMG_02_sand_F: Weapon_Base_F {
        displayName = CSTRING(MMG_02_sand);
    };*/

    //attachments

    class Item_Base_F;

    class Item_acc_flashlight: Item_Base_F {
        displayName="UTG Defender 126";
    };

    // APEX/Tanoa

    // Jeep Wrangler
    class Offroad_02_unarmed_base_F;
    class C_Offroad_02_unarmed_F: Offroad_02_unarmed_base_F {
        displayName = CSTRING(C_Offroad_02_unarmed);
    };
    class C_Offroad_02_unarmed_F_black: C_Offroad_02_unarmed_F {
        displayName = CSTRING(C_Offroad_02_unarmed_black);
    };
    class C_Offroad_02_unarmed_F_blue: C_Offroad_02_unarmed_F {
        displayName = CSTRING(C_Offroad_02_unarmed_blue);
    };
    class C_Offroad_02_unarmed_F_green: C_Offroad_02_unarmed_F {
        displayName = CSTRING(C_Offroad_02_unarmed_green);
    };
    class C_Offroad_02_unarmed_F_orange: C_Offroad_02_unarmed_F {
        displayName = CSTRING(C_Offroad_02_unarmed_orange);
    };

    // Cessna
    class Plane_Civil_01_base_F;
    class C_Plane_Civil_01_F: Plane_Civil_01_base_F {
        displayName = CSTRING(C_Plane_Civil_01);
    };
    class C_Plane_Civil_01_racing_F: Plane_Civil_01_base_F {
        displayName = CSTRING(C_Plane_Civil_01_racing);
    };

    // Burraq
    class UAV_04_base_F;
    class O_T_UAV_04_CAS_F: UAV_04_base_F {
        displayName = CSTRING(O_T_UAV_04_CAS);
    };
};
