class CfgPatches {
  class AGM_RealisticNames {
    units[] = {};
    weapons[] = {};
    requiredVersion = 0.60;
    requiredAddons[] = {AGM_Core};
    version = "0.95";
    versionStr = "0.95";
    versionAr[] = {0,95,0};
    author[] = {"KoffeinFlummi", "TaoSensai"};
    authorUrl = "https://github.com/KoffeinFlummi/";
  };
};

// VEHICLES

class CfgVehicles {
  // Global Inheritance
  class StaticMGWeapon;
  class GMG_TriPod;
  class AT_01_base_F;
  class AA_01_base_F;
  class UAV_02_base_F;
  class UAV_02_CAS_base_F: UAV_02_base_F {};

  // BLUFOR Inheritance
  class MRAP_01_base_F;
  class MRAP_01_gmg_base_F: MRAP_01_base_F {};
  class MRAP_01_hmg_base_F: MRAP_01_gmg_base_F {};
  class MBT_01_base_F;
  class B_MBT_01_base_F: MBT_01_base_F {};
  class MBT_01_arty_base_F: MBT_01_base_F {};
  class B_MBT_01_arty_base_F: MBT_01_arty_base_F {};
  class MBT_01_mlrs_base_F: MBT_01_base_F {};
  class B_MBT_01_mlrs_base_F: MBT_01_mlrs_base_F {};
  class B_APC_Wheeled_01_base_F;
  class B_APC_Tracked_01_base_F;
  class Truck_01_base_F;
  class Heli_Attack_01_base_F;
  class Heli_Light_01_base_F;
  class Heli_Light_01_armed_base_F;
  class B_Heli_Transport_03_base_F;
  class B_Heli_Transport_03_unarmed_base_F: B_Heli_Transport_03_base_F {};
  class Plane_CAS_01_base_F;

  // INDEP Inheritance
  class MRAP_03_base_F;
  class MRAP_03_hmg_base_F: MRAP_03_base_F {};
  class MRAP_03_gmg_base_F: MRAP_03_hmg_base_F {};
  class I_MBT_03_base_F;
  class I_APC_Wheeled_03_base_F;
  class I_APC_tracked_03_base_F;
  class Truck_02_base_F;
  class I_Heli_light_03_base_F;
  class I_Heli_light_03_unarmed_base_F;
  class Heli_Transport_02_base_F;
  class Plane_Fighter_03_base_F;

  // OPFOR Inheritance
  class MRAP_02_base_F;
  class MRAP_02_hmg_base_F: MRAP_02_base_F {};
  class MRAP_02_gmg_base_F: MRAP_02_hmg_base_F {};
  class MBT_02_base_F;
  class O_MBT_02_base_F: MBT_02_base_F {};
  class MBT_02_arty_base_F: MBT_02_base_F {};
  class O_MBT_02_arty_base_F: MBT_02_arty_base_F {};
  class O_APC_Wheeled_02_base_F;
  class O_APC_Tracked_02_base_F;
  class Truck_03_base_F;
  class Heli_Light_02_base_F;
  class Plane_CAS_02_base_F;

  ////////////////////////////////////

  // Global
  class HMG_01_base_F: StaticMGWeapon {
    displayName = "$STR_AGM_RealisticNames_HMG_01_Name";
  };
  class HMG_01_A_base_F: HMG_01_base_F {
    displayName = "$STR_AGM_RealisticNames_HMG_01_A_Name";
  };
  class HMG_01_high_base_F: HMG_01_base_F {
    displayName = "$STR_AGM_RealisticNames_HMG_01_high_Name";
  };
  class GMG_01_base_F: GMG_TriPod {
    displayName = "$STR_AGM_RealisticNames_GMG_01_Name";
  };
  class GMG_01_A_base_F: GMG_01_base_F {
    displayName = "$STR_AGM_RealisticNames_GMG_01_A_Name";
  };
  class GMG_01_high_base_F: GMG_01_base_F {
    displayName = "$STR_AGM_RealisticNames_GMG_01_high_Name";
  };

  // BLUFOR
  class B_MRAP_01_F: MRAP_01_base_F {
    displayName = "$STR_AGM_RealisticNames_MRAP_01_Name";
  };
  class B_MRAP_01_hmg_F: MRAP_01_hmg_base_F {
    displayName = "$STR_AGM_RealisticNames_MRAP_01_hmg_Name";
  };
  class B_MRAP_01_gmg_F: MRAP_01_gmg_base_F {
    displayName = "$STR_AGM_RealisticNames_MRAP_01_gmg_Name";
  };

  class B_MBT_01_cannon_F: B_MBT_01_base_F {
    displayName = "$STR_AGM_RealisticNames_MBT_01_cannon_Name";
  };
  class B_MBT_01_TUSK_F: B_MBT_01_cannon_F {
    displayName = "$STR_AGM_RealisticNames_MBT_01_TUSK_Name";
  };
  class B_MBT_01_arty_F: B_MBT_01_arty_base_F {
    displayName = "$STR_AGM_RealisticNames_MBT_01_arty_Name";
  };
  class B_MBT_01_mlrs_F: B_MBT_01_mlrs_base_F {
    displayName = "$STR_AGM_RealisticNames_MBT_01_mlrs_Name"; // Fictional name, (probably wrong) hebrew translation of storm.
  };
  class B_APC_Tracked_01_rcws_F: B_APC_Tracked_01_base_F {
    displayName = "$STR_AGM_RealisticNames_APC_Tracked_01_rcws_Name";
  };
  class B_APC_Tracked_01_AA_F: B_APC_Tracked_01_base_F {
    displayName = "$STR_AGM_RealisticNames_APC_Tracked_01_AA_Name"; // Fictional name, (probably wrong) hebrew translation of cheetah.
  };
  class B_APC_Wheeled_01_cannon_F: B_APC_Wheeled_01_base_F {
    displayName = "$STR_AGM_RealisticNames_APC_Wheeled_cannon_Name";
  };
  class B_APC_Tracked_01_CRV_F: B_APC_Tracked_01_base_F {
    displayName = "$STR_AGM_RealisticNames_APC_Tracked_01_CRV_Name";
  };

  class B_Truck_01_transport_F: Truck_01_base_F {
    displayName = "$STR_AGM_RealisticNames_Truck_01_transport_Name";
  };
  class B_Truck_01_covered_F: B_Truck_01_transport_F {
    displayName = "$STR_AGM_RealisticNames_Truck_01_covered_Name";
  };
  class B_Truck_01_mover_F: B_Truck_01_transport_F {
    displayName = "$STR_AGM_RealisticNames_Truck_01_mover_Name";
  };
  class B_Truck_01_box_F: B_Truck_01_mover_F {
    displayName = "$STR_AGM_RealisticNames_Truck_01_box_Name";
  };
  class B_Truck_01_medical_F: B_Truck_01_transport_F {
    displayName = "$STR_AGM_RealisticNames_Truck_01_medical_Name";
  };
  class B_Truck_01_ammo_F: B_Truck_01_mover_F {
    displayName = "$STR_AGM_RealisticNames_Truck_01_ammo_Name";
  };
  class B_Truck_01_fuel_F: B_Truck_01_mover_F {
    displayName = "$STR_AGM_RealisticNames_Truck_01_fuel_Name";
  };
  class B_Truck_01_Repair_F: B_Truck_01_mover_F {
    displayName = "$STR_AGM_RealisticNames_Truck_01_Repair_Name";
  };

  class B_Heli_Attack_01_F: Heli_Attack_01_base_F {
    displayName = "$STR_AGM_RealisticNames_Heli_Attack_01_Name";
  };
  class B_Heli_Light_01_F: Heli_Light_01_base_F {
    displayName = "$STR_AGM_RealisticNames_Heli_Light_01_Name";
  };
  class B_Heli_Light_01_armed_F: Heli_Light_01_armed_base_F {
    displayName = "$STR_AGM_RealisticNames_Heli_Light_01_armed_Name";
  };
  class B_Heli_Transport_03_F: B_Heli_Transport_03_base_F {
    displayName = "$STR_AGM_RealisticNames_Heli_Transport_03_Name";
  };
  class B_Heli_Transport_03_unarmed_F: B_Heli_Transport_03_unarmed_base_F {
    displayName = "$STR_AGM_RealisticNames_Heli_Transport_03_unarmed_Name";
  };
  class B_Plane_CAS_01_F: Plane_CAS_01_base_F {
    displayName = "$STR_AGM_RealisticNames_Plane_CAS_01_Name";
  };

  class B_UAV_02_F: UAV_02_base_F {
    displayName = "$STR_AGM_RealisticNames_UAV_02_Name";
  };
  class B_UAV_02_CAS_F: UAV_02_CAS_base_F {
    displayName = "$STR_AGM_RealisticNames_UAV_02_CAS_Name";
  };

  class B_static_AT_F: AT_01_base_F {
    displayName = "$STR_AGM_RealisticNames_static_AT_Name";
  };
  class B_static_AA_F: AA_01_base_F {
    displayName = "$STR_AGM_RealisticNames_static_AA_Name";
  };


  // INDEP
  class I_MRAP_03_F: MRAP_03_base_F {
    displayName = "$STR_AGM_RealisticNames_MRAP_03_Name";
  };
  class I_MRAP_03_hmg_F: MRAP_03_hmg_base_F {
    displayName = "$STR_AGM_RealisticNames_MRAP_03_hmg_Name";
  };
  class I_MRAP_03_gmg_F: MRAP_03_gmg_base_F {
    displayName = "$STR_AGM_RealisticNames_MRAP_03_gmg_Name";
  };

  class I_MBT_03_cannon_F: I_MBT_03_base_F {
    displayName = "$STR_AGM_RealisticNames_MBT_03_cannon_Name";
  };
  class I_APC_tracked_03_cannon_F: I_APC_tracked_03_base_F {
    displayName = "$STR_AGM_RealisticNames_APC_tracked_03_cannon_Name";
  };
  class I_APC_Wheeled_03_cannon_F: I_APC_Wheeled_03_base_F {
    displayName = "$STR_AGM_RealisticNames_APC_Wheeled_03_cannon_Name";
  };

  class I_Truck_02_transport_F: Truck_02_base_F {
    displayName = "$STR_AGM_RealisticNames_Truck_02_transport_Name";
  };
  class I_Truck_02_covered_F: Truck_02_base_F {
    displayName = "$STR_AGM_RealisticNames_Truck_02_covered_Name";
  };
  class I_Truck_02_ammo_F: Truck_02_base_F {
    displayName = "$STR_AGM_RealisticNames_Truck_02_ammo_Name";
  };
  class I_Truck_02_fuel_F: Truck_02_base_F {
    displayName = "$STR_AGM_RealisticNames_Truck_02_fuel_Name";
  };
  class I_Truck_02_box_F: Truck_02_base_F {
    displayName = "$STR_AGM_RealisticNames_Truck_02_box_Name";
  };
  class I_Truck_02_medical_F: I_Truck_02_box_F {
    displayName = "$STR_AGM_RealisticNames_Truck_02_medical_Name";
  };

  class I_Heli_light_03_F: I_Heli_light_03_base_F {
    displayName = "$STR_AGM_RealisticNames_Heli_light_03_Name";
  };
  class I_Heli_light_03_unarmed_F: I_Heli_light_03_unarmed_base_F {
    displayName = "$STR_AGM_RealisticNames_Heli_light_03_unarmed_Name";
  };
  class I_Heli_Transport_02_F: Heli_Transport_02_base_F {
    displayName = "$STR_AGM_RealisticNames_Heli_Transport_02_Name";
  };
  class I_Plane_Fighter_03_CAS_F: Plane_Fighter_03_base_F {
    displayName = "$STR_AGM_RealisticNames_Plane_Fighter_03_CAS_Name";
  };
  class I_Plane_Fighter_03_AA_F: I_Plane_Fighter_03_CAS_F {
    displayName = "$STR_AGM_RealisticNames_Plane_Fighter_03_AA_Name";
  };

  class I_UAV_02_F: UAV_02_base_F {
    displayName = "$STR_AGM_RealisticNames_UAV_02_Name";
  };
  class I_UAV_02_CAS_F: UAV_02_CAS_base_F {
    displayName = "$STR_AGM_RealisticNames_UAV_02_CAS_Name";
  };

  class I_static_AT_F: AT_01_base_F {
    displayName = "$STR_AGM_RealisticNames_static_AT_Name";
  };
  class I_static_AA_F: AA_01_base_F {
    displayName = "$STR_AGM_RealisticNames_static_AA_Name";
  };


  // OPFOR
  class O_MRAP_02_F: MRAP_02_base_F {
    displayName = "$STR_AGM_RealisticNames_MRAP_02_Name";
  };
  class O_MRAP_02_hmg_F: MRAP_02_hmg_base_F {
    displayName = "$STR_AGM_RealisticNames_MRAP_02_hmg_Name";
  };
  class O_MRAP_02_gmg_F: MRAP_02_gmg_base_F {
    displayName = "$STR_AGM_RealisticNames_MRAP_02_gmg_Name";
  };

  class O_MBT_02_cannon_F: O_MBT_02_base_F {
    displayName = "$STR_AGM_RealisticNames_MBT_02_cannon_Name";
  };
  class O_MBT_02_arty_F: O_MBT_02_arty_base_F {
    displayName = "$STR_AGM_RealisticNames_MBT_02_arty_Name";
  };
  class O_APC_Tracked_02_cannon_F: O_APC_Tracked_02_base_F {
    displayName = "$STR_AGM_RealisticNames_APC_Tracked_02_cannon_Name";
  };
  class O_APC_Tracked_02_AA_F: O_APC_Tracked_02_base_F {
    displayName = "$STR_AGM_RealisticNames_APC_Tracked_02_AA_Name";
  };
  class O_APC_Wheeled_02_rcws_F: O_APC_Wheeled_02_base_F {
    displayName = "$STR_AGM_RealisticNames_APC_Wheeled_02_rcws_Name";
  };

  class O_Truck_02_transport_F: Truck_02_base_F {
    displayName = "$STR_AGM_RealisticNames_Truck_02_transport_Name";
  };
  class O_Truck_02_covered_F: Truck_02_base_F {
    displayName = "$STR_AGM_RealisticNames_Truck_02_covered_Name";
  };
  class O_Truck_02_ammo_F: Truck_02_base_F {
    displayName = "$STR_AGM_RealisticNames_Truck_02_ammo_Name";
  };
  class O_Truck_02_fuel_F: Truck_02_base_F {
    displayName = "$STR_AGM_RealisticNames_Truck_02_fuel_Name";
  };
  class O_Truck_02_box_F: Truck_02_base_F {
    displayName = "$STR_AGM_RealisticNames_Truck_02_box_Name";
  };
  class O_Truck_02_medical_F: O_Truck_02_box_F {
    displayName = "$STR_AGM_RealisticNames_Truck_02_medical_Name";
  };

  class O_Truck_03_transport_F: Truck_03_base_F {
    displayName = "$STR_AGM_RealisticNames_Truck_03_transport_Name";
  };
  class O_Truck_03_covered_F: Truck_03_base_F {
    displayName = "$STR_AGM_RealisticNames_Truck_03_covered_Name";
  };
  class O_Truck_03_device_F: Truck_03_base_F {
    displayName = "$STR_AGM_RealisticNames_Truck_03_device_Name";
  };
  class O_Truck_03_ammo_F: Truck_03_base_F {
    displayName = "$STR_AGM_RealisticNames_Truck_03_ammo_Name";
  };
  class O_Truck_03_fuel_F: Truck_03_base_F {
    displayName = "$STR_AGM_RealisticNames_Truck_03_fuel_Name";
  };
  class O_Truck_03_repair_F: Truck_03_base_F {
    displayName = "$STR_AGM_RealisticNames_Truck_03_repair_Name";
  };
  class O_Truck_03_medical_F: Truck_03_base_F {
    displayName = "$STR_AGM_RealisticNames_Truck_03_medical_Name";
  };

  class O_Heli_Light_02_F: Heli_Light_02_base_F {
    displayName = "$STR_AGM_RealisticNames_Heli_Light_02_Name";
  };
  class O_Heli_Light_02_unarmed_F: Heli_Light_02_base_F {
    displayName = "$STR_AGM_RealisticNames_Heli_Light_02_unarmed_Name";
  };
  class O_Plane_CAS_02_F: Plane_CAS_02_base_F {
    displayName = "$STR_AGM_RealisticNames_Plane_CAS_02_Name";
  };

  class O_UAV_02_F: UAV_02_base_F {
    displayName = "$STR_AGM_RealisticNames_UAV_02_Name";
  };
  class O_UAV_02_CAS_F: UAV_02_CAS_base_F {
    displayName = "$STR_AGM_RealisticNames_UAV_02_CAS_Name";
  };

  class O_static_AT_F: AT_01_base_F {
    displayName = "$STR_AGM_RealisticNames_static_AT_Name";
  };
  class O_static_AA_F: AA_01_base_F {
    displayName = "$STR_AGM_RealisticNames_static_AA_Name";
  };

  // Civilian
  class Heli_Light_01_civil_base_F: Heli_Light_01_base_F {
    displayName = "$STR_AGM_RealisticNames_Heli_Light_01_civil_Name";
  };

  // pistols
  class Pistol_Base_F;
  class Weapon_hgun_P07_F: Pistol_Base_F {
    displayName = "P99";
  };
  class Weapon_hgun_Rook40_F: Pistol_Base_F {
    displayName = "MP-443 Grach";
  };
  class Weapon_hgun_ACPC2_F: Pistol_Base_F {
    displayName = "ACP-C2";
  };
  class Weapon_hgun_Pistol_heavy_01_F: Pistol_Base_F {
    displayName = "FNX-45 Tactical";
  };
  class Weapon_hgun_Pistol_heavy_02_F: Pistol_Base_F {
    displayName = "Chiappa Rhino 60DS";
  };
  class Weapon_hgun_Pistol_Signal_F: Pistol_Base_F {
    displayName = "Taurus Judge";
  };

  // rocket launchers
  class Launcher_Base_F;
  class Weapon_launch_NLAW_F: Launcher_Base_F {
    displayName = "NLAW";
  };
  class Weapon_launch_RPG32_F: Launcher_Base_F {
    displayName = "RPG-32";
  };
  class Weapon_launch_Titan_F: Launcher_Base_F {
    displayName = "Mini-Spike (AA)";
  };
  class Weapon_launch_Titan_short_F: Launcher_Base_F {
    displayName = "Mini-Spike (AT)";
  };
  class Weapon_launch_B_Titan_F: Launcher_Base_F {
    displayName = "Mini-Spike (AA)";
  };
  //class Weapon_launch_I_Titan_F: Weapon_launch_B_Titan_F {};
  //class Weapon_launch_O_Titan_F: Weapon_launch_B_Titan_F {};
  class Weapon_launch_launch_B_Titan_short_F: Launcher_Base_F {
    displayName = "Mini-Spike (AT)";
  };
  //class Weapon_launch_I_Titan_short_F: Weapon_launch_launch_B_Titan_short_F {};
  //class Weapon_launch_O_Titan_short_F: Weapon_launch_launch_B_Titan_short_F {};

  // rifles
  class Weapon_Base_F;
  class Weapon_arifle_MX_F: Weapon_Base_F {
    displayName = "MX";
  };
  class Weapon_arifle_MXC_F: Weapon_Base_F {
    displayName = "MXC";
  };
  class Weapon_arifle_MX_GL_F: Weapon_Base_F {
    displayName = "MX 3GL";
  };
  class Weapon_arifle_MX_SW_F: Weapon_Base_F {
    displayName = "MX LSW";
  };
  class Weapon_arifle_MXM_F: Weapon_Base_F {
    displayName = "MXM";
  };

  class Weapon_arifle_Katiba_F: Weapon_Base_F {
    displayName = "KT2002 Katiba";
  };
  class Weapon_arifle_Katiba_C_F: Weapon_Base_F {
    displayName = "KT2002C Katiba";
  };
  class Weapon_arifle_Katiba_GL_F: Weapon_Base_F {
    displayName = "KT2002 Katiba KGL";
  };

  class Weapon_arifle_Mk20_F: Weapon_Base_F {
    displayName = "F2000 (Camo)";
  };
  class Weapon_arifle_Mk20_plain_F: Weapon_Base_F {
    displayName = "F2000";
  };
  class Weapon_arifle_Mk20C_F: Weapon_Base_F {
    displayName = "F2000 Tactical (Camo)";
  };
  class Weapon_arifle_Mk20C_plain_F: Weapon_Base_F {
    displayName = "F2000 Tactical";
  };
  class Weapon_arifle_Mk20_GL_F: Weapon_Base_F {
    displayName = "F2000 EGLM (Camo)";
  };
  class Weapon_arifle_Mk20_GL_plain_F: Weapon_Base_F {
    displayName = "F2000 EGLM";
  };

  class Weapon_arifle_TRG21_F: Weapon_Base_F {
    displayName = "TAR-21";
  };
  class Weapon_arifle_TRG20_F: Weapon_Base_F {
    displayName = "CTAR-21";
  };
  class Weapon_arifle_TRG21_GL_F: Weapon_Base_F {
    displayName = "TAR-21 EGLM";
  };

  // sub machine guns
  class Weapon_SMG_01_F: Weapon_Base_F {
    displayName = "Vector SMG";
  };
  class Weapon_SMG_02_F: Weapon_Base_F {
    displayName = "Scorpion Evo 3 A1";
  };
  class Weapon_hgun_PDW2000_F: Weapon_Base_F {
    displayName = "CPW";
  };
  class Weapon_arifle_SDAR_F: Weapon_Base_F {
    displayName = "RFB SDAR";
  };

  // machine guns
  class Weapon_LMG_Mk200_F: Weapon_Base_F {
    displayName = "Stoner 99 LMG";
  };
  class Weapon_LMG_Zafir_F: Weapon_Base_F {
    displayName = "Negev NG7";
  };

  // sniper rifles
  class Weapon_srifle_EBR_F: Weapon_Base_F {
    displayName = "Mk14 Mod 1 EBR";
  };
  class Weapon_srifle_GM6_F: Weapon_Base_F {
    displayName = "GM6 Lynx";
  };
  class Weapon_srifle_GM6_camo_F: Weapon_Base_F {
    displayName = "GM6 Lynx (Camo)";
  };
  class Weapon_srifle_LRR_F: Weapon_Base_F {
    displayName = "M200 Intervention";
  };
  class Weapon_srifle_LRR_camo_F: Weapon_Base_F {
    displayName = "M200 Intervention (Camo)";
  };
  class Weapon_srifle_DMR_01_F: Weapon_Base_F {
    displayName = "VS-121";
  };
};

// WEAPONS

class Mode_FullAuto;
class CfgWeapons {
  class Rifle_Base_F;
  class CannonCore;
  class RocketPods;
  class MissileLauncher;
  class MGunCore;
  class MGun;
  class LMG_RCWS;
  class GMG_F;
  class Bomb_04_Plane_CAS_01_F;
  class autocannon_Base_F;

  // INFANTRY STUFF
  // (I indented this on purpose, so you can collapse it in ST)
    class arifle_MX_Base_F;
    class arifle_MX_F : arifle_MX_Base_F {
      displayName = "MX";
    };
    class arifle_MX_Black_F: arifle_MX_F {
      displayName = "MX (Black)";
    };
    class arifle_MXC_F : arifle_MX_Base_F {
      displayName = "MXC";
    };
    class arifle_MXC_Black_F: arifle_MXC_F {
      displayName = "MXC (Black)";
    };
    class arifle_MX_GL_F : arifle_MX_Base_F {
      displayName = "MX 3GL";
    };
    class arifle_MX_GL_Black_F : arifle_MX_GL_F {
      displayName = "MX 3GL (Black)";
    };
    class arifle_MX_SW_F : arifle_MX_Base_F {
      displayName = "MX LSW";
    };
    class arifle_MX_SW_Black_F : arifle_MX_SW_F {
      displayName = "MX LSW (Black)";
    };
    class arifle_MXM_F : arifle_MX_Base_F {
      displayName = "MXM";
    };
    class arifle_MXM_Black_F : arifle_MXM_F {
      displayName = "MXM (Black)";
    };

    class arifle_katiba_Base_F;
    class arifle_Katiba_F : arifle_katiba_Base_F {
      displayName = "KT2002 Katiba";
    };
    class arifle_Katiba_GL_F : arifle_katiba_Base_F {
      displayName = "KT2002 Katiba KGL";
    };
    class arifle_Katiba_C_F : arifle_katiba_Base_F {
      displayName = "KT2002C Katiba";
    };

    class SDAR_base_F;
    class arifle_SDAR_F : SDAR_base_F {
      displayName = "RFB SDAR";
    };

    class Tavor_base_F;
    class arifle_TRG21_F : Tavor_base_F {
      displayName = "TAR-21";
    };
    class arifle_TRG21_GL_F : arifle_TRG21_F {
      displayName = "TAR-21 EGLM";
    };
    class arifle_TRG20_F : Tavor_base_F {
      displayName = "CTAR-21";
    };

    class mk20_base_F;
    class arifle_Mk20_F : mk20_base_F {
      displayName = "F2000 (Camo)";
    };
    class arifle_Mk20_plain_F : arifle_Mk20_F {
      displayName = "F2000";
    };
    class arifle_Mk20C_F : mk20_base_F {
      displayName = "F2000 Tactical (Camo)";
    };
    class arifle_Mk20C_plain_F : arifle_Mk20C_F {
      displayName = "F2000 Tactical";
    };
    class arifle_Mk20_GL_F : mk20_base_F {
      displayName = "F2000 EGLM (Camo)";
    };
    class arifle_Mk20_GL_plain_F : arifle_Mk20_GL_F {
      displayName = "F2000 EGLM";
    };

    class SMG_01_Base : Rifle_Base_F {
      displayName = "Vector SMG";
    };
    class SMG_01_F : SMG_01_Base {
      displayName = "Vector SMG";
    };

    class SMG_02_base_F;
    class SMG_02_F : SMG_02_base_F {
      displayName = "Scorpion Evo 3 A1";
    };

    class pdw2000_base_F;
    class hgun_pdw2000_F : pdw2000_base_F {
      displayName = "CPW";
    };

    class Pistol_Base_F;
    class hgun_P07_F : Pistol_Base_F {
      displayName = "P99";
    };

    class hgun_Rook40_F : Pistol_Base_F {
      displayName = "MP-443 Grach";
    };

    class hgun_ACPC2_F : Pistol_Base_F {
      displayName = "ACP-C2";
    };

    class hgun_Pistol_heavy_01_F: Pistol_Base_F {
      displayName = "FNX-45 Tactical";
    };

    class hgun_Pistol_heavy_02_F: Pistol_Base_F {
      displayName = "Chiappa Rhino 60DS";
    };

    class hgun_Pistol_Signal_F: Pistol_Base_F {
      displayName = "Taurus Judge";
    };

    class Rifle_Long_Base_F;
    class LMG_Mk200_F : Rifle_Long_Base_F {
      displayName = "Stoner 99 LMG";
    };

    class LMG_Zafir_F: Rifle_Long_Base_F {
      displayName = "Negev NG7";
    };

    class EBR_base_F;
    class srifle_EBR_F : EBR_base_F {
      displayName = "Mk14 Mod 1 EBR";
    };

    class LRR_base_F;
    class srifle_LRR_F : LRR_base_F {
      displayName = "M200 Intervention";
    };
    class srifle_LRR_camo_F : srifle_LRR_F {
      displayName = "M200 Intervention (Camo)";
    };

    class GM6_base_F;
    class srifle_GM6_F : GM6_base_F {
      displayName = "GM6 Lynx";
    };
    class srifle_GM6_camo_F : srifle_GM6_F {
      displayName = "GM6 Lynx (Camo)";
    };

    class DMR_01_base_F;
    class srifle_DMR_01_F : DMR_01_base_F {
      displayName = "VS-121";
    };

  //MANPADS
    class Launcher_Base_F;
    class launch_RPG32_F: Launcher_Base_F {
      displayName = "RPG-32";
    };
    class launch_Titan_base: Launcher_Base_F {
      displayName = "Mini-Spike (AA)";
    };
    class launch_Titan_short_base: launch_Titan_base {
      displayName = "Mini-Spike (AT)";
    };
    class launch_NLAW_F: Launcher_Base_F {
      displayName = "NLAW";
    };

  // VEHICLE STUFF
    class gatling_20mm: CannonCore {
      class manual;
    };
    class Twin_Cannon_20mm: gatling_20mm {
      displayName = "Plamen PL-20";
      class manual: manual {
        displayName = "Plamen PL-20";
      };
    };
    class gatling_30mm: CannonCore { // This is a fictional veresion of the GSh-6-30, with 3 barrels
      displayName = "GSh-3-30";
      class LowROF: Mode_FullAuto {
        displayName = "GSh-3-30";
      };
    };
    class Gatling_30mm_Plane_CAS_01_F: CannonCore {
      displayName = "GAU-8";
      class LowROF: Mode_FullAuto {
        displayName = "GAU-8";
      };
    };
    class Cannon_30mm_Plane_CAS_02_F: CannonCore {
      displayName = "GSh-301";
      class LowROF: Mode_FullAuto {
        displayName = "GSh-301";
      };
    };
    class Missile_AA_04_Plane_CAS_01_F: RocketPods {
      displayName = "AIM-9 Sidewinder";
    };
    class Missile_AA_03_Plane_CAS_02_F: Missile_AA_04_Plane_CAS_01_F {
      displayName = "Wympel R-73";
    };
    class Missile_AGM_02_Plane_CAS_01_F: MissileLauncher {
      displayName = "AGM-65 Maverick";
    };
    class Missile_AGM_01_Plane_CAS_02_F: Missile_AGM_02_Plane_CAS_01_F {
      displayName = "Kh-25MTP";
    };
    class Rocket_04_HE_Plane_CAS_01_F: RocketPods {
      displayName = "Hydra 70";
      class Burst: RocketPods {
        displayName = "Hydra 70";
      };
    };
    class Rocket_04_AP_Plane_CAS_01_F: Rocket_04_HE_Plane_CAS_01_F {
      displayName = "Hydra 70";
      class Burst: RocketPods {
        displayName = "Hydra 70";
      };
    };
    class Rocket_03_HE_Plane_CAS_02_F: Rocket_04_HE_Plane_CAS_01_F {
      displayName = "S-8";
      class Burst: Burst {
        displayName = "S-8";
      };
    };
    class Rocket_03_AP_Plane_CAS_02_F: Rocket_04_AP_Plane_CAS_01_F {
      displayName = "S-8";
      class Burst: Burst {
        displayName = "S-8";
      };
    };
    class rockets_Skyfire: RocketPods {
      displayName = "Skyfire-70";
      class Burst: RocketPods {
        displayName = "Skyfire-70";
      };
    };
    class missiles_DAR: RocketPods {
      displayName = "Hydra 70";
      class Burst: RocketPods {
        displayName = "Hydra 70";
      };
    };
    class missiles_DAGR: RocketPods {
      displayName = "DAGR";
      class Burst: RocketPods {
        displayName = "DAGR";
      };
    };
    class missiles_ASRAAM: MissileLauncher {
      displayName = "AIM-132 ASRAAM";
    };
    class missiles_Zephyr: MissileLauncher {
      displayName = "AIM-120A AMRAAM";
    };
    class missiles_SCALPEL: RocketPods { // according to zGuba, this is what it's based on
      displayName = "9K121 Vikhr";
    };
    class Bomb_03_Plane_CAS_02_F: Bomb_04_Plane_CAS_01_F {
      displayName = "FAB-250M-54";
    };

    class M134_minigun: MGunCore {
      displayName = "2x M134 Minigun";
    };
    class LMG_Minigun: LMG_RCWS {
      displayName = "M134 Minigun";
      class manual: MGun {
        displayName = "M134 Minigun";
      };
    };
    class HMG_127: LMG_RCWS {
      displayName = "M2";
      class manual: MGun {
        displayName = "M2";
      };
    };
    class HMG_01: HMG_127 {
      displayName = "XM312";
    };
    class HMG_M2: HMG_01 {
      displayName = "M2";
    };
    class HMG_NSVT: HMG_127 {
      displayName = "NSVT";
      class manual: manual {
        displayName = "NSVT";
      };
    };
    class GMG_20mm: GMG_F {
      displayName = "XM307";
      class manual: GMG_F {
        displayName = "XM307";
      };
    };
    class GMG_40mm: GMG_F {
      displayName = "Mk 19";
      class manual: GMG_F {
        displayName = "Mk 19";
      };
    };

    class autocannon_35mm: CannonCore {
      displayName = "GDF-001";
      class manual: CannonCore {
        displayName = "GDF-001";
      };
    };
    class missiles_titan: MissileLauncher {
      displayName = "Mini-Spike";
    };
    class mortar_155mm_AMOS: CannonCore {
      displayName = "L/52";
    };
    class rockets_230mm_GAT: RocketPods {
      displayName = "M269";
    };
    class cannon_120mm: CannonCore {
      class player;
      displayName = "MG251";
    };
    class cannon_120mm_long: cannon_120mm {
      displayName = "L/55";
      class player: player {};
    };
    class cannon_105mm: cannon_120mm {
      displayName = "M68";
      class player: player {
        displayName = "M68";
      };
    };
    class cannon_125mm: cannon_120mm {
      displayName = "2A46";
    };
    class LMG_coax: LMG_RCWS {
      displayName = "PKT";
    };
    class AGM_LMG_coax_MBT_01: LMG_coax {
      displayName = "MAG 58";
    };
    class AGM_LMG_coax_APC_Tracked_03: LMG_coax {
      displayName = "L94A1";
    };
    class autocannon_40mm_CTWS: autocannon_Base_F {
      displayName = "Mk44 Bushmaster II";
      class AP: autocannon_Base_F {
        displayName = "Mk44 Bushmaster II";
      };
      class HE: autocannon_Base_F {
        displayName = "Mk44 Bushmaster II";
      };
    };
    class autocannon_30mm_CTWS: autocannon_Base_F {
      displayName = "Mk44 Bushmaster II";
      class AP: autocannon_Base_F {
        displayName = "Mk44 Bushmaster II";
      };
      class HE: autocannon_Base_F {
        displayName = "Mk44 Bushmaster II";
      };
    };
    class autocannon_30mm: autocannon_30mm_CTWS {
      displayName = "L21A1 RARDEN";
      class AP: AP {
        displayName = "L21A1 RARDEN";
      };
      class HE: HE {
        displayName = "L21A1 RARDEN";
      };
    };
};

class CfgMagazines {
  class VehicleMagazine;
  class 2000Rnd_65x39_Belt;

  class 1000Rnd_Gatling_30mm_Plane_CAS_01_F: VehicleMagazine {
    displayNameShort = "30mm HEI";
  };
  class 7Rnd_Rocket_04_HE_F: VehicleMagazine {
    displayNameShort = "70mm HE";
  };
  class 7Rnd_Rocket_04_AP_F: 7Rnd_Rocket_04_HE_F {
    displayNameShort = "70mm AP";
  };
  class 24Rnd_PG_missiles: VehicleMagazine {
    displayNameShort = "70mm HE";
  };
  class 12Rnd_PG_missiles: 24Rnd_PG_missiles {
    displayNameShort = "70mm HE";
  };
  class 5000Rnd_762x51_Belt: 2000Rnd_65x39_Belt {
    displayNameShort = "7.62mm";
  };
  class 5000Rnd_762x51_Yellow_Belt: 5000Rnd_762x51_Belt {
    displayNameShort = "7.62mm";
  };
  class 500Rnd_127x99_mag: VehicleMagazine {
    displayNameShort = "12.7mm";
  };
  class 500Rnd_127x99_mag_Tracer_Green: 500Rnd_127x99_mag {
    displayNameShort = "12.7mm";
  };
  class 500Rnd_127x99_mag_Tracer_Red: 500Rnd_127x99_mag {
    displayNameShort = "12.7mm";
  };
  class 500Rnd_127x99_mag_Tracer_Yellow: 500Rnd_127x99_mag {
    displayNameShort = "12.7mm";
  };
  class 200Rnd_127x99_mag: 500Rnd_127x99_mag {
    displayNameShort = "12.7mm";
  };
  class 200Rnd_127x99_mag_Tracer_Green: 200Rnd_127x99_mag {
    displayNameShort = "12.7mm";
  };
  class 200Rnd_127x99_mag_Tracer_Red: 200Rnd_127x99_mag {
    displayNameShort = "12.7mm";
  };
  class 200Rnd_127x99_mag_Tracer_Yellow: 200Rnd_127x99_mag {
    displayNameShort = "12.7mm";
  };
  class 100Rnd_127x99_mag: 500Rnd_127x99_mag {
    displayNameShort = "12.7mm";
  };
  class 100Rnd_127x99_mag_Tracer_Green: 100Rnd_127x99_mag {
    displayNameShort = "12.7mm";
  };
  class 100Rnd_127x99_mag_Tracer_Red: 100Rnd_127x99_mag {
    displayNameShort = "12.7mm";
  };
  class 100Rnd_127x99_mag_Tracer_Yellow: 100Rnd_127x99_mag {
    displayNameShort = "12.7mm";
  };
  class 200Rnd_40mm_G_belt: VehicleMagazine {
    displayNameShort = "40mm HE";
  };
  class 24Rnd_missiles: VehicleMagazine {
    displayNameShort = "70mm HE";
  };
  class 300Rnd_20mm_shells: VehicleMagazine {
    displayNameShort = "20mm HE";
  };
  class 14Rnd_80mm_rockets: VehicleMagazine {
    displayNameShort = "70mm HE";
  };
  class 250Rnd_30mm_HE_shells: VehicleMagazine {
    displayNameShort = "30mm HE";
  };
  class 250Rnd_30mm_APDS_shells: 250Rnd_30mm_HE_shells {
    displayNameShort = "30mm APDS";
  };
  class 20Rnd_Rocket_03_HE_F: 7Rnd_Rocket_04_HE_F {
    displayNameShort = "80mm HE";
  };
  class 20Rnd_Rocket_03_AP_F: 7Rnd_Rocket_04_AP_F {
    displayNameShort = "80mm AP";
  };
  class 500Rnd_Cannon_30mm_Plane_CAS_02_F: 1000Rnd_Gatling_30mm_Plane_CAS_01_F {
    displayNameShort = "30mm HEI-T";
  };
  class 680Rnd_35mm_AA_shells: VehicleMagazine {
    displayNameShort = "35mm HEI";
  };
  class 680Rnd_35mm_AA_shells_Tracer_Red: 680Rnd_35mm_AA_shells {
    displayNameShort = "35mm HEI-T";
  };
  class 680Rnd_35mm_AA_shells_Tracer_Green: 680Rnd_35mm_AA_shells {
    displayNameShort = "35mm HEI-T";
  };
  class 680Rnd_35mm_AA_shells_Tracer_Yellow: 680Rnd_35mm_AA_shells {
    displayNameShort = "35mm HEI-T";
  };
  class 32Rnd_155mm_Mo_shells: VehicleMagazine {
    displayNameShort = "155mm HE";
  };
  class 6Rnd_155mm_Mo_smoke: 32Rnd_155mm_Mo_shells {
    displayNameShort = "155mm Smoke";
  };
  class 6Rnd_155mm_Mo_mine: 6Rnd_155mm_Mo_smoke {
    displayNameShort = "155mm Mines";
  };
  class 6Rnd_155mm_Mo_AT_mine: 6Rnd_155mm_Mo_smoke {
    displayNameShort = "155mm AT Mines";
  };
  class 2Rnd_155mm_Mo_Cluster: 6Rnd_155mm_Mo_smoke {
    displayNameShort = "155mm Cluster";
  };
  class 2Rnd_155mm_Mo_guided: 6Rnd_155mm_Mo_smoke {
    displayNameShort = "155mm Guided";
  };
  class 2Rnd_155mm_Mo_LG: 6Rnd_155mm_Mo_smoke {
    displayNameShort = "155mm Laser Guided";
  };
  class 12Rnd_230mm_rockets: 14Rnd_80mm_rockets {
    displayName = "227mm HE Missile";
    displayNameShort = "227mm HE";
  };
  class 30Rnd_120mm_HE_shells: VehicleMagazine {
    displayNameShort = "120mm HE";
  };
  class 30Rnd_120mm_HE_shells_Tracer_Red: 30Rnd_120mm_HE_shells {
    displayNameShort = "120mm HE-T";
  };
  class 30Rnd_120mm_HE_shells_Tracer_Green: 30Rnd_120mm_HE_shells {
    displayNameShort = "120mm HE-T";
  };
  class 30Rnd_120mm_HE_shells_Tracer_Yellow: 30Rnd_120mm_HE_shells {
    displayNameShort = "120mm HE-T";
  };
  class 30Rnd_120mm_APFSDS_shells: 30Rnd_120mm_HE_shells {
    displayNameShort = "120mm AP";
  };
  class 30Rnd_120mm_APFSDS_shells_Tracer_Red: 30Rnd_120mm_APFSDS_shells {
    displayNameShort = "120mm AP-T";
  };
  class 30Rnd_120mm_APFSDS_shells_Tracer_Green: 30Rnd_120mm_APFSDS_shells {
    displayNameShort = "120mm AP-T";
  };
  class 30Rnd_120mm_APFSDS_shells_Tracer_Yellow: 30Rnd_120mm_APFSDS_shells {
    displayNameShort = "120mm AP-T";
  };
  class 200Rnd_762x51_Belt: VehicleMagazine {
    displayNameShort = "7.62mm";
  };
  class 200Rnd_762x51_Belt_Red: 200Rnd_762x51_Belt {};
  class 200Rnd_762x51_Belt_Green: 200Rnd_762x51_Belt {};
  class 200Rnd_762x51_Belt_Yellow: 200Rnd_762x51_Belt {};
  class 200Rnd_762x51_Belt_T_Red: 200Rnd_762x51_Belt_Red {
    displayNameShort = "7.62mm";
  };
  class 200Rnd_762x51_Belt_T_Green: 200Rnd_762x51_Belt_Green {
    displayNameShort = "7.62mm";
  };
  class 200Rnd_762x51_Belt_T_Yellow: 200Rnd_762x51_Belt_Yellow {
    displayNameShort = "7.62mm";
  };
  class 2000Rnd_762x51_Belt_Red;
  class 2000Rnd_762x51_Belt_T_Red: 2000Rnd_762x51_Belt_Red {
    displayNameShort = "7.62mm";
  };
  class 2000Rnd_762x51_Belt_Green;
  class 2000Rnd_762x51_Belt_T_Green: 2000Rnd_762x51_Belt_Green {
    displayNameShort = "7.62mm";
  };
  class 2000Rnd_762x51_Belt_Yellow;
  class 2000Rnd_762x51_Belt_T_Yellow: 2000Rnd_762x51_Belt_Yellow {
    displayNameShort = "7.62mm";
  };
  class 1000Rnd_762x51_Belt_Red;
  class 1000Rnd_762x51_Belt_T_Red: 1000Rnd_762x51_Belt_Red {
    displayNameShort = "7.62mm";
  };
  class 1000Rnd_762x51_Belt_Green;
  class 1000Rnd_762x51_Belt_T_Green: 1000Rnd_762x51_Belt_Green {
    displayNameShort = "7.62mm";
  };
  class 1000Rnd_762x51_Belt_Yellow;
  class 1000Rnd_762x51_Belt_T_Yellow: 1000Rnd_762x51_Belt_Yellow {
    displayNameShort = "7.62mm";
  };

  class 16Rnd_120mm_HE_shells;
  class 16Rnd_120mm_HE_shells_Tracer_Red;
  class 16Rnd_120mm_HE_shells_Tracer_Green;
  class 16Rnd_120mm_HE_shells_Tracer_Yellow;
  class 12Rnd_125mm_HE: 16Rnd_120mm_HE_shells {
    displayNameShort = "125mm HE";
  };
  class 12Rnd_125mm_HE_T_Red: 16Rnd_120mm_HE_shells_Tracer_Red {
    displayNameShort = "125mm HE-T";
  };
  class 12Rnd_125mm_HE_T_Green: 16Rnd_120mm_HE_shells_Tracer_Green {
    displayNameShort = "125mm HE-T";
  };
  class 12Rnd_125mm_HE_T_Yellow: 16Rnd_120mm_HE_shells_Tracer_Yellow {
    displayNameShort = "125mm HE-T";
  };

  class 12Rnd_125mm_HEAT: 12Rnd_125mm_HE {
    displayNameShort = "125mm MP";
  };
  class 12Rnd_125mm_HEAT_T_Red: 12Rnd_125mm_HEAT {
    displayNameShort = "125mm MP-T";
  };
  class 12Rnd_125mm_HEAT_T_Green: 12Rnd_125mm_HEAT {
    displayNameShort = "125mm MP-T";
  };
  class 12Rnd_125mm_HEAT_T_Yellow: 12Rnd_125mm_HEAT {
    displayNameShort = "125mm MP-T";
  };

  class 32Rnd_120mm_APFSDS_shells;
  class 32Rnd_120mm_APFSDS_shells_Tracer_Red;
  class 32Rnd_120mm_APFSDS_shells_Tracer_Green;
  class 32Rnd_120mm_APFSDS_shells_Tracer_Yellow;
  class 24Rnd_125mm_APFSDS: 32Rnd_120mm_APFSDS_shells {
    displayNameShort = "125mm AP";
  };
  class 24Rnd_125mm_APFSDS_T_Red: 32Rnd_120mm_APFSDS_shells_Tracer_Red {
    displayNameShort = "125mm AP-T";
  };
  class 24Rnd_125mm_APFSDS_T_Green: 32Rnd_120mm_APFSDS_shells_Tracer_Green {
    displayNameShort = "125mm AP-T";
  };
  class 24Rnd_125mm_APFSDS_T_Yellow: 32Rnd_120mm_APFSDS_shells_Tracer_Yellow {
    displayNameShort = "125mm AP-T";
  };

  class 20Rnd_105mm_HEAT_MP: 12Rnd_125mm_HEAT {
    displayNameShort = "105mm MP";
  };
  class 20Rnd_105mm_HEAT_MP_T_Red: 20Rnd_105mm_HEAT_MP {
    displayNameShort = "105mm MP-T";
  };
  class 20Rnd_105mm_HEAT_MP_T_Green: 20Rnd_105mm_HEAT_MP {
    displayNameShort = "105mm MP-T";
  };
  class 20Rnd_105mm_HEAT_MP_T_Yellow: 20Rnd_105mm_HEAT_MP {
    displayNameShort = "105mm MP-T";
  };
  class 40Rnd_105mm_APFSDS: 24Rnd_125mm_APFSDS {
    displayNameShort = "105mm AP";
  };
  class 40Rnd_105mm_APFSDS_T_Red: 40Rnd_105mm_APFSDS {
    displayNameShort = "105mm AP-T";
  };
  class 40Rnd_105mm_APFSDS_T_Green: 40Rnd_105mm_APFSDS {
    displayNameShort = "105mm AP-T";
  };
  class 40Rnd_105mm_APFSDS_T_Yellow: 40Rnd_105mm_APFSDS {
    displayNameShort = "105mm AP-T";
  };
  class 60Rnd_40mm_GPR_shells: VehicleMagazine {
    displayNameShort = "40mm GPR";
  };
  class 60Rnd_40mm_GPR_Tracer_Red_shells: 60Rnd_40mm_GPR_shells {
    displayNameShort = "40mm GPR-T";
  };
  class 60Rnd_40mm_GPR_Tracer_Green_shells: 60Rnd_40mm_GPR_shells {
    displayNameShort = "40mm GPR-T";
  };
  class 60Rnd_40mm_GPR_Tracer_Yellow_shells: 60Rnd_40mm_GPR_shells {
    displayNameShort = "40mm GPR-T";
  };
  class 40Rnd_40mm_APFSDS_shells: 60Rnd_40mm_GPR_shells {
    displayNameShort = "40mm AP";
  };
  class 40Rnd_40mm_APFSDS_Tracer_Red_shells: 40Rnd_40mm_APFSDS_shells {
    displayNameShort = "40mm AP-T";
  };
  class 40Rnd_40mm_APFSDS_Tracer_Green_shells: 40Rnd_40mm_APFSDS_Tracer_Red_shells {
    displayNameShort = "40mm AP-T";
  };
  class 40Rnd_40mm_APFSDS_Tracer_Yellow_shells: 40Rnd_40mm_APFSDS_Tracer_Red_shells {
    displayNameShort = "40mm AP-T";
  };
  class 450Rnd_127x108_Ball: VehicleMagazine {
    displayNameShort = "12.7mm";
  };

  class 140Rnd_30mm_MP_shells: 250Rnd_30mm_HE_shells {
    displayNameShort = "30mm MP";
  };
  class 140Rnd_30mm_MP_shells_Tracer_Red: 140Rnd_30mm_MP_shells {
    displayNameShort = "30mm MP-T";
  };
  class 140Rnd_30mm_MP_shells_Tracer_Green: 140Rnd_30mm_MP_shells_Tracer_Red {
    displayNameShort = "30mm MP-T";
  };
  class 140Rnd_30mm_MP_shells_Tracer_Yellow: 140Rnd_30mm_MP_shells_Tracer_Red {
    displayNameShort = "30mm MP-T";
  };
  class 60Rnd_30mm_APFSDS_shells: 250Rnd_30mm_HE_shells {
    displayNameShort = "30mm AP";
  };
  class 60Rnd_30mm_APFSDS_shells_Tracer_Red: 60Rnd_30mm_APFSDS_shells {
    displayNameShort = "30mm AP-T";
  };
  class 60Rnd_30mm_APFSDS_shells_Tracer_Green: 60Rnd_30mm_APFSDS_shells {
    displayNameShort = "30mm AP-T";
  };
  class 60Rnd_30mm_APFSDS_shells_Tracer_Yellow: 60Rnd_30mm_APFSDS_shells {
    displayNameShort = "30mm AP-T";
  };

  class 200Rnd_20mm_G_belt: VehicleMagazine {
    displayNameShort = "20mm HE";
  };
  class 40Rnd_20mm_G_belt: 200Rnd_20mm_G_belt {
    displayNameShort = "20mm HE";
  };


  // EXPLOSIVES
  class CA_Magazine;
  // http://en.wikipedia.org/wiki/M15_mine
  class ATMine_Range_Mag: CA_Magazine {
    displayName = "$STR_AGM_RealisticNames_ATMine_Name";
  };
  // http://en.wikipedia.org/wiki/VS-50_mine
  class APERSMine_Range_Mag: ATMine_Range_Mag {
    displayName = "$STR_AGM_RealisticNames_APERSMine_Name";
  };
  // https://www.buymilsurp.com/us-m26-antipersonnel-bounding-mine-p-5419.html
  class APERSBoundingMine_Range_Mag: ATMine_Range_Mag {
    displayName = "$STR_AGM_RealisticNames_APERSBoundingMine_Name";
  };
  // http://en.wikipedia.org/wiki/PMR-3_mine
  class APERSTripMine_Wire_Mag: ATMine_Range_Mag {
    displayName = "$STR_AGM_RealisticNames_APERSTripwireMine_Name";
  };
  // the following ones can be found here: http://www.dtic.mil/dtic/tr/fulltext/u2/a567897.pdf
  class SLAMDirectionalMine_Wire_Mag: ATMine_Range_Mag {
    displayName = "$STR_AGM_RealisticNames_SLAM_Name";
  };
  class ClaymoreDirectionalMine_Remote_Mag: CA_Magazine {
    displayName = "$STR_AGM_RealisticNames_Claymore_Name";
  };
  class SatchelCharge_Remote_Mag: CA_Magazine {
    displayName = "$STR_AGM_RealisticNames_SatchelCharge_Name";
  };
  class DemoCharge_Remote_Mag: SatchelCharge_Remote_Mag {
    displayName = "$STR_AGM_RealisticNames_DemoCharge_Name";
  };
  class HandGrenade: CA_Magazine {
    displayName = "$STR_AGM_RealisticNames_HandGrenade_Name";
  };
  class SmokeShell: HandGrenade {
    displayName = "$STR_AGM_RealisticNames_SmokeShell_Name";
  };
  class SmokeShellBlue: SmokeShell {
    displayName = "$STR_AGM_RealisticNames_SmokeShellBlue_Name";
  };
  class SmokeShellGreen: SmokeShell {
    displayName = "$STR_AGM_RealisticNames_SmokeShellGreen_Name";
  };
  class SmokeShellOrange: SmokeShell {
    displayName = "$STR_AGM_RealisticNames_SmokeShellOrange_Name";
  };
  class SmokeShellPurple: SmokeShell {
    displayName = "$STR_AGM_RealisticNames_SmokeShellPurple_Name";
  };
  class SmokeShellRed: SmokeShell {
    displayName = "$STR_AGM_RealisticNames_SmokeShellRed_Name";
  };
  class SmokeShellYellow: SmokeShell {
    displayName = "$STR_AGM_RealisticNames_SmokeShellYellow_Name";
  };
};
