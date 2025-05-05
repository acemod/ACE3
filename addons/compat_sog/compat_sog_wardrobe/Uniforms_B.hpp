class Uniform_Base;
class vn_b_uniform_base: Uniform_Base {
    class ItemInfo;
};

// Macros
#define ITEMINFO_FIX()\
class ItemInfo: ItemInfo {\
    containerClass = "Supply70";\
    mass = 70;\
}

#define UNIFORM_BASE_B_ITEMINFO_FIX(class2)\
class class2: vn_b_uniform_base {\
    ITEMINFO_FIX();\
}

#define B_U(div,var,camo) vn_b_uniform_##div##_##var##_##camo
#define B_U_PAIR_FIX(div,up,camo) UNIFORM_BASE_B_ITEMINFO_FIX(B_U(div,up,camo))

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
B_U_PAIR_FIX(macv,04,camo)

B_U_PAIR_SET(OLIVE_FIELD);
B_U_PAIR_SET(TIGER);
B_U_PAIR_SET(TIGER_GREEN);
B_U_PAIR_SET(ERDL_BROWN);
B_U_PAIR_SET(OLIVE);
B_U_PAIR_SET(LEOPARD);
B_U_PAIR_SET(ERDL);
B_U_PAIR_SET(LIZARD);
B_U_PAIR_SET(BDQ);
B_U_PAIR_SET(FROG);
