// CfgWeapons


// Macros
#define CN01(side,var1,var2) vn_##side##_helmet_##var1##_01_##var2
#define CN02(side,var1,var2) vn_##side##_helmet_##var1##_02_##var2


#define HELMET_VARIANT(side,var1,var2)\
class CN01(side,var1,var2): EGVAR(wardrobe,base_H_visor_up) {\
    class modifiableTo {\
        class CN02(side,var1,var2) {};\
    };\
};\
class CN02(side,var1,var2): EGVAR(wardrobe,base_H_visor_down) {\
    class modifiableTo {\
        class CN01(side,var1,var2) {};\
    };\
}


// Parent Version aph6 & svh4
#define base_class_up vn_b_headgear_base
#define base_class_dn vn_b_headgear_base
HELMET_VARIANT(b,aph6,01);
HELMET_VARIANT(b,svh4,01);

// Child Version aph6
#undef base_class_up
#undef base_class_dn
#define base_class_up CN01(b,aph6,01)
#define base_class_dn CN02(b,aph6,01)

HELMET_VARIANT(b,aph6,02);
HELMET_VARIANT(b,aph6,03);
HELMET_VARIANT(b,aph6,04);
HELMET_VARIANT(b,aph6,05);

// Child Version svh4
#undef base_class_up
#undef base_class_dn
#define base_class_up CN01(b,svh4,01)
#define base_class_dn CN02(b,svh4,01)

HELMET_VARIANT(b,svh4,02);
HELMET_VARIANT(b,svh4,03);
HELMET_VARIANT(b,svh4,04);
HELMET_VARIANT(b,svh4,05);
HELMET_VARIANT(b,svh4,06);

#undef base_class_up
#undef base_class_dn


// Special Case zsh3
HELMET_VISOR(vn_o_helmet_zsh3_01,vn_o_helmet_zsh3_02);

// Helmets with/without Goggles
class vn_b_helmet_m1_14_01: EGVAR(wardrobe,base_H_goggles_off) {
    class modifiableTo {
        class vn_b_helmet_m1_20_01 {};
    };
};
   
class vn_b_helmet_m1_14_02: EGVAR(wardrobe,base_H_goggles_off) {
    class modifiableTo { 
        class vn_b_helmet_m1_20_02 {};
    };
};

class vn_b_helmet_m1_20_01: EGVAR(wardrobe,base_H_goggles_on) {
        class modifiableTo {
            class vn_b_helmet_m1_14_01 {};
        };
    components[] = {"vn_b_acc_goggles_01"};
};
class vn_b_helmet_m1_20_02: EGVAR(wardrobe,base_H_goggles_on) {
    class modifiableTo {
        class vn_b_helmet_m1_14_02 {};
    };
    components[] = {"vn_b_acc_goggles_01"};
};


//// VN Pilot Helmet
// With Goggles
class vn_o_helmet_shl61_01: EGVAR(wardrobe,base_H_goggles_on) {
    class modifiableTo {
        class vn_o_helmet_shl61_02 {};
    };
    components[] = {"vn_o_acc_goggles_02"};
};
// Without Goggles
class vn_o_helmet_shl61_02: EGVAR(wardrobe,base_H_goggles_off) {
    class modifiableTo {
        class vn_o_helmet_shl61_01 {};
    };
};


// US Vic Crew Helmets
class vn_b_helmet_t56_01_01: EGVAR(wardrobe,base_H_goggles_off) {
    class modifiableTo {
        class vn_b_helmet_t56_02_01 {};
    };
};

class vn_b_helmet_t56_02_01: EGVAR(wardrobe,base_H_goggles_on) {
    class modifiableTo {
        class vn_b_helmet_t56_01_01 {};
    };
    components[] = {"vn_b_acc_goggles_01"};
};

class vn_b_helmet_t56_01_02: EGVAR(wardrobe,base_H_goggles_off) {
    class modifiableTo {
        class vn_b_helmet_t56_02_02 {};
    };
};
class vn_b_helmet_t56_02_02: EGVAR(wardrobe,base_H_goggles_on) {
    class modifiableTo {
        class vn_b_helmet_t56_01_02 {};
    };
    components[] = {"vn_b_acc_goggles_01"};
};

class vn_b_helmet_t56_01_03: EGVAR(wardrobe,base_H_goggles_off) {
    class modifiableTo {
        class vn_b_helmet_t56_02_03 {};
    };
};
class vn_b_helmet_t56_02_03: EGVAR(wardrobe,base_H_goggles_on) {
    class modifiableTo {
        class vn_b_helmet_t56_01_03 {};
    };
    components[] = {"vn_b_acc_goggles_01"};
};


// VN Vic Crew Helmet   // 1 with goggles
// vn_o_acc_goggles_01
class vn_o_helmet_tsh3_01: EGVAR(wardrobe,base_H_goggles_on) {
    class modifiableTo {
        class vn_o_helmet_tsh3_02 {};
    };
    components[] = {"vn_o_acc_goggles_01"};
};
class vn_o_helmet_tsh3_02: EGVAR(wardrobe,base_H_goggles_off) {
    class modifiableTo {
        class vn_o_helmet_tsh3_01 {};
    };
};

// VN Pith Helmet with Crew Goggles
class vn_o_helmet_nva_01: EGVAR(wardrobe,base_H_goggles_off) {
    class modifiableTo {
        class vn_o_helmet_nva_05 {};
    };
};
class ItemInfo {};
class vn_o_helmet_nva_05: EGVAR(wardrobe,base_H_goggles_on) {
    class modifiableTo {
        class vn_o_helmet_nva_01 {};
    };
    components[] = {"vn_o_acc_goggles_02"};
};
