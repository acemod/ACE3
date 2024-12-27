// CfgWeapons

// Base Classes
class gm_ge_headgear_psh77_cover_down_base;
class gm_ge_headgear_psh77_cover_up_base;
class gm_ge_headgear_psh77_down_base;
class gm_ge_headgear_psh77_up_base;

class gm_ge_bgs_headgear_psh77_cover_down_smp : gm_ge_headgear_psh77_cover_down_base { class PVAR(wardrobe) : EGVAR(wardrobe,base_H_visor_down) { modifiableTo[] = { "gm_ge_bgs_headgear_psh77_cover_up_smp"   }; }; };
class gm_ge_bgs_headgear_psh77_cover_up_smp   : gm_ge_headgear_psh77_cover_up_base   { class PVAR(wardrobe) : EGVAR(wardrobe,base_H_visor_up)   { modifiableTo[] = { "gm_ge_bgs_headgear_psh77_cover_down_smp" }; }; };
class gm_ge_bgs_headgear_psh77_cover_down_str : gm_ge_headgear_psh77_cover_down_base { class PVAR(wardrobe) : EGVAR(wardrobe,base_H_visor_down) { modifiableTo[] = { "gm_ge_bgs_headgear_psh77_cover_up_str"   }; }; };
class gm_ge_bgs_headgear_psh77_cover_up_str   : gm_ge_headgear_psh77_cover_up_base   { class PVAR(wardrobe) : EGVAR(wardrobe,base_H_visor_up)   { modifiableTo[] = { "gm_ge_bgs_headgear_psh77_cover_down_str" }; }; };
class gm_ge_headgear_psh77_down_oli           : gm_ge_headgear_psh77_down_base       { class PVAR(wardrobe) : EGVAR(wardrobe,base_H_visor_down) { modifiableTo[] = { "gm_ge_headgear_psh77_up_oli"             }; }; };
class gm_ge_headgear_psh77_up_oli             : gm_ge_headgear_psh77_up_base         { class PVAR(wardrobe) : EGVAR(wardrobe,base_H_visor_up)   { modifiableTo[] = { "gm_ge_headgear_psh77_down_oli"           }; }; };