class CfgWeapons {
    #include "Attachments.hpp"

    class Pistol_Base_F;
    class hgun_Glock19_RF: Pistol_Base_F {
        displayName = SUBCSTRING(glock19_Name);
    };
    class hgun_Glock19_khk_RF: hgun_Glock19_RF {
        displayName = SUBCSTRING(glock19_khk_Name);
    };
    class hgun_Glock19_Tan_RF: hgun_Glock19_RF {
        displayName = SUBCSTRING(glock19_tan_Name);
    };
    class hgun_Glock19_auto_RF: hgun_Glock19_RF {
        displayName = SUBCSTRING(glock19_auto_Name);
    };
    class hgun_Glock19_auto_khk_RF: hgun_Glock19_auto_RF {
        displayName = SUBCSTRING(glock19_auto_khk_Name);
    };
    class hgun_Glock19_auto_Tan_RF: hgun_Glock19_auto_RF {
        displayName = SUBCSTRING(glock19_auto_tan_Name);
    };

    class hgun_DEagle_RF: Pistol_Base_F {
        displayName = SUBCSTRING(deagle_Name);
    };
    class hgun_DEagle_classic_RF: hgun_DEagle_RF {
        displayName = SUBCSTRING(deagle_classic_Name);
    };
    class hgun_DEagle_bronze_RF: hgun_DEagle_RF {
        displayName = SUBCSTRING(deagle_bronze_Name);
    };
    class hgun_DEagle_copper_RF: hgun_DEagle_RF {
        displayName = SUBCSTRING(deagle_copper_Name);
    };
    class hgun_DEagle_gold_RF: hgun_DEagle_RF {
        displayName = SUBCSTRING(deagle_gold_Name);
    };

    class srifle_h6_base_rf;
    class srifle_h6_tan_rf: srifle_h6_base_rf {
        displayName = SUBCSTRING(h6_tan_Name);
    };
    class srifle_h6_oli_rf: srifle_h6_tan_rf {
        displayName = SUBCSTRING(h6_oli_Name);
    };
    class srifle_h6_blk_rf: srifle_h6_tan_rf {
        displayName = SUBCSTRING(h6_blk_Name);
    };
    class srifle_h6_digi_rf: srifle_h6_tan_rf {
        displayName = SUBCSTRING(h6_digi_Name);
    };
    class srifle_h6_gold_rf: srifle_h6_tan_rf {
        displayName = SUBCSTRING(h6_gold_Name);
    };

    class srifle_DMR_01_F;
    class srifle_DMR_01_black_RF: srifle_DMR_01_F {
        displayName = SUBCSTRING(dmr_01_black_Name);
    };
    class srifle_DMR_01_tan_RF: srifle_DMR_01_black_RF {
        displayName = SUBCSTRING(dmr_01_tan_Name);
    };

    class SMG_01_F;
    class SMG_01_black_RF: SMG_01_F {
        displayName = SUBCSTRING(smg_01_black_Name);
    };

    class arifle_ash12_base_RF;
    class arifle_ash12_blk_RF: arifle_ash12_base_RF {
        displayName = SUBCSTRING(ash12_blk_Name);
    };
    class arifle_ash12_desert_RF: arifle_ash12_base_RF {
        displayName = SUBCSTRING(ash12_desert_Name);
    };
    class arifle_ash12_urban_RF: arifle_ash12_base_RF {
        displayName = SUBCSTRING(ash12_urban_Name);
    };
    class arifle_ash12_wood_RF: arifle_ash12_base_RF {
        displayName = SUBCSTRING(ash12_wood_Name);
    };

    class arifle_ash12_GL_base_RF;
    class arifle_ash12_GL_blk_RF: arifle_ash12_GL_base_RF {
        displayName = SUBCSTRING(ash12_gl_blk_Name);
    };
    class arifle_ash12_GL_desert_RF: arifle_ash12_GL_blk_RF {
        displayName = SUBCSTRING(ash12_gl_desert_Name);
    };
    class arifle_ash12_GL_urban_RF: arifle_ash12_GL_blk_RF {
        displayName = SUBCSTRING(ash12_gl_urban_Name);
    };
    class arifle_ash12_GL_wood_RF: arifle_ash12_GL_blk_RF {
        displayName = SUBCSTRING(ash12_gl_wood_Name);
    };

    class arifle_ash12_LR_base_RF;
    class arifle_ash12_LR_blk_RF: arifle_ash12_LR_base_RF {
        displayName = SUBCSTRING(ash12_lr_blk_Name);
    };
    class arifle_ash12_LR_desert_RF: arifle_ash12_LR_blk_RF {
        displayName = SUBCSTRING(ash12_lr_desert_Name);
    };
    class arifle_ash12_LR_urban_RF: arifle_ash12_LR_blk_RF {
        displayName = SUBCSTRING(ash12_lr_urban_Name);
    };
    class arifle_ash12_LR_wood_RF: arifle_ash12_LR_blk_RF {
        displayName = SUBCSTRING(ash12_lr_wood_Name);
    };
};
