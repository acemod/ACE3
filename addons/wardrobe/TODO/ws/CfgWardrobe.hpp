class EGVAR(wardrobe,base);

class CfgWeapons
{
    // Cap (Ion) Forward and Reversed
    class lxWS_H_CapB_rvs_blk;
    class lxWS_H_CapB_rvs_blk_ION: lxWS_H_CapB_rvs_blk       { class PVAR(wardrobe) : EGVAR(wardrobe,base) { modifiableTo[] = { "H_Cap_headphones_ion_lxws" }; }; };
    class H_Cap_headphones_ion_lxws: lxWS_H_CapB_rvs_blk_ION { class PVAR(wardrobe) : EGVAR(wardrobe,base) { modifiableTo[] = { "lxWS_H_CapB_rvs_blk_ION"   }; }; };

    #include "Turbans.hpp"
};

