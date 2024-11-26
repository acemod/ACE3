class CfgVehicles {
    class MRAP_01_gmg_base_F;
    class EF_MRAP_01_FSV_base: MRAP_01_gmg_base_F {
        displayName = SUBCSTRING(MRAP_01_FSV);
    };
    class EF_MRAP_01_AT_base: EF_MRAP_01_FSV_base {
        displayName = SUBCSTRING(MRAP_01_AT);
    };
    class EF_MRAP_01_LAAD_base: EF_MRAP_01_FSV_base {
        displayName = SUBCSTRING(MRAP_01_LAAD);
    };
};
