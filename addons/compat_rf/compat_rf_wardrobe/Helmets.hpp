// CfgWeapons

// Macros
#define CN(color) H_HelmetHeavy_##color##_RF
#define CN_VU(color) H_HelmetHeavy_VisorUp_##color##_RF


#define HELMET_VARIANT(color)\
class CN(color): H_HelmetHeavy_Black_RF            { class PVAR(wardrobe) : EGVAR(wardrobe,base_H_visor_down) { modifiableTo[] = { Q(CN_VU(color)) }; }; };\
class CN_VU(color): H_HelmetHeavy_VisorUp_Black_RF { class PVAR(wardrobe) : EGVAR(wardrobe,base_H_visor_up)   { modifiableTo[] = { Q(CN(color))    }; }; };\


// Base Classes
class H_HelmetAggressor_F;

class H_HelmetHeavy_Black_RF         : H_HelmetAggressor_F    { class PVAR(wardrobe) : EGVAR(wardrobe,base_H_visor_down) { modifiableTo[] = { "H_HelmetHeavy_VisorUp_Black_RF" }; }; };
class H_HelmetHeavy_VisorUp_Black_RF : H_HelmetHeavy_Black_RF { class PVAR(wardrobe) : EGVAR(wardrobe,base_H_visor_up)   { modifiableTo[] = { "H_HelmetHeavy_Black_RF"         }; }; };

// Variants
HELMET_VARIANT(Hex)
HELMET_VARIANT(GHex)
HELMET_VARIANT(Sand)
HELMET_VARIANT(Olive)
HELMET_VARIANT(White)