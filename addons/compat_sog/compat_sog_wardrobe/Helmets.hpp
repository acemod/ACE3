// CfgWeapons

class vn_b_helmet_m1_01_01: vn_b_headgear_base {
    class ItemInfo;
};

// Helmets with/without Goggles
class vn_b_helmet_m1_14_01: vn_b_helmet_m1_01_01 {};


class vn_b_helmet_m1_20_01 : vn_b_helmet_m1_14_01 {
    MASS(12);
};
class vn_b_helmet_m1_20_02 : vn_b_helmet_m1_20_01 {
    MASS(12);
};


//// VN Pilot Helmet
// With Goggles
class vn_o_helmet_shl61_01: vn_o_headgear_base {
    MASS(12);
};   
// Without Goggles
class vn_o_helmet_shl61_02: vn_o_helmet_shl61_01 {
    MASS(10);
};


// US Vic Crew Helmets
class vn_b_helmet_t56_01_01: vn_b_headgear_base {
    class ItemInfo;
};
class vn_b_helmet_t56_02_01: vn_b_helmet_t56_01_01 {
    MASS(12);
};

class vn_b_helmet_t56_02_02: vn_b_helmet_t56_02_01 {
    MASS(12);
};

class vn_b_helmet_t56_02_03: vn_b_helmet_t56_02_01 {
    MASS(12);
};

// VN Pith Helmet with Crew Goggles
class vn_o_helmet_nva_01: vn_o_headgear_base {
    class ItemInfo;
};
class vn_o_helmet_nva_05: vn_o_helmet_nva_01  {
    MASS(12);
};
