
// Adjust Mass of Objects for consistency's sake
class CfgWeapons {
    // Base Classes
    class H_Booniehat_khk;
    class vn_b_headgear_base;
    class vn_o_headgear_base: H_Booniehat_khk {
        class ItemInfo;
    };
    #include "Helmets.hpp"
    #include "Uniforms_B.hpp"
    // #include "Uniforms_O.hpp" // ToDo
};
class CfgGlasses {
    #include "Facewear.hpp"
};


// Actual CfgWardrobe Compat
class ace_wardrobe {
    #include "\z\ace\addons\wardrobe\BaseClasses_Import.hpp"

    #include "CfgWardrobe_Booniehats.hpp"
    #include "CfgWardrobe_Facewear.hpp"
    #include "CfgWardrobe_Helmets.hpp"

    #include "CfgWardrobe_Uniforms_B.hpp"
    #include "CfgWardrobe_Uniforms_O.hpp"
};
