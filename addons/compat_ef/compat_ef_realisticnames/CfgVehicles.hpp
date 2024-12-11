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

    class Heli_Attack_01_dynamicLoadout_base_F;
    class EF_AH99J_dynamicLoadout_base: Heli_Attack_01_dynamicLoadout_base_F {
        displayName = SUBCSTRING(AH99J);
    };
};
