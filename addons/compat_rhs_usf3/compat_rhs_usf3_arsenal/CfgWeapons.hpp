class CfgWeapons {
    // Last update: RHSUSAF 0.5.6
    class acc_pointer_IR;
    class rhsusf_acc_anpeq15: acc_pointer_IR {
        baseWeapon = "rhsusf_acc_anpeq15";
        MRT_SwitchItemHintText = ""; // prevent false info for illuminator stat
        MRT_SwitchItemNextClass = "";
        MRT_SwitchItemPrevClass = "";
    };
    class rhsusf_acc_anpeq15_bk: rhsusf_acc_anpeq15 {
        baseWeapon = "rhsusf_acc_anpeq15_bk";
    };
    class rhsusf_acc_anpeq15_light;
    class rhsusf_acc_anpeq15_bk_light: rhsusf_acc_anpeq15_light {
        baseWeapon = "rhsusf_acc_anpeq15_bk";
    };
    class rhsusf_acc_anpeq15_wmx: rhsusf_acc_anpeq15 {
        baseWeapon = "rhsusf_acc_anpeq15_wmx";
    };
    class rhsusf_acc_anpeq15_wmx_light: rhsusf_acc_anpeq15_light {
        baseWeapon = "rhsusf_acc_anpeq15_wmx";
    };
    class rhsusf_acc_M952V: rhsusf_acc_anpeq15_light {
        rhs_acc_combo = ""; // prevent materializing a PEQ-15 if RHS's attachment switch is called
        rhs_anpeq15_base = ""; // same deal
        baseWeapon = "rhsusf_acc_M952V";
    };
    class rhsusf_acc_wmx: rhsusf_acc_M952V {
        baseWeapon = "rhsusf_acc_wmx";
    };
    class rhsusf_acc_wmx_bk: rhsusf_acc_M952V {
        baseWeapon = "rhsusf_acc_wmx_bk";
    };

    class rhsusf_acc_anpeq15A: acc_pointer_IR {
        baseWeapon = "rhsusf_acc_anpeq15A";
        MRT_SwitchItemHintText = ""; // prevent false info for illuminator stat
        MRT_SwitchItemNextClass = "";
        MRT_SwitchItemPrevClass = "";
    };
    class rhsusf_acc_anpeq15_top: rhsusf_acc_anpeq15A {
        baseWeapon = "rhsusf_acc_anpeq15_top";
    };
    class rhsusf_acc_anpeq15_bk_top: rhsusf_acc_anpeq15_top {
        baseWeapon = "rhsusf_acc_anpeq15_bk_top";
    };

    class rhsusf_acc_anpeq15side: acc_pointer_IR {
        baseWeapon = "rhsusf_acc_anpeq15side";
        MRT_SwitchItemHintText = ""; // prevent false info for illuminator stat
        MRT_SwitchItemNextClass = "";
        MRT_SwitchItemPrevClass = "";
    };
    class rhsusf_acc_anpeq15side_bk: rhsusf_acc_anpeq15side {
        baseWeapon = "rhsusf_acc_anpeq15side_bk";
    };
    class rhsusf_acc_anpeq16a: rhsusf_acc_anpeq15 {
        baseWeapon = "rhsusf_acc_anpeq16a";
    };
    class rhsusf_acc_anpeq16a_light: rhsusf_acc_anpeq15_light {
        baseWeapon = "rhsusf_acc_anpeq16a";
    };
    class rhsusf_acc_anpeq16a_top: rhsusf_acc_anpeq16a {
        baseWeapon = "rhsusf_acc_anpeq16a_top";
    };
    class rhsusf_acc_anpeq16a_light_top: rhsusf_acc_anpeq16a_light {
        baseWeapon = "rhsusf_acc_anpeq16a_top";
    };
};
