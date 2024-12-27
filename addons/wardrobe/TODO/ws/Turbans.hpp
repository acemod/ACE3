// CfgWeapons

// MACROS
#define CN(version,color) lxWS_H_turban_##version##_##color
#define QCN(version,color) Q(CN(version,color))

#define COLORGROUP(COLOR)\
class CN(01,COLOR): lxWS_H_turban_01_black { class PVAR(wardrobe) : EGVAR(wardrobe,base) { modifiableTo[] = { QCN(02,COLOR), QCN(03,COLOR), QCN(04,COLOR) }; }; };\
class CN(02,COLOR): lxWS_H_turban_02_black { class PVAR(wardrobe) : EGVAR(wardrobe,base) { modifiableTo[] = { QCN(01,COLOR), QCN(03,COLOR), QCN(04,COLOR) }; }; };\
class CN(03,COLOR): lxWS_H_turban_03_black { class PVAR(wardrobe) : EGVAR(wardrobe,base) { modifiableTo[] = { QCN(01,COLOR), QCN(02,COLOR), QCN(04,COLOR) }; }; };\
class CN(04,COLOR): lxWS_H_turban_04_black { class PVAR(wardrobe) : EGVAR(wardrobe,base) { modifiableTo[] = { QCN(01,COLOR), QCN(02,COLOR), QCN(03,COLOR) }; }; };\

#define COLORGROUP_SPECIAL(COLOR)\
class CN(02,COLOR): lxWS_H_turban_02_black { class PVAR(wardrobe) : EGVAR(wardrobe,base) { modifiableTo[] = { QCN(03,COLOR) }; }; };\
class CN(03,COLOR): lxWS_H_turban_03_black { class PVAR(wardrobe) : EGVAR(wardrobe,base) { modifiableTo[] = { QCN(02,COLOR) }; }; };\

// BASECLASS
class H_Shemag_khk;
class lxWS_H_turban_01_black : H_Shemag_khk           { class PVAR(wardrobe) : EGVAR(wardrobe,base) { modifiableTo[] = { QCN(02,black), QCN(03,black), QCN(04,black) }; }; };
class lxWS_H_turban_02_black : lxWS_H_turban_01_black { class PVAR(wardrobe) : EGVAR(wardrobe,base) { modifiableTo[] = { QCN(01,black), QCN(03,black), QCN(04,black) }; }; };
class lxWS_H_turban_03_black : lxWS_H_turban_01_black { class PVAR(wardrobe) : EGVAR(wardrobe,base) { modifiableTo[] = { QCN(01,black), QCN(02,black), QCN(04,black) }; }; };
class lxWS_H_turban_04_black : lxWS_H_turban_01_black { class PVAR(wardrobe) : EGVAR(wardrobe,base) { modifiableTo[] = { QCN(01,black), QCN(02,black), QCN(03,black) }; }; };

// VARIATIONS
COLORGROUP(blue)
COLORGROUP(blue_una)
COLORGROUP(green)
COLORGROUP(red)
COLORGROUP(sand)
COLORGROUP(gray)
COLORGROUP(yellow)

// Special Variations
COLORGROUP_SPECIAL(green_pattern)