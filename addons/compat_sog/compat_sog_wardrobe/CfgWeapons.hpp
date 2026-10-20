class CfgWeapons {

    // Headgear
    class H_Booniehat_khk;
    class vn_b_headgear_base;
    class vn_o_headgear_base: H_Booniehat_khk {
        class ItemInfo;
    };

    class vn_b_helmet_m1_01_01: vn_b_headgear_base {
        class ItemInfo;
    };

    // Helmets with/without Goggles
    class vn_b_helmet_m1_14_01: vn_b_helmet_m1_01_01 {};


    class vn_b_helmet_m1_20_01: vn_b_helmet_m1_14_01 {
        MASS(12);
    };
    class vn_b_helmet_m1_20_02: vn_b_helmet_m1_20_01 {
        MASS(12);
    };


    //// VN Pilot Helmet
    // With Goggles
    class vn_o_helmet_shl61_01: vn_o_headgear_base {
        MASS(12);
    };   
    // Without Goggles
    class vn_o_helmet_shl61_02: vn_o_helmet_shl61_01 {
        MASS(10);
    };


    // US Vic Crew Helmets
    class vn_b_helmet_t56_01_01: vn_b_headgear_base {
        class ItemInfo;
    };
    class vn_b_helmet_t56_02_01: vn_b_helmet_t56_01_01 {
        MASS(12);
    };

    class vn_b_helmet_t56_02_02: vn_b_helmet_t56_02_01 {
        MASS(12);
    };

    class vn_b_helmet_t56_02_03: vn_b_helmet_t56_02_01 {
        MASS(12);
    };

    // VN Pith Helmet with Crew Goggles
    class vn_o_helmet_nva_01: vn_o_headgear_base {
        class ItemInfo;
    };
    class vn_o_helmet_nva_05: vn_o_helmet_nva_01  {
        MASS(12);
    };


    // Uniform
    // Common Uniform Base Class
    class Uniform_Base;

    // BLUFOR Uniform Base Class
    class vn_b_uniform_base: Uniform_Base {
        class ItemInfo;
    };

    // BLUFOR Uniform Macros
    #define ITEMINFO_FIX(num)\
    class ItemInfo: ItemInfo {\
        containerClass = QUOTE(Supply##num);\
        mass = num;\
    }

    #define UNIFORM_BASE_B_ITEMINFO_FIX(class2)\
    class class2: vn_b_uniform_base {\
        ITEMINFO_FIX(70);\
    }

    #define B_U(div,var,camo) vn_b_uniform_##div##_##var##_##camo
    #define B_U_FIX(div,up,camo) UNIFORM_BASE_B_ITEMINFO_FIX(B_U(div,up,camo))

    // MACV
    #define OLIVE_FIELD 01
    #define TIGER 02
    #define TIGER_GREEN 05
    #define ERDL_BROWN 06
    #define OLIVE 07
    #define LEOPARD 08
    #define ERDL 15
    #define LIZARD 16
    #define BDQ 17
    #define FROG 18

    // macv 05 and 04 have inconsistency between them -> different uniform maxLoad. This likely will cause the player to loose items when the uniform is filled to the brim. Difference is 1lb which translates to 16~17x ace bandages or 1x 1l blood
    B_U_FIX(macv,04,OLIVE_FIELD);
    B_U_FIX(macv,04,TIGER);
    B_U_FIX(macv,04,TIGER_GREEN);
    B_U_FIX(macv,04,ERDL_BROWN);
    B_U_FIX(macv,04,OLIVE);
    B_U_FIX(macv,04,LEOPARD);
    B_U_FIX(macv,04,ERDL);
    B_U_FIX(macv,04,LIZARD);
    B_U_FIX(macv,04,BDQ);
    B_U_FIX(macv,04,FROG);

    // OPFOR Uniform Base Class
    class vn_o_uniform_base: Uniform_Base {
        class ItemInfo;
    };

    // OPFOR Uniform Macro
    #define UNIFORM_BASE_O_ITEMINFO_FIX(classname)\
    class classname: vn_o_uniform_base {\
        ITEMINFO_FIX(60);\
    }

    UNIFORM_BASE_O_ITEMINFO_FIX(vn_o_uniform_nva_army_02_01);
    UNIFORM_BASE_O_ITEMINFO_FIX(vn_o_uniform_nva_army_02_02);
    UNIFORM_BASE_O_ITEMINFO_FIX(vn_o_uniform_nva_army_02_03);
    UNIFORM_BASE_O_ITEMINFO_FIX(vn_o_uniform_nva_army_02_04);

    UNIFORM_BASE_O_ITEMINFO_FIX(vn_o_uniform_nva_army_04_01);
    UNIFORM_BASE_O_ITEMINFO_FIX(vn_o_uniform_nva_army_04_02);
    UNIFORM_BASE_O_ITEMINFO_FIX(vn_o_uniform_nva_army_04_03);
    UNIFORM_BASE_O_ITEMINFO_FIX(vn_o_uniform_nva_army_04_04);

    UNIFORM_BASE_O_ITEMINFO_FIX(vn_o_uniform_nva_army_06_03);
    UNIFORM_BASE_O_ITEMINFO_FIX(vn_o_uniform_nva_army_06_04);

    UNIFORM_BASE_O_ITEMINFO_FIX(vn_o_uniform_nva_army_08_03);
    UNIFORM_BASE_O_ITEMINFO_FIX(vn_o_uniform_nva_army_08_04);

    UNIFORM_BASE_O_ITEMINFO_FIX(vn_o_uniform_nva_army_10_03);
    UNIFORM_BASE_O_ITEMINFO_FIX(vn_o_uniform_nva_army_10_04);

    UNIFORM_BASE_O_ITEMINFO_FIX(vn_o_uniform_nva_army_12_03);
    UNIFORM_BASE_O_ITEMINFO_FIX(vn_o_uniform_nva_army_12_04);

    UNIFORM_BASE_O_ITEMINFO_FIX(vn_o_uniform_vc_reg_12_08);
    UNIFORM_BASE_O_ITEMINFO_FIX(vn_o_uniform_vc_reg_12_09);
    UNIFORM_BASE_O_ITEMINFO_FIX(vn_o_uniform_vc_reg_12_10);

    UNIFORM_BASE_O_ITEMINFO_FIX(vn_o_uniform_vc_mf_02_07);
    UNIFORM_BASE_O_ITEMINFO_FIX(vn_o_uniform_vc_mf_04_07);
    UNIFORM_BASE_O_ITEMINFO_FIX(vn_o_uniform_vc_mf_10_07);
    UNIFORM_BASE_O_ITEMINFO_FIX(vn_o_uniform_vc_mf_12_07);
};
