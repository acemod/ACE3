// CfgWeapons

// Base Classes
class gm_ge_headgear_psh77_cover_down_base;
class gm_ge_headgear_psh77_cover_up_base;
class gm_ge_headgear_psh77_down_base;
class gm_ge_headgear_psh77_up_base;

class gm_ge_bgs_headgear_psh77_cover_down_smp: gm_ge_headgear_psh77_cover_down_base {
    class ace_wardrobe: EGVAR(wardrobe,base_H_visor_down) { 
        modifiableTo[] = { "gm_ge_bgs_headgear_psh77_cover_up_smp" };
    };
};
class gm_ge_bgs_headgear_psh77_cover_up_smp: gm_ge_headgear_psh77_cover_up_base {
    class ace_wardrobe: EGVAR(wardrobe,base_H_visor_up)   { 
        modifiableTo[] = { "gm_ge_bgs_headgear_psh77_cover_down_smp" };
    };
};
class gm_ge_bgs_headgear_psh77_cover_down_str: gm_ge_headgear_psh77_cover_down_base {
    class ace_wardrobe: EGVAR(wardrobe,base_H_visor_down) { 
        modifiableTo[] = { "gm_ge_bgs_headgear_psh77_cover_up_str" };
    };
};
class gm_ge_bgs_headgear_psh77_cover_up_str: gm_ge_headgear_psh77_cover_up_base {
    class ace_wardrobe: EGVAR(wardrobe,base_H_visor_up)   { 
        modifiableTo[] = { "gm_ge_bgs_headgear_psh77_cover_down_str" };
    };
};
class gm_ge_headgear_psh77_down_oli: gm_ge_headgear_psh77_down_base {
    class ace_wardrobe: EGVAR(wardrobe,base_H_visor_down) { 
        modifiableTo[] = { "gm_ge_headgear_psh77_up_oli" };
    };
};
class gm_ge_headgear_psh77_up_oli: gm_ge_headgear_psh77_up_base {
    class ace_wardrobe: EGVAR(wardrobe,base_H_visor_up)   { 
        modifiableTo[] = { "gm_ge_headgear_psh77_down_oli" };
    };
};

#define GM_Helmet_Glasses(classWith,classWithout,baseWith,baseWithout,goggles)\
class classWith: baseWith {\
    class ace_wardrobe: EGVAR(wardrobe,base_H_goggles_on) {\
        modifiableTo[] = { QUOTE(classWithout) };\
        components[] = { QUOTE(goggles) };\
    };\
    MASS(11);\
};\
class classWithout: baseWithout {\
    class ace_wardrobe: EGVAR(wardrobe,base_H_goggles_off) {\
        modifiableTo[] = { QUOTE(classWith) };\
    };\
}


class gm_ge_headgear_m92_base;
class gm_ge_headgear_m92_cover_base;

class gm_ge_headgear_m92_glasses_base: gm_ge_headgear_m92_base {
    class ItemInfo;
};

class gm_ge_headgear_m92_cover_glasses_base: gm_ge_headgear_m92_base {
    class ItemInfo;
};

GM_Helmet_Glasses(gm_ge_headgear_m92_cover_glasses_win,gm_ge_headgear_m92_cover_win,gm_ge_headgear_m92_cover_glasses_base,gm_ge_headgear_m92_cover_base,gm_ge_facewear_dustglasses);
GM_Helmet_Glasses(gm_ge_headgear_m92_cover_glasses_oli,gm_ge_headgear_m92_cover_oli,gm_ge_headgear_m92_cover_glasses_base,gm_ge_headgear_m92_cover_base,gm_ge_facewear_dustglasses);
GM_Helmet_Glasses(gm_ge_headgear_m92_cover_glasses_blk,gm_ge_headgear_m92_cover_blk,gm_ge_headgear_m92_cover_glasses_base,gm_ge_headgear_m92_cover_base,gm_ge_facewear_dustglasses);

GM_Helmet_Glasses(gm_ge_headgear_m92_glasses_trp,gm_ge_headgear_m92_trp,gm_ge_headgear_m92_glasses_base,gm_ge_headgear_m92_base,gm_ge_facewear_dustglasses);
GM_Helmet_Glasses(gm_ge_headgear_m92_glasses_flk,gm_ge_headgear_m92_flk,gm_ge_headgear_m92_glasses_base,gm_ge_headgear_m92_base,gm_ge_facewear_dustglasses);


class gm_headgear_armored_base;
class gm_ge_headgear_m38_72_base;
class gm_ge_headgear_m38_72_goggles_base: gm_headgear_armored_base {
    class ItemInfo;
};
GM_Helmet_Glasses(gm_ge_bgs_headgear_m38_72_goggles_bgr,gm_ge_bgs_headgear_m38_72_bgr,gm_ge_headgear_m38_72_goggles_base,gm_ge_headgear_m38_72_base,gm_ge_facewear_acidgoggles);

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

// Helmet Only
class gm_ge_headgear_m62_base;
class gm_ge_headgear_m62_net: gm_ge_headgear_m62_base {
    class ace_wardrobe: EGVAR(wardrobe,base) {
        modifiableTo[] = {"gm_ge_headgear_hgm_ge_headgear_sidecap_80_m62_oliat_80_oli", "gm_ge_headgear_hat_80_m62_oli"};
        components[] = {"gm_ge_headgear_m62_net"};
    };
};

// Hats only
class gm_ge_headgear_hat_80_oli: gm_ge_headgear_hat_80_base {
    class ace_wardrobe: EGVAR(wardrobe,base) {
        modifiableTo[] = {"gm_ge_headgear_hat_80_m62_oli"};
        components[] = {"gm_ge_headgear_hat_80_oli"};
    };
};
class gm_ge_headgear_sidecap_80_oli: gm_ge_headgear_sidecap_80_base {
    class ace_wardrobe: EGVAR(wardrobe,base) {
        modifiableTo[] = {"gm_ge_headgear_sidecap_80_m62_oli"};
        components[] = {"gm_ge_headgear_sidecap_80_oli"};
    };
};

// Hats + Helmets
class gm_ge_headgear_hat_80_m62_oli: gm_ge_headgear_hat_80_base {
    class ace_wardrobe: EGVAR(wardrobe,base) {
        modifiableTo[] = {"gm_ge_headgear_hat_80_oli","gm_ge_headgear_m62_net"};
        components[] = {"gm_ge_headgear_hat_80_oli","gm_ge_headgear_m62_net"};
    };
    MASS(20);
};
class gm_ge_headgear_sidecap_80_m62_oli: gm_ge_headgear_sidecap_80_base {
    class ace_wardrobe: EGVAR(wardrobe,base) {
        modifiableTo[] = {"gm_ge_headgear_sidecap_80_oli","gm_ge_headgear_m62_net"};
        components[] = {"gm_ge_headgear_sidecap_80_oli","gm_ge_headgear_m62_net"};
    };
    MASS(20);
};
