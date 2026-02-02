class SubmunitionBase;
class SPE_MAIN_pipebomb;
class SPE_ShellHE_base;
class SPE_ShellHEAT_base;
class SPE_MAIN_mine;
class SPE_Rocket_base;
class SPE_PzFaust_30m: SPE_Rocket_base {
    EGVAR(frag,force) = 1;
    EGVAR(frag,metal) = 150;
    EGVAR(frag,charge) = 400;
    EGVAR(frag,gurney_c) = 2440;
    EGVAR(frag,gurney_k) = 1/2;
    EGVAR(frag,classes)[] = {"ACE_frag_small"};
};
class SPE_60mm_M6: SPE_Rocket_base {
    EGVAR(frag,force) = 1;
    EGVAR(frag,metal) = 250;
    EGVAR(frag,charge) = 400;
    EGVAR(frag,gurney_c) = 2750;
    EGVAR(frag,gurney_k) = 1/2;
    EGVAR(frag,classes)[] = {"ACE_frag_small"};
};
class SPE_Sh_M43A1_81_HE: SubmunitionBase  {
    EGVAR(frag,force) = 1;
    EGVAR(frag,metal) = 1200;
    EGVAR(frag,charge) = 600;
    EGVAR(frag,gurney_c) = 2750;
    EGVAR(frag,gurney_k) = 1/2;
    EGVAR(frag,classes)[] = {"ACE_frag_medium","ACE_frag_small"};
    EGVAR(rearm,caliber) = 82;
};
class SPE_M48_HE: SPE_ShellHE_base {
    EGVAR(frag,force) = 1;
    EGVAR(frag,metal) = 1250;
    EGVAR(frag,charge) = 670;
    EGVAR(frag,gurney_c) = 2750;
    EGVAR(frag,gurney_k) = 1/2;
    EGVAR(frag,classes)[] = {"ACE_frag_medium","ACE_frag_small"};
    EGVAR(rearm,caliber) = 75;
};
class SPE_M101_M1_HE: SPE_ShellHE_base {
    EGVAR(frag,force) = 1;
    EGVAR(frag,metal) = 2500;
    EGVAR(frag,charge) = 1980;
    EGVAR(frag,gurney_c) = 2750;
    EGVAR(frag,gurney_k) = 1/2;
    EGVAR(frag,classes)[] = {"ACE_frag_medium","ACE_frag_large"};
    EGVAR(rearm,caliber) = 105;
};
class SPE_S_105L28_Gr38: SPE_ShellHE_base {
    EGVAR(frag,force) = 1;
    EGVAR(frag,metal) = 2500;
    EGVAR(frag,charge) = 1500;
    EGVAR(frag,gurney_c) = 2750;
    EGVAR(frag,gurney_k) = 1/2;
    EGVAR(frag,classes)[] = {"ACE_frag_medium","ACE_frag_large"};
    EGVAR(rearm,caliber) = 105;
};
class SPE_S_105L28_Gr39HlC: SPE_ShellHEAT_base {
    EGVAR(frag,force) = 1;
    EGVAR(frag,metal) = 2500;
    EGVAR(frag,charge) = 1500;
    EGVAR(frag,gurney_c) = 2750;
    EGVAR(frag,gurney_k) = 1/2;
    EGVAR(frag,classes)[] = {"ACE_frag_medium","ACE_frag_large"};
    EGVAR(rearm,caliber) = 105;
};
class SPE_R_280mm_WkSpr: SubmunitionBase {
    EGVAR(frag,force) = 1;
    EGVAR(frag,metal) = 37000;
    EGVAR(frag,charge) = 50000;
    EGVAR(frag,gurney_c) = 2750;
    EGVAR(frag,gurney_k) = 1/2;
    EGVAR(frag,classes)[] = {"ACE_frag_medium","ACE_frag_large","ACE_frag_huge"};
};
class SPE_US_Bangalore_ammo: SPE_MAIN_pipebomb {
    EGVAR(frag,force) = 1;
    EGVAR(frag,metal) = 1700;
    EGVAR(frag,charge) = 4100;
    EGVAR(frag,gurney_c) = 2440;
    EGVAR(frag,gurney_k) = 3/5;
    EGVAR(frag,classes)[] = {"ACE_frag_medium","ACE_frag_small"};
    EGVAR(explosives,defuseObjectPosition)[] = {0, 0, 0.02};
};
class SPE_Ladung_Big_ammo: SPE_MAIN_pipebomb {
    EGVAR(frag,force) = 1;
    EGVAR(frag,metal) = 500;
    EGVAR(frag,charge) = 1500;
    EGVAR(frag,gurney_c) = 2440;
    EGVAR(frag,gurney_k) = 3/5;
    EGVAR(frag,classes)[] = {"ACE_frag_medium","ACE_frag_small"};
    EGVAR(explosives,defuseObjectPosition)[] = {0, 0, 0.02};
};
class SPE_Ladung_Small_ammo: SPE_MAIN_pipebomb {
    EGVAR(frag,force) = 1;
    EGVAR(frag,metal) = 250;
    EGVAR(frag,charge) = 750;
    EGVAR(frag,gurney_c) = 2440;
    EGVAR(frag,gurney_k) = 3/5;
    EGVAR(frag,classes)[] = {"ACE_frag_medium","ACE_frag_small"};
    EGVAR(explosives,defuseObjectPosition)[] = {0, 0, 0.02};
};
class SPE_US_M1A1_ATMINE_ammo: SPE_MAIN_mine {
    EGVAR(frag,force) = 1;
    EGVAR(frag,metal) = 2100;
    EGVAR(frag,charge) = 2700;
    EGVAR(frag,gurney_c) = 2440;
    EGVAR(frag,gurney_k) = 3/5;
    EGVAR(frag,classes)[] = {"ACE_frag_medium","ACE_frag_small"};
    EGVAR(explosives,defuseObjectPosition)[] = {0, 0, 0.02};
};
class SPE_US_TNT_half_pound_ammo: SPE_MAIN_pipebomb {
    EGVAR(frag,force) = 1;
    EGVAR(frag,metal) = 100;
    EGVAR(frag,charge) = 226;
    EGVAR(frag,gurney_c) = 2440;
    EGVAR(frag,gurney_k) = 3/5;
    EGVAR(frag,classes)[] = {"ACE_frag_small"};
    EGVAR(explosives,defuseObjectPosition)[] = {0, 0, 0.02};
};
class SPE_US_TNT_4pound_ammo: SPE_MAIN_pipebomb {
    EGVAR(frag,force) = 1;
    EGVAR(frag,metal) = 372;
    EGVAR(frag,charge) = 1814;
    EGVAR(frag,gurney_c) = 2440;
    EGVAR(frag,gurney_k) = 3/5;
    EGVAR(frag,classes)[] = {"ACE_frag_medium","ACE_frag_small"};
    EGVAR(explosives,defuseObjectPosition)[] = {0, 0, 0.02};
};
class SPE_US_M3_PRessure_ammo: SPE_MAIN_mine {
    EGVAR(frag,force) = 1;
    EGVAR(frag,metal) = 2267;
    EGVAR(frag,charge) = 454;
    EGVAR(frag,gurney_c) = 2440;
    EGVAR(frag,gurney_k) = 3/5;
    EGVAR(frag,classes)[] = {"ACE_frag_medium","ACE_frag_small"};
    EGVAR(explosives,defuseObjectPosition)[] = {0, 0, 0.02};
};
class SPE_US_M3_ammo: SPE_MAIN_mine {
    EGVAR(frag,force) = 1;
    EGVAR(frag,metal) = 2267;
    EGVAR(frag,charge) = 454;
    EGVAR(frag,gurney_c) = 2440;
    EGVAR(frag,gurney_k) = 3/5;
    EGVAR(frag,classes)[] = {"ACE_frag_medium","ACE_frag_small"};
    EGVAR(explosives,defuseObjectPosition)[] = {0, 0, 0.02};
};
class SPE_shumine42_ammo: SPE_MAIN_mine {
    EGVAR(frag,force) = 1;
    EGVAR(frag,metal) = 300;
    EGVAR(frag,charge) = 200;
    EGVAR(frag,gurney_c) = 2440;
    EGVAR(frag,gurney_k) = 3/5;
    EGVAR(frag,classes)[] = {"ACE_frag_medium","ACE_frag_small"};
    EGVAR(explosives,defuseObjectPosition)[] = {0, 0, 0.02};
};
class SPE_Shg24x7_Improvised_Mine_ammo: SPE_MAIN_mine {
    EGVAR(frag,force) = 1;
    EGVAR(frag,metal) = 525;
    EGVAR(frag,charge) = 1330;
    EGVAR(frag,gurney_c) = 2440;
    EGVAR(frag,gurney_k) = 3/5;
    EGVAR(frag,classes)[] = {"ACE_frag_small_HD"};
};
class SPE_SMI35_Pressure_ammo: SPE_MAIN_mine {
    EGVAR(frag,force) = 1;
    EGVAR(frag,metal) = 2720;
    EGVAR(frag,charge) = 182;
    EGVAR(frag,gurney_c) = 2440;
    EGVAR(frag,gurney_k) = 3/5;
    EGVAR(frag,classes)[] = {"ACE_frag_medium","ACE_frag_small"};
    EGVAR(explosives,defuseObjectPosition)[] = {0, 0, 0.02};
};
class SPE_SMI35_1_ammo: SPE_MAIN_mine {
    EGVAR(frag,force) = 1;
    EGVAR(frag,metal) = 2720;
    EGVAR(frag,charge) = 182;
    EGVAR(frag,gurney_c) = 2440;
    EGVAR(frag,gurney_k) = 3/5;
    EGVAR(frag,classes)[] = {"ACE_frag_medium","ACE_frag_small"};
    EGVAR(explosives,defuseObjectPosition)[] = {0, 0, 0.02};
};
class SPE_SMI35_ammo: SPE_MAIN_mine {
    EGVAR(frag,force) = 1;
    EGVAR(frag,metal) = 2720;
    EGVAR(frag,charge) = 182;
    EGVAR(frag,gurney_c) = 2440;
    EGVAR(frag,gurney_k) = 3/5;
    EGVAR(frag,classes)[] = {"ACE_frag_medium","ACE_frag_small"};
    EGVAR(explosives,defuseObjectPosition)[] = {0, 0, 0.02};
};
class SPE_STMI_ammo: SPE_MAIN_mine {
    EGVAR(frag,force) = 1;
    EGVAR(frag,metal) = 1520;
    EGVAR(frag,charge) = 152;
    EGVAR(frag,gurney_c) = 2440;
    EGVAR(frag,gurney_k) = 3/5;
    EGVAR(frag,classes)[] = {"ACE_frag_medium","ACE_frag_small"};
    EGVAR(explosives,defuseObjectPosition)[] = {0, 0, 0.02};
};
class SPE_TMI42_ammo: SPE_MAIN_mine {
    EGVAR(frag,force) = 1;
    EGVAR(frag,metal) = 2520;
    EGVAR(frag,charge) = 5400;
    EGVAR(frag,gurney_c) = 2440;
    EGVAR(frag,gurney_k) = 3/5;
    EGVAR(frag,classes)[] = {"ACE_frag_medium","ACE_frag_small"};
    EGVAR(explosives,defuseObjectPosition)[] = {0, 0, 0.02};
};
