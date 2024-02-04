class CfgWeapons {
    // Last update: RHSAFRF 0.5.6
    class rhs_acc_perst3_2dp_light;
    class rhs_acc_perst3_2dp_light_h: rhs_acc_perst3_2dp_light {
        baseWeapon = "rhs_acc_perst3_2dp_h";
    };

    class acc_pointer_IR;
    class rhs_acc_perst1ik: acc_pointer_IR {
        MRT_SwitchItemHintText = ""; // prevent false info for illuminator stat
        MRT_SwitchItemNextClass = "";
        MRT_SwitchItemPrevClass = "";
    };
};
