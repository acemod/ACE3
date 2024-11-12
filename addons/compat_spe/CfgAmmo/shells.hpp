//Panzer III J, L, M HE
class SPE_50mm_SprGr38_HE: SPE_ShellHE_base
{
    EGVAR(frag,enabled) = 1;
    EGVAR(frag,force) = 1;
    EGVAR(frag,metal) = 1820;
    EGVAR(frag,charge) = 217;
    EGVAR(frag,gurney_c) = 2930;
    EGVAR(frag,gurney_k) = "1/2";
    EGVAR(frag,classes)[] = {"ACE_frag_medium","ACE_frag_small_HD"};
};
//Panzer III N HE
class SPE_SprGr34_K51_HE: SPE_ShellHE_base
{
    EGVAR(frag,enabled) = 1;
    EGVAR(frag,force) = 1;
    EGVAR(frag,metal) = 5740;
    EGVAR(frag,charge) = 686;
    EGVAR(frag,gurney_c) = 2930;
    EGVAR(frag,gurney_k) = "1/2";
    EGVAR(frag,classes)[] = {"ACE_frag_medium","ACE_frag_medium_HD"};
};

//Panzer IV, StuG III G HE
class SPE_SprGr34_KWK40_HE: SPE_ShellHE_base
{
    EGVAR(frag,enabled) = 1;
    EGVAR(frag,force) = 1;
    EGVAR(frag,metal) = 5740;
    EGVAR(frag,charge) = 686;
    EGVAR(frag,gurney_c) = 2930;
    EGVAR(frag,gurney_k) = "1/2";
    EGVAR(frag,classes)[] = {"ACE_frag_medium","ACE_frag_medium_HD"};
};

//Panzer V HE
class SPE_SprGr42_KwK42_HE: SPE_ShellHE_base
{
    EGVAR(frag,enabled) = 1;
    EGVAR(frag,force) = 1;
    EGVAR(frag,metal) = 5740;
    EGVAR(frag,charge) = 725;
    EGVAR(frag,gurney_c) = 2930;
    EGVAR(frag,gurney_k) = "1/2";
    EGVAR(frag,classes)[] = {"ACE_frag_medium","ACE_frag_medium_HD"};
};

//Panzer VI HE
class SPE_SprGr_KwK36_HE: SPE_ShellHE_base
{
    EGVAR(frag,enabled) = 1;
    EGVAR(frag,force) = 1;
    EGVAR(frag,metal) = 9000;
    EGVAR(frag,charge) = 900;
    EGVAR(frag,gurney_c) = 2930;
    EGVAR(frag,gurney_k) = "1/2";
    EGVAR(frag,classes)[] = {"ACE_frag_large","ACE_frag_large_HD"};
};

//StuH 42 HE
class SPE_105mm_StuH42_Gr38_HE: SPE_ShellHE_base
{
    EGVAR(frag,enabled) = 1;
    EGVAR(frag,force) = 1;
    EGVAR(frag,metal) = 14810;
    EGVAR(frag,charge) = 2530;
    EGVAR(frag,gurney_c) = 2930;
    EGVAR(frag,gurney_k) = "1/2";
    EGVAR(frag,classes)[] = {"ACE_frag_large","ACE_frag_large_HD"};
};

//Nashorn HE
class SPE_SprGr39_HE: SPE_ShellHE_base
{
    EGVAR(frag,enabled) = 1;
    EGVAR(frag,force) = 1;
    EGVAR(frag,metal) = 9400;
    EGVAR(frag,charge) = 1000;
    EGVAR(frag,gurney_c) = 2930;
    EGVAR(frag,gurney_k) = "1/2";
    EGVAR(frag,classes)[] = {"ACE_frag_large","ACE_frag_large_HD"};
};

//M10 HE
class SPE_76mm_M7_M42_HE: SPE_ShellHE_base
{
    EGVAR(frag,enabled) = 1;
    EGVAR(frag,force) = 1;
    EGVAR(frag,metal) = 5840;
    EGVAR(frag,charge) = 390;
    EGVAR(frag,gurney_c) = 2440;
    EGVAR(frag,gurney_k) = "1/2";
    EGVAR(frag,classes)[] = {"ACE_frag_medium","ACE_frag_medium_HD"};
};

//M18 HE
class SPE_76mm_M1_HC_M42_HE: SPE_76mm_M7_M42_HE
{
    EGVAR(frag,enabled) = 1;
    EGVAR(frag,force) = 1;
    EGVAR(frag,metal) = 5840;
    EGVAR(frag,charge) = 390;
    EGVAR(frag,gurney_c) = 2440;
    EGVAR(frag,gurney_k) = "1/2";
    EGVAR(frag,classes)[] = {"ACE_frag_medium","ACE_frag_medium_HD"};
};

//M4 Sherman 76 HE
class SPE_76mm_M1_M42_HE: SPE_76mm_M7_M42_HE
{
    EGVAR(frag,enabled) = 1;
    EGVAR(frag,force) = 1;
    EGVAR(frag,metal) = 5840;
    EGVAR(frag,charge) = 390;
    EGVAR(frag,gurney_c) = 2440;
    EGVAR(frag,gurney_k) = "1/2";
    EGVAR(frag,classes)[] = {"ACE_frag_medium","ACE_frag_medium_HD"};
};

// M1 57mm AT gun
class SPE_6pdr_mk10T_HE: SPE_ShellHE_base {
    EGVAR(frag,enabled) = 1;
    EGVAR(frag,force) = 1;
    EGVAR(frag,metal) = 2720;
    EGVAR(frag,charge) = 590;
    EGVAR(frag,gurney_c) = 2440;
    EGVAR(frag,gurney_k) = "1/2";
    EGVAR(frag,classes)[] = {"ACE_frag_medium", "ACE_frag_small_HD"};
};