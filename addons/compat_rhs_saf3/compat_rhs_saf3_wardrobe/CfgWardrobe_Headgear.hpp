CfgWardrobe_Headgear.hpp
//SAF requires RHS USAF, so we can use their Googles
// ToDo Use Macros
class rhssaf_helmet_m97_black_nocamo: EGVAR(wardrobe,base_H_goggles_off) {
    class modifiableTo { class rhssaf_helmet_m97_black_nocamo_black_ess_bare; };
    components[] = {};
};
class rhssaf_helmet_m97_black_nocamo_black_ess_bare: EGVAR(wardrobe,base_H_goggles_on) {
    class modifiableTo { class rhssaf_helmet_m97_black_nocamo; };
    components[] = {"rhs_ess_black"}; 
};

class rhssaf_helmet_m97_nostrap_blue: EGVAR(wardrobe,base_H_goggles_off) {
    class modifiableTo { class rhssaf_helmet_m97_nostrap_blue_tan_ess_bare; };
    components[] = {};
};
class rhssaf_helmet_m97_nostrap_blue_tan_ess_bare: EGVAR(wardrobe,base_H_goggles_on) {
    class modifiableTo { class rhssaf_helmet_m97_nostrap_blue; };
    components[] = {"rhs_ess_black"};
};

class rhssaf_helmet_m97_digital: EGVAR(wardrobe,base_H_goggles_off) {
    class modifiableTo { class rhssaf_helmet_m97_digital_black_ess_bare; };
    components[] = {};
};
class rhssaf_helmet_m97_digital_black_ess_bare: EGVAR(wardrobe,base_H_goggles_on) {
    class modifiableTo { class rhssaf_helmet_m97_digital; };
    components[] = {"rhs_ess_black"};
};

class rhssaf_helmet_m97_md2camo: EGVAR(wardrobe,base_H_goggles_off) {
    class modifiableTo { class rhssaf_helmet_m97_md2camo_black_ess_bare; };
    components[] = {};
};
class rhssaf_helmet_m97_md2camo_black_ess_bare: EGVAR(wardrobe,base_H_goggles_on) {
    class modifiableTo { class rhssaf_helmet_m97_md2camo; };
    components[] = {"rhs_ess_black"};
};

class rhssaf_helmet_m97_oakleaf: EGVAR(wardrobe,base_H_goggles_off) {
    class modifiableTo { class rhssaf_helmet_m97_oakleaf_black_ess_bare; };
    components[] = {};
};
class rhssaf_helmet_m97_oakleaf_black_ess_bare: EGVAR(wardrobe,base_H_goggles_on) {
    class modifiableTo { class rhssaf_helmet_m97_oakleaf; };
    components[] = {"rhs_ess_black"};
};

class rhssaf_helmet_m97_olive_nocamo: EGVAR(wardrobe,base_H_goggles_off) {
    class modifiableTo { class rhssaf_helmet_m97_olive_nocamo_black_ess_bare; };
    components[] = {};
};
class rhssaf_helmet_m97_olive_nocamo_black_ess_bare: EGVAR(wardrobe,base_H_goggles_on) {
    class modifiableTo { class rhssaf_helmet_m97_olive_nocamo; };
    components[] = {"rhs_ess_black"};
};

//This might be wierd, because we start with goggles_off, and also add mask_on
// ToDo use EGVAR(wardrobe,base)
class rhssaf_helmet_m97_woodland: EGVAR(wardrobe,base_H_goggles_off) {
    class modifiableTo { class rhssaf_helmet_m97_woodland_black_ess_bare; class rhssaf_helmet_m97_veil_woodland};
    components[] = {};
};
class rhssaf_helmet_m97_woodland_black_ess_bare: EGVAR(wardrobe,base_H_goggles_on) {
    class modifiableTo { class rhssaf_helmet_m97_woodland; };
    components[] = {"rhs_ess_black"};
};

class rhssaf_helmet_m97_veil_woodland: EGVAR(wardrobe,base_H_mask_on) {
    class modifiableTo { class rhssaf_helmet_m97_woodland; };
    components[] = {"rhssaf_veil_Green"};
};