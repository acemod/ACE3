// CfgWeapons


// Macros
#define CN01(side,var1,var2) vn_##side##_helmet_##var1##_01_##var2
#define CN02(side,var1,var2) vn_##side##_helmet_##var1##_02_##var2


#define HELMET_VARIANT(side,var1,var2)\
class CN01(side,var1,var2) : base_class_up { class PVAR(wardrobe) : EGVAR(wardrobe,base_H_visor_up)   { modifiableTo[] = { Q(CN02(side,var1,var2)) }; }; };\
class CN02(side,var1,var2) : base_class_dn { class PVAR(wardrobe) : EGVAR(wardrobe,base_H_visor_down) { modifiableTo[] = { Q(CN01(side,var1,var2)) }; }; };\


// Base classes in CfgWeapons.hpp

// Parent Version aph6 & svh4
#define base_class_up vn_b_headgear_base
#define base_class_dn vn_b_headgear_base
HELMET_VARIANT(b,aph6,01)
HELMET_VARIANT(b,svh4,01)

// Child Version aph6
#undef base_class_up
#undef base_class_dn
#define base_class_up CN01(b,aph6,01)
#define base_class_dn CN02(b,aph6,01)

HELMET_VARIANT(b,aph6,02)
HELMET_VARIANT(b,aph6,03)
HELMET_VARIANT(b,aph6,04)
HELMET_VARIANT(b,aph6,05)

// Child Version svh4
#undef base_class_up
#undef base_class_dn
#define base_class_up CN01(b,svh4,01)
#define base_class_dn CN02(b,svh4,01)

HELMET_VARIANT(b,svh4,02)
HELMET_VARIANT(b,svh4,03)
HELMET_VARIANT(b,svh4,04)
HELMET_VARIANT(b,svh4,05)
HELMET_VARIANT(b,svh4,06)

// Special Case zsh3
class vn_o_helmet_zsh3_01 :  vn_o_headgear_base  { class PVAR(wardrobe) : EGVAR(wardrobe,base_H_visor_up)   { modifiableTo[] = { Q(vn_o_helmet_zsh3_02) }; }; };
class vn_o_helmet_zsh3_02 :  vn_o_helmet_zsh3_01 { class PVAR(wardrobe) : EGVAR(wardrobe,base_H_visor_down) { modifiableTo[] = { Q(vn_o_helmet_zsh3_01) }; }; };
