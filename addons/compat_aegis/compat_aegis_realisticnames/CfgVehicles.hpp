class CfgVehicles {
    class APC_Wheeled_01_base_v2_F;
    class B_APC_Wheeled_01_cannon_v2_F: APC_Wheeled_01_base_v2_F {
        displayName = ECSTRING(realisticnames,APC_Wheeled_01_cannon_Name);
    };

    class B_APC_Wheeled_01_base_F;
    class B_APC_Wheeled_01_medical_F: B_APC_Wheeled_01_base_F {
        displayName = SUBCSTRING(APC_Wheeled_01_medical_Name);
    };

    class APC_Tracked_02_medical_base_F;
    class O_R_APC_Tracked_02_medical_F: APC_Tracked_02_medical_base_F {
        displayName = SUBCSTRING(APC_Tracked_02_medical_Name);
    };

    class APC_Tracked_03_base_v2_F;
    class B_A_APC_tracked_03_cannon_v2_F: APC_Tracked_03_base_v2_F {
        displayName = ECSTRING(realisticnames,APC_tracked_03_cannon_Name);
    };
};
