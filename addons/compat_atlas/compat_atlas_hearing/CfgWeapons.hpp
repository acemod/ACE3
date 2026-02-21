#define PELTOR(CLASSNAME) \
    class CLASSNAME: ItemCore { \
        HEARING_PROTECTION_PELTOR; \
    }

#define PELTOR_PARENT(CLASSNAME,PARENT) \
    class CLASSNAME: PARENT { \
        HEARING_PROTECTION_PELTOR; \
    }

class CfgWeapons {
    class ItemCore;

    // Boonie hat
    class H_Booniehat_flecktarn;
    class H_Booniehat_flecktarn_hs: H_Booniehat_flecktarn {
        HEARING_PROTECTION_PELTOR;
    };

    class H_Booniehat_multitarn;
    class H_Booniehat_multitarn_hs: H_Booniehat_multitarn {
        HEARING_PROTECTION_PELTOR;
    };

    class H_Booniehat_semiarid;
    class H_Booniehat_semiarid_hs: H_Booniehat_semiarid {
        HEARING_PROTECTION_PELTOR;
    };

    class H_Booniehat_whex_F;
    class H_Booniehat_whex_hs_F: H_Booniehat_whex_F {
        HEARING_PROTECTION_PELTOR;
    };

    class H_Booniehat_aucamo_F;
    class H_Booniehat_aucamo_hs_F: H_Booniehat_aucamo_F {
        HEARING_PROTECTION_PELTOR;
    };

    class H_Booniehat_aucamo_ard_F;
    class H_Booniehat_aucamo_ard_hs_F: H_Booniehat_aucamo_ard_F {
        HEARING_PROTECTION_PELTOR;
    };

    class H_Booniehat_aucamo_trp_F;
    class H_Booniehat_aucamo_trp_hs_F: H_Booniehat_aucamo_trp_F {
        HEARING_PROTECTION_PELTOR;
    };

    class H_Booniehat_jungle;
    class H_Booniehat_jungle_hs: H_Booniehat_jungle {
        HEARING_PROTECTION_PELTOR;
    };

    // Shemag
    class H_Shemag_red;
    class H_Shemag_red_hs: H_Shemag_red {
        HEARING_PROTECTION_PELTOR;
    };

    class H_Shemag_blk;
    class H_Shemag_blk_hs: H_Shemag_blk {
        HEARING_PROTECTION_PELTOR;
    };

    class H_Shemag_khk;
    class H_Shemag_khk_hs: H_Shemag_khk {
        HEARING_PROTECTION_PELTOR;
    };


    // Field cap
    class Atlas_H_FieldCap_flecktarn;
    class Atlas_H_FieldCap_hs_flecktarn: Atlas_H_FieldCap_flecktarn {
        HEARING_PROTECTION_PELTOR;
    };

    class Atlas_H_FieldCap_multitarn;
    class Atlas_H_FieldCap_hs_multitarn: Atlas_H_FieldCap_multitarn {
        HEARING_PROTECTION_PELTOR;
    };
    
    class Atlas_H_FieldCap_kzg;
    class Atlas_H_FieldCap_hs_kzg: Atlas_H_FieldCap_kzg {
        HEARING_PROTECTION_PELTOR;
    };
    
    class Atlas_H_FieldCap_ldf;
    class Atlas_H_FieldCap_hs_ldf: Atlas_H_FieldCap_ldf {
        HEARING_PROTECTION_PELTOR;
    };
    
    class Atlas_H_FieldCap_pantera;
    class Atlas_H_FieldCap_hs_pantera: Atlas_H_FieldCap_pantera {
        HEARING_PROTECTION_PELTOR;
    };

    // Guardian helmet
    PELTOR(H_HelmetI_I_01_base_F);
    PELTOR(H_HelmetI_I_01_cover_base_F);
    PELTOR(Atlas_H_HelmetI_I_01_cover_alt_base_F);
    
    // Intruder helmet
    class Atlas_H_HelmetCCH_HiCut_base_F;
    class Atlas_H_HelmetCCH_HiCut_Cover_base_F: Atlas_H_HelmetCCH_HiCut_base_F {
        HEARING_PROTECTION_PELTOR;
    };

    class Atlas_H_HelmetCCH_HiCut_Headset_base_F: Atlas_H_HelmetCCH_HiCut_base_F {
        HEARING_PROTECTION_PELTOR;
    };

    // Liberator helmet
    class Atlas_H_HelmetCCH_base_F;
    class Atlas_H_HelmetCCH_Cover_base_F: Atlas_H_HelmetCCH_base_F {
        HEARING_PROTECTION_PELTOR;
    };

    class Atlas_H_HelmetCCH_Headset_base_F: Atlas_H_HelmetCCH_base_F {
        HEARING_PROTECTION_PELTOR;
    };
};
