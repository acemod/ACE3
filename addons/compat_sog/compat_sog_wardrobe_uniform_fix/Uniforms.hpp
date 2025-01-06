#define S_70(className)\
class className: vn_b_uniform_base {\
    class ItemInfo: ItemInfo {\
        containerClass = "Supply70";\
        mass = 70;\
    };\
};

class CfgWeapons {
	class Uniform_Base;
	class vn_b_uniform_base: Uniform_Base {
		class ItemInfo;
	};

    S_70(vn_b_uniform_macv_04_01)
    S_70(vn_b_uniform_macv_04_02)
    S_70(vn_b_uniform_macv_04_05)
    S_70(vn_b_uniform_macv_04_06)
    S_70(vn_b_uniform_macv_04_07)
    S_70(vn_b_uniform_macv_04_08)
    S_70(vn_b_uniform_macv_04_15)
    S_70(vn_b_uniform_macv_04_16)
    S_70(vn_b_uniform_macv_04_17)
    S_70(vn_b_uniform_macv_04_18)


    //// US Headgear
    // Helmets with Combat Goggles
    class vn_b_helmet_m1_01_01;
	class vn_b_helmet_m1_14_01: vn_b_helmet_m1_01_01 {
		class ItemInfo;
	};

    class vn_b_helmet_m1_20_01: vn_b_helmet_m1_14_01 {
        MASS(12)
    };
    class vn_b_helmet_m1_20_02: vn_b_helmet_m1_20_01 {
        MASS(12)
    };


    // Crew Helmets with Goggles
    class vn_b_headgear_base;
	class vn_b_helmet_t56_01_01: vn_b_headgear_base {
		class ItemInfo;
	};
    class vn_b_helmet_t56_02_01: vn_b_helmet_t56_01_01 {
        MASS(12)
    };

    class vn_b_helmet_t56_02_02: vn_b_helmet_t56_02_01 {
        MASS(12)
    };

    class vn_b_helmet_t56_02_03: vn_b_helmet_t56_02_01 {
        MASS(12)
    };

    //// NVA Headgear



    // NVA Gear usually has the Goggles Version be the parent version of the non-goggle version, meaning we have to "reset" the children to their previous mass.
    class H_Booniehat_khk;
	class vn_o_headgear_base: H_Booniehat_khk {
		class ItemInfo;
	};
    // NVA Pilot Helmet with Goggles
    class vn_o_helmet_shl61_01: vn_o_headgear_base {
        MASS(12)
    };
    class vn_o_helmet_shl61_02: vn_o_helmet_shl61_01 {
        MASS(10)
    };

    // NVA Crew Helmet with Goggles
    class vn_o_helmet_tsh3_01: vn_o_headgear_base {
        MASS(12)
    };
    class vn_o_helmet_tsh3_02: vn_o_helmet_tsh3_01 {
        MASS(10)
    };



    // NVA Pith helmet with Crew Goggles
	class vn_o_helmet_nva_01: vn_o_headgear_base {
		class ItemInfo;
	};
    class vn_o_helmet_nva_05: vn_o_helmet_nva_01 {
        MASS(12)
    };
};


class CfgGlasses {
    // VN Pilot Goggles + Mask
    class vn_glasses_base;
    class vn_o_acc_goggles_03: vn_glasses_base {
        mass = 4;
    };
};
