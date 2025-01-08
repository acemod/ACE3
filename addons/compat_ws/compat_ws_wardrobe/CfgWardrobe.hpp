class EGVAR(wardrobe,base);
class EGVAR(wardrobe,base_H_goggles_on);
class EGVAR(wardrobe,base_H_goggles_off);


class CfgGlasses {
    class G_Combat;
    class G_Combat_lxWS: G_Combat {
        class ace_wardrobe: EGVAR(wardrobe,base) {
            components[] = {"G_Combat_lxWS"};
        };
    };
};


class CfgWeapons {

    class ItemCore;
    class HelmetBase: ItemCore {
        class ItemInfo;
    };

    #include "Turbans.hpp"

    // Cap (Ion) Forward and Reversed
    class lxWS_H_CapB_rvs_blk;
    class lxWS_H_CapB_rvs_blk_ION: lxWS_H_CapB_rvs_blk {
        class ace_wardrobe: EGVAR(wardrobe,base) {
            modifiableTo[] = { "H_Cap_headphones_ion_lxws" };
        };
    };
    class H_Cap_headphones_ion_lxws: lxWS_H_CapB_rvs_blk_ION {
        class ace_wardrobe: EGVAR(wardrobe,base) {
            modifiableTo[] = { "lxWS_H_CapB_rvs_blk_ION" };
        };
    };

    // Helmets
    class H_PASGT_basic_base_F;

    //// RF Helmets with Glasses
    class lxWS_H_PASGT_goggles_UN_F: HelmetBase {
        MASS(32);
        class ace_wardrobe: EGVAR(wardrobe,base_H_goggles_on) {
            modifiableTo[] = { "lxWS_H_PASGT_basic_UN_F" };
            components[] = {"G_Combat_lxWS"};
        };
    };  
    class lxWS_H_PASGT_goggles_black_F: lxWS_H_PASGT_goggles_UN_F {
        MASS(32);
        class ace_wardrobe: EGVAR(wardrobe,base_H_goggles_on) {
            modifiableTo[] = { "H_PASGT_basic_black_F" };
            components[] = {"G_Combat_lxWS"};
        };
    };  
    class lxWS_H_PASGT_goggles_olive_F: lxWS_H_PASGT_goggles_UN_F {
        MASS(32);
        class ace_wardrobe: EGVAR(wardrobe,base_H_goggles_on) {
            modifiableTo[] = { "H_PASGT_basic_olive_F" };
            components[] = {"G_Combat_lxWS"};
        };
    };  
    class lxWS_H_PASGT_goggles_white_F: lxWS_H_PASGT_goggles_UN_F {
        MASS(32);
        class ace_wardrobe: EGVAR(wardrobe,base_H_goggles_on) {
            modifiableTo[] = { "H_PASGT_basic_white_F" };
            components[] = {"G_Combat_lxWS"};
        };
    };  

    // Without
    class lxWS_H_PASGT_basic_UN_F: HelmetBase {
        class ace_wardrobe: EGVAR(wardrobe,base_H_goggles_off) {
            modifiableTo[] = { "lxWS_H_PASGT_goggles_UN_F" };
        };
    };
    class H_PASGT_basic_black_F: H_PASGT_basic_base_F {
        class ace_wardrobe: EGVAR(wardrobe,base_H_goggles_off) {
            modifiableTo[] = { "lxWS_H_PASGT_goggles_black_F" };
        };
    };
    class H_PASGT_basic_olive_F: H_PASGT_basic_base_F {
        class ace_wardrobe: EGVAR(wardrobe,base_H_goggles_off) {
            modifiableTo[] = { "lxWS_H_PASGT_goggles_olive_F" };
        };
    };
    class H_PASGT_basic_white_F: H_PASGT_basic_base_F {
        class ace_wardrobe: EGVAR(wardrobe,base_H_goggles_off) {
            modifiableTo[] = { "lxWS_H_PASGT_goggles_white_F" };
        };
    };
};
