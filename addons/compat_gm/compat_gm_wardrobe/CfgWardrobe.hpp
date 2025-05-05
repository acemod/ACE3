// Import Base Classes
class EGVAR(wardrobe,base);

class EGVAR(wardrobe,base_H_visor_up);
class EGVAR(wardrobe,base_H_visor_down);

class EGVAR(wardrobe,base_U_sleeves_up);
class EGVAR(wardrobe,base_U_sleeves_down);

class EGVAR(wardrobe,base_U_gloves_on);
class EGVAR(wardrobe,base_U_gloves_off);

class EGVAR(wardrobe,base_H_goggles_on);
class EGVAR(wardrobe,base_H_goggles_off);

// Adjust Mass of Objects for consistency's sake
class CfgWeapons {
    #include "Helmets.hpp"
};

// Actual CfgWardrobe Compat
class ace_wardrobe {
  #include "CfgWardrobe_Helmets.hpp"
  #include "CfgWardrobe_Uniform.hpp"
};