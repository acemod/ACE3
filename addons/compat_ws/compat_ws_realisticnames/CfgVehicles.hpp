class CfgVehicles {
    class APC_Wheeled_01_base_F;
    class APC_Wheeled_01_atgm_base_lxWS: APC_Wheeled_01_base_F {
        displayName = SUBCSTRING(apc_wheeled_01_atgm_Name);
    };
    class APC_Wheeled_01_command_base_lxWS: APC_Wheeled_01_base_F {
        displayName = SUBCSTRING(apc_wheeled_01_command_Name);
    };
    class APC_Wheeled_01_mortar_base_lxWS: APC_Wheeled_01_base_F {
        displayName = SUBCSTRING(apc_wheeled_01_mortar_Name);
    };

    class Truck_02_base_F;
    class Truck_02_aa_base_lxWS: Truck_02_base_F {
        displayName = SUBCSTRING(truck_02_aa_Name);
    };
    class Truck_02_cargo_base_lxWS: Truck_02_base_F {
        displayName = SUBCSTRING(truck_02_cargo_Name);
    };
    class Truck_02_box_base_lxWS: Truck_02_base_F {
        displayName = SUBCSTRING(truck_02_repair_Name);
    };
    class C_Truck_02_racing_lxWS: Truck_02_box_base_lxWS {
        displayName = SUBCSTRING(truck_02_racing_Name);
    };
    class Truck_02_Ammo_base_lxWS: Truck_02_base_F {
        displayName = SUBCSTRING(truck_02_ammo_Name);
    };
    class Truck_02_flatbed_base_lxWS: Truck_02_cargo_base_lxWS {
        displayName = SUBCSTRING(truck_02_flatbed_Name);
    };

    class Heli_Transport_02_base_F;
    class B_UN_Heli_Transport_02_lxWS: Heli_Transport_02_base_F {
        displayName = SUBCSTRING(heli_transport_02_Name);
    };

    class O_APC_Tracked_02_cannon_F;
    class O_APC_Tracked_02_30mm_lxWS: O_APC_Tracked_02_cannon_F {
        displayName = SUBCSTRING(apc_tracked_02_Name);
    };

    class APC_Wheeled_02_base_v2_F;
    class APC_Wheeled_02_hmg_base_lxws: APC_Wheeled_02_base_v2_F {
        displayName = SUBCSTRING(apc_wheeled_02_hmg_Name);
    };
    class APC_Wheeled_02_unarmed_base_lxws: APC_Wheeled_02_base_v2_F {
        displayName = SUBCSTRING(apc_wheeled_02_unarmed_Name);
    };

    class O_Heli_Light_02_dynamicLoadout_F;
    class B_ION_Heli_Light_02_dynamicLoadout_lxWS: O_Heli_Light_02_dynamicLoadout_F {
        displayName = SUBCSTRING(heli_light_02_armed_Name);
    };

    class O_Heli_Light_02_unarmed_F;
    class B_ION_Heli_Light_02_unarmed_lxWS: O_Heli_Light_02_unarmed_F {
        displayName = SUBCSTRING(heli_light_02_unarmed_Name);
    };

    #include "CfgVehiclesAttachments.hpp"

    // AA12
    class Weapon_Base_F;
    class Weapon_sgun_aa40_lxWS: Weapon_Base_F {
        displayName = SUBCSTRING(AA40_Name);
    };
    class Weapon_sgun_aa40_tan_lxWS: Weapon_Base_F {
        displayName = SUBCSTRING(AA40_Tan_Name);
    };
    class Weapon_sgun_aa40_snake_lxWS: Weapon_Base_F {
        displayName = SUBCSTRING(AA40_Snake_Name);
    };

    // Galil ARM
    class Weapon_arifle_Galat_lxWS: Weapon_Base_F {
        displayName = SUBCSTRING(Galat_Name);
    };
    class Weapon_arifle_Galat_worn_lxWS: Weapon_Base_F {
        displayName = SUBCSTRING(Galat_Old_Name);
    };

    // GLX 160
    class Weapon_glaunch_GLX_lxWS: Weapon_Base_F {
        displayName = SUBCSTRING(GLX_Name);
    };
    class Weapon_glaunch_GLX_snake_lxWS: Weapon_Base_F {
        displayName = SUBCSTRING(GLX_Snake_Name);
    };
    class Weapon_glaunch_GLX_hex_lxWS: Weapon_Base_F {
        displayName = SUBCSTRING(GLX_Hex_Name);
    };
    class Weapon_glaunch_GLX_ghex_lxWS: Weapon_Base_F {
        displayName = SUBCSTRING(GLX_GreenHex_Name);
    };
    class Weapon_glaunch_GLX_camo_lxWS: Weapon_Base_F {
        displayName = SUBCSTRING(GLX_Camo_Name);
    };
    class Weapon_glaunch_GLX_tan_lxWS: Weapon_Base_F {
        displayName = SUBCSTRING(GLX_Tan_Name);
    };

    // Mk14 Mod 1 EBR
    class Weapon_srifle_EBR_blk_lxWS: Weapon_Base_F {
        displayName = SUBCSTRING(EBR_Black_Name);
    };
    class Weapon_srifle_EBR_snake_lxWS: Weapon_Base_F {
        displayName = SUBCSTRING(EBR_Snake_Name);
    };

    // Vektor SS-77
    class Weapon_LMG_S77_lxWS: Weapon_Base_F {
        displayName = SUBCSTRING(S77_Name);
    };
    class Weapon_LMG_S77_AAF_lxWS: Weapon_Base_F {
        displayName = SUBCSTRING(S77_AAF_Name);
    };
    class Weapon_LMG_S77_Hex_lxWS: Weapon_Base_F {
        displayName = SUBCSTRING(S77_Hex_Name);
    };
    class Weapon_LMG_S77_GHex_lxWS: Weapon_Base_F {
        displayName = SUBCSTRING(S77_GreenHex_Name);
    };
    class Weapon_LMG_S77_Desert_lxWS: Weapon_Base_F {
        displayName = SUBCSTRING(S77_Desert_Name);
    };

    // Vektor SS-77 (Compact)
    class Weapon_LMG_S77_Compact_lxWS: Weapon_Base_F {
        displayName = SUBCSTRING(S77_Compact_Name);
    };
    class Weapon_LMG_S77_Compact_Snakeskin_lxWS: Weapon_Base_F {
        displayName = SUBCSTRING(S77_Compact_Snake_Name);
    };

    // FN FAL (Wood) - Closest match is the 50.00
    class Weapon_arifle_SLR_lxWS: Weapon_Base_F {
        displayName = SUBCSTRING(SLR_Wood_Name);
    };
    class Weapon_arifle_SLR_GL_lxWS: Weapon_Base_F {
        displayName = SUBCSTRING(SLR_GL_Wood_Name);
    };

    // FN FAL
    class Weapon_arifle_SLR_V_lxWS: Weapon_Base_F {
        displayName = SUBCSTRING(SLR_Name);
    };
    class Weapon_arifle_SLR_V_GL_lxWS: Weapon_Base_F {
        displayName = SUBCSTRING(SLR_GL_Name);
    };
    class Weapon_arifle_SLR_D_lxWS: Weapon_Base_F {
        displayName = SUBCSTRING(SLR_Desert_Name);
    };
    class Weapon_arifle_SLR_V_camo_lxWS: Weapon_Base_F {
        displayName = SUBCSTRING(SLR_Camo_Name);
    };
    class Weapon_arifle_SLR_Para_lxWS: Weapon_Base_F {
        displayName = SUBCSTRING(SLR_Para_Name);
    };
    class Weapon_arifle_SLR_Para_snake_lxWS: Weapon_Base_F {
        displayName = SUBCSTRING(SLR_Para_Snake_Name);
    };

    // Vektor R4/R5
    class Weapon_arifle_Velko_lxWS: Weapon_Base_F {
        displayName = SUBCSTRING(Velko_R4_Name);
    };
    class Weapon_arifle_VelkoR5_lxWS: Weapon_Base_F {
        displayName = SUBCSTRING(Velko_R5_Name);
    };
    class Weapon_arifle_VelkoR5_GL_lxWS: Weapon_Base_F {
        displayName = SUBCSTRING(Velko_R5_GL_Name);
    };
    class Weapon_arifle_VelkoR5_snake_lxWS: Weapon_Base_F {
        displayName = SUBCSTRING(Velko_R5_Snake_Name);
    };
    class Weapon_arifle_VelkoR5_GL_snake_lxWS: Weapon_Base_F {
        displayName = SUBCSTRING(Velko_R5_GL_Snake_Name);
    };

    // XMS has no realistic name as it's a make believe hybrid of the XM8/VHS-K2: XM8+VHS = XMS, this just removes the 5.56 mm from the name.
    class Weapon_arifle_XMS_Base_lxWS: Weapon_Base_F {
        displayName = SUBCSTRING(XMS_Name);
    };
    class Weapon_arifle_XMS_Base_khk_lxWS: Weapon_Base_F {
        displayName = SUBCSTRING(XMS_Khaki_Name);
    };
    class Weapon_arifle_XMS_Base_Sand_lxWS: Weapon_Base_F {
        displayName = SUBCSTRING(XMS_Sand_Name);
    };
    class Weapon_arifle_XMS_GL_lxWS: Weapon_Base_F {
        displayName = SUBCSTRING(XMS_GL_Name);
    };
    class Weapon_arifle_XMS_GL_khk_lxWS: Weapon_Base_F {
        displayName = SUBCSTRING(XMS_GL_Khaki_Name);
    };
    class Weapon_arifle_XMS_GL_Sand_lxWS: Weapon_Base_F {
        displayName = SUBCSTRING(XMS_GL_Sand_Name);
    };
    class Weapon_arifle_XMS_Shot_lxWS: Weapon_Base_F {
        displayName = SUBCSTRING(XMS_SG_Name);
    };
    class Weapon_arifle_XMS_Shot_khk_lxWS: Weapon_Base_F {
        displayName = SUBCSTRING(XMS_SG_Khaki_Name);
    };
    class Weapon_arifle_XMS_Shot_Sand_lxWS: Weapon_Base_F {
        displayName = SUBCSTRING(XMS_SG_Sand_Name);
    };
    class Weapon_arifle_XMS_M_lxWS: Weapon_Base_F {
        displayName = SUBCSTRING(XMS_SW_Name);
    };
    class arifle_XMS_M_khk_lxWS: Weapon_Base_F {
        diWeapon_splayName = SUBCSTRING(XMS_SW_Khaki_Name);
    };
    class Weapon_arifle_XMS_M_Sand_lxWS: Weapon_Base_F {
        displayName = SUBCSTRING(XMS_SW_Sand_Name);
    };

    // GM6 Lynx
    class Weapon_srifle_GM6_snake_lxWS: Weapon_Base_F {
        displayName = SUBCSTRING(gm6_snake_Name);
    };

    // RPG-32
    class Launcher_Base_F;
    class Weapon_launch_RPG32_tan_lxWS: Launcher_Base_F {
        displayName = SUBCSTRING(rpg32_tan_Name);
    };
};
