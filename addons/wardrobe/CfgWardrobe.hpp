
/*
class CfgGlasses {
    #include "Facewear.hpp"
};
*/

// The new way :sigh:

class ADDON {
    #include "BaseClasses.hpp"
    #include "Uniforms.hpp"

    // Balaclava, black
    class G_Balaclava_blk: EGVAR(wardrobe,base) {
        class modifiableTo {
            class G_Balaclava_lowprofile;
            class G_Balaclava_combat;
        };
        components[] = { "G_Balaclava_blk" };
    };
    class G_Balaclava_combat: EGVAR(wardrobe,base) {
        class modifiableTo {
            class G_Balaclava_blk;
        };
        components[] = {"G_Balaclava_blk", "G_Combat"};
    };
    class G_Balaclava_lowprofile: EGVAR(wardrobe,base) {
        class modifiableTo {
            class G_Balaclava_blk;
        };
        components[] = { "G_Balaclava_blk", "G_Lowprofile" };
    };
};
