class SPE_GrenadeHand_base;
class SPE_Grenade_base;

class SPE_US_M15: SPE_GrenadeHand_base {
    ACE_damageType = QGVAR(explosive_incendiary);
};
class SPE_Shg24: SPE_GrenadeHand_base {
    EGVAR(frag,force) = 1;
    EGVAR(frag,metal) = 75;
    EGVAR(frag,charge) = 170;
    EGVAR(frag,gurney_c) = 2440;
    EGVAR(frag,gurney_k) = 1/2;
    EGVAR(frag,classes)[] = {"ACE_frag_tiny_HD"};
};
class SPE_Shg24_Frag: SPE_GrenadeHand_base {
    EGVAR(frag,force) = 1;
    EGVAR(frag,metal) = 250;
    EGVAR(frag,charge) = 190;
    EGVAR(frag,gurney_c) = 2440;
    EGVAR(frag,gurney_k) = 1/2;
    EGVAR(frag,classes)[] = {"ACE_frag_small_HD"};
};
class SPE_Shg24x7: SPE_GrenadeHand_base {
    EGVAR(frag,force) = 1;
    EGVAR(frag,metal) = 525;
    EGVAR(frag,charge) = 1330;
    EGVAR(frag,gurney_c) = 2440;
    EGVAR(frag,gurney_k) = 3/5;
    EGVAR(frag,classes)[] = {"ACE_frag_small_HD"};
};
class SPE_M39: SPE_GrenadeHand_base {
    EGVAR(frag,force) = 1;
    EGVAR(frag,metal) = 200;
    EGVAR(frag,charge) = 112;
    EGVAR(frag,gurney_c) = 2440;
    EGVAR(frag,gurney_k) = 3/5;
    EGVAR(frag,classes)[] = {"ACE_frag_tiny_HD"};
};
class SPE_US_Mk_2: SPE_GrenadeHand_base {
    EGVAR(frag,force) = 1;
    EGVAR(frag,metal) = 400;
    EGVAR(frag,charge) = 56;
    EGVAR(frag,gurney_c) = 2440;
    EGVAR(frag,gurney_k) = 3/5;
    EGVAR(frag,classes)[] = {"ACE_frag_small_HD"};
};
class SPE_US_Mk_3: SPE_GrenadeHand_base {
    EGVAR(frag,force) = 1;
    EGVAR(frag,metal) = 90;
    EGVAR(frag,charge) = 200;
    EGVAR(frag,gurney_c) = 2440;
    EGVAR(frag,gurney_k) = 1/2;
    EGVAR(frag,classes)[] = {"ACE_frag_tiny_HD"};
};
class SPE_G_M9A1: SPE_Grenade_base {
    EGVAR(frag,force) = 1;
    EGVAR(frag,metal) = 200;
    EGVAR(frag,charge) = 113;
    EGVAR(frag,gurney_c) = 2750;
    EGVAR(frag,gurney_k) = 1/2;
    EGVAR(frag,classes)[] = {"ACE_frag_tiny_HD"};
};
class SPE_G_MK2: SPE_Grenade_base {
    EGVAR(frag,force) = 1;
    EGVAR(frag,metal) = 400;
    EGVAR(frag,charge) = 56;
    EGVAR(frag,gurney_c) = 2440;
    EGVAR(frag,gurney_k) = 3/5;
    EGVAR(frag,classes)[] = {"ACE_frag_small_HD"};
};
class SPE_G_PZGR_30: SPE_Grenade_base {
    EGVAR(frag,force) = 1;
    EGVAR(frag,metal) = 120;
    EGVAR(frag,charge) = 50;
    EGVAR(frag,gurney_c) = 2440;
    EGVAR(frag,gurney_k) = 1/2;
    EGVAR(frag,classes)[] = {"ACE_frag_tiny_HD"};
};
class SPE_G_PZGR_40: SPE_Grenade_base {
    EGVAR(frag,force) = 1;
    EGVAR(frag,metal) = 180;
    EGVAR(frag,charge) = 75;
    EGVAR(frag,gurney_c) = 2440;
    EGVAR(frag,gurney_k) = 1/2;
    EGVAR(frag,classes)[] = {"ACE_frag_tiny_HD"};
};
class SPE_G_SPRGR_30_Detonation: SPE_Grenade_base {
    EGVAR(frag,force) = 1;
    EGVAR(frag,metal) = 150;
    EGVAR(frag,charge) = 200;
    EGVAR(frag,gurney_c) = 2440;
    EGVAR(frag,gurney_k) = 1/2;
    EGVAR(frag,classes)[] = {"ACE_frag_small_HD"};
};

class SPE_SmokeShell_base;
class SPE_US_AN_M14: SPE_SmokeShell_base {
    EGVAR(grenades,incendiary) = 1;
};
class SPE_US_Mk_1: SPE_SmokeShell_base {
    EGVAR(frag,enabled) = 0;
};
