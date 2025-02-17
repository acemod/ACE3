

class EGVAR(wardrobe,base);

class EGVAR(wardrobe,base_H_visor_up);
class EGVAR(wardrobe,base_H_visor_down);

class EGVAR(wardrobe,base_U_sleeves_up);
class EGVAR(wardrobe,base_U_sleeves_down);

class EGVAR(wardrobe,base_H_goggles_on);
class EGVAR(wardrobe,base_H_goggles_off);



class CfgWeapons {
    // Base Classes
    class H_Booniehat_khk;
    class vn_b_headgear_base;
    class vn_o_headgear_base: H_Booniehat_khk {
        class ItemInfo;
    };


    #include "Helmets.hpp"
    #include "Booniehats.hpp"
    #include "Uniforms_B.hpp"
    #include "Uniforms_O.hpp"
};


class CfgGlasses {
    #include "Facewear.hpp"
};