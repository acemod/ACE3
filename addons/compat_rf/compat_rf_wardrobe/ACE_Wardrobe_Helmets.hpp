//// Helmets
// Macros
#define CN(color) H_HelmetHeavy_##color##_RF
#define CN_VU(color) H_HelmetHeavy_VisorUp_##color##_RF

#define HELMET_VARIANT(color)\
HELMET_VISOR(CN_VU(color),CN(color))

HELMET_VISOR(H_HelmetHeavy_VisorUp_Black_RF,H_HelmetHeavy_Black_RF);

// Variants
HELMET_VARIANT(Hex);
HELMET_VARIANT(GHex);
HELMET_VARIANT(Sand);
HELMET_VARIANT(Olive);
HELMET_VARIANT(White);

// Cap (Ion) Forward and Reversed
BASE_PAIR(lxWS_H_CapB_rvs_blk_ION,H_Cap_headphones_ion_lxws);
