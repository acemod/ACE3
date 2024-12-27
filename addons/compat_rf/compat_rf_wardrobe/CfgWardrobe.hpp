class EGVAR(wardrobe,base);
class EGVAR(wardrobe,base_U_sleeves_up);
class EGVAR(wardrobe,base_U_sleeves_down);
class EGVAR(wardrobe,base_U_jacket_open);
class EGVAR(wardrobe,base_U_jacket_closed);
class EGVAR(wardrobe,base_H_visor_up);
class EGVAR(wardrobe,base_H_visor_down);

class CfgWeapons
{
    #include "Helmets.hpp"
    #include "Uniforms.hpp"


    // Cap (Ion) Forward and Reversed
    class lxWS_H_CapB_rvs_blk;
    class lxWS_H_CapB_rvs_blk_ION: lxWS_H_CapB_rvs_blk       { class PVAR(wardrobe) : EGVAR(wardrobe,base) { modifiableTo[] = { "H_Cap_headphones_ion_lxws" }; }; };
    class H_Cap_headphones_ion_lxws: lxWS_H_CapB_rvs_blk_ION { class PVAR(wardrobe) : EGVAR(wardrobe,base) { modifiableTo[] = { "lxWS_H_CapB_rvs_blk_ION"   }; }; };    
};


