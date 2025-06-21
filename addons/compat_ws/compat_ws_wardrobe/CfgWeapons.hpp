class CfgWeapons {

    // BASECLASSES
    class ItemCore;
    class HelmetBase: ItemCore {
        class ItemInfo;
    };

    class H_Shemag_khk;
    class HeadgearItem;

    class H_turban_02_mask_black_lxws: H_Shemag_khk {
        class ItemInfo: HeadgearItem {
            mass = 26;
        };
    };

    //// RF Helmets with Glasses, adjust mass by adding weight of glasses
    class lxWS_H_PASGT_goggles_UN_F: HelmetBase {
        MASS(32);
    };  
    class lxWS_H_PASGT_goggles_black_F: lxWS_H_PASGT_goggles_UN_F {
        MASS(32);
    };  
    class lxWS_H_PASGT_goggles_olive_F: lxWS_H_PASGT_goggles_UN_F {
        MASS(32);
    };  
    class lxWS_H_PASGT_goggles_white_F: lxWS_H_PASGT_goggles_UN_F {
        MASS(32);
    };
};
