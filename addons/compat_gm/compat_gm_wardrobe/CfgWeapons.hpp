class CfgWeapons {
    // Base Classes
    class gm_ge_headgear_m92_base;
    class gm_ge_headgear_m92_glasses_base: gm_ge_headgear_m92_base {
        class ItemInfo;
    };
    class gm_ge_headgear_m92_cover_glasses_base: gm_ge_headgear_m92_base {
        class ItemInfo;
    };


    // Increase mass of helmets with glasses by mass of glasses
    #define GM_Helmet_Glasses(Classname,BaseClass)\
    class Classname: BaseClass {\
        MASS(11);\
    }

    GM_Helmet_Glasses(gm_ge_headgear_m92_cover_glasses_win,gm_ge_headgear_m92_cover_glasses_base);
    GM_Helmet_Glasses(gm_ge_headgear_m92_cover_glasses_oli,gm_ge_headgear_m92_cover_glasses_base);
    GM_Helmet_Glasses(gm_ge_headgear_m92_cover_glasses_blk,gm_ge_headgear_m92_cover_glasses_base);

    GM_Helmet_Glasses(gm_ge_headgear_m92_glasses_trp,gm_ge_headgear_m92_glasses_base);
    GM_Helmet_Glasses(gm_ge_headgear_m92_glasses_flk,gm_ge_headgear_m92_glasses_base);


    // Base Classes
    class gm_headgear_armored_base;
    class gm_ge_headgear_m38_72_goggles_base: gm_headgear_armored_base {
        class ItemInfo;
    };

    GM_Helmet_Glasses(gm_ge_bgs_headgear_m38_72_goggles_bgr,gm_ge_headgear_m38_72_goggles_base);


    // Caps with M62 Helmets
    // Base Classes
    class gm_ge_headgear_hat_base;

    class gm_ge_headgear_hat_80_base: gm_ge_headgear_hat_base {
        class ItemInfo;
    };
    class gm_ge_headgear_sidecap_base;
    class gm_ge_headgear_sidecap_80_base: gm_ge_headgear_sidecap_base {
        class ItemInfo;
    };

    // Increase mass of helmets with hat by mass of hat
    class gm_ge_headgear_hat_80_m62_oli: gm_ge_headgear_hat_80_base {
        MASS(20);
    };
    class gm_ge_headgear_sidecap_80_m62_oli: gm_ge_headgear_sidecap_80_base {
        MASS(20);
    };
};
