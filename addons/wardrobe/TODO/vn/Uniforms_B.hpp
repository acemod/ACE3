// CfgWeapons

class vn_b_uniform_base;

// Macros


#define UNIFORM_BASE_B(class1,class2)\
class class1: vn_b_uniform_base { class PVAR(wardrobe) : EGVAR(wardrobe,base_U_sleeves_down) { modifiableTo[] = { Q(class2) }; }; };\
class class2: vn_b_uniform_base { class PVAR(wardrobe) : EGVAR(wardrobe,base_U_sleeves_up) { modifiableTo[] = { Q(class1) }; }; };\

#define B_U(div,var,camo) vn_b_uniform_##div##_##var##_##camo

#define B_U_PAIR(div,down,up,camo) UNIFORM_BASE_B(B_U(div,down,camo),B_U(div,up,camo))


// Simple Variants
// ACZAC
UNIFORM_BASE_B(vn_b_uniform_aus_01_01,vn_b_uniform_aus_02_01)
UNIFORM_BASE_B(vn_b_uniform_aus_03_01,vn_b_uniform_aus_04_01)
UNIFORM_BASE_B(vn_b_uniform_aus_05_01,vn_b_uniform_aus_06_01)
UNIFORM_BASE_B(vn_b_uniform_aus_07_01,vn_b_uniform_aus_08_01)
UNIFORM_BASE_B(vn_b_uniform_aus_09_01,vn_b_uniform_aus_10_01)

// NZ
UNIFORM_BASE_B(vn_b_uniform_NZ_01_01,vn_b_uniform_NZ_02_01)
UNIFORM_BASE_B(vn_b_uniform_NZ_03_01,vn_b_uniform_NZ_04_01)
UNIFORM_BASE_B(vn_b_uniform_NZ_05_01,vn_b_uniform_NZ_06_01)

// SEAL STUFF
UNIFORM_BASE_B(vn_b_uniform_seal_01_01,vn_b_uniform_seal_02_01)
UNIFORM_BASE_B(vn_b_uniform_seal_01_02,vn_b_uniform_seal_02_02)
UNIFORM_BASE_B(vn_b_uniform_seal_01_05,vn_b_uniform_seal_02_05)
UNIFORM_BASE_B(vn_b_uniform_seal_01_06,vn_b_uniform_seal_02_06)
UNIFORM_BASE_B(vn_b_uniform_seal_01_07,vn_b_uniform_seal_02_07)

// MACV
#define OLIVE_FIELD 01
#define TIGER 02
#define TIGER_GREEN 05
#define ERDL_BROWN 06
#define OLIVE 07
#define LEOPARD 08
#define ERDL 15
#define LIZARD 16
#define BDQ 17
#define FROG 18

// macv 05 and 04 have inconsistency between them -> different uniform maxLoad. This likely will cause the player to loose items when the uniform is filled to the brim. Difference is 1lb which translates to 16~17x ace bandages or 1x 1l blood
#define B_U_PAIR_SET(camo)\
B_U_PAIR(macv,02,03,camo)\
B_U_PAIR(macv,05,04,camo)\

B_U_PAIR_SET(TIGER)
B_U_PAIR_SET(TIGER_GREEN)
B_U_PAIR_SET(ERDL)
B_U_PAIR_SET(ERDL_BROWN)
B_U_PAIR_SET(OLIVE)
B_U_PAIR_SET(OLIVE_FIELD)
B_U_PAIR_SET(LEOPARD)
B_U_PAIR_SET(LIZARD)
B_U_PAIR_SET(BDQ)
B_U_PAIR_SET(FROG)
