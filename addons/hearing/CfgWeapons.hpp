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

    class ACE_EHP: ACE_ItemCore {
        author = ECSTRING(common,ACETeam);
        displayName = CSTRING(ElectronicHearingProtection_Name);
        descriptionShort = CSTRING(ElectronicHearingProtection_Description);
        model = "\A3\Characters_F_Orange\Headgear\H_EarProtectors_F.p3d";
        picture = "\A3\Characters_F_Orange\Headgear\Data\UI\icon_H_EarProtectors_black_F_CA.paa";
        scope = 2;
        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 8.4; // 380g, based on 3M Peltor
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
        HEARING_PROTECTION_PELTOR;
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

    // Military headgear with a both-ear headset (similar to the modern INVISIO X7) should have active earpro.
    class H_Watchcap_blk: HelmetBase {
        HEARING_PROTECTION_PELTOR;
    };
    class H_Bandanna_khk;
    class H_Bandanna_khk_hs: H_Bandanna_khk {
        HEARING_PROTECTION_PELTOR;
    };
    class H_Booniehat_khk;
    class H_Booniehat_khk_hs: H_Booniehat_khk {
        HEARING_PROTECTION_PELTOR;
    };
    class H_Cap_oli;
    class H_Cap_oli_hs: H_Cap_oli {
        HEARING_PROTECTION_PELTOR;
    };
    class H_MilCap_ocamo: HelmetBase {
        HEARING_PROTECTION_PELTOR;
    };
    class H_Shemag_olive;
    class H_Shemag_olive_hs: H_Shemag_olive {
        HEARING_PROTECTION_PELTOR;
    };
};
