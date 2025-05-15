class CfgVehicles {

    class B_Bergen_Base;
    class UK3CB_B_Alice_pack_01;

    class UK3CB_B_Bedroll_Shovel_Backpack_KHK: B_Bergen_Base {
        EGVAR(trenches,entrenchingTool) = 1;
    };

    //these get it by inheritance from UK3CB_B_Bedroll_Shovel_Backpack_KHK
    //UK3CB_B_Bedroll_Shovel_Backpack_GRY
    //UK3CB_B_Bedroll_Shovel_Backpack_GRN

    class UK3CB_B_Alice_pack_02: B_Bergen_Base {
        EGVAR(trenches,entrenchingTool) = 1;
    };
    class UK3CB_B_Alice_pack_03: UK3CB_B_Alice_pack_01 {
        EGVAR(trenches,entrenchingTool) = 1;
    };
    class UK3CB_B_Alice_pack_03_M81: UK3CB_B_Alice_pack_03 {
        EGVAR(trenches,entrenchingTool) = 1;
    };
    class UK3CB_B_Alice_pack_frame_01: UK3CB_B_Alice_pack_01 {
        EGVAR(trenches,entrenchingTool) = 1;
    };
    class UK3CB_B_Alice_pack_frame_01_M81: UK3CB_B_Alice_pack_frame_01 {
        EGVAR(trenches,entrenchingTool) = 1;
    };
    class UK3CB_B_Alice_pack_frame_02: UK3CB_B_Alice_pack_01 {
        EGVAR(trenches,entrenchingTool) = 1;
    };
    class UK3CB_B_Alice_pack_frame_02_M81: UK3CB_B_Alice_pack_frame_02 {
        EGVAR(trenches,entrenchingTool) = 1;
    };

    class TFAR_anprc155;
    class TFAR_mr3000;
    class TFAR_rt1523g_big;

    class UK3CB_B_I_Alice_pack_frame_radio_01: TFAR_anprc155 {
        EGVAR(trenches,entrenchingTool) = 1;
    };
    class UK3CB_B_I_Alice_pack_frame_radio_01_M81: UK3CB_B_I_Alice_pack_frame_radio_01 {
        EGVAR(trenches,entrenchingTool) = 1;
    };

    class UK3CB_B_O_Alice_pack_frame_radio_01: TFAR_mr3000 {
        EGVAR(trenches,entrenchingTool) = 1;
    };
    class UK3CB_B_O_Alice_pack_frame_radio_01_M81: UK3CB_B_O_Alice_pack_frame_radio_01 {
        EGVAR(trenches,entrenchingTool) = 1;
    };

    class UK3CB_B_B_Alice_pack_frame_radio_01: TFAR_rt1523g_big {
        EGVAR(trenches,entrenchingTool) = 1;
    };
    class UK3CB_B_B_Alice_pack_frame_radio_01_M81: UK3CB_B_B_Alice_pack_frame_radio_01 {
        EGVAR(trenches,entrenchingTool) = 1;
    };
};
