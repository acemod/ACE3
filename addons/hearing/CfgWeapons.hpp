class CfgWeapons {
    class ACE_ItemCore;
    class CBA_MiscItem_ItemInfo;

    class ACE_EarPlugs: ACE_ItemCore {
        author = ECSTRING(common,ACETeam);
        displayName = CSTRING(EarPlugs_Name);
        descriptionShort = CSTRING(EarPlugs_Description);
        model = QPATHTOF(data\ace_earplugs.p3d);
        picture = QPATHTOF(UI\ACE_earplugs_x_ca.paa);
        scope = 2;
        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 0.1;
        };
    };


    class H_HelmetB;
    class H_HelmetCrew_B: H_HelmetB {
        HEARING_PROTECTION_VICCREW;
    };

    class H_CrewHelmetHeli_B: H_HelmetB {
        HEARING_PROTECTION_VICCREW;
    };

    class H_PilotHelmetHeli_B: H_HelmetB {
        HEARING_PROTECTION_VICCREW;
    };

    class H_PilotHelmetFighter_B: H_HelmetB {
        HEARING_PROTECTION_VICCREW;
    };

    class HelmetBase;
    class H_Cap_headphones: HelmetBase {
        HEARING_PROTECTION_EARMUFF;
    };

    class H_Construction_earprot_base_F: HelmetBase {
        HEARING_PROTECTION_EARMUFF;
    };

    class H_Construction_headset_base_F: HelmetBase {
        HEARING_PROTECTION_EARMUFF;
    };

    class H_EarProtectors_base_F: HelmetBase {
        HEARING_PROTECTION_EARMUFF;
    };

   class H_HeadSet_base_F: HelmetBase {
        HEARING_PROTECTION_EARMUFF;
    };

    class H_HelmetB_light: H_HelmetB {
        HEARING_PROTECTION_PELTOR;
    };
    class H_HelmetB_camo: H_HelmetB {
        HEARING_PROTECTION_PELTOR;
    };

    class H_HelmetB_plain_mcamo;
    class H_HelmetSpecB: H_HelmetB_plain_mcamo {
        HEARING_PROTECTION_PELTOR;
    };

    class H_HelmetB_TI_tna_F: H_HelmetB {
        HEARING_PROTECTION_PELTOR;
    };

    class H_Tank_base_F;
    class H_Tank_black_F: H_Tank_base_F {
        HEARING_PROTECTION_VICCREW;
    };

    class H_RacingHelmet_1_F: H_HelmetB_camo {
        HEARING_PROTECTION_VICCREW;
    };

    class H_HelmetO_ocamo: H_HelmetB {
        HEARING_PROTECTION_PELTOR;
    }; // Defender and Assassin Helmet inherit.

    class H_HelmetO_ViperSP_hex_f: H_HelmetB {
        HEARING_PROTECTION_PELTOR;
    };

    class H_HelmetAggressor_base_F: HelmetBase {
        HEARING_PROTECTION_PELTOR;
    };

    class H_HelmetHBK_base_F;
    class H_HelmetHBK_chops_base_F: H_HelmetHBK_base_F {
        HEARING_PROTECTION_PELTOR;
    };
    class H_HelmetHBK_ear_base_F: H_HelmetHBK_base_F {
        HEARING_PROTECTION_PELTOR;
    };
    class H_HelmetHBK_headset_base_F: H_HelmetHBK_base_F {
        HEARING_PROTECTION_PELTOR;
    };
};
