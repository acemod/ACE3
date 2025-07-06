class SPE_Shell_base;
// Panzer III J, L, M HE
class SPE_50mm_SprGr38_HE: SPE_ShellHE_base {
    EGVAR(frag,enabled) = 1;
    EGVAR(frag,force) = 1;
    EGVAR(frag,metal) = 1820;
    EGVAR(frag,charge) = 217;
    EGVAR(frag,gurney_c) = 2930;
    EGVAR(frag,gurney_k) = 1/2;
    EGVAR(frag,classes)[] = {"ACE_frag_medium", "ACE_frag_small_HD"};
};

// Panzer III J, L, M APHE
class SPE_50mm_PzGr39_AP: SPE_Shell_base {
    EGVAR(frag,enabled) = 1;
    EGVAR(frag,force) = 1;
    EGVAR(frag,metal) = 2050;
    EGVAR(frag,charge) = 29;
    EGVAR(frag,gurney_c) = 2930;
    EGVAR(frag,gurney_k) = 1/2;
    EGVAR(frag,classes)[] = {"ACE_frag_medium", "ACE_frag_small_HD"};
};
// Panzer III N HE
class SPE_SprGr34_K51_HE: SPE_ShellHE_base {
    EGVAR(frag,enabled) = 1;
    EGVAR(frag,force) = 1;
    EGVAR(frag,metal) = 5740;
    EGVAR(frag,charge) = 686;
    EGVAR(frag,gurney_c) = 2930;
    EGVAR(frag,gurney_k) = 1/2;
    EGVAR(frag,classes)[] = {"ACE_frag_medium", "ACE_frag_medium_HD"};
};

// Panzer III N AP
class SPE_KGrRotPz_K51_AP: SPE_Shell_base {
    EGVAR(frag,enabled) = 1;
    EGVAR(frag,force) = 1;
    EGVAR(frag,metal) = 6800;
    EGVAR(frag,charge) = 103;
    EGVAR(frag,gurney_c) = 2930;
    EGVAR(frag,gurney_k) = 1/2;
    EGVAR(frag,classes)[] = {"ACE_frag_medium", "ACE_frag_medium_HD"};
};

// Panzer III N HEAT
class SPE_HLGr38c_K51_HEAT: SPE_ShellHEAT_base {
    EGVAR(frag,enabled) = 1;
    EGVAR(frag,force) = 1;
    EGVAR(frag,metal) = 4800;
    EGVAR(frag,charge) = 876;
    EGVAR(frag,gurney_c) = 2930;
    EGVAR(frag,gurney_k) = 1/2;
    EGVAR(frag,classes)[] = {"ACE_frag_medium", "ACE_frag_medium_HD"};
};

// Panzer IV, StuG III G HE
class SPE_SprGr34_KWK40_HE: SPE_ShellHE_base {
    EGVAR(frag,enabled) = 1;
    EGVAR(frag,force) = 1;
    EGVAR(frag,metal) = 5740;
    EGVAR(frag,charge) = 686;
    EGVAR(frag,gurney_c) = 2930;
    EGVAR(frag,gurney_k) = 1/2;
    EGVAR(frag,classes)[] = {"ACE_frag_medium", "ACE_frag_medium_HD"};
};

// Panzer IV G AP
class SPE_PzGr39_KWK40_AP: SPE_Shell_base {
    EGVAR(frag,enabled) = 1;
    EGVAR(frag,force) = 1;
    EGVAR(frag,metal) = 6800;
    EGVAR(frag,charge) = 29;
    EGVAR(frag,gurney_c) = 2930;
    EGVAR(frag,gurney_k) = 1/2;
    EGVAR(frag,classes)[] = {"ACE_frag_medium", "ACE_frag_medium_HD"};
};

// Panzer V HE
class SPE_SprGr42_KwK42_HE: SPE_ShellHE_base {
    EGVAR(frag,enabled) = 1;
    EGVAR(frag,force) = 1;
    EGVAR(frag,metal) = 5740;
    EGVAR(frag,charge) = 725;
    EGVAR(frag,gurney_c) = 2930;
    EGVAR(frag,gurney_k) = 1/2;
    EGVAR(frag,classes)[] = {"ACE_frag_medium", "ACE_frag_medium_HD"};
};

// Panzer V AP
class SPE_PzGr3942_KwK42_AP: SPE_Shell_base {
    EGVAR(frag,enabled) = 1;
    EGVAR(frag,force) = 1;
    EGVAR(frag,metal) = 6800;
    EGVAR(frag,charge) = 29;
    EGVAR(frag,gurney_c) = 2930;
    EGVAR(frag,gurney_k) = 1/2;
    EGVAR(frag,classes)[] = {"ACE_frag_medium", "ACE_frag_medium_HD"};
};

// Panzer VI HE
class SPE_SprGr_KwK36_HE: SPE_ShellHE_base {
    EGVAR(frag,enabled) = 1;
    EGVAR(frag,force) = 1;
    EGVAR(frag,metal) = 9000;
    EGVAR(frag,charge) = 900;
    EGVAR(frag,gurney_c) = 2930;
    EGVAR(frag,gurney_k) = 1/2;
    EGVAR(frag,classes)[] = {"ACE_frag_large", "ACE_frag_large_HD"};
};

// Panzer VI AP
class SPE_PzGr39_KwK36_AP: SPE_Shell_base {
    EGVAR(frag,enabled) = 1;
    EGVAR(frag,force) = 1;
    EGVAR(frag,metal) = 10200;
    EGVAR(frag,charge) = 109;
    EGVAR(frag,gurney_c) = 2930;
    EGVAR(frag,gurney_k) = 1/2;
    EGVAR(frag,classes)[] = {"ACE_frag_large", "ACE_frag_large_HD"};
};

// StuH 42 HE
class SPE_105mm_StuH42_Gr38_HE: SPE_ShellHE_base {
    EGVAR(frag,enabled) = 1;
    EGVAR(frag,force) = 1;
    EGVAR(frag,metal) = 14810;
    EGVAR(frag,charge) = 2530;
    EGVAR(frag,gurney_c) = 2930;
    EGVAR(frag,gurney_k) = 1/2;
    EGVAR(frag,classes)[] = {"ACE_frag_large", "ACE_frag_large_HD"};
};
// StuH 42 AP
class SPE_105mm_Stuh42_PzGrRot_AP: SPE_Shell_base {
    EGVAR(frag,enabled) = 1;
    EGVAR(frag,force) = 1;
    EGVAR(frag,metal) = 14000;
    EGVAR(frag,charge) = 305;
    EGVAR(frag,gurney_c) = 2930;
    EGVAR(frag,gurney_k) = 1/2;
    EGVAR(frag,classes)[] = {"ACE_frag_large", "ACE_frag_large_HD"};
};

// StuH 42 HEAT
class SPE_105mm_StuH42_Gr39HlC_HEAT: SPE_ShellHEAT_base {
    EGVAR(frag,enabled) = 1;
    EGVAR(frag,force) = 1;
    EGVAR(frag,metal) = 12350;
    EGVAR(frag,charge) = 2530;
    EGVAR(frag,gurney_c) = 2930;
    EGVAR(frag,gurney_k) = 1/2;
    EGVAR(frag,classes)[] = {"ACE_frag_large", "ACE_frag_large_HD"};
};

// Nashorn HE
class SPE_SprGr39_HE: SPE_ShellHE_base {
    EGVAR(frag,enabled) = 1;
    EGVAR(frag,force) = 1;
    EGVAR(frag,metal) = 9400;
    EGVAR(frag,charge) = 1000;
    EGVAR(frag,gurney_c) = 2930;
    EGVAR(frag,gurney_k) = 1/2;
    EGVAR(frag,classes)[] = {"ACE_frag_large", "ACE_frag_large_HD"};
};

// Nashorn AP
class SPE_PzGr43_AP: SPE_Shell_base {
    EGVAR(frag,enabled) = 1;
    EGVAR(frag,force) = 1;
    EGVAR(frag,metal) = 10160;
    EGVAR(frag,charge) = 109;
    EGVAR(frag,gurney_c) = 2930;
    EGVAR(frag,gurney_k) = 1/2;
    EGVAR(frag,classes)[] = {"ACE_frag_large", "ACE_frag_large_HD"};
};

// M10 HE
class SPE_76mm_M7_M42_HE: SPE_ShellHE_base {
    EGVAR(frag,enabled) = 1;
    EGVAR(frag,force) = 1;
    EGVAR(frag,metal) = 5840;
    EGVAR(frag,charge) = 390;
    EGVAR(frag,gurney_c) = 2440;
    EGVAR(frag,gurney_k) = 1/2;
    EGVAR(frag,classes)[] = {"ACE_frag_medium", "ACE_frag_medium_HD"};
};

// M10 AP
class SPE_76mm_M7_M62_APHE: SPE_Shell_base {
    EGVAR(frag,enabled) = 1;
    EGVAR(frag,force) = 1;
    EGVAR(frag,metal) = 7000;
    EGVAR(frag,charge) = 64;
    EGVAR(frag,gurney_c) = 2440;
    EGVAR(frag,gurney_k) = 1/2;
    EGVAR(frag,classes)[] = {"ACE_frag_medium", "ACE_frag_medium_HD"};
};

// M18 HE
class SPE_76mm_M1_HC_M42_HE: SPE_76mm_M7_M42_HE {
    EGVAR(frag,enabled) = 1;
    EGVAR(frag,force) = 1;
    EGVAR(frag,metal) = 5840;
    EGVAR(frag,charge) = 390;
    EGVAR(frag,gurney_c) = 2440;
    EGVAR(frag,gurney_k) = 1/2;
    EGVAR(frag,classes)[] = {"ACE_frag_medium", "ACE_frag_medium_HD"};
};

// M18 and Sherman 76 AP
class SPE_76mm_M1_M62_APHE: SPE_76mm_M7_M62_APHE {
    EGVAR(frag,enabled) = 1;
    EGVAR(frag,force) = 1;
    EGVAR(frag,metal) = 7000;
    EGVAR(frag,charge) = 64;
    EGVAR(frag,gurney_c) = 2440;
    EGVAR(frag,gurney_k) = 1/2;
    EGVAR(frag,classes)[] = {"ACE_frag_medium", "ACE_frag_medium_HD"};
};

// M4 Sherman 76 HE
class SPE_76mm_M1_M42_HE: SPE_76mm_M7_M42_HE {
    EGVAR(frag,enabled) = 1;
    EGVAR(frag,force) = 1;
    EGVAR(frag,metal) = 5840;
    EGVAR(frag,charge) = 390;
    EGVAR(frag,gurney_c) = 2440;
    EGVAR(frag,gurney_k) = 1/2;
    EGVAR(frag,classes)[] = {"ACE_frag_medium","ACE_frag_medium_HD"};
};

//M4 Sherman 75 AP
class SPE_M61_M1_AP: SPE_Shell_base {
    EGVAR(frag,enabled) = 1;
    EGVAR(frag,force) = 1;
    EGVAR(frag,metal) = 6790;
    EGVAR(frag,charge) = 64;
    EGVAR(frag,gurney_c) = 2440;
    EGVAR(frag,gurney_k) = 1/2;
    EGVAR(frag,classes)[] = {"ACE_frag_medium", "ACE_frag_medium_HD"};
};

// M4 Sherman 105 HEAT
class SPE_M101_M67_HEAT: SPE_ShellHEAT_base {
    EGVAR(frag,enabled) = 1;
    EGVAR(frag,force) = 1;
    EGVAR(frag,metal) = 13140;
    EGVAR(frag,charge) = 1610;
    EGVAR(frag,gurney_c) = 2750;
    EGVAR(frag,gurney_k) = 1/2;
    EGVAR(frag,classes)[] = {"ACE_frag_medium","ACE_frag_large"};
};

// M1 57mm AT gun HE
class SPE_6pdr_mk10T_HE: SPE_ShellHE_base {
    EGVAR(frag,enabled) = 1;
    EGVAR(frag,force) = 1;
    EGVAR(frag,metal) = 2720;
    EGVAR(frag,charge) = 590;
    EGVAR(frag,gurney_c) = 2440;
    EGVAR(frag,gurney_k) = 1/2;
    EGVAR(frag,classes)[] = {"ACE_frag_medium", "ACE_frag_small_HD"};
};

// M1 57mm AT gun AP
class SPE_57mm_M86_APCBC: SPE_Shell_base {
    EGVAR(frag,enabled) = 1;
    EGVAR(frag,force) = 1;
    EGVAR(frag,metal) = 3290;
    EGVAR(frag,charge) = 41;
    EGVAR(frag,gurney_c) = 2440;
    EGVAR(frag,gurney_k) = 1/2;
    EGVAR(frag,classes)[] = {"ACE_frag_medium", "ACE_frag_small_HD"};
};

// M3 Howitzer HE
class SPE_M3_M1_HE: SPE_ShellHE_base {
    EGVAR(frag,enabled) = 1;
    EGVAR(frag,force) = 1;
    EGVAR(frag,metal) = 18350;
    EGVAR(frag,charge) = 2180;
    EGVAR(frag,gurney_c) = 2750;
    EGVAR(frag,gurney_k) = 1/2;
    EGVAR(frag,classes)[] = {"ACE_frag_medium","ACE_frag_large"};
};

// M3 Howitzer HEAT
class SPE_M3_M67_HEAT: SPE_ShellHEAT_base {
    EGVAR(frag,enabled) = 1;
    EGVAR(frag,force) = 1;
    EGVAR(frag,metal) = 16620;
    EGVAR(frag,charge) = 2180;
    EGVAR(frag,gurney_c) = 2750;
    EGVAR(frag,gurney_k) = 1/2;
    EGVAR(frag,classes)[] = {"ACE_frag_medium","ACE_frag_large"};
};

// M8 Greyhound HE
class SPE_S_37L57_M63: SPE_ShellHE_base {
    EGVAR(frag,enabled) = 1;
    EGVAR(frag,force) = 1;
    EGVAR(frag,metal) = 1420;
    EGVAR(frag,charge) = 39;
    EGVAR(frag,gurney_c) = 2440;
    EGVAR(frag,gurney_k) = 1/2;
    EGVAR(frag,classes)[] = {"ACE_frag_medium", "ACE_frag_small_HD"};
};
