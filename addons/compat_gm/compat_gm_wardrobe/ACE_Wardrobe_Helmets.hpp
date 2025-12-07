// Helmet Visor 
//HELMET_VISOR(variantVisorUp,variantVisorDown)

HELMET_VISOR(gm_ge_bgs_headgear_psh77_cover_up_smp,gm_ge_bgs_headgear_psh77_cover_down_smp);
HELMET_VISOR(gm_ge_bgs_headgear_psh77_cover_up_str,gm_ge_bgs_headgear_psh77_cover_down_str);
HELMET_VISOR(gm_ge_headgear_psh77_up_oli,gm_ge_headgear_psh77_down_oli);


// Hemlet with Goggles 
//HELMET_GOGGLES(variantGogglesOn,variantGogglesOff,component)

HELMET_GOGGLES(gm_ge_headgear_m92_cover_glasses_win,gm_ge_headgear_m92_cover_win,gm_ge_facewear_dustglasses);
HELMET_GOGGLES(gm_ge_headgear_m92_cover_glasses_oli,gm_ge_headgear_m92_cover_oli,gm_ge_facewear_dustglasses);
HELMET_GOGGLES(gm_ge_headgear_m92_cover_glasses_blk,gm_ge_headgear_m92_cover_blk,gm_ge_facewear_dustglasses);

HELMET_GOGGLES(gm_ge_headgear_m92_glasses_trp,gm_ge_headgear_m92_trp,gm_ge_facewear_dustglasses);
HELMET_GOGGLES(gm_ge_headgear_m92_glasses_flk,gm_ge_headgear_m92_flk,gm_ge_facewear_dustglasses);

HELMET_GOGGLES(gm_ge_bgs_headgear_m38_72_goggles_bgr,gm_ge_bgs_headgear_m38_72_bgr,gm_ge_facewear_acidgoggles);


// Caps with "Slung" M62 Helmets
// HELMET_CAP_COMBO(Combo,Helmet,Cap)


// Helmet Only
class gm_ge_headgear_m62_net: EGVAR(wardrobe,base) {
    class modifiableTo {
        class gm_ge_headgear_sidecap_80_m62_oli {};
        class gm_ge_headgear_hat_80_m62_oli {};
    };
    components[] = {"gm_ge_headgear_m62_net"};
};


// Hats only
class gm_ge_headgear_hat_80_oli: EGVAR(wardrobe,base) {
    class modifiableTo {
        class gm_ge_headgear_hat_80_m62_oli {};
    };
    components[] = {"gm_ge_headgear_hat_80_oli"};
};

class gm_ge_headgear_sidecap_80_oli: EGVAR(wardrobe,base) {
    class modifiableTo {
        class gm_ge_headgear_sidecap_80_m62_oli {};
    };
    components[] = {"gm_ge_headgear_sidecap_80_oli"};
};

// Hats + Helmets

class gm_ge_headgear_hat_80_m62_oli: EGVAR(wardrobe,base) {
    class modifiableTo {
        class gm_ge_headgear_hat_80_oli {};
        class gm_ge_headgear_m62_net {};
    };
    components[] = {"gm_ge_headgear_hat_80_oli","gm_ge_headgear_m62_net"};
};



class gm_ge_headgear_sidecap_80_m62_oli: EGVAR(wardrobe,base) {
    class modifiableTo {
        class gm_ge_headgear_sidecap_80_oli {};
        class gm_ge_headgear_m62_net {};
    };
    components[] = {"gm_ge_headgear_sidecap_80_oli","gm_ge_headgear_m62_net"};
};
