// Adjust Mass of Objects for consistency's sake
class CfgWeapons {
    #include "Helmets.hpp"
};

// Actual CfgWardrobe Compat
class ace_wardrobe {
    #include "\z\ace\addons\wardrobe\BaseClasses_Import.hpp"
    
    #include "CfgWardrobe_Helmets.hpp"
    #include "CfgWardrobe_Uniform.hpp"
};