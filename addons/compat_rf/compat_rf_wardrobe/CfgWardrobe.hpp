class EGVAR(wardrobe,base);
class EGVAR(wardrobe,base_U_sleeves_up);
class EGVAR(wardrobe,base_U_sleeves_down);
class EGVAR(wardrobe,base_U_jacket_open);
class EGVAR(wardrobe,base_U_jacket_closed);
class EGVAR(wardrobe,base_H_visor_up);
class EGVAR(wardrobe,base_H_visor_down);

class CfgWeapons
{
    //// Helmets
    // Macros
    #define CN(color) H_HelmetHeavy_##color##_RF
    #define CN_VU(color) H_HelmetHeavy_VisorUp_##color##_RF

    #define HELMET_VARIANT(color)\
    class CN(color): H_HelmetHeavy_Black_RF {\
        class ace_wardrobe: EGVAR(wardrobe,base_H_visor_down) {\
            modifiableTo[] = { QUOTE(CN_VU(color)) };\
        };\
    };\
    class CN_VU(color): H_HelmetHeavy_VisorUp_Black_RF {\
        class ace_wardrobe: EGVAR(wardrobe,base_H_visor_up){\
            modifiableTo[] = { QUOTE(CN(color)) };\
        };\
    }
    
    // Base Classes
    class H_HelmetAggressor_F;

    class H_HelmetHeavy_Black_RF: H_HelmetAggressor_F {
        class ace_wardrobe: EGVAR(wardrobe,base_H_visor_down) {
            modifiableTo[] = { "H_HelmetHeavy_VisorUp_Black_RF" };
        };
    };
    class H_HelmetHeavy_VisorUp_Black_RF: H_HelmetHeavy_Black_RF {
        class ace_wardrobe: EGVAR(wardrobe,base_H_visor_up){
            modifiableTo[] = { "H_HelmetHeavy_Black_RF" };
        };
    };
    // Variants
    HELMET_VARIANT(Hex);
    HELMET_VARIANT(GHex);
    HELMET_VARIANT(Sand);
    HELMET_VARIANT(Olive);
    HELMET_VARIANT(White);
    
    //// Uniforms
    class Uniform_Base;

    // Macros
    #define UNIFORM_BASE(class1,class2)\
    class class1: Uniform_Base {\
        class ace_wardrobe: EGVAR(wardrobe,base_U_sleeves_down) {\
            modifiableTo[] = { QUOTE(class2) };\
        };\
    };\
    class class2: Uniform_Base {\
        class ace_wardrobe: EGVAR(wardrobe,base_U_sleeves_up) {\
            modifiableTo[] = { QUOTE(class1) };\
        };\
    }

    // Sleeves up/down
    UNIFORM_BASE(U_C_FirefighterFatigues_RF,U_C_FirefighterFatigues_RolledUp_RF);
    UNIFORM_BASE(U_BG_Guerrilla_6_1,U_BG_Guerrilla_RF);


    // Pilot Jackets
    class U_C_PilotJacket_black_RF: Uniform_Base {
        class ace_wardrobe: EGVAR(wardrobe,base_U_jacket_closed) {
            modifiableTo[] = { "U_C_PilotJacket_open_black_RF" };
        };
    };
    class U_C_PilotJacket_open_black_RF: U_C_PilotJacket_black_RF {
        class ace_wardrobe: EGVAR(wardrobe,base_U_jacket_open) {
            modifiableTo[] = { "U_C_PilotJacket_black_RF" };
        };
    };

    class U_C_PilotJacket_brown_RF: U_C_PilotJacket_black_RF {
        class ace_wardrobe: EGVAR(wardrobe,base_U_jacket_closed) {
            modifiableTo[] = { "U_C_PilotJacket_open_brown_RF" };
        };
    };
    class U_C_PilotJacket_open_brown_RF: U_C_PilotJacket_brown_RF {
        class ace_wardrobe: EGVAR(wardrobe,base_U_jacket_open) {
            modifiableTo[] = { "U_C_PilotJacket_brown_RF" };
        };
    };

    class U_C_PilotJacket_lbrown_RF: U_C_PilotJacket_black_RF  {
        class ace_wardrobe: EGVAR(wardrobe,base_U_jacket_closed) {
            modifiableTo[] = { "U_C_PilotJacket_open_lbrown_RF" };
        };
    };
    class U_C_PilotJacket_open_lbrown_RF: U_C_PilotJacket_lbrown_RF {
        class ace_wardrobe: EGVAR(wardrobe,base_U_jacket_open) {
            modifiableTo[] = { "U_C_PilotJacket_lbrown_RF" };
        };
    };


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
};
