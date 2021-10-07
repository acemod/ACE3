#define HEARING_PROTECTION_OPEN EGVAR(hearing,protection) = 0; EGVAR(hearing,lowerVolume) = 0
#define HEARING_PROTECTION_VICCREW EGVAR(hearing,protection) = 0.85; EGVAR(hearing,lowerVolume) = 0.6
#define HEARING_PROTECTION_EARMUFF EGVAR(hearing,protection) = 0.75; EGVAR(hearing,lowerVolume) = 0.5
#define HEARING_PROTECTION_PELTOR EGVAR(hearing,protection) = 0.75; EGVAR(hearing,lowerVolume) = 0

class vn_b_headgear_base;
class vn_b_helmet_aph6_01_01: vn_b_headgear_base {
    HEARING_PROTECTION_VICCREW;
};
class vn_b_helmet_aph6_02_01: vn_b_headgear_base {
    HEARING_PROTECTION_VICCREW;
    ACE_Protection = 1;
};
class vn_b_helmet_sph4_01_01: vn_b_headgear_base {
    HEARING_PROTECTION_VICCREW;
};
class vn_b_helmet_sph4_02_01: vn_b_headgear_base {
    HEARING_PROTECTION_VICCREW;
    ACE_Protection = 1;
};
class vn_b_helmet_t56_01_01: vn_b_headgear_base {
    HEARING_PROTECTION_VICCREW;
};

class vn_o_headgear_base;
class vn_o_helmet_tsh3_01: vn_o_headgear_base {
    HEARING_PROTECTION_VICCREW;
};
class vn_o_helmet_zsh3_01: vn_o_headgear_base {
    HEARING_PROTECTION_VICCREW;
};
class vn_o_helmet_zsh3_02: vn_o_helmet_zsh3_01 {
    ACE_Protection = 1;
};
class vn_o_helmet_shl61_01: vn_o_headgear_base {
    HEARING_PROTECTION_VICCREW;
};
