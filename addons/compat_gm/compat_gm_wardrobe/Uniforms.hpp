// CfgWeapons

// Sleves

class gm_ge_bgs_uniform_special_80_base;
class gm_ge_bgs_uniform_special_rolled_80_base;

class gm_ge_bgs_uniform_special_80_grn        : gm_ge_bgs_uniform_special_80_base        { class PVAR(wardrobe) : EGVAR(wardrobe,base_U_sleeves_down) { modifiableTo[] = { Q(gm_ge_bgs_uniform_special_rolled_80_grn) }; }; };
class gm_ge_bgs_uniform_special_rolled_80_grn : gm_ge_bgs_uniform_special_rolled_80_base { class PVAR(wardrobe) : EGVAR(wardrobe,base_U_sleeves_up)   { modifiableTo[] = { Q(gm_ge_bgs_uniform_special_80_grn) }; }; };

class gm_ge_bgs_uniform_special_80_blk        : gm_ge_bgs_uniform_special_80_base        { class PVAR(wardrobe) : EGVAR(wardrobe,base_U_sleeves_down) { modifiableTo[] = { Q(gm_ge_bgs_uniform_special_rolled_80_blk) }; }; };
class gm_ge_bgs_uniform_special_rolled_80_blk : gm_ge_bgs_uniform_special_rolled_80_base { class PVAR(wardrobe) : EGVAR(wardrobe,base_U_sleeves_up)   { modifiableTo[] = { Q(gm_ge_bgs_uniform_special_80_blk) }; }; };


class gm_ge_army_uniform_pilot_base;
class gm_ge_army_uniform_pilot_rolled_base;

class gm_ge_army_uniform_pilot_sar        : gm_ge_army_uniform_pilot_base        { class PVAR(wardrobe) : EGVAR(wardrobe,base_U_sleeves_down) { modifiableTo[] = { Q(gm_ge_army_uniform_pilot_rolled_sar) }; }; };
class gm_ge_army_uniform_pilot_rolled_sar : gm_ge_army_uniform_pilot_rolled_base { class PVAR(wardrobe) : EGVAR(wardrobe,base_U_sleeves_up)   { modifiableTo[] = { Q(gm_ge_army_uniform_pilot_sar) }; }; };

class gm_ge_army_uniform_pilot_oli        : gm_ge_army_uniform_pilot_base        { class PVAR(wardrobe) : EGVAR(wardrobe,base_U_sleeves_down) { modifiableTo[] = { Q(gm_ge_army_uniform_pilot_oli) }; }; };
class gm_ge_army_uniform_pilot_rolled_oli : gm_ge_army_uniform_pilot_rolled_base { class PVAR(wardrobe) : EGVAR(wardrobe,base_U_sleeves_up)   { modifiableTo[] = { Q(gm_ge_army_uniform_pilot_rolled_oli) }; }; };

class gm_ge_pol_uniform_pilot_grn        : gm_ge_army_uniform_pilot_base        { class PVAR(wardrobe) : EGVAR(wardrobe,base_U_sleeves_down) { modifiableTo[] = { Q(gm_ge_pol_uniform_pilot_rolled_grn) }; }; };
class gm_ge_pol_uniform_pilot_rolled_grn : gm_ge_army_uniform_pilot_rolled_base { class PVAR(wardrobe) : EGVAR(wardrobe,base_U_sleeves_up)   { modifiableTo[] = { Q(gm_ge_pol_uniform_pilot_grn) }; }; };

class gm_ge_uniform_pilot_commando_base;
class gm_ge_uniform_pilot_commando_rolled_base;

class gm_ge_uniform_pilot_commando_oli        : gm_ge_uniform_pilot_commando_base        { class PVAR(wardrobe) : EGVAR(wardrobe,base_U_sleeves_down) { modifiableTo[] = { Q(gm_ge_uniform_pilot_commando_rolled_oli) }; }; };
class gm_ge_uniform_pilot_commando_rolled_oli : gm_ge_uniform_pilot_commando_rolled_base { class PVAR(wardrobe) : EGVAR(wardrobe,base_U_sleeves_up)   { modifiableTo[] = { Q(gm_ge_uniform_pilot_commando_oli) }; }; };

class gm_ge_uniform_pilot_commando_gry        : gm_ge_uniform_pilot_commando_base        { class PVAR(wardrobe) : EGVAR(wardrobe,base_U_sleeves_down) { modifiableTo[] = { Q(gm_ge_uniform_pilot_commando_rolled_gry) }; }; };
class gm_ge_uniform_pilot_commando_rolled_gry : gm_ge_uniform_pilot_commando_rolled_base { class PVAR(wardrobe) : EGVAR(wardrobe,base_U_sleeves_up)   { modifiableTo[] = { Q(gm_ge_uniform_pilot_commando_gry) }; }; };

class gm_ge_uniform_pilot_commando_blk        : gm_ge_uniform_pilot_commando_base        { class PVAR(wardrobe) : EGVAR(wardrobe,base_U_sleeves_down) { modifiableTo[] = { Q(gm_ge_uniform_pilot_commando_rolled_blk) }; }; };
class gm_ge_uniform_pilot_commando_rolled_blk : gm_ge_uniform_pilot_commando_rolled_base { class PVAR(wardrobe) : EGVAR(wardrobe,base_U_sleeves_up)   { modifiableTo[] = { Q(gm_ge_uniform_pilot_commando_blk) }; }; };

class gm_pl_uniform_soldier_80_base;

class gm_pl_army_uniform_soldier_80_frog        : gm_pl_uniform_soldier_80_base { class PVAR(wardrobe) : EGVAR(wardrobe,base_U_sleeves_down) { modifiableTo[] = { Q(gm_pl_army_uniform_soldier_rolled_80_frog) }; }; };
class gm_pl_army_uniform_soldier_rolled_80_frog : gm_pl_uniform_soldier_80_base { class PVAR(wardrobe) : EGVAR(wardrobe,base_U_sleeves_up)   { modifiableTo[] = { Q(gm_pl_army_uniform_soldier_80_frog) }; }; };

class gm_pl_army_uniform_soldier_80_moro        : gm_pl_uniform_soldier_80_base { class PVAR(wardrobe) : EGVAR(wardrobe,base_U_sleeves_down) { modifiableTo[] = { Q(gm_pl_army_uniform_soldier_rolled_80_moro) }; }; };
class gm_pl_army_uniform_soldier_rolled_80_moro : gm_pl_uniform_soldier_80_base { class PVAR(wardrobe) : EGVAR(wardrobe,base_U_sleeves_up)   { modifiableTo[] = { Q(gm_pl_army_uniform_soldier_80_moro) }; }; };


class gm_ge_uniform_soldier_90_base;

class gm_ge_uniform_soldier_90_trp        : gm_ge_uniform_soldier_90_base { class PVAR(wardrobe) : EGVAR(wardrobe,base_U_sleeves_down) { modifiableTo[] = { Q(gm_ge_uniform_soldier_rolled_90_trp) }; }; };
class gm_ge_uniform_soldier_rolled_90_trp : gm_ge_uniform_soldier_90_base { class PVAR(wardrobe) : EGVAR(wardrobe,base_U_sleeves_up)   { modifiableTo[] = { Q(gm_ge_uniform_soldier_90_trp) }; }; };

class gm_ge_uniform_soldier_90_flk        : gm_ge_uniform_soldier_90_base { class PVAR(wardrobe) : EGVAR(wardrobe,base_U_sleeves_down) { modifiableTo[] = { Q(gm_ge_uniform_soldier_rolled_90_flk) }; }; };
class gm_ge_uniform_soldier_rolled_90_flk : gm_ge_uniform_soldier_90_base { class PVAR(wardrobe) : EGVAR(wardrobe,base_U_sleeves_up)   { modifiableTo[] = { Q(gm_ge_uniform_soldier_90_flk) }; }; };




// Gloves

class gm_gc_uniform_soldier_80_base;
class gm_gc_army_uniform_soldier_gloves_80_str : gm_gc_uniform_soldier_80_base { class PVAR(wardrobe) : EGVAR(wardrobe,base_U_gloves_on)  { modifiableTo[] = { Q(gm_gc_army_uniform_soldier_80_str)        }; }; };
class gm_gc_army_uniform_soldier_80_str        : gm_gc_uniform_soldier_80_base { class PVAR(wardrobe) : EGVAR(wardrobe,base_U_gloves_off) { modifiableTo[] = { Q(gm_gc_army_uniform_soldier_gloves_80_str) }; }; };

class gm_ge_uniform_soldier_80_base;
class gm_ge_army_uniform_soldier_gloves_80_ols : gm_ge_uniform_soldier_80_base { class PVAR(wardrobe) : EGVAR(wardrobe,base_U_gloves_on)  { modifiableTo[] = { Q(gm_ge_army_uniform_soldier_80_ols)        }; }; };
class gm_ge_army_uniform_soldier_80_ols        : gm_ge_uniform_soldier_80_base { class PVAR(wardrobe) : EGVAR(wardrobe,base_U_gloves_off) { modifiableTo[] = { Q(gm_ge_army_uniform_soldier_gloves_80_ols) }; }; };


// Mixed case -> Base Interaction
class gm_ge_army_uniform_soldier_bdu_80_wdl;
class gm_ge_army_uniform_soldier_bdu_rolled_80_wdl;

class gm_xx_uniform_soldier_bdu_80_wdl          : gm_ge_army_uniform_soldier_bdu_80_wdl        { class PVAR(wardrobe) : EGVAR(wardrobe,base_U_gloves_on)    { modifiableTo[] = { Q(gm_xx_uniform_soldier_bdu_rolled_80_wdl), Q(gm_xx_uniform_soldier_bdu_nogloves_80_wdl) }; }; };
class gm_xx_uniform_soldier_bdu_rolled_80_wdl   : gm_ge_army_uniform_soldier_bdu_rolled_80_wdl { class PVAR(wardrobe) : EGVAR(wardrobe,base_U_sleeves_up)   { modifiableTo[] = { Q(gm_xx_uniform_soldier_bdu_80_wdl),        Q(gm_xx_uniform_soldier_bdu_nogloves_80_wdl) }; }; };
class gm_xx_uniform_soldier_bdu_nogloves_80_wdl : gm_ge_army_uniform_soldier_bdu_80_wdl        { class PVAR(wardrobe) : EGVAR(wardrobe,base)                { modifiableTo[] = { Q(gm_xx_uniform_soldier_bdu_80_wdl),        Q(gm_xx_uniform_soldier_bdu_rolled_80_wdl)   }; }; };

class gm_xx_uniform_soldier_bdu_80_oli          : gm_ge_army_uniform_soldier_bdu_80_wdl        { class PVAR(wardrobe) : EGVAR(wardrobe,base_U_gloves_on)    { modifiableTo[] = { Q(gm_xx_uniform_soldier_bdu_rolled_80_oli), Q(gm_xx_uniform_soldier_bdu_nogloves_80_oli) }; }; };
class gm_xx_uniform_soldier_bdu_rolled_80_oli   : gm_ge_army_uniform_soldier_bdu_rolled_80_wdl { class PVAR(wardrobe) : EGVAR(wardrobe,base_U_sleeves_up)   { modifiableTo[] = { Q(gm_xx_uniform_soldier_bdu_80_oli),        Q(gm_xx_uniform_soldier_bdu_nogloves_80_oli) }; }; };
class gm_xx_uniform_soldier_bdu_nogloves_80_oli : gm_ge_army_uniform_soldier_bdu_80_wdl        { class PVAR(wardrobe) : EGVAR(wardrobe,base)                { modifiableTo[] = { Q(gm_xx_uniform_soldier_bdu_80_oli),        Q(gm_xx_uniform_soldier_bdu_rolled_80_oli)   }; }; };


