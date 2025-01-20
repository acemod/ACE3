// Common Base
class vn_glasses_base;


// Scarf
class vn_b_acc_rag_01: vn_glasses_base {
    class ace_wardrobe: EGVAR(wardrobe,base) {
        modifiableTo[] = { "vn_b_acc_rag_02" };
    };
};
class vn_b_acc_rag_02: vn_b_acc_rag_01 {
    class ace_wardrobe: EGVAR(wardrobe,base) {
        modifiableTo[] = { "vn_b_acc_rag_01" };
    };
};


// Towel
class vn_b_acc_towel_01: vn_b_acc_rag_02 {
    class ace_wardrobe: EGVAR(wardrobe,base) {
        modifiableTo[] = { "vn_b_acc_towel_02" };
    };
};
class vn_b_acc_towel_02: vn_b_acc_towel_01 {
    class ace_wardrobe: EGVAR(wardrobe,base) {
        modifiableTo[] = { "vn_b_acc_towel_01" };
    };
};


// Pilot Air Mask
class vn_b_acc_ms22001_01: vn_glasses_base {
    class ace_wardrobe: EGVAR(wardrobe,base) {
        modifiableTo[] = { "vn_b_acc_ms22001_02" };
        alternativeDisplayName = ECSTRING(wardrobe,maskOn);
    };
};
class vn_b_acc_ms22001_02: vn_b_acc_ms22001_01 {
    class ace_wardrobe: EGVAR(wardrobe,base) {
        modifiableTo[] = { "vn_b_acc_ms22001_01" };
        alternativeDisplayName = ECSTRING(wardrobe,maskOff);
    };
};

// Bandana + Aviators
class vn_b_aviator: vn_glasses_base {
    class ace_wardrobe: EGVAR(wardrobe,base) {
        modifiableTo[] = { "vn_b_bandana_a" };
        components[] = {"vn_b_aviator"};
    };
};

class vn_o_bandana_b: vn_glasses_base {
    class ace_wardrobe: EGVAR(wardrobe,base) {
        modifiableTo[] = { "vn_b_bandana_a" };
        components[] = {"vn_o_bandana_b"};
    };
};

class vn_b_bandana_a: vn_o_bandana_b {
    class ace_wardrobe: EGVAR(wardrobe,base) {
        modifiableTo[] = { "vn_b_aviator", "vn_o_bandana_b" };
        components[] = {"vn_b_aviator", "vn_o_bandana_b"};
    };
};



// US Combat Goggles, used by vn_b_helmet_m1_20_01 & vn_b_helmet_m1_20_02
class vn_b_acc_goggles_01: vn_glasses_base {
    class ace_wardrobe: EGVAR(wardrobe,base) {
        components[] = {"vn_b_acc_goggles_01"};
    };
};

// VN Pilot Glasses + Mask
// Pilot Mask
class vn_o_acc_km32_01: vn_glasses_base {
    class ace_wardrobe: EGVAR(wardrobe,base) {
        modifiableTo[] = { "vn_o_acc_goggles_03" };
        components[] = {"vn_o_acc_km32_01"};
    };
};       
// VN Crew Goggles
class vn_o_acc_goggles_01: vn_glasses_base {
    class ace_wardrobe: EGVAR(wardrobe,base) {
        components[] = {"vn_o_acc_goggles_01"};
    };
};
// Goggles
class vn_o_acc_goggles_02: vn_glasses_base {
    class ace_wardrobe: EGVAR(wardrobe,base) {
        modifiableTo[] = { "vn_o_acc_goggles_03" };
        components[] = {"vn_o_acc_goggles_02"};
    };
};
// Goggles with Mask
class vn_o_acc_goggles_03: vn_glasses_base {
    class ace_wardrobe: EGVAR(wardrobe,base) {
        modifiableTo[] = { "vn_o_acc_km32_01", "vn_o_acc_goggles_02" };
        components[] = { "vn_o_acc_km32_01", "vn_o_acc_goggles_02"};
    };
    mass = 4;
};