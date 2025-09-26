BASE_PAIR(vn_b_acc_rag_01,vn_b_acc_rag_02);
BASE_PAIR(vn_b_acc_towel_01,vn_b_acc_towel_02);

HELMET_MASK(vn_b_acc_ms22001_01,vn_b_acc_ms22001_02);


// 2 Bandana Variants with same Aviators
class vn_b_aviator: EGVAR(wardrobe,base) {
    class modifiableTo {
        class vn_b_bandana_a {};
    };
    components[] = {"vn_b_aviator"};
};
class vn_o_bandana_b: EGVAR(wardrobe,base) {
    class modifiableTo {
        class vn_b_bandana_a {};
    };
    components[] = {"vn_o_bandana_b"};
};
class vn_b_bandana_a: EGVAR(wardrobe,base) {
    class modifiableTo {
        class vn_b_aviator {};
        class vn_o_bandana_b {};
    };
    components[] = {"vn_b_aviator", "vn_o_bandana_b"};
};


// Glasses used by Helmets
// US Combat Goggles, used by vn_b_helmet_m1_20_01 & vn_b_helmet_m1_20_02
class vn_b_acc_goggles_01: EGVAR(wardrobe,base) {
    components[] = {"vn_b_acc_goggles_01"};
};

// VN Pilot Glasses + Mask
// Pilot Mask
class vn_o_acc_km32_01: EGVAR(wardrobe,base) {
    class modifiableTo {
        class vn_o_acc_goggles_03 {};
    };
    components[] = {"vn_o_acc_km32_01"};
};

// VN Crew Goggles
class vn_o_acc_goggles_01: EGVAR(wardrobe,base) {
    components[] = {"vn_o_acc_goggles_01"};
};

// Goggles
class vn_o_acc_goggles_02: EGVAR(wardrobe,base) {
    class modifiableTo {
        class vn_o_acc_goggles_03 {};
    };
    components[] = {"vn_o_acc_goggles_02"};
};

// Goggles with Mask
class vn_o_acc_goggles_03: EGVAR(wardrobe,base) {
    class modifiableTo {
        class vn_o_acc_km32_01 {};
        class vn_o_acc_goggles_02 {};
    };
    components[] = { "vn_o_acc_km32_01", "vn_o_acc_goggles_02"};
};
