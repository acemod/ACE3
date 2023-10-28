class CfgVehicles {
    class CUP_MTVR_Base;
    class CUP_MTVR_Reammo_Base: CUP_MTVR_Base {
        transportAmmo = 0;
        EGVAR(rearm,defaultSupply) = 1200;
    };
    class CUP_MTVR_Repair_Base: CUP_MTVR_Base {
        transportRepair = 0;
        EGVAR(repair,canRepair) = 1;
    };

    class CUP_V3S_Open_Base;
    class CUP_V3S_Repair_Base: CUP_V3S_Open_Base {
        transportRepair = 0;
        EGVAR(repair,canRepair) = 1;
    };
    class CUP_V3S_Rearm_Base: CUP_V3S_Open_Base {
        transportAmmo = 0;
        EGVAR(rearm,defaultSupply) = 1200;
    };

    class CUP_Ural_Support_Base;
    class CUP_Ural_Reammo_Base: CUP_Ural_Support_Base {
        transportAmmo = 0;
        EGVAR(rearm,defaultSupply) = 1200;
    };
    class CUP_Ural_Repair_Base: CUP_Ural_Support_Base {
        transportRepair = 0;
        EGVAR(repair,canRepair) = 1;
    };

    class CUP_Kamaz_5350_Base;
    class CUP_Kamaz_5350_ReAmmo_Base: CUP_Kamaz_5350_Base {
        transportAmmo = 0;
        EGVAR(rearm,defaultSupply) = 1200;
    };

    class Truck_02_box_base_F;
    class CUP_Kamaz_5350_Repair_Base: Truck_02_box_base_F {
        transportRepair = 0;
        EGVAR(repair,canRepair) = 1;
    };

    class CUP_T810_Unarmed_Base;
    class CUP_T810_Reammo_Base: CUP_T810_Unarmed_Base {
        transportAmmo = 0;
        EGVAR(rearm,defaultSupply) = 1200;
    };
    class CUP_T810_Repair_Base: CUP_T810_Unarmed_Base {
        transportRepair = 0;
        EGVAR(repair,canRepair) = 1;
    };
};
