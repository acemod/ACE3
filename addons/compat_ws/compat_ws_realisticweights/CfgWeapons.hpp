class CfgWeapons {
    class Rifle;
    class Rifle_Base_F: Rifle {
        class WeaponSlotsInfo;
    };
    class Rifle_Long_Base_F: Rifle_Base_F {
        class WeaponSlotsInfo;
    };

    // FN FAL 50
    class DMR_06_base_F: Rifle_Long_Base_F {
        class WeaponSlotsInfo;
    };
    class arifle_SLR_lxWS: DMR_06_base_F {
        class WeaponSlotsInfo: WeaponSlotsInfo {
            mass = 94;
        };
    };

    // FN FAL 50 bipod
    class arifle_SLR_V_lxWS: arifle_SLR_lxWS {
        class WeaponSlotsInfo: WeaponSlotsInfo {
            mass = 104; // + 1lbs due to bipod
        };
    };

    // FN FAL OSW Para
    class arifle_SLR_Para_lxWS: arifle_SLR_V_lxWS {
        class WeaponSlotsInfo: WeaponSlotsInfo {
            // Source: Manufacturer website: DS Arms SA58 FAL O.S.W
            mass = 90;
        };
    };

    // Galil ARM
    class arifle_Galat_base_lxWS: Rifle_Base_F {
        class WeaponSlotsInfo: WeaponSlotsInfo {
            mass = 96;
        };
    };

    // GLX-160
    class glaunch_GLX_base_lxWS: Rifle_Base_F {
        class WeaponSlotsInfo: WeaponSlotsInfo {
            mass = 48.5;
        };
    };

    // Vektor R4
    class arifle_Velko_base_lxWS: arifle_Galat_base_lxWS {
        class WeaponSlotsInfo: WeaponSlotsInfo {
            mass = 94.8;
        };
    };

    // Vektor R5
    class arifle_VelkoR5_lxWS: arifle_Velko_base_lxWS {
        class WeaponSlotsInfo: WeaponSlotsInfo {
            mass = 82;
        };
    };

    // Vektor R5 GL
    class arifle_VelkoR5_GL_lxWS: arifle_VelkoR5_lxWS {
        class WeaponSlotsInfo: WeaponSlotsInfo {
            mass = 112; // + 3lbs (M203 weight)
        };
    };

    // Vektor SS-77
    class LMG_S77_base_lxWS: Rifle_Long_Base_F {
        class WeaponSlotsInfo: WeaponSlotsInfo {
            mass = 213;
        };
    };

    // Vektor SS-77 Compact
    class LMG_S77_Compact_base_lxWS: LMG_S77_base_lxWS {
        class WeaponSlotsInfo: WeaponSlotsInfo {
            // https://web.archive.org/web/20250428134347/https://www.thefirearmblog.com/blog/2008/09/22/aad-08-vektor-ss77-compact/
            mass = 169;
        };
    };

    // XMS
    class arifle_SPAR_01_base_F: Rifle_Base_F {
        class WeaponSlotsInfo;
    };
    class arifle_XMS_Base_lxWS: arifle_SPAR_01_base_F {
        class WeaponSlotsInfo: WeaponSlotsInfo {
            mass = 75;
        };
    };

    // XMS-GL
    class arifle_XMS_GL_lxWS: arifle_XMS_Base_lxWS {
        class WeaponSlotsInfo: WeaponSlotsInfo {
            mass = 108; // + 3.3lbs (AG36 weight)
        };
    };

    // XMS-SG
    class arifle_XMS_Shot_lxWS: arifle_XMS_Base_lxWS {
        class WeaponSlotsInfo: WeaponSlotsInfo {
            mass = 108; // same as GL
        };
    };

    // XMS-SW
    class arifle_XMS_lxWS: arifle_XMS_Base_lxWS {
        class WeaponSlotsInfo;
    };
    class arifle_XMS_M_lxWS: arifle_XMS_lxWS {
        class WeaponSlotsInfo: WeaponSlotsInfo {
            mass = 120; // no sources available, so just XMS * 1.6
        };
    };
};
