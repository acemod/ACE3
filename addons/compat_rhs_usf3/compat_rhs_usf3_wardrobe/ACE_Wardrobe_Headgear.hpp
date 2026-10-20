// Components
class rhs_ess_black: EGVAR(wardrobe,base) {
    fallbackComponent = "G_Combat";
};


//Pilot Helmets with Visors
HELMET_VISOR(rhsusf_hgu56p,rhsusf_hgu56p_visor);
HELMET_VISOR(rhsusf_hgu56p_mask,rhsusf_hgu56p_visor_mask);
HELMET_VISOR(rhsusf_hgu56p_mask_mo,rhsusf_hgu56p_visor_mask_mo);
HELMET_VISOR(rhsusf_hgu56p_mask_skull,rhsusf_hgu56p_visor_mask_skull);

HELMET_VISOR(rhsusf_hgu56p_black,rhsusf_hgu56p_visor_black);
HELMET_VISOR(rhsusf_hgu56p_mask_black,rhsusf_hgu56p_visor_mask_black);
// HELMET_VISOR(rhsusf_hgu56p_mask_Empire_black,rhsusf_hgu56p_visor_mask_Empire_black);
HELMET_VISOR(rhsusf_hgu56p_mask_black_skull,rhsusf_hgu56p_visor_mask_black_skull);

HELMET_VISOR(rhsusf_hgu56p_green,rhsusf_hgu56p_visor_green);
HELMET_VISOR(rhsusf_hgu56p_mask_green,rhsusf_hgu56p_visor_mask_green);
HELMET_VISOR(rhsusf_hgu56p_mask_green_mo,rhsusf_hgu56p_visor_mask_green_mo);

HELMET_VISOR(rhsusf_hgu56p_mask_smiley,rhsusf_hgu56p_visor_mask_smiley);

HELMET_VISOR(rhsusf_hgu56p_tan,rhsusf_hgu56p_visor_tan);
HELMET_VISOR(rhsusf_hgu56p_mask_tan,rhsusf_hgu56p_visor_mask_tan);

HELMET_VISOR(rhsusf_hgu56p_pink,rhsusf_hgu56p_visor_pink);
HELMET_VISOR(rhsusf_hgu56p_mask_pink,rhsusf_hgu56p_visor_mask_pink);

HELMET_VISOR(rhsusf_hgu56p_saf,rhsusf_hgu56p_visor_saf);
HELMET_VISOR(rhsusf_hgu56p_mask_saf,rhsusf_hgu56p_visor_mask_saf);

HELMET_VISOR(rhsusf_hgu56p_white,rhsusf_hgu56p_visor_white);

HELMET_VISOR(rhsusf_hgu56p_usa,rhsusf_hgu56p_visor_usa);


// Helmet with Netting
class rhsusf_ach_helmet_ocp: EGVAR(wardrobe,base) {
  class modifiableTo { class rhsusf_ach_helmet_ESS_ocp {}; class rhsusf_ach_helmet_camo_ocp {}; };
  components[] = {};
};
class rhsusf_ach_helmet_camo_ocp: EGVAR(wardrobe,base) {
  class modifiableTo { class rhsusf_ach_helmet_ocp {}; };
  components[] = {};
};


//Combat Helmets with Goggles
HELMET_GOGGLES(rhsusf_ach_bare_tan_ess,rhsusf_ach_bare_tan,rhs_ess_black);
HELMET_GOGGLES(rhsusf_ach_bare_tan_headset_ess,rhsusf_ach_bare_tan_headset,rhs_ess_black);

HELMET_GOGGLES(rhsusf_ach_bare_des_ess,rhsusf_ach_bare_des,rhs_ess_black);
HELMET_GOGGLES(rhsusf_ach_bare_des_headset_ess,rhsusf_ach_bare_des_headset,rhs_ess_black);

HELMET_GOGGLES(rhsusf_ach_bare_ess,rhsusf_ach_bare,rhs_ess_black);
HELMET_GOGGLES(rhsusf_ach_bare_headset_ess,rhsusf_ach_bare_headset,rhs_ess_black);

HELMET_GOGGLES(rhsusf_ach_bare_semi_ess,rhsusf_ach_bare_semi,rhs_ess_black);
HELMET_GOGGLES(rhsusf_ach_bare_semi_headset_ess,rhsusf_ach_bare_semi_headset,rhs_ess_black);

HELMET_GOGGLES(rhsusf_ach_bare_wood_ess,rhsusf_ach_bare_wood,rhs_ess_black);
HELMET_GOGGLES(rhsusf_ach_bare_wood_headset_ess,rhsusf_ach_bare_wood_headset,rhs_ess_black);

HELMET_GOGGLES(rhsusf_cvc_ess,rhsusf_cvc_alt_helmet,rhs_ess_black);
HELMET_GOGGLES(rhsusf_cvc_green_ess,rhsusf_cvc_green_alt_helmet,rhs_ess_black);

HELMET_GOGGLES(rhsusf_lwh_helmet_marpatd_ess,rhsusf_lwh_helmet_marpatd,rhs_ess_black);

HELMET_GOGGLES(rhsusf_lwh_helmet_marpatwd_blk_ess,rhsusf_lwh_helmet_marpatwd,rhs_ess_black);
HELMET_GOGGLES(rhsusf_lwh_helmet_marpatwd_headset_blk,rhsusf_lwh_helmet_marpatwd_headset_blk2,rhs_ess_black);

HELMET_GOGGLES(rhsusf_protech_helmet_ess,rhsusf_protech_helmet,rhs_ess_black);
HELMET_GOGGLES(rhsusf_protech_helmet_rhino_ess,rhsusf_protech_helmet_rhino,rhs_ess_black);
