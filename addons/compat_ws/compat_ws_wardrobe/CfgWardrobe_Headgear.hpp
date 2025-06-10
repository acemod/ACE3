// Cap (Ion) Forward and Reversed
class lxWS_H_CapB_rvs_blk_ION: EGVAR(wardrobe,base) {
    class modifiableTo {
        class H_Cap_headphones_ion_lxws {};
    };
};
class H_Cap_headphones_ion_lxws: EGVAR(wardrobe,base) {
    class modifiableTo {
        class lxWS_H_CapB_rvs_blk_ION {};
    };
};

//// RF Helmets with Glasses
HELMET_GOGGLES(lxWS_H_PASGT_goggles_UN_F,lxWS_H_PASGT_basic_UN_F,G_Combat_lxWS);
HELMET_GOGGLES(lxWS_H_PASGT_goggles_black_F,H_PASGT_basic_black_F,G_Combat_lxWS);
HELMET_GOGGLES(lxWS_H_PASGT_goggles_olive_F,H_PASGT_basic_olive_F,G_Combat_lxWS);
HELMET_GOGGLES(lxWS_H_PASGT_goggles_white_F,H_PASGT_basic_white_F,G_Combat_lxWS);

//Component
class G_Combat_lxWS: EGVAR(wardrobe,base) {
    components[] = {"G_Combat_lxWS"};
};
