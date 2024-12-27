// CfgWeapons
class Uniform_Base;

// Macros
#define UNIFORM_BASE(class1,class2)\
class class1: Uniform_Base { class PVAR(wardrobe) : EGVAR(wardrobe,base_U_sleeves_down) { modifiableTo[] = { Q(class2) }; }; };\
class class2: Uniform_Base { class PVAR(wardrobe) : EGVAR(wardrobe,base_U_sleeves_up) { modifiableTo[] = { Q(class1) }; }; };\


// Vanilla CTRG Uniform
UNIFORM_BASE(U_B_CTRG_1,U_B_CTRG_3)

// AAF Fatigues
UNIFORM_BASE(U_I_CombatUniform,U_I_CombatUniform_shortsleeve)

// APEX CTRG Uniforms
UNIFORM_BASE(U_B_CTRG_Soldier_F,U_B_CTRG_Soldier_3_F)
UNIFORM_BASE(U_B_CTRG_Soldier_Arid_F,U_B_CTRG_Soldier_3_Arid_F)
UNIFORM_BASE(U_B_CTRG_Soldier_urb_1_F,U_B_CTRG_Soldier_urb_3_F)

// Contact - LDF Fatigues
UNIFORM_BASE(U_I_E_Uniform_01_F,U_I_E_Uniform_01_shortsleeve_F)

