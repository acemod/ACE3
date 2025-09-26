// Sleeves
// UNIFORM_SLEEVES(variantSleevesDown,variantSleevesUp);

UNIFORM_SLEEVES(gm_ge_bgs_uniform_special_80_grn,gm_ge_bgs_uniform_special_rolled_80_grn);
UNIFORM_SLEEVES(gm_ge_bgs_uniform_special_80_blk,gm_ge_bgs_uniform_special_rolled_80_blk);

UNIFORM_SLEEVES(gm_ge_army_uniform_pilot_sar,gm_ge_army_uniform_pilot_rolled_sar);
UNIFORM_SLEEVES(gm_ge_army_uniform_pilot_oli,gm_ge_army_uniform_pilot_rolled_oli);

UNIFORM_SLEEVES(gm_ge_pol_uniform_pilot_grn,gm_ge_pol_uniform_pilot_rolled_grn);

UNIFORM_SLEEVES(gm_ge_uniform_pilot_commando_oli,gm_ge_uniform_pilot_commando_rolled_oli);
UNIFORM_SLEEVES(gm_ge_uniform_pilot_commando_gry,gm_ge_uniform_pilot_commando_rolled_gry);
UNIFORM_SLEEVES(gm_ge_uniform_pilot_commando_blk,gm_ge_uniform_pilot_commando_rolled_blk);

UNIFORM_SLEEVES(gm_pl_army_uniform_soldier_80_frog,gm_pl_army_uniform_soldier_rolled_80_frog);
UNIFORM_SLEEVES(gm_pl_army_uniform_soldier_80_moro,gm_pl_army_uniform_soldier_rolled_80_moro);

UNIFORM_SLEEVES(gm_ge_uniform_soldier_90_trp,gm_ge_uniform_soldier_rolled_90_trp);
UNIFORM_SLEEVES(gm_ge_uniform_soldier_90_flk,gm_ge_uniform_soldier_rolled_90_flk);


// Sleeves
// #define UNIFORM_GLOVES(variantGlovesOn,variantGlovesOff)
UNIFORM_GLOVES(gm_gc_army_uniform_soldier_gloves_80_str,gm_gc_army_uniform_soldier_80_str);
UNIFORM_GLOVES(gm_ge_army_uniform_soldier_gloves_80_ols,gm_ge_army_uniform_soldier_80_ols);


// Gloves, Sleeves Up and Base Variant -> Manual configuration
// Woodland Variant
class gm_xx_uniform_soldier_bdu_80_wdl: EGVAR(wardrobe,base_U_gloves_on) {
    class modifiableTo {
        class gm_xx_uniform_soldier_bdu_rolled_80_wdl {};
        class gm_xx_uniform_soldier_bdu_nogloves_80_wdl {};
    };
};
class gm_xx_uniform_soldier_bdu_rolled_80_wdl: EGVAR(wardrobe,base_U_sleeves_up) {
    class modifiableTo {
        class gm_xx_uniform_soldier_bdu_80_wdl {};
        class gm_xx_uniform_soldier_bdu_nogloves_80_wdl {};
    };
};
class gm_xx_uniform_soldier_bdu_nogloves_80_wdl: EGVAR(wardrobe,base) {
    class modifiableTo {
        class gm_xx_uniform_soldier_bdu_80_wdl {};
        class gm_xx_uniform_soldier_bdu_rolled_80_wdl {};
    };
};

// Olive variant
class gm_xx_uniform_soldier_bdu_80_oli: EGVAR(wardrobe,base_U_gloves_on) {
    class modifiableTo {
        class gm_xx_uniform_soldier_bdu_rolled_80_oli {};
        class gm_xx_uniform_soldier_bdu_nogloves_80_oli {};
    };
};
class gm_xx_uniform_soldier_bdu_rolled_80_oli: EGVAR(wardrobe,base_U_sleeves_up) {
    class modifiableTo {
        class gm_xx_uniform_soldier_bdu_80_oli {};
        class gm_xx_uniform_soldier_bdu_nogloves_80_oli {};
    };
};
class gm_xx_uniform_soldier_bdu_nogloves_80_oli: EGVAR(wardrobe,base) {
    class modifiableTo {
        class gm_xx_uniform_soldier_bdu_80_oli {};
        class gm_xx_uniform_soldier_bdu_rolled_80_oli {};
    };
};
