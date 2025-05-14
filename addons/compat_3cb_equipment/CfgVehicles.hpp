class CfgVehicles {

    class UK3CB_BAF_B_Bergen_Base;
    class UK3CB_BAF_B_rt1523g_Base;

    //Entrenching Tools
    class UK3CB_BAF_B_Bergen_MTP_Rifleman_H_A: UK3CB_BAF_B_Bergen_Base {
        EGVAR(trenches,entrenchingTool) = 1;
    };
    class UK3CB_BAF_B_Bergen_MTP_Rifleman_H_B: UK3CB_BAF_B_Bergen_Base {
        EGVAR(trenches,entrenchingTool) = 1;
    };
    class UK3CB_BAF_B_Bergen_MTP_Engineer_H_A: UK3CB_BAF_B_Bergen_Base {
        EGVAR(trenches,entrenchingTool) = 1;
    };
    class UK3CB_BAF_B_Bergen_MTP_PointMan_H_A: UK3CB_BAF_B_Bergen_Base {
        EGVAR(trenches,entrenchingTool) = 1;
    };
    class UK3CB_BAF_B_Bergen_MTP_Radio_H_B: UK3CB_BAF_B_rt1523g_Base {
        EGVAR(trenches,entrenchingTool) = 1;
    };

    //Wirecutter
    class UK3CB_BAF_B_Bergen_MTP_Engineer_H_A: UK3CB_BAF_B_Bergen_Base {
        EGVAR(logistics_wirecutter,hasWirecutter) = 1;
    };
    class UK3CB_BAF_B_Bergen_MTP_Engineer_L_A: UK3CB_BAF_B_Bergen_Base {
        EGVAR(logistics_wirecutter,hasWirecutter) = 1;        
    };
};
